#https://stackoverflow.com/questions/37688708/iterate-over-psobject-properties-in-powershell/47930107#47930107

$Counter = [PSCustomObject]@{
	A = 3
	B = 4
	C = 5
	D = 6
	E = 7
	F = 8
	G = 9
	H = 10	
}
#$Counter.TOTAL += 100

$Counter | Get-Member -Type NoteProperty | ForEach {
	Write-Output "$($_.name): $($Counter.($_.name))"
}

cmd /c pause