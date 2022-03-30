#Open Excel
$Excel = New-Object -ComObject excel.application

#Set screen to Visible or Invible ($true | $false)
$Excel.visible = $true

#Set to ignore errors ($true | $false)
$Excel.DisplayAlerts = $false

#Open Workbook
$Excel_Book = $Excel.Workbooks.Open("$fileLocation")

#Open Worksheet
$Excel_Sheet = $Excel_Book.Sheets.Item(1)

#SaveAs Workbook
#Format: https://docs.microsoft.com/en-us/office/vba/api/excel.xlfileformat
#51 = Excel Workbook default
$Excel_Book.SaveAs("$FileName", $Format)

#Close Workbook
$Excel_Book.Close()

#Close Excel
$Excel.Quit()