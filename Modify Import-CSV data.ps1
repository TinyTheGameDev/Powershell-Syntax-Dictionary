Get-ChildItem -path "$PSScriptRoot\*.txt" | Foreach-Object  {
	$file = $_.fullname
	
	#Import data to powershell using Import-CSV
	$test = Import-csv $_.FullName -Delimiter "|" 
	
	#Foreach Object in Import-CSV data
	$test | Foreach {
		#Data to manipulate needs to be the header	
		#Example data appends double quotes to beginning and end of current object's COLUMN field
		$_.COLUMN = '"' + $_.COLUMN + '"'
	} 
	
	#Export modified data as csv
	$test | Export-csv "Test.csv"

}

cmd /c pause