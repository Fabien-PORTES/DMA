<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_disableAccount" displayname="Action Broker - Disable Account" scriptfile="/workflow/bw_action_pack/actionbroker/ab_disableAccount.javascript" description="This workflow is a technical workflow, it is used as a place holder to embed all the technical activities related to disabling an account.&#xA;This workflow cannot be used directly, it is called by other process as a technical activity." statictitle="Action Broker - Disable Account">
		<Component name="CSTART" type="startactivity" x="81" y="210" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415643719828"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415739743157" action="executeview" viewname="actionpackAccountpicker" attribute="accountDisabled">
					<ViewParam name="P14157397431570" param="uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1415739743157_1" attribute="disabled" variable="accountDisabled"/>
					<ViewAttribute name="P1415739743157_2" attribute="identifier" variable="accountIdentifier"/>
					<ViewAttribute name="P1415739743157_3" attribute="login" variable="accountLogin"/>
					<ViewAttribute name="P1415739743157_4" attribute="repositorydisplayname" variable="accountRepository"/>
					<ViewAttribute name="P1415739743157_5" attribute="username" variable="accountUsername"/>
					<ViewAttribute name="P1415739743157_6" attribute="repositoryuid" variable="repository"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="784" y="210" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415643689749" priority="1"/>
		<Component name="C1415643689749" type="callactivity" x="361" y="185" w="200" h="98" title="Disable account {dataset.accountLogin.get()} on {dataset.accountRepository.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionDisableAccount.workflow">
				<Input name="A1415644011388" variable="account" content="account"/>
				<Input name="A1415644015523" variable="requester" content="requester"/>
				<Output name="A1415644024425" variable="result" content="result"/>
				<Output name="A1415644029297" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738383810" variable="duedate" content="duedate"/>
				<Input name="A1415738388040" variable="parentprocessid" content="processid"/>
				<Input name="A1415738392847" variable="prioritylevel" content="prioritylevel"/>
			</Process>
		</Component>
		<Link name="L1415643712941" source="C1415643689749" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415643719828" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415643730972" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415643752664" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" description="Account to disable" notstoredvariable="false"/>
		<Variable name="A1415643792380" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="contains either &apos;ok&apos; or a string describing the problem" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415643834509" variable="accountLogin" displayname="account Login" editortype="Default" type="String" multivalued="false" visibility="local" description="account Login" notstoredvariable="false"/>
		<Variable name="A1415643846578" variable="accountUsername" displayname="account Username" editortype="Default" type="String" multivalued="false" visibility="local" description="account Username" notstoredvariable="false"/>
		<Variable name="A1415643860129" variable="accountRepository" displayname="account Repository" editortype="Default" type="String" multivalued="false" visibility="local" description="account Repository" notstoredvariable="false"/>
		<Variable name="A1415643880494" variable="accountDisabled" displayname="account Disabled" editortype="Default" type="String" multivalued="false" visibility="local" description="account Disabled" notstoredvariable="false"/>
		<Variable name="A1415643894649" variable="accountIdentifier" displayname="account Identifier" editortype="Default" type="String" multivalued="false" visibility="local" description="account Identifier" notstoredvariable="false"/>
		<Variable name="A1415643942868" variable="requester" displayname="requester" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="The one who requested this action.&#xA;This is an optional attribute, it can be used to ask to more information while doing the action." notstoredvariable="false"/>
		<Variable name="A1415643962059" variable="repository" displayname="repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" description="repository" notstoredvariable="false"/>
		<Variable name="A1415643976970" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="Additional action description that you want to push  back to the requester" notstoredvariable="false"/>
		<Variable name="A1415737463101" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737475418" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737487150" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737503266" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737832722" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738127805" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
	</Variables>
</Workflow>
