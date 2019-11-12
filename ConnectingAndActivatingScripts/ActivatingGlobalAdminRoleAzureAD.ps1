Import-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule
Connect-PimService
Get-PrivilegedRoleAssignment | Where-Object {$_.RoleName -eq "Global Administrator"} | Enable-PrivilegedRoleAssignment -Reason "Daily Activation $Date"