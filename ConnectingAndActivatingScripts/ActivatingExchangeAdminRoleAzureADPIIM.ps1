#Activating Roles in Privileged Identity Management
#Install-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
$Date = Get-Date
Import-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
Connect-PimService
Get-PrivilegedRoleAssignment | Where-Object {$_.RoleName -eq "Exchange Administrator"} | Enable-PrivilegedRoleAssignment -Reason "Daily Activation $Date"