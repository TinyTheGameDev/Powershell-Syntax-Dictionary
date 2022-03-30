$MyScriptName = Split-Path $PSCommandPath -leaf
$host.ui.RawUI.WindowTitle = $MyScriptName

cmd /c pause