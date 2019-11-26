#Discovery Script to find the conference room details by location 
#Have to be connected to ExchangeOnline
#Find all conference rooms in NorCal
Get-Mailbox -RecipientTypeDetails RoomMailbox -ResultSize Unlimited | where -Property Name -like "*NorCal*" -OutVariable NorCal | clip
#Find all conference rooms in ATOM
Get-Mailbox -RecipientTypeDetails RoomMailbox -ResultSize Unlimited | where -Property Name -like "*ATOM*" -OutVariable ATOM
#Find all Conference rooms in ION
Get-Mailbox -RecipientTypeDetails RoomMailbox -ResultSize Unlimited | where -Property Name -like "*ION*" -OutVariable ION

#Questions: Who are the approvers for the room?
#Questions: What are the calendarprocessing details? 
#Room capacity? 
#Anything else?
