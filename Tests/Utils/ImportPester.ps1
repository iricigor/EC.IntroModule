$module = Get-Module -Name Pester -ListAvailable | Where-Object Version -ge 5.0.0 | Sort-Object Version -Descending | Select-Object -First 1

if ($module) {
    Write-Host "Pester module found. Importing Pester module..."
    Import-Module -Name $module.Name -RequiredVersion $module.Version -Force
} else {
    Write-Host "Pester module not found. Installing Pester module..."
    Install-Module -Name Pester -Force -Scope CurrentUser -RequiredVersion 5.0.0
    Import-Module -Name Pester -Force -Scope Global -RequiredVersion 5.0.0
}

