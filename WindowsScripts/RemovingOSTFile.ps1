#Author: Justin Reid
#Purpose: Remove faulty OST files
#
#Stop Processes for Skype and Outlook
Get-Process -Name Skype* | Stop-Process
Get-Process -Name Outlook* | Stop-Process
#Remove OST FILE
Remove-Item -Path $env:USERPROFILE\AppData\Local\Microsoft\Outlook\*.ost

