<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_removeApplication" displayname="Action Broker - Remove Application" scriptfile="/workflow/bw_action_pack/actionbroker/ab_removeApplication.javascript" description="Remove an application access for a given individual" statictitle="Action Broker - Remove Application">
		<Component name="CSTART" type="startactivity" x="115" y="210" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415644838200"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415740063903" action="executeview" viewname="actionpackIdentitypicker" attribute="identityhrcode">
					<ViewParam name="P14157400639030" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415740063903_1" attribute="hrcode" variable="identityhrcode"/>
					<ViewAttribute name="P1415740063903_2" attribute="fullname" variable="identityfullname"/>
				</Action>
				<Action name="U1415740133696" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14157401336960" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415740133696_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415740220280" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountLogins">
					<ViewParam name="P14157402202800" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14157402202801" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415740220280_2" attribute="login" variable="accountLogins"/>
					<ViewAttribute name="P1415740220280_3" attribute="username" variable="accountUsernames"/>
					<ViewAttribute name="P1415740220280_4" attribute="repositorydisplayname" variable="accountRepositories"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="944" y="210" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415645036961" priority="1"/>
		<Component name="C1415645036961" type="callactivity" x="522" y="185" w="200" h="98" title="Please remove the {dataset.applicationname.get()} application access for {dataset.identityfullname.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionRemoveApplication.workflow">
				<Input name="A1415645068947" variable="application" content="application"/>
				<Input name="A1415645073305" variable="comments" content="comments"/>
				<Input name="A1415645077290" variable="identity" content="identity"/>
				<Input name="A1415645081255" variable="requester" content="requester"/>
				<Output name="A1415645087570" variable="result" content="result"/>
				<Output name="A1415645092805" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738561653" variable="duedate" content="duedate"/>
				<Input name="A1415738565258" variable="parentprocessid" content="processid"/>
				<Input name="A1415738569283" variable="prioritylevel" content="prioritylevel"/>
			</Process>
		</Component>
		<Link name="L1415645057437" source="C1415645036961" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415644838200" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415644847872" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415644869806" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="result" notstoredvariable="false"/>
		<Variable name="A1415644888084" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="Additional action description that you want to push  back to the requester" notstoredvariable="false"/>
		<Variable name="A1415644904736" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" description="application" notstoredvariable="false"/>
		<Variable name="A1415644916896" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="identity" notstoredvariable="false"/>
		<Variable name="A1415644927436" variable="requester" displayname="requester" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="requester" notstoredvariable="false"/>
		<Variable name="A1415644941155" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" description="identity fullname" notstoredvariable="false"/>
		<Variable name="A1415644953097" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" description="identity hrcode" notstoredvariable="false"/>
		<Variable name="A1415644967029" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" description="application name" notstoredvariable="false"/>
		<Variable name="A1415644978144" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="comments" notstoredvariable="false"/>
		<Variable name="A1415644999526" variable="accountLogins" displayname="account Logins" editortype="Default" type="String" multivalued="true" visibility="local" description="account Logins" notstoredvariable="false"/>
		<Variable name="A1415645010407" variable="accountUsernames" displayname="account Usernames" editortype="Default" type="String" multivalued="true" visibility="local" description="account Usernames" notstoredvariable="false"/>
		<Variable name="A1415645028498" variable="accountRepositories" displayname="account Repositories" editortype="Default" type="String" multivalued="true" visibility="local" description="account Repositories" notstoredvariable="false"/>
		<Variable name="A1415737628809" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737643825" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737658726" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737671381" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737862822" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738146947" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
	</Variables>
</Workflow>
