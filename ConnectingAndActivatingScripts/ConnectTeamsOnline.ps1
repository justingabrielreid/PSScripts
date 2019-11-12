#Connecting to Microsoft Teams
#Author: Justin Reid
#Install-Module MicrosoftTeams
#Need more access to Teams
$User = Read-Host -Prompt "Enter your email: "
$Credential = Get-Credential
Connect-MicrosoftTeams -AccountId $User -Credential $Credential
