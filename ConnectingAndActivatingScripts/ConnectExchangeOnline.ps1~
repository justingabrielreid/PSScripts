#New way to connect to Exchange Online with MFA

#Install-Module ExchangeOnline
#only needed if new machine
Import-Module ExchangeOnline
#Credential Prompting
Connect-EXOService -UserPrincipalName (Read-Host -Prompt "Enter your email address: ")
$PSSession = Get-PSSession
