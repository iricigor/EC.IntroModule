[CmdletBinding()]param()
# only publish if commit message starts with !publish
# if ($Env:APPVEYOR_REPO_COMMIT_MESSAGE -notmatch ', publish!$') {
#     Write-Output "No publishing from AppVeyor, to automatically publish, finish commit message with ', publish!'"
#     exit
# }

if ($env:OS -notmatch 'Windows') {
    Write-Output 'Publishing possible only from Windows hosts'
    exit
}

# check if this version already exists
$ModuleName = 'EC.IntroModule'
Write-Verbose "Checking local module $ModuleName manifest"
$Manifest = Test-ModuleManifest -Path (Join-Path . "$ModuleName.psd1") -Verbose:$false
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

# we proceed with publish
if (!$Env:MyPSGalleryAPIKey) {
    Write-Warning 'MyPSGalleryAPIKey environment variable is not set. Publishing is not possible.'
    exit
} else {
    Write-Output "Publishing version $LocalVersion to PSGallery, currently published version is $RemoteVersion..."
    try {
        Publish-Module -Path . -Repository PSGallery -NuGetApiKey $env:MyPSGalleryAPIKey -ea Stop -Verbose
        Write-Output "Module successfully published!"
    } catch {
        Write-Output "Publishing failed: $_"
    }
}