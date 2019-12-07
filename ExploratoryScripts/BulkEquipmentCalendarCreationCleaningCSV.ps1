$csv = Import-Csv C:\Users\jreid\Documents\equipmentCalendars2.csv                                            
#$csv                                                                                                          
$csv | foreach {
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
$csv | Export-Csv C:\Users\jreid\Documents\refinedEquipmentCalenders2.csv

