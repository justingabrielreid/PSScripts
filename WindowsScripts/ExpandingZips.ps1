#Author Justin Reid
#Extracting Zip Folders
$zipFilePath = [string](Read-Host -Prompt "Zip file path: ")
$destinationPath = [string](Read-Host -Prompt "Desired Destination: ")
Expand-Archive -Path $zipFilePath -DestinationPath $destinationPath


