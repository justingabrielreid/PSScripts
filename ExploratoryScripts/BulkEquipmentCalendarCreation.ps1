$csv = Import-Csv C:\Users\jreid\Documents\refinedEquipmentCalenders2.csv
$csv | foreach {
    #Create Equipment Mailbox.Need to find out how to configure the UserPrincipalName as well. 
    New-Mailbox -Name $_.InstrumentID -Alias $_.Alias -DisplayName $_.DisplayName -PrimarySmtpAddress $_.EmailAddress -Equipment
    #Set the Calendar Processing to AutoAccept. Additionally will not allow conflicts.
    #needs to pause here.
    Start-Sleep -Milliseconds 30
    #set the access rights of the calendar so the title and info can be viewed. 
    Set-MailboxFolderPermission -Identity $_.EmailAddress -User Default -AccessRights Reviewer
    Start-Sleep -Milliseconds 10
    Set-CalendarProcessing -Identity $_.EmailAddress -AutomateProcessing AutoAccept -AllowConflicts $false
}
#output the results to a file:
$csv | foreach {Get-Mailbox -Identity $_.EmailAddress | select UserPrincipalName, Alias, PrimarySMTP*, DisplayName, Name} | Export-Csv -Path $env:USERPROFILE\Documents\SuccesfulMailboxes.csv