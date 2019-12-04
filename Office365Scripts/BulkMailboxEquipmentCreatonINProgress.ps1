$File = Import-Csv .\EquipmentCalendars.csv
$DisplayNames = $File.Name
$Emails  = $File.EmailAddress
$Users = $File.Users
$Aliases = $File.Alias

#Creating the Equipment Mailboxes
for ($iteration = 0; $iteration -lt $File.Length; $iteration++){
     
     New-Mailbox -Name $File.Name[$iteration] -Equipment -Alias $File.Alias[$iteration] -DisplayName $File.Name[$iteration] -PrimarySmtpAddress $File.EmailAddress[$iteration]
     $File.Name[$iteration]
     $File.EmailAddress[$iteration]
}
#Adding Owners to the mailbox
for ($iteration = 0; $iteration -lt $File.Length; $iteration++){
    #Get-Mailbox -Identity $File.EmailAddress[$iteration] | Add-MailboxPermission -User $File.Users -AccessRights FullAccess
    #Need User to the mailboxes. Only way to do that is to add each user individually. 
    #inner for loop needed. 
    foreach($value in $File.Users){
        Add-MailboxPermission -Identity $File.EmailAddress[$iteration] -User $value -AccessRights FullAccess -InheritanceType All -AutoMapping $false
    }
}
#add users as moderators 
for ($index = 0; $index -lt $File.Length; $index++){
    foreach($value in $Users){
        Set-Mailbox -Identity $File.EmailAddress[$index] -ModeratedBy @{Add=$Value} -ModerationEnabled $true
    }
}
<#
#$Users[0..]
#this loop while useful is not needed. 
for ($index = 0; $index -lt $Users.Length - 1; $index++){
    $Users[$index] = '"' + $Users[$index] + '"'
}
#Create a String of the Users to add them as moderators
$UsersString = $Users[0..7] -join " , "
$UsersString = $UsersString.TrimEnd(" , ")
$User

'''
Foreach($mailbox in $File.EmailAddress){
    Remove-MailboxPermission -Identity $mailbox -User jreid@atarabio.com -AccessRights FullAccess
}

Foreach($mailbox in $File.EmailAddress){
    Get-MailboxPermission -Identity $mailbox -User jreid@atarabio.com
}
'''
#>