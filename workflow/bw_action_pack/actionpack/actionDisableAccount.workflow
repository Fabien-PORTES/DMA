<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="actionDisableAccount" displayname="Account manual disabling" description="This workflow is a technical workflow, it is used as a place holder to embed all the technical activities related to disabling an account.&#xA;This workflow cannot be used directly, it is called by other process as a technical activity.&#xA;" scriptfile="/workflow/bw_action_pack/actionpack/actionDisableAccount.javascript" statictitle="A simple action workflow to disable an account">
		<Component name="CSTART" type="startactivity" x="54" y="85" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Actions>
				<Action name="U1415608981638" action="executeview" viewname="actionpackAccountpicker" attribute="accountDisabled">
					<ViewParam name="P14156094533380" param="uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1415609453338_1" attribute="disabled" variable="accountDisabled"/>
					<ViewAttribute name="P1415609453338_2" attribute="identifier" variable="accountIdentifier"/>
					<ViewAttribute name="P1415609453338_3" attribute="login" variable="accountLogin"/>
					<ViewAttribute name="P1415609453338_4" attribute="repositorydisplayname" variable="accountRepository"/>
					<ViewAttribute name="P1415609453338_5" attribute="username" variable="accountUsername"/>
					<ViewAttribute name="P1415609453338_6" attribute="repositoryuid" variable="repository"/>
				</Action>
			</Actions>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="custom1" attribute="accountRepository"/>
				<Attribute name="custom2" attribute="accountLogin"/>
				<Attribute name="custom3" attribute="accountUsername"/>
				<Attribute name="custom5" attribute="requester"/>
			</Ticket>
		</Component>
		<Component name="CEND" type="endactivity" x="701" y="85" w="200" h="98" title="End" compact="true" inexclusive="true">
			<Actions>
			</Actions>
		</Component>
		<Component name="C1415608684127" type="manualactivity" x="287" y="52" w="200" h="114" title="Disable account {dataset.accountLogin.get()} on {dataset.accountRepository.get()}" inexclusive="true" duedate="{dataset.duedate.get()}">
			<Candidates name="role" role="A1415609459302" mail="A1415609982393" reassignmentmail="A1415609982393">
				<Reminder name="reminder" number="4" period="1" delay="1" mail="A1415609982393"/>
			</Candidates>
			<Escalation name="escalation" role="A1415609618685" includetaskrole="true" mail="A1415609982393">
				<Start name="start" delay="1"/>
				<Reminder name="reminder" number="4" period="1" delay="1" mail="A1415609982393"/>
			</Escalation>
			<FormVariable name="A1415610150653" layoutelement="inserttitle" elementtitle="Please disable the following account" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415610161158" layoutelement="begingroup" elementtitle="Account informations" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415610168860" variable="accountLogin" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415610182814" variable="accountIdentifier" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415610189502" variable="accountUsername" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415610195083" variable="accountRepository" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415610202732" layoutelement="endgroup" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415610212306" variable="result" action="input" mandatory="true" longlist="false"/>
			<Page name="actionDisableAccount" template="/library/pagetemplates/workflow/manualActivity.pagetemplate"/>
			<FormVariable name="A1415610720144" variable="resultdescription" action="input" mandatory="false" longlist="false"/>
			<TicketAction create="true"/>
		</Component>
		<Link name="L1415608698360" source="C1415608684127" target="CEND" priority="1"/>
		<Link name="L1415609259294" source="CSTART" target="C1415608684127" priority="1" expression="!dataset.isEmpty(&apos;accountDisabled&apos;) &amp;&amp; !dataset.accountDisabled.get()" labelcustom="true" label="Account is active"/>
		<Link name="L1415614870755" source="CSTART" target="CEND" priority="2" labelcustom="true" label="Account is disabled"/>
	</Definition>
	<Variables>
		<Variable name="A1415608589127" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" description="Account to disable" notstoredvariable="false"/>
		<Variable name="A1415608635769" variable="result" displayname="Action status" editortype="Default" type="String" multivalued="false" visibility="out" description="contains either &quot;ok&quot; or a string describing the problem" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415608727210" variable="accountLogin" displayname="accountLogin" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415608735837" variable="accountUsername" displayname="accountUsername" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415608754629" variable="accountRepository" displayname="accountRepository" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415608769508" variable="accountDisabled" displayname="accountDisabled" editortype="Default" type="Boolean" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415608782939" variable="accountIdentifier" displayname="accountIdentifier" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415609156146" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" description="The one who requested this action.&#xA;This is an optional attribute, it can be used to ask to more information while doing the action." notstoredvariable="false"/>
		<Variable name="A1415609440719" variable="repository" displayname="repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415610663533" variable="resultdescription" displayname="Additional action description that you want to push  back to the requester" editortype="Default" type="String" multivalued="false" visibility="out" description="Additional action description that you want to push  back to the requester" notstoredvariable="false"/>
		<Variable name="A1415736946389" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415736959930" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" notstoredvariable="false"/>
		<Variable name="A1415736970333" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" notstoredvariable="false"/>
		<Variable name="A1415737004535" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737912457" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1422608278547" variable="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="AP-DISABLEACCOUNT" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1415609459302" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="accountOwner" description="Account owner">
			<Rule name="A1415609477965" rule="actionpackRepositoryowner">
				<Param name="uid" variable="repository"/>
			</Rule>
			<Rule name="A1415614708728" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
		<Role name="A1415609618685" displayname="admin" icon="/reports/icons/48/people/personal_red_48.png" smallicon="/reports/icons/16/people/personal_red_16.png" description="workflow administrator">
			<Rule name="A1415609641537" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
	</Roles>
	<Mails>
		<Mail name="A1415609982393" displayname="Disable account notification" description="Disable account notification" toaddtaskrole="true" notifyrule="actionpackDisableaccount">
			<Param name="login" variable="accountLogin"/>
			<Param name="repository" variable="accountRepository"/>
		</Mail>
	</Mails>
</Workflow>
