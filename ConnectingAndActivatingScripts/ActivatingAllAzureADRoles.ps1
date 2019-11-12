#Activating all Role Assignments in PIM
#Author: Justin Reid
#Activating Roles in Privileged Identity Management
#Install-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
$Date = Get-Date
Import-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
Connect-PimService 
Get-PrivilegedRoleAssignment | Where-Object {$_.IsElevated -eq $false} | Enable-PrivilegedRoleAssignment -Reason "Daily Activation $Date"