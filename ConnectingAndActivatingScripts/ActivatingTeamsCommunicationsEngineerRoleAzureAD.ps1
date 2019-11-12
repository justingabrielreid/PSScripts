#Activating Roles in Privileged Identity Management: Teams Communications Support Engineer
#Install-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
$Date = Get-Date
Import-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
Connect-PimService
Get-PrivilegedRoleAssignment | Where-Object {$_.RoleName -eq "Teams Communications Support Engineer"} | Enable-PrivilegedRoleAssignment -Reason "Daily Activation $Date"