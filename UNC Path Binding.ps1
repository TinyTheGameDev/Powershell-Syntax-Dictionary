#UNC Error Prevention
$pathInfo = [System.Uri]$PSScriptRoot
if($pathInfo.IsUnc) {
	#Get used drives
	$used = Get-PSDrive | Select-Object -Expand Name | Where-Object { $_.Length -eq 1 }
	
	#Pick an un-used Drive
	$drive = 65..90 | ForEach-Object { [string][char]$_ } | Where-Object { $used -notcontains $_ } | Select-Object -First 1
	
	#Map drive
	New-PSDrive -Name $drive -PSProvider FileSystem -Root "$PSScriptRoot" -persist
	
	#Directorys
	$myFolder = "$drive"+":"
	
	#Unmap Drive
	Remove-PSDrive -name $drive
} else {
	$myFolder = "$PSScriptRoot"
}
