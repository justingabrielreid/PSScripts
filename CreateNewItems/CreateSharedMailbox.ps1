#Author Justin Reid 
#Script to create Shared Mailboxes
#must activate the Exchange Service Administrator Role First
#note not tested.  
$MailboxName = read-host "Enter the Name of the Shared Mailbox, "
$email = read-host "Enter the e-mail address to use, it must end with @atarabio.com: "
$owner = Read-Host -Prompt "Enter the email address of the owner of the mailbox: "
#
#
#
Write-Host "Creating a new shared mailbox: "
#
#
#
New-Mailbox -Shared -Name $MailboxName -PrimarySmtpAddress $email
#
#
#
Write-Host "Setting account creation"
#
#
#
#
Write-Host "Setting account permissions"
Add-MailboxPermission -Identity $MailboxName -User $owner -AccessRights FullAccess -InheritanceType All -AutoMapping $true
Add-RecipientPermission -Identity $MailboxName -AccessRights SendAs -Trustee $owner
