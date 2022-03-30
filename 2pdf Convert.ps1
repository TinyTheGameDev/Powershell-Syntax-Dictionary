#Run on SL-Tools server as the licence is stored there
#Support documentation: https://www.cmd2pdf.com/

$fileLocation = "File Location"					#For multiple documents, use "*.extension" ex all spreadsheets would be "*.xlsx"
$fileDestination = "File Destination"	
2pdf.exe -src $fileLocation -dst $fileDestination

