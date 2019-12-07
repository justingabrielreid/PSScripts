Import-Csv -Path .\JMP_Users.csv -OutVariable JMP
$allJMPusers = $JMP.Users
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
$firstNameActive = @()
foreach($user in $activeUsers){
    $firstNameActive += $user.Split()[0]
}
$firstNameALLJMP = @()
foreach ($user in $allJMPusers){
    $firstNameALLJMP += $user.Split()[0]
}