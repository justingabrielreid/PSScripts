#Find the file
$emailCSV = New-Object system.windows.forms.openfiledialog
$emailCSV.Title="Select CSV: "
$emailCSV.MultiSelect = $False
$emailCSV.showdialog()
#Import the CSV file and assign it to the variable.
Import the CSV and assign it to a variable
Import-Csv $emailCSV.FileName -OutVariable CSVObject
#create an array of email addresses from the sam account name
$EmailAddress = @()
$CSVObject | foreach {$EmailAddress += ($_.SAM + "atarabio.com")}
#Add the array to the existing Object
for ($i = 0; $i -lt $EmailAddress.Length; $i++){
    Add-Member -InputObject $CSVObject[$i] -Name "EmailAddress" -MemberType NoteProperty -Value $EmailAddress[$i] -Force
}
#export to file and overwrite with the new and existing properties
$CSVObject | Export-Csv -Path $emailCSV.FileName
