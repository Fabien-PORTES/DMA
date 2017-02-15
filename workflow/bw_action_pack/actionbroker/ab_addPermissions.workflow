<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_addPermissions" displayname="Action Broker - Add Permissions" scriptfile="/workflow/bw_action_pack/actionbroker/ab_addPermissions.javascript" description="Add permissions for a given application and a given individual" statictitle="Action Broker - Add Permissions">
		<Component name="CSTART" type="startactivity" x="45" y="188" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415643553088"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415739286764" action="executeview" viewname="actionpackIdentitypicker" attribute="identityhrcode">
					<ViewParam name="P14157392867640" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415739286764_1" attribute="hrcode" variable="identityhrcode"/>
					<ViewAttribute name="P1415739286764_2" attribute="fullname" variable="identityfullname"/>
				</Action>
				<Action name="U1415739333357" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14157393333570" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415739333357_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415739421672" action="executeview" viewname="actionpackPermissionspicker" attribute="permissioncodes">
					<ViewParam name="P14157394430720" param="uids" paramvalue="{dataset.permissions}"/>
					<ViewAttribute name="P1415739443072_1" attribute="code" variable="permissioncodes"/>
					<ViewAttribute name="P1415739443072_2" attribute="displayname" variable="permissionnames"/>
				</Action>
				<Action name="U1415739526883" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountlogins">
					<ViewParam name="P14157395268830" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14157395268831" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415739526883_2" attribute="login" variable="accountlogins"/>
					<ViewAttribute name="P1415739526883_3" attribute="username" variable="accountusernames"/>
					<ViewAttribute name="P1415739526883_4" attribute="repositorydisplayname" variable="accountrepositories"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="842" y="188" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415643514571" priority="1"/>
		<Component name="C1415643514571" type="callactivity" x="306" y="163" w="200" h="98" title="Add {dataset.applicationname.get()} permissions for {dataset.identityfullname.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionAddPermissions.workflow">
				<Input name="A1415643598534" variable="application" content="application"/>
				<Input name="A1415643602967" variable="comments" content="comments"/>
				<Input name="A1415643606379" variable="identity" content="identity"/>
				<Input name="A1415643610591" variable="permissions" content="permissions"/>
				<Input name="A1415643615271" variable="requester" content="requester"/>
				<Output name="A1415643622711" variable="result" content="result"/>
				<Output name="A1415643627574" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738335924" variable="duedate" content="duedate"/>
				<Input name="A1415738341072" variable="parentprocessid" content="processid"/>
				<Input name="A1415738345995" variable="prioritylevel" content="prioritylevel"/>
			</Process>
		</Component>
		<Link name="L1415643543539" source="C1415643514571" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1415643277318" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="identity" notstoredvariable="false"/>
		<Variable name="A1415643288304" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" description="requester" notstoredvariable="false"/>
		<Variable name="A1415643299427" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1415643321874" variable="permissions" displayname="permissions" editortype="Ledger Permission" type="String" multivalued="true" visibility="in" description="permissions" notstoredvariable="false"/>
		<Variable name="A1415643338739" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="result" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415643357080" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="comments" notstoredvariable="false"/>
		<Variable name="A1415643377217" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="Additional action description that you want to push  back to the requester" notstoredvariable="false"/>
		<Variable name="A1415643397834" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" description="identity hrcode" notstoredvariable="false"/>
		<Variable name="A1415643410700" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" description="identity fullname" notstoredvariable="false"/>
		<Variable name="A1415643425997" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" description="application name" notstoredvariable="false"/>
		<Variable name="A1415643444513" variable="permissioncodes" displayname="permission codes" editortype="Default" type="String" multivalued="true" visibility="local" description="permission codes" notstoredvariable="false"/>
		<Variable name="A1415643460469" variable="permissionnames" displayname="permission names" editortype="Default" type="String" multivalued="true" visibility="local" description="permission names" notstoredvariable="false"/>
		<Variable name="A1415643476407" variable="accountlogins" displayname="account logins" editortype="Default" type="String" multivalued="true" visibility="local" description="account logins" notstoredvariable="false"/>
		<Variable name="A1415643492925" variable="accountusernames" displayname="account usernames" editortype="Default" type="String" multivalued="true" visibility="local" description="account usernames" notstoredvariable="false"/>
		<Variable name="A1415643506318" variable="accountrepositories" displayname="account repositories" editortype="Default" type="String" multivalued="true" visibility="local" description="account repositories" notstoredvariable="false"/>
		<Variable name="A1415737399161" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737410321" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737428533" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737441569" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737822588" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738121648" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1415643553088" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415643564010" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
