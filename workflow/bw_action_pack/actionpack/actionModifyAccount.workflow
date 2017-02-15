<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="actionModifyAccount" displayname="Account manual modification" scriptfile="/workflow/bw_action_pack/actionpack/actionModifyAccount.javascript" description="This workflow is a technical workflow, it is used as a place holder to embed all the technical activities related to modifying an account.&#xA;This workflow cannot be used directly, it is called by other process as a technical activity." statictitle="A simple action workflow to modify an account">
		<Component name="CSTART" type="startactivity" x="118" y="235" w="200" h="114" title="Start" compact="true">
			<Actions>
				<Action name="U1415717006960" action="executeview" viewname="actionpackAccountpicker" attribute="repository">
					<ViewParam name="P14157170069600" param="uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1415717006960_1" attribute="repositoryuid" variable="repository"/>
					<ViewAttribute name="P1415717006960_2" attribute="login" variable="login"/>
					<ViewAttribute name="P1415717006960_3" attribute="repositorydisplayname" variable="repositoryName"/>
				</Action>
			</Actions>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="custom1" attribute="repositoryName"/>
				<Attribute name="custom2" attribute="login"/>
				<Attribute name="custom3" attribute="acc_username"/>
				<Attribute name="custom5" attribute="requester"/>
			</Ticket>
		</Component>
		<Component name="CEND" type="endactivity" x="871" y="235" w="200" h="98" title="End" compact="true"/>
		<Component name="C1415717010017" type="manualactivity" x="469" y="202" w="200" h="114" title="Modify account {dataset.login.get()} on {dataset.repositoryName.get()}" duedate="{dataset.duedate.get()}">
			<Candidates name="role" role="A1415716568499" mail="A1415716781950" reassignmentmail="A1415716781950">
				<Reminder name="reminder" mail="A1415716781950" number="4" period="1" delay="1"/>
			</Candidates>
			<Escalation name="escalation" role="A1415716643410" mail="A1415716781950">
				<Reminder name="reminder" mail="A1415716781950" number="4" period="1" delay="1"/>
				<Start name="start" delay="1"/>
			</Escalation>
			<Page name="actionModifyAccount" template="/library/pagetemplates/workflow/manualActivity.pagetemplate"/>
			<FormVariable name="A1415717419336" layoutelement="inserttitle" elementtitle="Please modify the following account" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415717443631" layoutelement="begingroup" elementtitle="Account Informations" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415717459006" variable="account" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415717465042" variable="login" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415717478549" variable="repository" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415717484225" variable="repositoryName" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415717494953" layoutelement="endgroup" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415717506755" variable="result" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1415717511812" variable="resultdescription" action="input" mandatory="false" longlist="false"/>
			<TicketAction create="true"/>
		</Component>
		<Link name="L1415717021684" source="C1415717010017" target="CEND" priority="1"/>
		<Link name="L1415810919815" source="CSTART" target="C1415717010017" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415716568499" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="accountOwner" description="Account Owner : manager of the account&apos;s repository">
			<Rule name="A1415716596205" rule="actionpackRepositoryowner" description="Manager of repository {uid}">
				<Param name="uid" variable="repository"/>
			</Rule>
		</Role>
		<Role name="A1415716643410" displayname="admin" description="Workflow Administrator">
			<Rule name="A1415716656083" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415716622585" variable="repository" displayname="Repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" description="Account Repository" notstoredvariable="false"/>
		<Variable name="A1415716821251" variable="account" displayname="Account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" description="Account" notstoredvariable="false"/>
		<Variable name="A1415716837839" variable="login" displayname="login" editortype="Default" type="String" multivalued="false" visibility="local" description="Account Login" notstoredvariable="false"/>
		<Variable name="A1415716874418" variable="repositoryName" displayname="repositoryName" editortype="Default" type="String" multivalued="false" visibility="local" description="Repository Name" notstoredvariable="false"/>
		<Variable name="A1415717246464" variable="result" displayname="Result" editortype="Default" type="String" multivalued="false" visibility="out" description="Result (ok/error)" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415717270853" variable="resultdescription" displayname="Result Description" editortype="Default" type="String" multivalued="false" visibility="out" description="Result description" notstoredvariable="false"/>
		<Variable name="A1415737025712" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737057193" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737070503" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" notstoredvariable="false"/>
		<Variable name="A1415737089173" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737922608" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415798512768" variable="acc_identifier" displayname="acc_identifier" editortype="Default" type="String" multivalued="false" visibility="in" description="Account identifier" notstoredvariable="false"/>
		<Variable name="A1415798527051" variable="acc_login" displayname="acc_login" editortype="Default" type="String" multivalued="false" visibility="in" description="Account login" notstoredvariable="false"/>
		<Variable name="A1415798541804" variable="acc_givenname" displayname="acc_givenname" editortype="Default" type="String" multivalued="false" visibility="in" description="Account givenname" notstoredvariable="false"/>
		<Variable name="A1415798558204" variable="acc_surname" displayname="acc_surname" editortype="Default" type="String" multivalued="false" visibility="in" description="Account surname" notstoredvariable="false"/>
		<Variable name="A1415798611660" variable="acc_username" displayname="acc_username" editortype="Default" type="String" multivalued="false" visibility="in" description="Account username" notstoredvariable="false"/>
		<Variable name="A1415798622899" variable="acc_employeenumber" displayname="acc_employeenumber" editortype="Default" type="String" multivalued="false" visibility="in" description="Account employeenumber" notstoredvariable="false"/>
		<Variable name="A1415798634013" variable="acc_mail" displayname="acc_mail" editortype="Default" type="String" multivalued="false" visibility="in" description="Account mail" notstoredvariable="false"/>
		<Variable name="A1415798660205" variable="acc_creationdate" displayname="acc_creationdate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account creationdate" notstoredvariable="false"/>
		<Variable name="A1415798678732" variable="acc_lastlogindate" displayname="acc_lastlogindate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account lastlogindate" notstoredvariable="false"/>
		<Variable name="A1415798695176" variable="acc_passwordlastsetdate" displayname="acc_passwordlastsetdate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account passwordlastsetdate" notstoredvariable="false"/>
		<Variable name="A1415798708060" variable="acc_expiredate" displayname="acc_expiredate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account expiredate" notstoredvariable="false"/>
		<Variable name="A1415798721684" variable="acc_nextpwdchangedate" displayname="acc_nextpwdchangedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account nextpwdchangedate" notstoredvariable="false"/>
		<Variable name="A1415798740142" variable="acc_service" displayname="acc_service" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account service" notstoredvariable="false"/>
		<Variable name="A1415798752749" variable="acc_disabled" displayname="acc_disabled" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account disabled" notstoredvariable="false"/>
		<Variable name="A1415798767631" variable="acc_locked" displayname="acc_locked" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account locked" notstoredvariable="false"/>
		<Variable name="A1415798781801" variable="acc_logincount" displayname="acc_logincount" editortype="Default" type="Number" multivalued="false" visibility="in" description="Account logincount" notstoredvariable="false"/>
		<Variable name="A1415798805929" variable="acc_badpasswordcount" displayname="acc_badpasswordcount" editortype="Default" type="Number" multivalued="false" visibility="in" description="Account badpasswordcount" notstoredvariable="false"/>
		<Variable name="A1415798818932" variable="acc_passwordnotrequired" displayname="acc_passwordnotrequired" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account passwordnotrequired" notstoredvariable="false"/>
		<Variable name="A1415798833148" variable="acc_passwordcantchange" displayname="acc_passwordcantchange" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account passwordcantchange" notstoredvariable="false"/>
		<Variable name="A1415798845107" variable="acc_notnormalaccount" displayname="acc_notnormalaccount" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account notnormalaccount" notstoredvariable="false"/>
		<Variable name="A1415798856942" variable="acc_dontexpirepassword" displayname="acc_dontexpirepassword" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account dontexpirepassword" notstoredvariable="false"/>
		<Variable name="A1415798870237" variable="acc_passwordexpired" displayname="acc_passwordexpired" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account passwordexpired" notstoredvariable="false"/>
		<Variable name="A1415798882409" variable="acc_smartcardrequired" displayname="acc_smartcardrequired" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account smartcardrequired" notstoredvariable="false"/>
		<Variable name="A1415798911337" variable="acc_custom1" displayname="acc_custom1" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom1" notstoredvariable="false"/>
		<Variable name="A1415798923094" variable="acc_custom2" displayname="acc_custom2" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom2" notstoredvariable="false"/>
		<Variable name="A1415798934020" variable="acc_custom3" displayname="acc_custom3" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom3" notstoredvariable="false"/>
		<Variable name="A1415798944640" variable="acc_custom4" displayname="acc_custom4" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom4" notstoredvariable="false"/>
		<Variable name="A1415798955480" variable="acc_custom5" displayname="acc_custom5" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom5" notstoredvariable="false"/>
		<Variable name="A1415798967106" variable="acc_custom6" displayname="acc_custom6" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom6" notstoredvariable="false"/>
		<Variable name="A1415798978261" variable="acc_custom7" displayname="acc_custom7" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom7" notstoredvariable="false"/>
		<Variable name="A1415798990022" variable="acc_custom8" displayname="acc_custom8" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom8" notstoredvariable="false"/>
		<Variable name="A1415799002901" variable="acc_custom9" displayname="acc_custom9" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom9" notstoredvariable="false"/>
		<Variable name="A1415810977129" variable="acc_profile" displayname="acc_profile" editortype="Default" type="String" multivalued="false" visibility="in" description="Account profile" notstoredvariable="false"/>
		<Variable name="A1422607716629" variable="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="AP-UPDATEACCOUNT" notstoredvariable="false"/>
		<Variable name="A1422608006238" variable="requester" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
	</Variables>
	<Mails>
		<Mail name="A1415716781950" displayname="ap_modifyAccountNotification" description="Action Pack - Modify Account Notification" torole="A1415716568499" notifyrule="actionpackModifyAccount">
			<Param name="login" variable="login"/>
			<Param name="repository" variable="repositoryName"/>
		</Mail>
	</Mails>
</Workflow>
