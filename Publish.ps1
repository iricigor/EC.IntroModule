[CmdletBinding()]param()

if ($env:OS -notmatch 'Windows') {
    Write-Output 'Publishing possible only from Windows hosts'
    exit
}

$ModuleName = 'EC.IntroModule'

# check if this version already exists
Write-Verbose "Checking local module $ModuleName manifest"
$ManifestFile = Join-Path $PSScriptRoot "$ModuleName.psd1"
Write-Verbose "  ..FileName $ManifestFile"
$Manifest = Test-ModuleManifest -Path $ManifestFile -Verbose:$false -ea Stop
$LocalVersion = $Manifest.Version.ToString()
Write-Verbose "  ...local module manifest version $LocalVersion found"

try {
    Write-Verbose "Checking for published module $ModuleName"
    $RemoteModule = Find-Module $ModuleName -Repository PSGallery -Verbose:$false -ea 0
    $RemoteVersion = $RemoteModule.Version.ToString()
    Write-Verbose "  ...remote module version $RemoteVersion found"
} catch {
    Write-Verbose "  ...remote module not found"
    $RemoteVersion = 'not found'
}

if ($LocalVersion -eq $RemoteVersion) {
    Write-Warning "Module $ModuleName with version $LocalVersion already exists. Consider bumping version."
    exit
}

# prepare publishing environment
Push-Location $PSScriptRoot
New-Item 'src','src/Public','src/en-US' -ItemType Directory | Out-Null
$a = ('EC.IntroModule.psd1','EC.IntroModule.psm1','Public/Get-Cube.ps1','Public/Get-Square.ps1','en-US\EC.IntroModule-help.xml')
$a | ForEach-Object {Copy-Item $_ -Destination (Join-Path 'src' $_)}
$CopiedFiles = Get-ChildItem 'src' -Recurse -File
if ($CopiedFiles.Count -ne 5) {
    $CopiedFiles
    Write-Error "There is an issue with copied files, we expected exactly 5, but we have $($CopiedFiles.Count)" -ea Stop
}
Pop-Location

# we proceed with publish
if (!$Env:MyPSGalleryAPIKey) {
    Write-Warning 'MyPSGalleryAPIKey environment variable is not set. Publishing is not possible.'
    exit
} else {
    Write-Output "Publishing version $LocalVersion to PSGallery, currently published version is $RemoteVersion..."
    try {
        Publish-Module -Path (Join-Path $PSScriptRoot 'src') -Repository PSGallery -NuGetApiKey $env:MyPSGalleryAPIKey -ea Stop -Verbose
        Write-Output "Module successfully published!"
    } catch {
        Write-Output "Publishing failed: $_"
    }
}