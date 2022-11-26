$TestFiles = @(
    '.\Tests\EC.IntroModule.Tests.ps1',
    '.\Tests\Get-Square.Tests.ps1',
    '.\Tests\Get-Cube.Tests.ps1'
)

Invoke-Pester -Path $TestFiles  -Output Detailed