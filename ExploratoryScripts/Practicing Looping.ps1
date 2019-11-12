$Members = @()
$Members += (Get-Mailbox -Identity "Sim*").primarySMTPAddress
(Get-Mailbox -Identity "Julia*").primarySMTPAddress

for ($i=0; $i -lt $Members.Length; $i++){
    $Members[$i]
}

$Members

Get-DistributionGroup -Identity AVTEAM | Add-DistributionGroupMember -Member {for ($i=0; $i -lt $Members.Length; $i++){
    $Members[$i]
}
}
#Practice Looping
for ($i=0; $i -lt $Members.Length; $i++){
    Add-DistributionGroupMember -Identity AVTEAM -Member $Members[$i]
}





