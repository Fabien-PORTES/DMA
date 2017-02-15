<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ar_updatePermissions" displayname="Action Broker - Update Permissions" scriptfile="/workflow/bw_action_pack/actionbroker/ar_updatePermissions.javascript" description="Update permissions for a given application and a given individual" statictitle="Action Broker - Update Permissions">
		<Component name="CSTART" type="startactivity" x="125" y="241" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415645509137"/>
			<Output name="output" processidvariable="processid"/>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="917" y="241" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415645525489" priority="1"/>
		<Component name="C1415645525489" type="callactivity" x="455" y="216" w="200" h="98" title="Update {dataset.applicationname.get()} permissions for {dataset.identityfullname.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionUpdatePermissions.workflow">
				<Input name="A1415645763073" variable="application" content="application"/>
				<Input name="A1415645769181" variable="comments" content="comments"/>
				<Input name="A1415645773130" variable="identity" content="identity"/>
				<Input name="A1415645796661" variable="permissions" content="permissions"/>
				<Input name="A1415645801696" variable="referer" content="referer"/>
				<Input name="A1415645806223" variable="requester" content="requester"/>
				<Output name="A1415645813799" variable="result" content="result"/>
				<Output name="A1415645818962" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738627838" variable="duedate" content="duedate"/>
				<Input name="A1415738631873" variable="parentprocessid" content="processid"/>
				<Input name="A1415738635714" variable="prioritylevel" content="prioritylevel"/>
			</Process>
		</Component>
		<Link name="L1415645545443" source="C1415645525489" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415645509137" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415645518176" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415645571355" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="identity" notstoredvariable="false"/>
		<Variable name="A1415645582074" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" description="requester" notstoredvariable="false"/>
		<Variable name="A1415645591505" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" description="application" notstoredvariable="false"/>
		<Variable name="A1415645604357" variable="permissions" displayname="permissions" editortype="Ledger Permission" type="String" multivalued="true" visibility="in" description="permissions" notstoredvariable="false"/>
		<Variable name="A1415645612206" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="result" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415645631902" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="comments" notstoredvariable="false"/>
		<Variable name="A1415645648065" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="result description" notstoredvariable="false"/>
		<Variable name="A1415645659691" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" description="identity hrcode" notstoredvariable="false"/>
		<Variable name="A1415645670834" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" description="identity fullname" notstoredvariable="false"/>
		<Variable name="A1415645684968" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" description="application name" notstoredvariable="false"/>
		<Variable name="A1415645695902" variable="permissioncodes" displayname="permission codes" editortype="Default" type="String" multivalued="true" visibility="local" description="permission codes" notstoredvariable="false"/>
		<Variable name="A1415645705905" variable="permissionnames" displayname="permission names" editortype="Default" type="String" multivalued="false" visibility="local" description="permission names" notstoredvariable="false"/>
		<Variable name="A1415645718440" variable="accountlogins" displayname="account logins" editortype="Default" type="String" multivalued="true" visibility="local" description="account logins" notstoredvariable="false"/>
		<Variable name="A1415645730013" variable="accountusernames" displayname="account usernames" editortype="Default" type="String" multivalued="true" visibility="local" description="account usernames" notstoredvariable="false"/>
		<Variable name="A1415645744906" variable="accountrepositories" displayname="account repositories" editortype="Default" type="String" multivalued="true" visibility="local" description="account repositories" notstoredvariable="false"/>
		<Variable name="A1415645754048" variable="referer" displayname="referer" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="referer" notstoredvariable="false"/>
		<Variable name="A1415737744697" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priorityl evel" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737756409" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737767287" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737778537" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737884171" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738165169" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
	</Variables>
</Workflow>
