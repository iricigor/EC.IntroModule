# only publish if commit message starts with !publish
if ($Env:APPVEYOR_REPO_COMMIT_MESSAGE -notmatch ', publish!$') {
    Write-Output "No publishing from AppVeyor, to automatically publish, finish commit message with ', publish!'"
    exit
}

if ($env:OS -notmatch 'Windows') {
    Write-Output 'Publishing possible only from Windows hosts'
    exit
}

# check if this version already exists
$ModuleName = 'SE.IntroModule'

$Manifest = Test-ModuleManifest -Path (Join-Path . "$ModuleName.psd1")
$LocalVersion = $Manifest.Version.ToString()

try {
    $RemoteModule = Find-Module $ModuleName -Repository PSGallery
    $RemoteVersion = $RemoteModule.Version.ToString()    
} catch {
    $RemoteVersion = 'not found'
}

if ($LocalVersion -eq $RemoteVersion) {
    Write-Warning "Module $ModuleName with version $LocalVersion already exists. Consider bumping version."
    exit
}

# we proceed with publish
Write-Output "Publishing version $LocalVersion to PSGallery, currently published version is $RemoteVersion"
try {
    Publish-Module -Path . -Repository PSGallery -NuGetApiKey $env:MyPSGalleryAPIKey -ea Stop -Verbose
    Write-Output "Module successfully published!"
} catch {
    Write-Output "Publishing failed: $_"
}