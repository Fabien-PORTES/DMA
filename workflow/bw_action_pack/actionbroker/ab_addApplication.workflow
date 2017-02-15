<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_addApplication" displayname="Action Broker - Add Application" scriptfile="/workflow/bw_action_pack/actionbroker/ab_addApplication.javascript" description="Add a new application for a given individual" statictitle="Action Broker - Add Application">
		<Component name="CSTART" type="startactivity" x="35" y="227" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Candidates name="role" role="A1415642616121"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415738949649" action="executeview" viewname="actionpackIdentitypicker" attribute="identityfullname">
					<ViewParam name="P14157389496490" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415738949649_1" attribute="fullname" variable="identityfullname"/>
					<ViewAttribute name="P1415738949649_2" attribute="hrcode" variable="identityhrcode"/>
				</Action>
				<Action name="U1415738999305" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14157389993050" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415738999305_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415739105316" action="executeview" viewname="actionpackPermissionspicker" attribute="profilescodes">
					<ViewParam name="P14157391053160" param="uids" paramvalue="{dataset.profiles}"/>
					<ViewAttribute name="P1415739105316_1" attribute="code" variable="profilescodes"/>
					<ViewAttribute name="P1415739105316_2" attribute="displayname" variable="profilesnames"/>
				</Action>
				<Action name="U1415739211030" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountLogin">
					<ViewParam name="P14157392110300" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14157392110301" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415739211030_2" attribute="login" variable="accountLogin"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="1000" y="227" w="200" h="98" title="End" compact="true" inexclusive="true"/>
		<Link name="CLINK" source="CSTART" target="C1415642645760" priority="1"/>
		<Component name="C1415642645760" type="callactivity" x="374" y="202" w="200" h="98" title="Create a new {dataset.applicationname.get()} application access for {dataset.identityfullname.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionAddApplication.workflow">
				<Input name="A1415643167214" variable="application" content="application"/>
				<Input name="A1415643172071" variable="comments" content="comments"/>
				<Input name="A1415643177891" variable="identity" content="identity"/>
				<Input name="A1415643182873" variable="profiles" content="profiles"/>
				<Input name="A1415643187034" variable="referer" content="referer"/>
				<Input name="A1415643191245" variable="requester" content="requester"/>
				<Output name="A1415643198244" variable="accountLogin" content="accountLogin"/>
				<Output name="A1415643203248" variable="result" content="result"/>
				<Output name="A1415643210103" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738093041" variable="duedate" content="duedate"/>
				<Input name="A1415738277695" variable="parentprocessid" content="processid"/>
				<Input name="A1415738283083" variable="prioritylevel" content="prioritylevel"/>
				<Input name="A1416237408777" variable="firstname" content="firstname"/>
				<Input name="A1416237416334" variable="hrcode" content="hrcode"/>
				<Input name="A1416237423160" variable="lastname" content="lastname"/>
				<Input name="A1416238804722" variable="arrivaldate" content="arrivaldate"/>
				<Input name="A1416238809986" variable="departuredate" content="departuredate"/>
			</Process>
		</Component>
		<Link name="L1415642668991" source="C1415642645760" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1415642616121" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415642628293" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1415642743188" variable="requester" displayname="requester" editortype="Process Actor" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="the action requester"/>
		<Variable name="A1415642754125" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The invididual on which the new application will be added"/>
		<Variable name="A1415642763479" variable="profiles" displayname="profiles" editortype="Ledger Permission" type="String" multivalued="true" visibility="in" notstoredvariable="false" description="the application profiles to assign"/>
		<Variable name="A1415642775607" variable="referer" displayname="referer" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="The referer in case of smart confguration: cloning another individual access rights" notstoredvariable="false"/>
		<Variable name="A1415642802644" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="action comments" notstoredvariable="false"/>
		<Variable name="A1415642814584" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" description="The application to assign" notstoredvariable="false"/>
		<Variable name="A1415642828963" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" notstoredvariable="false" description="result">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415642878720" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="Additional action description that you want to push  back to the requester" notstoredvariable="false"/>
		<Variable name="A1415642900245" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" description="application name" notstoredvariable="false"/>
		<Variable name="A1415642915478" variable="identityfullname" displayname="identity fullname" editortype="Default" type="String" multivalued="false" visibility="local" description="identity fullname" notstoredvariable="false"/>
		<Variable name="A1415642968995" variable="accountLogin" displayname="account Login" editortype="Default" type="String" multivalued="false" visibility="out" description="The account login associated with the application" notstoredvariable="false"/>
		<Variable name="A1415642994433" variable="profilescodes" displayname="profiles codes" editortype="Default" type="String" multivalued="true" visibility="local" description="profiles codes" notstoredvariable="false"/>
		<Variable name="A1415643010501" variable="profilesnames" displayname="profiles names" editortype="Default" type="String" multivalued="true" visibility="local" description="profiles names" notstoredvariable="false"/>
		<Variable name="A1415643024877" variable="identityhrcode" displayname="identity hrcode" editortype="Default" type="String" multivalued="false" visibility="local" description="identity hrcode" notstoredvariable="false"/>
		<Variable name="A1415737345461" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737356733" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737371645" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737386394" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737811908" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738115065" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
		<Variable name="A1416237320603" variable="hrcode" displayname="hrcode" editortype="Default" type="String" multivalued="false" visibility="in" description="the hrcode of the individual, could be used as a substitute for the &quot;identity&quot; attribute in case of a &quot;newcomer&quot; which is not yet in the database" notstoredvariable="false"/>
		<Variable name="A1416237334564" variable="firstname" displayname="firstname" editortype="Default" type="String" multivalued="false" visibility="in" description="the firstname of the individual, could be used as a substitute for the &quot;identity&quot; attribute in case of a &quot;newcomer&quot; which is not yet in the database" notstoredvariable="false"/>
		<Variable name="A1416237348379" variable="lastname" displayname="lastname" editortype="Default" type="String" multivalued="false" visibility="in" description="the lastname of the individual, could be used as a substitute for the &quot;identity&quot; attribute in case of a &quot;newcomer&quot; which is not yet in the database" notstoredvariable="false"/>
		<Variable name="A1416238735995" variable="arrivaldate" displayname="arrival date" editortype="Default" type="Date" multivalued="false" visibility="in" description="arrival date" notstoredvariable="false"/>
		<Variable name="A1416238751733" variable="departuredate" displayname="departure date" editortype="Default" type="Date" multivalued="false" visibility="in" description="departure date" notstoredvariable="false"/>
	</Variables>
</Workflow>
