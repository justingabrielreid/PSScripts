#Author: Justin Reid
#Setting Automatic Reply
#Gather Admin Input 
Write-Host -Object "Script to set Automatic Replies: "
$MailboxName = Read-Host -Prompt "Enter Mailbox Name: "
$InternalMessage = Read-Host -Prompt "Enter Automatic Reply: "
#
#
#Setting the AutoReply 

Set-MailboxAutoReplyConfiguration -Identity $MailboxName -AutoReplyState 
