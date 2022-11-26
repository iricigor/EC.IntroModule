#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests.
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#
$ModuleName = 'EC.IntroModule'

BeforeAll {
    $ModuleName = 'EC.IntroModule'
}


#
# Fake test
#


Describe 'Fake Test' {
    It "Runs Fake Test" {
        $true | Should -Be $true
    }
}

#
# Module Should be loaded
#


Describe "Test if module $ModuleName is loaded" {
    It "Module should be loaded" {
        Get-Module $ModuleName -ea 0 | Should -Not -Be $null
    }
    It "Fake Module should not be loaded" {
        Get-Module 'FakeModule' -ea 0 | Should -Be $null
    }
}


#
# Module should import two functions
#

Describe 'Proper Declarations' {
    It 'Checks for existence of functions' {
        (Get-Command -Module $ModuleName).Count | Should -Be 2
        Get-Command Get-Cube -ea 0   | Should -Not -Be $Null
        Get-Command Get-Square -ea 0 | Should -Not -Be $Null
        Get-Command Get-Fourth -ea 0 | Should -Be $Null
    }

    It 'Checks for Parameters' {
        Get-Command -Module IntroModule | % {
            $_.Parameters.Number  | Should -Not -Be $null
            $_.Parameters.FakeParam | Should -Be $null
        }
    }

    It 'Checks for Aliases' {
        Get-Command -Module $ModuleName | % {
            Get-Alias -Definition ($_.Name) | Should -Not -Be $null
        }
    }
}

#
# Check if documentation is proper
#

Describe 'Proper Documentation' {

    It 'Runs in proper folder' {
        $Root = Split-Path -Parent $PSScriptRoot
        Push-Location $Root
        Get-Item 'Docs' | Should -Not -Be $null -Because "cannot run in $Root"
        Pop-Location
    }

    It 'Has PlatyPS installed' {
        if (!(Get-Module platyPS -List -ea 0)) {Install-Module platyPS -Force -Scope CurrentUser}
		Import-Module platyPS
    }

	It 'Updates documentation and does git diff' {
		# update documentation
        $Root = Split-Path -Parent $PSScriptRoot
        Push-Location $Root
        Update-MarkdownHelp -Path ./Docs
        New-ExternalHelp -Path ./Docs -OutputPath ./en-US -Force
        $diff = git diff ./Docs ./en-US
        Pop-Location
		$diff | Should -Be $null
	}
}
