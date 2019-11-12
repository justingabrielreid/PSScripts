#Author: Justin Reid
#Adding a member to a distribution group 
#distribution group name 
$DistributionGroupName = Read-Host -Prompt "Enter the name of a distribution group: "
$NewMember = Read-Host -Prompt "Enter the name of the new member: "
(Get-DistributionGroup -Identity $DistributionGroupName) | Add-DistributionGroupMember -Member $NewMember