$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

Push-Location $Here

./Tests/Utils/DisplayConfigurationInfo.ps1
./Tests/Utils/ImportModule.ps1
./Tests/Utils/ImportPester.ps1

$TestFiles = @(
    './Tests/EC.IntroModule.Tests.ps1',
    './Tests/Get-Square.Tests.ps1',
    './Tests/Get-Cube.Tests.ps1'
)

$config = [PesterConfiguration]::Default
$config.Run.Path = $TestFiles
$config.TestResult.Enabled = $true
$config.TestResult.OutputPath = './TestResults.xml'
$config.CodeCoverage.Enabled = $true
$config.CodeCoverage.OutputPath = './CodeCoverage.xml'
$config.codecoverage.OutputFormat = 'CoverageGutters'
$config.CodeCoverage.Path = './Public/*.ps1'

Invoke-Pester -Configuration $config

Pop-Location