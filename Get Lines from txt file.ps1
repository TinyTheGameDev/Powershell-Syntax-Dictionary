$file = "$PSScriptRoot\myFile.txt"
foreach($line in Get-Content $file) {
	#Do The Things
	Add-Content -Path $ -Value $line
}