#
# Display troubleshooting variables
#

if ($Env:APPVEYOR -or $Env:TF_BUILD) {
    Write-Host "Checking environment details`n"
    $PSVersionTable | Out-Host
    Get-Module | Out-Host
    Get-Module -ListAvailable PowerShellGet,PackageManagement | Out-Host
    Get-PackageProvider | Out-Host
    Get-PackageProvider -ListAvailable  | Out-Host
}
