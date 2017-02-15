BRAINWAVE GRC AUDIT / SAMPLE REPORTS SET
(c) BRAINWAVE 2011
---------------------------------------------

Please follow those principles if you want to use this set of reports for your own audits or compliance projects :

1. Applications
This set of reports support standard permission-based applications (ie : profiles or roles based applications)
Dedicated reports have been made for each permission family.
In order for this set of reports to display the correct information within the reports, you MUST FLAG EVERY APPLICATION to indicate 
if it is either a role based application or a DAC based application.
You do this by setting the APPLICATIONTYPE attribute of the application to
"Profile" for a role based or profile based application
"Filesystem" for a DAC application (ie : file shares)
"Physical" for physical access (ie : access card)
"Sharepoint" for Sharepoint access

2. Custom RefValues in the Concepts 
refvalue attributes are not included by default in the views and in the reports
If you are using refvalues in your project, you then MUST add the corresponding refvalue attributes in the corresponding views before using them in your reports
Don't forget to refresh the corresponding datasets in the reports you want to update before using them. 
 
 3. Using Rules for Controls
 A naming convention have been used to select only a subset of rules as controls in the reports :  The rule name (unique identifier) MUST begins by "control_"
 Don't forget to select "Include in execution plan" in the rules that you want to use as controls.
 
4. Multiple hierarchies
This set of reports doesn't support multiple hierarchies (organisation in matrix for instance)
  
 5. Graphical hierarchies in the web portal
 If you want to display organization structure in a graphical way, then you MUST have only one root in your organisation hierarchy.
 If it is not the case, we suggest that you add a virtual root (the name of the company or the name of your project for instance...)