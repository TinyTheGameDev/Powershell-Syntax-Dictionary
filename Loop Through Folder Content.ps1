#Base folder
Get-ChildItem -path "$PSScriptRoot" | Foreach-Object {
	#Object Variables
	$variable = $_.Attributes        #System.IO.FileAttributes Attributes {get;set;}
	$variable = $_.CreationTime      #datetime CreationTime {get;set;}
	$variable = $_.CreationTimeUtc   #datetime CreationTimeUtc {get;set;}
	$variable = $_.Directory         #System.IO.DirectoryInfo Directory {get;}
	$variable = $_.DirectoryName     #string DirectoryName {get;}
	$variable = $_.Exists            #bool Exists {get;}
	$variable = $_.Extension         #string Extension {get;}
	$variable = $_.FullName          #string FullName {get;}
	$variable = $_.IsReadOnly        #bool IsReadOnly {get;set;}
	$variable = $_.LastAccessTime    #datetime LastAccessTime {get;set;}
	$variable = $_.LastAccessTimeUtc #datetime LastAccessTimeUtc {get;set;}
	$variable = $_.LastWriteTime     #datetime LastWriteTime {get;set;}
	$variable = $_.LastWriteTimeUtc  #datetime LastWriteTimeUtc {get;set;}
	$variable = $_.Length            #long Length {get;}
	$variable = $_.Name              #string Name {get;}
	
	#Note: to skip current object, use return;
	if($_.name -eq "FileToSkip.txt") {
		return;
	}
}

#Recursive through all subfolders
Get-ChildItem -path "$PSScriptRoot" -recurse | Foreach-Object {
	#Do things
}

#Filter so only one type appears
Get-ChildItem -Path "$PSScriptRoot"  -exclude "*.ps1" | Foreach-Object {
	#Do Things
}
