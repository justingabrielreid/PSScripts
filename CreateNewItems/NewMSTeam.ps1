#Author: Justin Reid
#Creating a new MS Team
#must be connected to the Teams PowerShell Module

$DisplayName = Read-Host -Prompt "DisplayName of the team?"
$Description = Read-Host -Prompt "Description of the team?"
$MailNickName = Read-Host -Prompt "Alias of the team? No spaces"
$Owner = Read-Host -Prompt "Owner of the team?"
$Visibility = Read-Host -Prompt "Public or Private?"
$Discoverability = Read-Host -Prompt "Searchable? Yes or No?"
$Searchable = $true
if ($Discoverability.ToLower() -eq "no" -or $Discoverability.ToLower() -eq "n")
{
    $Searchable = $false
}


New-Team -DisplayName $DisplayName -Description $Description -MailNickName $MailNickName -Owner $Owner -Visibility $Visibility -ShowInTeamsSearchAndSuggestions $Searchable