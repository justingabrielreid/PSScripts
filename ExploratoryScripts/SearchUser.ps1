Import-Csv -Path .\JMP_Users.csv -OutVariable JMP
$activeUsers = @()
$inactiveUsers = @()
foreach ($user in $JMP.Users){
    Get-MsolUser -All -SearchString $user -ErrorVariable UserNotFound -OutVariable foundUser
    if ($UserNotFound -ne $null){
        $inactiveUsers += $user
    }
    else {
        $activeUsers += $foundUser.DisplayName
    }
}