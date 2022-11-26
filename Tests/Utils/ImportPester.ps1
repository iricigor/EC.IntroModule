$module = Get-Module -Name Pester -ListAvailable | Where-Object Version -ge 5.0.0

if (!$module) {
    Write-Warning "Pester module not found. Installing Pester module..."
    Install-Module -Name Pester -Force -Scope CurrentUser -RequiredVersion 5.0.0
}

Import-Module -Name Pester -Force -Scope Global -RequiredVersion 5.0.0