#MS Teams Report
#Discovery of existing Teams: Channels, Owners, Members

#Connect to Teams
Import-Module MicrosoftTeams -Verbose
Connect-MicrosoftTeams
#Find all the teams in Lytx
$AllTeams = Get-Team

$TeamsChannel = foreach($Team in $AllTeams){
    Get-TeamChannel -GroupId $Team.GroupID | select 
}

foreach($Team in $AllTeams){
    $team.GroupID
    $Team.Displayname
}