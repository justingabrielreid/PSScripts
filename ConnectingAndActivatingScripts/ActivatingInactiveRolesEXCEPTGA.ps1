#Author: Justin Reid
Connect-PimService
#Enable every role that is not already elevated save for Global Administrator
Get-PrivilegedRoleAssignment | where -FilterScript {$_.IsElevated -eq $false -and $_.RoleName -ne "Global Administrator"} | Enable-PrivilegedRoleAssignment -Reason "Daily Activation"