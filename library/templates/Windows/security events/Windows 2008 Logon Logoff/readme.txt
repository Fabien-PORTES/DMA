Extracting Windows Server Security Events logs
copyright Brainwave 2011
-----------------------------------------------


You can extract security events with the psloglist.exe tool from Microsoft (PsTools) 
http://technet.microsoft.com/en-us/sysinternals/bb897544.aspx

To extract security events which occured on the last 90 days on the local computer use the following command line :
psloglist.exe -d 90 -s -r -i 4624,4634,4625 Security >security_events.csv

Note that :
1. You must have administration privilege
2. The result is a CSV file with a header

If you want to extract security events from a list of distant computers use the following command line :
psloglist.exe @servers.txt -d 90 -s -r -i 4624,4634,4625 Security >security_events.csv
Where servers.txt contains the servers list (one server name per line)


The Audit Logon Events documentation is available here :
http://www.microsoft.com/downloads/en/details.aspx?FamilyID=82e6d48f-e843-40ed-8b10-b3b716f6b51b

