<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_removePermissions" displayname="Action Broker - Remove Permissions" scriptfile="/workflow/bw_action_pack/actionbroker/ab_removePermissions.javascript" description="Remove permissions for a given application and a given individual" statictitle="Action Broker - Remove Permissions">
		<Component name="CSTART" type="startactivity" x="123" y="222" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415645133387"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415740299071" action="executeview" viewname="actionpackIdentitypicker" attribute="identityhrcode">
					<ViewParam name="P14157402990710" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415740299071_1" attribute="hrcode" variable="identityhrcode"/>
					<ViewAttribute name="P1415740299071_2" attribute="fullname" variable="identityfullname"/>
				</Action>
				<Action name="U1415740353913" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14157403539130" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415740353913_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415740423412" action="executeview" viewname="actionpackPermissionspicker" attribute="permissioncodes">
					<ViewParam name="P14157404234120" param="uids" paramvalue="{dataset.permissions}"/>
					<ViewAttribute name="P1415740423412_1" attribute="code" variable="permissioncodes"/>
					<ViewAttribute name="P1415740423412_2" attribute="displayname" variable="permissionnames"/>
				</Action>
				<Action name="U1415740489373" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountlogins">
					<ViewParam name="P14157404893730" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14157404893731" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415740489373_2" attribute="login" variable="accountlogins"/>
					<ViewAttribute name="P1415740489373_3" attribute="username" variable="accountusernames"/>
					<ViewAttribute name="P1415740489373_4" attribute="repositorydisplayname" variable="accountrepositories"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="892" y="222" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415645378829" priority="1"/>
		<Component name="C1415645378829" type="callactivity" x="440" y="197" w="200" h="98" title="Remove {dataset.applicationname.get()} permissions for {dataset.identityfullname.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionRemovePermissions.workflow">
				<Input name="A1415645393851" variable="application" content="application"/>
				<Input name="A1415645398324" variable="comments" content="comments"/>
				<Input name="A1415645401592" variable="identity" content="identity"/>
				<Input name="A1415645405145" variable="permissions" content="permissions"/>
				<Input name="A1415645439369" variable="requester" content="requester"/>
				<Output name="A1415645446067" variable="result" content="result"/>
				<Output name="A1415645450936" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738607101" variable="duedate" content="duedate"/>
				<Input name="A1415738611994" variable="parentprocessid" content="processid"/>
				<Input name="A1415738616554" variable="prioritylevel" content="prioritylevel"/>
			</Process>
		</Component>
		<Link name="L1415645461650" source="C1415645378829" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415645133387" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415645143353" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415645173215" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="identity" notstoredvariable="false"/>
		<Variable name="A1415645184766" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" description="requester" notstoredvariable="false"/>
		<Variable name="A1415645197264" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" description="application" notstoredvariable="false"/>
		<Variable name="A1415645212473" variable="permissions" displayname="permissions" editortype="Ledger Permission" type="String" multivalued="true" visibility="in" description="permissions" notstoredvariable="false"/>
		<Variable name="A1415645229548" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="result" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415645250546" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="comments" notstoredvariable="false"/>
		<Variable name="A1415645261002" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="result description" notstoredvariable="false"/>
		<Variable name="A1415645273296" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" description="identity hrcode" notstoredvariable="false"/>
		<Variable name="A1415645281674" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" description="identity fullname" notstoredvariable="false"/>
		<Variable name="A1415645295584" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" description="application name" notstoredvariable="false"/>
		<Variable name="A1415645309214" variable="permissioncodes" displayname="permission codes" editortype="Default" type="String" multivalued="true" visibility="local" description="permission codes" notstoredvariable="false"/>
		<Variable name="A1415645319201" variable="permissionnames" displayname="permission names" editortype="Default" type="String" multivalued="true" visibility="local" description="permission names" notstoredvariable="false"/>
		<Variable name="A1415645329841" variable="accountlogins" displayname="account logins" editortype="Default" type="String" multivalued="true" visibility="local" description="account logins" notstoredvariable="false"/>
		<Variable name="A1415645351945" variable="accountusernames" displayname="account usernames" editortype="Default" type="String" multivalued="true" visibility="local" description="account usernames" notstoredvariable="false"/>
		<Variable name="A1415645371427" variable="accountrepositories" displayname="account repositories" editortype="Default" type="String" multivalued="true" visibility="local" description="account repositories" notstoredvariable="false"/>
		<Variable name="A1415737686400" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737701831" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737713915" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737730045" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737874978" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738155198" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
	</Variables>
</Workflow>
