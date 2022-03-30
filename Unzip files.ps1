Get-ChildItem "$PSScriptRoot\zips" | Foreach-Object {
	#Information about object
	$file = $_.basename
	$fullname = $_.fullname
	$ext = $_.extension
	
	#Extract
	Expand-Archive -LiteralPath $fullname -destinationpath "$PSScriptRoot\Processing\$file"
}


cmd /c pause