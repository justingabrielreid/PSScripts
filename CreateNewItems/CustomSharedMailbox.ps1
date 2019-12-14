#Author Justin Reid 
#Script to create Shared Mailboxes
#must activate the Exchange Service Administrator Role First
#note not tested.  
$MailboxDisplayName = read-host "Enter the Name of the Shared Mailbox: "
$MailboxName = $MailboxDisplayName.Replace(" ", "")
$email = read-host "Enter the e-mail address to use, it must end with @atarabio.com: "
$owner = Read-Host -Prompt "Enter the email address of the owner of the mailbox: "
$password = Read-Host -Prompt "Enter password for the mailbox: " -AsSecureString
#
#
#
Write-Host "Creating a new shared mailbox: "
#
#
#
New-Mailbox -Shared -Name $MailboxName -DisplayName $MailboxName -Alias $MailboxName -PrimarySmtpAddress $email -Password $password 
#
#Wait for the mailbox to create
Start-Sleep -Milliseconds 30
#Hide the mailbox from addressbook
Set-Mailbox -Identity $email -HiddenFromAddressListsEnabled $true
Start-Sleep -Milliseconds 5
Write-Host "Setting account creation"
#
#
#
#
Write-Host "Setting account permissions"
Add-MailboxPermission -Identity $MailboxName -User $owner -AccessRights FullAccess -InheritanceType All -AutoMapping $false
Start-Sleep -Milliseconds 10
Add-RecipientPermission -Identity $MailboxName -AccessRights SendAs -Trustee $owner
