<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="actionUpdatePermissions" description="Update permissions for a given application and a given individual" scriptfile="/workflow/bw_action_pack/actionpack/actionUpdatePermissions.javascript" statictitle="Update permissions for a given application and a given individual" displayname="Permissions manual update">
		<Component name="CSTART" type="startactivity" x="45" y="95" w="200" h="114" title="Start" compact="true">
			<Actions>
				<Action name="U1415631246169" action="executeview" viewname="actionpackIdentitypicker" attribute="identityhrcode">
					<ViewParam name="P14156312461690" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415631246169_1" attribute="hrcode" variable="identityhrcode"/>
					<ViewAttribute name="P1415631246169_2" attribute="fullname" variable="identityfullname"/>
				</Action>
				<Action name="U1415631274881" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14156312748810" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415631274881_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415631666771" action="executeview" viewname="actionpackPermissionspicker" attribute="permissioncodes">
					<ViewParam name="P14156316667710" param="uids" paramvalue="{dataset.permissions.get()}"/>
					<ViewAttribute name="P1415631666771_1" attribute="code" variable="permissioncodes"/>
					<ViewAttribute name="P1415631666771_2" attribute="displayname" variable="permissionnames"/>
				</Action>
				<Action name="U1415631867583" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountlogins">
					<ViewParam name="P14156318675830" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14156318675831" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415631867583_2" attribute="login" variable="accountlogins"/>
					<ViewAttribute name="P1415631867583_3" attribute="username" variable="accountusernames"/>
					<ViewAttribute name="P1415631867583_4" attribute="repositorydisplayname" variable="accountrepositories"/>
				</Action>
				<Action name="U1422606076195" action="update" attribute="permissionstring" newvalue="{dataset.permissions.toString()}"/>
				<Action name="U1422715067230" action="executeview" viewname="accessrequest_identitypicker_1" attribute="referername">
					<ViewParam name="P14227150672300" param="uid" paramvalue="{dataset.referer.get()}"/>
					<ViewAttribute name="P1422715067230_1" attribute="fullname" variable="referername"/>
				</Action>
			</Actions>
			<Candidates name="role" role="A1415637531627"/>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="custom1" attribute="applicationname"/>
				<Attribute name="custom3" attribute="identityhrcode"/>
				<Attribute name="custom4" attribute="identityfullname"/>
				<Attribute name="custom5" attribute="requester"/>
				<Attribute name="custom6" attribute="permissionstring"/>
				<Attribute name="custom7" attribute="referername"/>
			</Ticket>
		</Component>
		<Component name="CEND" type="endactivity" x="473" y="95" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415631278443" priority="1"/>
		<Component name="C1415631278443" type="manualactivity" x="184" y="62" w="200" h="114" title="Update {dataset.applicationname.get()} permissions for {dataset.identityfullname.get()}" duedate="{dataset.duedate.get()}">
			<Candidates name="role" role="A1415631361704" mail="A1415631510699" reassignmentmail="A1415631510699">
				<Reminder name="reminder" mail="A1415631510699" number="4" period="1" delay="1"/>
			</Candidates>
			<Escalation name="escalation" role="A1415631389424" includetaskrole="true" mail="A1415631510699">
				<Start name="start" delay="1"/>
				<Reminder name="reminder" mail="A1415631510699" number="4" period="1" delay="1"/>
			</Escalation>
			<FormVariable name="A1415631687635" layoutelement="inserttitle" elementtitle="Add new permissions for an individual" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631738516" layoutelement="begingroup" elementtitle="Beneficiary" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631746365" variable="identityhrcode" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631752503" variable="identityfullname" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631886005" layoutelement="endgroup" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631924985" variable="applicationname" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415632036689" variable="comments" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631900628" layoutelement="beginsection" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631916642" layoutelement="beginjointedition" elementtitle="Accounts" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631946489" variable="accountlogins" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631950933" variable="accountusernames" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631955608" variable="accountrepositories" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631962603" layoutelement="endjointedition" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631968888" layoutelement="newcolumn" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631982225" layoutelement="beginjointedition" elementtitle="Permissions to add" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415631988342" variable="permissioncodes" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415631996449" variable="permissionnames" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415632002722" layoutelement="endjointedition" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415632008740" layoutelement="endsection" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415632024636" variable="result" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1415632030315" variable="resultdescription" action="input" mandatory="false" longlist="false"/>
			<Page name="actionUpdatePermissions" template="/library/pagetemplates/workflow/manualActivity.pagetemplate"/>
			<TicketAction create="true"/>
		</Component>
		<Link name="L1415631288117" source="C1415631278443" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1415631010825" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415631026088" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415631043500" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415631055525" variable="permissions" displayname="permissions" editortype="Ledger Permission" type="String" multivalued="true" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415631090184" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415631100695" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415631116409" variable="resultdescription" editortype="Default" type="String" multivalued="false" visibility="out" notstoredvariable="false" displayname="Additional action description that you want to push  back to the requester" description="Additional action description that you want to push  back to the requester"/>
		<Variable name="A1415631158202" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631166533" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631172952" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631594362" variable="permissioncodes" displayname="permission codes" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631603679" variable="permissionnames" displayname="permission names" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631781917" variable="accountlogins" displayname="account logins" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631792726" variable="accountusernames" displayname="account usernames" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415631803362" variable="accountrepositories" displayname="account repositories" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415636016440" variable="referer" displayname="referer" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415737289636" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" notstoredvariable="false"/>
		<Variable name="A1415737301184" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737313145" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="progress Total" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737327597" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737963262" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1422605766471" variable="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="AP-UPDATEPERM" notstoredvariable="false"/>
		<Variable name="A1422605926050" variable="permissionstring" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1422715008414" variable="referername" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1415631361704" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="applicationOwner" description="applicationOwner">
			<Rule name="A1415631378763" rule="actionpackApplicationowner" description="Application owner for {uid}">
				<Param name="uid" variable="application"/>
			</Rule>
			<Rule name="A1415631382818" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
		<Role name="A1415631389424" displayname="admin" description="admin" icon="/reports/icons/48/people/personal_red_48.png" smallicon="/reports/icons/16/people/personal_red_16.png">
			<Rule name="A1415631398632" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
		<Role name="A1415637531627" icon="/reports/icons/48/people/personal_grey_48.png" smallicon="/reports/icons/16/people/personal_grey_16.png" displayname="everybody" description="everybody">
			<Rule name="A1415637554585" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Mails>
		<Mail name="A1415631510699" displayname="Update permissions" description="Update permissions" toaddtaskrole="true" notifyrule="actionpackUpdatePermissions">
			<Param name="applicationname" variable="applicationname"/>
			<Param name="beneficiaryname" variable="identityfullname"/>
		</Mail>
	</Mails>
</Workflow>
