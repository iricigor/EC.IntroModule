#
# Import module
#

$ModuleName = 'EC.IntroModule'

$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$TestsRoot = (get-item $here).Parent.FullName
$ModuleRoot = (get-item $TestsRoot).Parent.FullName

Import-Module (Join-Path $ModuleRoot "$ModuleName.psd1") -Force
