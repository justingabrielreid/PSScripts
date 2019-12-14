#Find and Open the CSV file
$equipmentCSV = New-Object system.windows.forms.openfiledialog
$equipmentCSV.Title="Select CSV: "
$equipmentCSV.MultiSelect = $False
$equipmentCSV.showdialog()
#Import the CSV and assign it to a variable
Import-Csv $equipmentCSV.FileName -OutVariable csv


$csv | foreach {
    #Create Equipment Mailbox.Need to find out how to configure the UserPrincipalName as well. 
    New-Mailbox -Name "$_.InstrumentID" -Alias $_.Alias -DisplayName $_.DisplayName -PrimarySmtpAddress $_.EmailAddress -Equipment
    #Set the Calendar Processing to AutoAccept. Additionally will not allow conflicts.
    #needs to pause here.
    Start-Sleep -Milliseconds 30
    #set the access rights of the calendar so the title and info can be viewed. THIS WILL NEED TO BE EDITED
    Set-MailboxFolderPermission -Identity $_.Calendar -User Default -AccessRights LimitedDetails
    Start-Sleep -Milliseconds 10
    Set-CalendarProcessing -Identity $_.EmailAddress -AutomateProcessing AutoAccept -DeleteSubject $false -AddOrganizerToSubject $true -AllowConflicts $false
}
#output the results to a file:
$csv | foreach {Get-Mailbox -Identity $_.EmailAddress | select UserPrincipalName, Alias, PrimarySMTP*, DisplayName, Name} | Export-Csv -Path $env:USERPROFILE\Documents\SuccesfulMailboxes.csv