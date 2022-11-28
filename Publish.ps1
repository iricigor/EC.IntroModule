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

$dir1 = Join-Path $PSScriptRoot $ModuleName
$dir2 = Join-Path $dir1 'Public'
New-Item $dir1, $dir2 -ItemType Directory
Copy-Item "$ModuleName.ps*1" $dir1 # copy psd1, psm1 to target directory
Copy-Item Public/*.ps1 $dir2
$CopiedFiles = Get-ChildItem $dir1 -Recurse -File
if ($CopiedFiles.Count -ne 4) {
    $CopiedFiles
    Write-Error "There is an issue with copied files, we expected exactly 4" -ea Stop
}


# we proceed with publish
if (!$Env:MyPSGalleryAPIKey) {
    Write-Warning 'MyPSGalleryAPIKey environment variable is not set. Publishing is not possible.'
    exit
} else {
    Write-Output "Publishing version $LocalVersion to PSGallery, currently published version is $RemoteVersion..."
    try {
        Publish-Module -Path $dir1 -Repository PSGallery -NuGetApiKey $env:MyPSGalleryAPIKey -ea Stop -Verbose
        Write-Output "Module successfully published!"
    } catch {
        Write-Output "Publishing failed: $_"
    }
}