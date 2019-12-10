#Sending Emails to a list of users in a csv

#Note: remove spaces in Display Name column and SAM Account Name column. For simplicity the Display Name field has been renamed to DisplayName
#And the SAM account Name field has been renamed to SAM.

#Setting the default SMTPServer
$SmtpServer = 'smtp.office365.com'
$SMTPPort = 587
#Prompt for the senders email address
$SenderAddress = Read-Host -Prompt "Enter Sender's Email Address: "
$SenderPassword = Read-Host -Prompt "Enter your password: "
#Prompt for Recipient Email Address
$RecepientAddress = Read-Host -Prompt "Enter the recipient's address: "
#Setting up authentication to SMTP server
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SenderAddress, ($SenderPassword | ConvertTo-SecureString -AsPlainText -Force)
$Credentials2 = Get-Credential -Message "Enter your credentials"

#Open file explorer to locate the CSV file
<#
$emailCSV = New-Object system.windows.forms.openfiledialog
$emailCSV.Title="Select CSV: "
$emailCSV.MultiSelect = $False
$emailCSV.showdialog()
#>

#Composing the email. 
$SubjectLine = "Test Email."
$EmailBody = "Testing CMDlet"

#Import the CSV and assign it to a variable
#Import-Csv $emailCSV.FileName -OutVariable CSVObject
#foreach($emailCSV) {Send-MailMessage -From $SenderAddress -To $RecipientAddress -Subject "Testing Cmdlet" -Body "Testing Email Functionality" -Priority High -DeliveryNotificationOption OnSuccess, OnFailure -SmtpServer $SmtpServer -UseSsl -Credential $Credentials}
Send-MailMessage -To $RecepientAddress -From $SenderAddress -Subject $SubjectLine -Body $EmailBody -BodyAsHtml -Priority High -DeliveryNotificationOption OnFailure, OnSuccess -SmtpServer $SmtpServer -Port $SMTPPort -Credential $Credentials2 -UseSsl -Verbose
