#New way to connect to Exchange Online with MFA

#Install-Module ExchangeOnline
#only needed if new machine

#Create the PSSession and import it to create a connection to O365. This works with MFA. The Script will then prompt you for your credentials.
$ExchangeSession = New-PSSession
Import-PSSession $ExchangeSession

