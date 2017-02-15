<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_removeAccount" displayname="Action Broker - Remove Account" scriptfile="/workflow/bw_action_pack/actionbroker/ab_removeAccount.javascript" description="This workflow is a technical workflow, it is used as a place holder to embed all the technical activities related to removing an account.&#xA;This workflow cannot be used directly, it is called by other process as a technical activity.&#xA;" statictitle="Action Broker - Remove Account">
		<Component name="CSTART" type="startactivity" x="88" y="257" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415644076008"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415739981054" action="executeview" viewname="actionpackAccountpicker" attribute="accountDisabled">
					<ViewParam name="P14157399810540" param="uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1415739981054_1" attribute="disabled" variable="accountDisabled"/>
					<ViewAttribute name="P1415739981054_2" attribute="identifier" variable="accountIdentifier"/>
					<ViewAttribute name="P1415739981054_3" attribute="login" variable="accountLogin"/>
					<ViewAttribute name="P1415739981054_4" attribute="repositorydisplayname" variable="accountRepository"/>
					<ViewAttribute name="P1415739981054_5" attribute="username" variable="accountUsername"/>
					<ViewAttribute name="P1415739981054_6" attribute="repositoryuid" variable="repository"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="773" y="257" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415644090047" priority="1"/>
		<Component name="C1415644090047" type="callactivity" x="350" y="232" w="200" h="98" title="Remove account {dataset.accountLogin.get()} on {dataset.accountRepository.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionRemoveAccount.workflow">
				<Input name="A1415644372925" variable="account" content="account"/>
				<Input name="A1415644377653" variable="requester" content="requester"/>
				<Output name="A1415644384611" variable="result" content="result"/>
				<Output name="A1415644388979" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738509030" variable="duedate" content="duedate"/>
				<Input name="A1415738513887" variable="parentprocessid" content="processid"/>
				<Input name="A1415738517487" variable="prioritylevel" content="prioritylevel"/>
			</Process>
		</Component>
		<Link name="L1415644110867" source="C1415644090047" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415644076008" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415644084897" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415644145499" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" description="Account to disable" notstoredvariable="false"/>
		<Variable name="A1415644180245" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="contains either &apos;ok&apos; or a string describing the problem" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415644207531" variable="accountLogin" displayname="account Login" editortype="Default" type="String" multivalued="false" visibility="local" description="account Login" notstoredvariable="false"/>
		<Variable name="A1415644218798" variable="accountUsername" displayname="account Username" editortype="Default" type="String" multivalued="false" visibility="local" description="account Username" notstoredvariable="false"/>
		<Variable name="A1415644233145" variable="accountRepository" displayname="account Repository" editortype="Default" type="String" multivalued="false" visibility="local" description="account Repository" notstoredvariable="false"/>
		<Variable name="A1415644251813" variable="accountDisabled" displayname="account Disabled" editortype="Default" type="Boolean" multivalued="false" visibility="local" description="account Disabled" notstoredvariable="false"/>
		<Variable name="A1415644275071" variable="accountIdentifier" displayname="account Identifier" editortype="Default" type="String" multivalued="false" visibility="local" description="account Identifier" notstoredvariable="false"/>
		<Variable name="A1415644282247" variable="requester" displayname="requester" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="The one who requested this action.&#xA;This is an optional attribute, it can be used to ask to more information while doing the action." notstoredvariable="false"/>
		<Variable name="A1415644316764" variable="repository" displayname="repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" description="repository" notstoredvariable="false"/>
		<Variable name="A1415644332822" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="Additional action description that you want to push  back to the requester" notstoredvariable="false"/>
		<Variable name="A1415737574856" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737585379" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737600032" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="progress Total" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737614649" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737851148" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738140679" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
	</Variables>
</Workflow>
