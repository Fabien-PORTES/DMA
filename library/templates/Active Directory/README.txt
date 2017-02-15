You can extract the Active Directory data in LDIF format by using the Microsoft ldifde tool :
ldifde -f ad.ldif -r "(|(objectclass=organizationalPerson)(objectclass=organizationalUnit)(objectclass=group)(objectclass=container))
or
ldifde -b [LOGIN] [DOMAIN] [PASSWORD] -f ad.ldif -r "(|(objectclass=organizationalPerson)(objectclass=organizationalUnit)(objectclass=group)(objectclass=container))


If you want to schedule the extraction, we encourage you to generate a file suffixed by the date of the day.
You can do it by creating a cmd file which will rename the ldif file afterwards :
for /F "tokens=1,2,3 delims=/ " %%i in ('date /T') do set DAY=%%k%%j%%i
rename ad.ldif ad%DAY%.ldif

