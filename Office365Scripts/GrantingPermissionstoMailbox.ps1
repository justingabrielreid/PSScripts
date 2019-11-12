#Granting Mailbox Permissions: 
$Mailbox = Read-Host -Prompt "Enter the mailbox name: "
$UserName = Read-Host -Prompt "Enter Full Name or email of the User: "
#Grant FullAccess to Mailbox
(Get-Mailbox -Identity $Mailbox) | Add-MailboxPermission -User $UserName -AccessRights FullAccess
#Grant SendAs to Mailbox
(Get-Mailbox -Identity $Mailbox) | Add-RecipientPermission -Trustee $UserName -AccessRights SendAs