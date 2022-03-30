$objArray = [PSCustomObject] @()

for($i = 0; $i -lt 5; $i++) {
	$myObject = [PSCustomObject]@{
		SSN = '123456'+$i
		Name = $i
		Birthday = $i
		Age = $i	
	}
	$objArray += $myObject
}


$Number = 1234561
foreach($obj in $objArray) {
	if($obj.SSN -like $Number) {
		$obj.Name = 'VALUE'
		$obj.Birthday = 'VALUE'
		$obj.Age = 'VALUE'
	}
}

foreach($obj in $objArray) {
	Write-output $obj.SSN
	Write-Output $obj.Name
	Write-output $obj.Birthday
	Write-Output $obj.Age
	Write-Output "####################"
}

cmd /c pause