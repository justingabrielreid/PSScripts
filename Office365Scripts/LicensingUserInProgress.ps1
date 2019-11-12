Import-Module AzureAD
#Install-Module MSOnline
Import-Module MSOnline
Connect-MsolService
Get-MsolUser -MaxResults All | where-object {$_.DisplayName -eq "Ryan Faucher"}
Get-MsolUser | where-object {$_.DisplayName -contains "Faucher"}
(Get-MsolUser -UserPrincipalName rfaucher@atarabio.com).licenses