Import-Module AzureAD
#Install-Module MSOnline
Import-Module MSOnline
Connect-MsolService
$User = Get-MsolUser -MaxResults All | where-object {$_.DisplayName -eq (Read-Host -Prompt "Enter the users first and last name")}
$User.Licenses


