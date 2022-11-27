# EC.IntroModule

[![Build Status](https://dev.azure.com/iiric/PS1/_apis/build/status/EC%20Intro%20Module%20Tests?branchName=master)](https://dev.azure.com/iiric/PS1/_build/latest?definitionId=47&branchName=master)
[![Tests](https://img.shields.io/azure-devops/tests/iiric/PS1/47?compact_message)](https://dev.azure.com/iiric/PS1/_build/latest?definitionId=47&branchName=master)
[![Code Coverage](https://img.shields.io/azure-devops/coverage/iiric/PS1/47)](https://dev.azure.com/iiric/PS1/_build/latest?definitionId=47&branchName=master)

[![latest version](https://img.shields.io/powershellgallery/v/EC.IntroModule.svg?label=latest+version)](https://www.powershellgallery.com/packages/EC.IntroModule)
[![downloads](https://img.shields.io/powershellgallery/dt/EC.IntroModule.svg?label=downloads)](https://www.powershellgallery.com/pagitckages/EC.IntroModule)
[![platforms](https://img.shields.io/powershellgallery/p/EC.IntroModule)](https://www.powershellgallery.com/pagitckages/EC.IntroModule)


## Introduction

This is PowerShell introduction module. It explains advanced functions and CI/CD integrations.

## How to install

You can install this module from PowerShell Gallery (preferred way) or by cloning GitHub repository.
Module is tested both on Windows PowerShell and PowerShell Core and on Windows, Linux and MacOS.

### From PSGallery

```PowerShell
Find-Module EC.IntroModule -Repository PSGallery | Install-Module -Scope CurrentUser -Force
```

### From GitHub

```PowerShell
git clone https://github.com/iricigor/EC.IntroModule.git    # Clone this repository
Import-Module ./EC.IntroModule/EC.IntroModule.psd1 -Force   # Import module
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

