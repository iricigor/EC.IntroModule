$Here = Split-Path -Parent $MyInvocation.MyCommand.Path

Push-Location $Here

./Tests/Utils/DisplayConfigurationInfo.ps1
./Tests/Utils/ImportModule.ps1


$TestFiles = @(
    './Tests/EC.IntroModule.Tests.ps1',
    './Tests/Get-Square.Tests.ps1',
    './Tests/Get-Cube.Tests.ps1'
)

Invoke-Pester -Path $TestFiles -OutputFormat NUnitXML -OutputFile ./TestResults.xml

Pop-Location