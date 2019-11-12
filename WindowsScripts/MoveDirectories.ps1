#Author: Justin Reid 
#Moving Entire File Directories to a new location. 
$currentPath = [string](Read-Host -Prompt "Enter the current path of the folder: ")
$destinationPath = [string](Read-Host -Prompt "Enter the destination path of the folder: ")
Move-Item $currentPath -Filter * -Destination $destinationPath