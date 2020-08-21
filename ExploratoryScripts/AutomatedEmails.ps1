#Sending Emails to a list of users in a csv

#Note: remove spaces in Display Name column and SAM Account Name column. For simplicity the Display Name field has been renamed to DisplayName
#And the SAM account Name field has been renamed to SAM.

#Setting the default SMTPServer
$SmtpServer = 'smtp.office365.com'
$SMTPPort = 587
#Prompt for the senders email address
$SenderAddress = Read-Host -Prompt "Enter Sender's Email Address: "
#Setting up authentication to SMTP server
$Credentials = Get-Credential -UserName $SenderAddress -Message "Enter your password"

#Open file explorer to locate the CSV file

$emailCSV = New-Object system.windows.forms.openfiledialog
$emailCSV.Title="Select CSV: "
$emailCSV.MultiSelect = $False
$emailCSV.showdialog()
Import the CSV and assign it to a variable
Import-Csv $emailCSV.FileName -OutVariable CSVObject

#Composing the email. 
$SubjectLine = "Test Email."
$EmailBody = "Testing CMDlet"
foreach($CSVObject) {Send-MailMessage -From $SenderAddress -To $_.EmailAddress -Subject $SubjectLine -Body $EmailBody -Priority High -DeliveryNotificationOption OnSuccess, OnFailure -SmtpServer $SmtpServer -Port $SMTPPort -UseSsl -Credential $Credentials}

#Send-MailMessage -To $RecepientAddress -From $SenderAddress -Subject $SubjectLine -Body $EmailBody -BodyAsHtml -Priority High -DeliveryNotificationOption OnFailure, OnSuccess -SmtpServer $SmtpServer -Port $SMTPPort -Credential $Credentials -UseSsl -Verbose
