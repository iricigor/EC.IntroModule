# EC.IntroModule

TODO:
[![Build status](https://ci.appveyor.com/api/projects/status/tlxsb0j6v9jdhq0s?svg=true)](https://ci.appveyor.com/project/iricigor/se-intromodule)
[![latest version](https://img.shields.io/powershellgallery/v/EC.IntroModule.svg?label=latest+version)](https://www.powershellgallery.com/packages/EC.IntroModule)
[![downloads](https://img.shields.io/powershellgallery/dt/EC.IntroModule.svg?label=downloads)](https://www.powershellgallery.com/pagitckages/EC.IntroModule)

## Introduction

This is PowerShell introduction module. It explains advanced functions and CI/CD integrations.

## How to install

You can install this module from PowerShell Gallery (preferred way) or by cloning GitHub repository.
TODO: Module is tested both on Windows PowerShell and PowerShell Core.

### From PSGallery

```PowerShell
Find-Module EC.IntroModule -Repository PSGallery | Install-Module -Scope CurrentUser -Force
```

### From GitHub

```PowerShell
git clone https://github.com/iricigor/EC.IntroModule.git      # Clone this repository
Import-Module .\EC.IntroModule\EC.IntroModule.psd1 -Force  # Import module
```

## How to use

Here are two commands for quick start with this module:

```PowerShell
Get-Command -Module EC.IntroModule # for list of all commands
Get-Command -Module EC.IntroModule | Get-Help | Select Name, Synopsis # for explanation on all commands
```

## Examples

For list of examples, run

```PowerShell
Get-Help Get-Square -Examples
Get-Help Get-Cube -Examples
```
