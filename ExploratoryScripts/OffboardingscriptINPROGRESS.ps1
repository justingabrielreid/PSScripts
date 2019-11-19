#Requires connection to Azure and MSOnline
#Author: Justin Reid
#Script to offboard a user in Office 365. Remove their devices from Intune and block sign in.
<#
Import-Module AzureAD, MSOnline
Connect-MsolService
Connect-AzureAD
#>
$User = Get-MsolUser -All | where -Property DisplayName -EQ (Read-Host -Prompt "Enter their first and last name: ")
$User
$UserAD = Get-AzureADUser -ObjectId $User.UserPrincipalName
Write-Host "Removing devices from Azure AD, device manager. This will remove all devices including their laptop and smartphone."
Get-MsolDevice -RegisteredOwnerUpn $User.UserPrincipalName | Remove-MsolDevice -WhatIf
Write-Host "This will block their sign in to Office 365."
Set-AzureADUser -ObjectId $UserAD.UserPrincipalName -AccountEnabled $false
