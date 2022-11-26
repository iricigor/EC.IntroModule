#
# Fake test
#

Describe "Fake-Test" {
    It "Should be fixed by developer" {
        $true | Should -Be $true
    }
}

#
# Check definition
#

$CommandName = 'Get-Cube'
$ParameterNames = @('Number')

Describe "Function $CommandName Definition" {

    $CmdDef = Get-Command -Name $CommandName -Module $ModuleName -ea 0
    $CmdFake = Get-Command -Name 'FakeCommandName' -Module $ModuleName -ea 0

    It "Command should exist" {
        $CmdDef | Should -Not -Be $null
        $CmdFake | Should -Be $null
    }

    It 'Command should have parameters' {
        $CmdDef.Parameters.Keys | Should -Not -Contain 'FakeParameterName'
        foreach ($P1 in $ParameterNames) {
            $CmdDef.Parameters.Keys | Should -Contain $P1
        }
    }
}


#
# Check functionality, real tests
#

Describe "Proper $CommandName Functionality" {
    It 'Checks Proper Functionality' {
        Get-Cube 2 | Should -Be 8
    }

    It 'Accepts pipeline input' {
        3,4 | Get-Cube | Should -Be @(27,64)
    }

    It 'Accepts decimal numbers' {
        Get-Cube  2.5 | Should -Be 15.625
    }

}