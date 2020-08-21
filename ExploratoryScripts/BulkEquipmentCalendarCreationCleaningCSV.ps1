
#Find and Open the CSV file
$equipmentCSV = New-Object system.windows.forms.openfiledialog
$equipmentCSV.Title="Select CSV: "
$equipmentCSV.MultiSelect = $False
$equipmentCSV.showdialog()
#Import the CSV and assign it to a variable
Import-Csv $equipmentCSV.FileName -OutVariable CSVObject
                                           
#$csvObject                                                                                                          
$csvObject | foreach {
   #remove the - from the instrumentID as this will be used for the email address
   $emailAddress = $_.InstrumentID.split('-')
   #static method to join the newly created array into a string
   $emailAddress = [string]::Join("",$emailAddress)
   #create the alias
   $alias = $emailAddress
   #add the @atarabio.com
   $emailAddress += '@atarabio.com'    
   #create the displayName
   $displayName = $_.Location.insert(0, '[')
   $length = $displayName.Length
   $displayName = $displayName.Insert($displayName.Length, ']')
   $displayName += " " + $_.Instrument
   $_.DisplayName = $displayName
   $_.EmailAddress = $emailAddress
   $_.Alias = $alias
   #next step is to write this to the .csv so we can use the properties of the CSV to create the calendars. 
}
$csvObject | Export-Csv $equipmentCSV.FileName

