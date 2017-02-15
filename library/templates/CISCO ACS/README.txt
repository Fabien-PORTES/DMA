CISCO ACS
=========
=========

You should consult the "Software Developer’s Guide for Cisco Secure Access Control System 5.3" chapter 5 "Using the Scripting Interface" if you want to learn how to extract data from CISCO ACS.
You can find this chapter online : http://www.cisco.com/en/US/docs/net_mgmt/cisco_secure_access_control_system/5.3/sdk/cli_imp_exp.pdf

At a glance :
=============

The template reads "User" data




HOW TO EXPORT DATA THANKS TO A COMMAND LINE TOOL
------------------------------------------------
Data is exported thanks to the "export-data" command

Syntax :
export-data user repository file-name result-file-name  none

where 
- repository : Name of the remote repository to which to export the ACS objects, in this case, the internal users
- file-name : Name of the export file in the remote repository
- result-file-name : Name of the file that contains the results of the export operation. This file is available in the remote repository when the export process completes

Example : export-data user repository01 file01 resultfile01 none

You can find more information on the "export-data" command at : http://www.cisco.com/en/US/docs/net_mgmt/cisco_secure_access_control_system/5.3/command/reference/cli_app_a.html#wp1893300




HOW TO EXPORT DATA THROUGH THE WEB INTERFACE
--------------------------------------------
1. Log into the ACS 5.3 web interface.
2. Choose Users and Identity Stores > Internal Identity Stores > Users.
	The Users page appears.
3. Click File Operations.
	The File Operations wizard appears.
4. Choose:
	Update—Updates the existing internal user list.
5. Click Next.
	The Template page appears.
6. Click Download Add Template.
7. Click Save to save the template to your local disk.
