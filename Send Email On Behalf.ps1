$User = "EMAIL"
$PWord = ConvertTo-SecureString -String "Email Password"-AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord


$mailParams = @{
	SmtpServer = 'smtp.office365.com'
	Port = '587'
	UseSSL = $true
	Credential = $Credential
	From = 'EMAIL'
	To = 'EMAIL'
	Subject = 'Test Subject'
	Body = 'Test Body'
	DeliveryNotificationOption = 'OnFailure'
	#Attachments = "$PSScriptRoot\MyAttachment.txt"
}

Send-MailMessage @mailParams


cmd /c pause