#Requires connection to Azure and MSOnline
#Author: Justin Reid
#Script to offboard a user in Office 365. Remove their devices from Intune and block sign in.
Import-Module AzureAD 
Import-Module MSOnline
Connect-MsolService
Connect-AzureAD
$User = Get-MsolUser -All | where -Property DisplayName -EQ (Read-Host -Prompt "Enter their first and last name: ")
Write-Host "This is the identity of the user: "
$User | Format-Table -Property DisplayName, UserPrincipalName
Start-Sleep -s 5
$answer = Read-Host "Is this the correct user? Y or N?"
#Conditional Statemment 
if ($answer -eq "y" -or "yes"){
    $UserAD = Get-AzureADUser -ObjectId $User.UserPrincipalName
    Write-Host "Removing devices from Azure AD, device manager. This will remove all devices including their laptop and smartphone."
    Get-MsolDevice -RegisteredOwnerUpn $User.UserPrincipalName | Remove-MsolDevice -WhatIf
    Write-Host "This will block their sign in to Office 365."
    Set-AzureADUser -ObjectId $UserAD.UserPrincipalName -AccountEnabled $false
}
else
{
    break
}
