#Forcing Password change for multiple Users
#Connect to AzureAD if you have not
Import-Module AzureAD
Connect-AzureAD
#Navigate to path of the file 
$csv = Get-Content -Path (Read-Host -Prompt "Enter the path to the file: ")

#Too dangerous!
#foreach( $user in $csv ){ 
#    Get-AzureADUser -All $true | Where-Object -Property Displayname -EQ $user | Set-AzureADUserPassword -EnforceChangePasswordPolicy $true
#}
$UsersAD = foreach ($user in $csv){
    Get-AzureADUser -Filter "DisplayName eq '$user'"
}

foreach ($userInAD in $UsersAD){
    Set-AzureADUserPassword -ObjectId $userInAD.UserPrincipalName -ForceChangePasswordNextLogin $true
}

#Get-AzureADUser -All $true | Where-Object -Property Displayname -EQ $csv[0] | Set-AzureADUserPassword -EnforceChangePasswordPolicy $true
$justin = "Justin Reid"
#This works. Will use this syntax in the loop
$justinAD = Get-AzureADUser  -Filter "DisplayName eq '$justin'"
Get-Command -Name "*password*" -Module AzureAD

$UsersAD | select DisplayName, PasswordPolicies
$justinAD | select Displayname, PasswordPolicies
