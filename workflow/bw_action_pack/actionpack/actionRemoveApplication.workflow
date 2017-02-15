<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="actionRemoveApplication" displayname="Application manual removal" description="Remove an application access for a given individual" scriptfile="/workflow/bw_action_pack/actionpack/actionRemoveApplication.javascript" statictitle="Remove an application access for a given individual">
		<Component name="CSTART" type="startactivity" x="29" y="79" w="200" h="114" title="Start" compact="true">
			<Actions>
				<Action name="U1415629430108" action="executeview" viewname="actionpackIdentitypicker" attribute="identityhrcode">
					<ViewParam name="P14156294301080" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415629430108_1" attribute="hrcode" variable="identityhrcode"/>
					<ViewAttribute name="P1415629430108_2" attribute="fullname" variable="identityfullname"/>
				</Action>
				<Action name="U1415629458979" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14156294589790" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415629458979_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415629540691" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountLogins">
					<ViewParam name="P14156295406910" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14156295406911" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415629540691_2" attribute="login" variable="accountLogins"/>
					<ViewAttribute name="P1415629540691_3" attribute="username" variable="accountUsernames"/>
					<ViewAttribute name="P1415629540691_4" attribute="repositorydisplayname" variable="accountRepositorries"/>
				</Action>
			</Actions>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="custom1" attribute="applicationname"/>
				<Attribute name="custom2" attribute="identityhrcode"/>
				<Attribute name="custom3" attribute="identityfullname"/>
				<Attribute name="custom4" attribute="requester"/>
			</Ticket>
		</Component>
		<Component name="CEND" type="endactivity" x="401" y="79" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415628734407" priority="1"/>
		<Component name="C1415628734407" type="manualactivity" x="140" y="46" w="200" h="114" title="Remove the {dataset.applicationname.get()} application access for {dataset.identityfullname.get()}" duedate="{dataset.duedate.get()}">
			<Candidates name="role" role="A1415628897397" mail="A1415629343823" reassignmentmail="A1415629343823">
				<Reminder name="reminder" mail="A1415629343823" number="4" period="1" delay="1"/>
			</Candidates>
			<Escalation name="escalation" role="A1415628925102" includetaskrole="true" mail="A1415629343823">
				<Start name="start" delay="1"/>
				<Reminder name="reminder" mail="A1415629343823" number="4" period="1" delay="1"/>
			</Escalation>
			<FormVariable name="A1415629585444" layoutelement="inserttitle" elementtitle="Remove an application access" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415629610483" layoutelement="begingroup" elementtitle="Individual" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="display"/>
			<FormVariable name="A1415629618344" variable="identityhrcode" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415629626419" variable="identityfullname" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415629632217" layoutelement="endgroup" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415629652603" layoutelement="beginjointedition" elementtitle="Accounts to disable" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415629659288" variable="accountLogins" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415629664951" variable="accountUsernames" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415629669985" variable="accountRepositorries" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415629675459" layoutelement="endjointedition" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415629687937" variable="result" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1415629691607" variable="resultdescription" action="input" mandatory="false" longlist="false"/>
			<Page name="actionRemoveApplication" template="/library/pagetemplates/workflow/manualActivity.pagetemplate"/>
			<TicketAction create="true"/>
		</Component>
		<Link name="L1415628743562" source="C1415628734407" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1415627939217" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="action result" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415627951367" variable="resultdescription" displayname="Additional action description that you want to push  back to the requester" editortype="Default" type="String" multivalued="false" visibility="out" notstoredvariable="false"/>
		<Variable name="A1415627985067" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415627997233" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415628009660" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415628063623" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415628077056" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415628083226" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415628104485" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415628132140" variable="accountLogins" displayname="accountLogins" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415628148513" variable="accountUsernames" displayname="accountUsernames" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415628160672" variable="accountRepositorries" displayname="accountRepositorries" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415737168291" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737182267" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" notstoredvariable="false" initialvalue="0"/>
		<Variable name="A1415737196195" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" notstoredvariable="false" initialvalue="100"/>
		<Variable name="A1415737214644" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737943605" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1422606547213" variable="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="AP-REMOVEAPP" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1415628897397" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="applicationOwner" description="application owner">
			<Rule name="A1415628912862" rule="actionpackApplicationowner" description="Application owner for {uid}">
				<Param name="uid" variable="application"/>
			</Rule>
			<Rule name="A1415628922702" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
		<Role name="A1415628925102" displayname="admin" description="admin" icon="/reports/icons/48/people/personal_red_48.png" smallicon="/reports/icons/16/people/personal_red_16.png">
			<Rule name="A1415628936720" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
	</Roles>
	<Mails>
		<Mail name="A1415629343823" displayname="Remove application" description="Remove application" toaddtaskrole="true" notifyrule="actionpackRemoveApplication">
			<Param name="applicationname" variable="applicationname"/>
			<Param name="identityname" variable="identityfullname"/>
		</Mail>
	</Mails>
</Workflow>
