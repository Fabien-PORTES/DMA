<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="ab_modifyAccount" displayname="Action Broker - Modify Account" scriptfile="/workflow/bw_action_pack/actionbroker/ab_modifyAccount.javascript" statictitle="Action Broker - Modify Account">
		<Component name="CSTART" type="startactivity" x="134" y="275" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1415718115056"/>
			<Output name="output" processidvariable="processid"/>
			<Actions>
				<Action name="U1415739850005" action="executeview" viewname="actionpackAccountpicker" attribute="repository">
					<ViewParam name="P14157398500050" param="uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1415739850005_1" attribute="repositoryuid" variable="repository"/>
					<ViewAttribute name="P1415739850005_2" attribute="login" variable="login"/>
					<ViewAttribute name="P1415739850005_3" attribute="repositorydisplayname" variable="repositoryName"/>
				</Action>
			</Actions>
			<Ticket create="true"/>
		</Component>
		<Component name="CEND" type="endactivity" x="839" y="275" w="200" h="98" title="End" compact="true"/>
		<Component name="C1415718070168" type="callactivity" x="453" y="250" w="200" h="98" title="Modify account {dataset.login.get()} on {dataset.repositoryName.get()}">
			<Process workflowfile="/workflow/bw_action_pack/actionpack/actionModifyAccount.workflow">
				<Input name="A1415718185306" variable="account" content="account"/>
				<Output name="A1415718211290" variable="result" content="result"/>
				<Output name="A1415718214824" variable="resultdescription" content="resultdescription"/>
				<Input name="A1415738431875" variable="duedate" content="duedate"/>
				<Input name="A1415738437338" variable="parentprocessid" content="processid"/>
				<Input name="A1415738442075" variable="prioritylevel" content="prioritylevel"/>
				<Input name="A1415799605771" variable="acc_badpasswordcount" content="acc_badpasswordcount"/>
				<Input name="A1415799610804" variable="acc_creationdate" content="acc_creationdate"/>
				<Input name="A1415799614902" variable="acc_custom1" content="acc_custom1"/>
				<Input name="A1415799619053" variable="acc_custom2" content="acc_custom2"/>
				<Input name="A1415799624041" variable="acc_custom3" content="acc_custom3"/>
				<Input name="A1415799629608" variable="acc_custom4" content="acc_custom4"/>
				<Input name="A1415799633893" variable="acc_custom5" content="acc_custom5"/>
				<Input name="A1415799638297" variable="acc_custom6" content="acc_custom6"/>
				<Input name="A1415799642618" variable="acc_custom7" content="acc_custom7"/>
				<Input name="A1415799646666" variable="acc_custom8" content="acc_custom8"/>
				<Input name="A1415799651249" variable="acc_custom9" content="acc_custom9"/>
				<Input name="A1415799655247" variable="acc_disabled" content="acc_disabled"/>
				<Input name="A1415799659512" variable="acc_dontexpirepassword" content="acc_dontexpirepassword"/>
				<Input name="A1415799663711" variable="acc_employeenumber" content="acc_employeenumber"/>
				<Input name="A1415799668567" variable="acc_expiredate" content="acc_expiredate"/>
				<Input name="A1415799673618" variable="acc_givenname" content="acc_givenname"/>
				<Input name="A1415799678089" variable="acc_identifier" content="acc_identifier"/>
				<Input name="A1415799683219" variable="acc_lastlogindate" content="acc_lastlogindate"/>
				<Input name="A1415799687343" variable="acc_locked" content="acc_locked"/>
				<Input name="A1415799692634" variable="acc_login" content="acc_login"/>
				<Input name="A1415799696743" variable="acc_logincount" content="acc_logincount"/>
				<Input name="A1415799700719" variable="acc_mail" content="acc_mail"/>
				<Input name="A1415799705456" variable="acc_nextpwdchangedate" content="acc_nextpwdchangedate"/>
				<Input name="A1415799712367" variable="acc_notnormalaccount" content="acc_notnormalaccount"/>
				<Input name="A1415799718144" variable="acc_passwordcantchange" content="acc_passwordcantchange"/>
				<Input name="A1415799722241" variable="acc_passwordexpired" content="acc_passwordexpired"/>
				<Input name="A1415799727378" variable="acc_passwordlastsetdate" content="acc_passwordlastsetdate"/>
				<Input name="A1415799733072" variable="acc_passwordnotrequired" content="acc_passwordnotrequired"/>
				<Input name="A1415799737555" variable="acc_service" content="acc_service"/>
				<Input name="A1415799741195" variable="acc_smartcardrequired" content="acc_smartcardrequired"/>
				<Input name="A1415799748503" variable="acc_surname" content="acc_surname"/>
				<Input name="A1415799756458" variable="acc_username" content="acc_username"/>
				<Input name="A1422608041492" variable="requester" content="requester"/>
			</Process>
		</Component>
		<Link name="L1415718080819" source="C1415718070168" target="CEND" priority="1"/>
		<Link name="L1415810943263" source="CSTART" target="C1415718070168" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1415717909433" variable="repository" displayname="repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" description="repository" notstoredvariable="false"/>
		<Variable name="A1415717924009" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" description="account" notstoredvariable="false"/>
		<Variable name="A1415717930779" variable="login" displayname="login" editortype="Default" type="String" multivalued="false" visibility="local" description="login" notstoredvariable="false"/>
		<Variable name="A1415717937435" variable="repositoryName" displayname="repositoryName" editortype="Default" type="String" multivalued="false" visibility="local" description="repositoryName" notstoredvariable="false"/>
		<Variable name="A1415717951405" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" description="result" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415717964849" variable="resultdescription" displayname="result description" editortype="Default" type="String" multivalued="false" visibility="out" description="result description" notstoredvariable="false"/>
		<Variable name="A1415737520689" variable="prioritylevel" displayname="priority level" editortype="Default" type="String" multivalued="false" visibility="in" description="priority level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415737533493" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415737545804" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" initialvalue="100" notstoredvariable="false"/>
		<Variable name="A1415737561367" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737841468" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1415738134338" variable="processid" displayname="processid" editortype="Default" type="String" multivalued="false" visibility="local" description="processid" notstoredvariable="false"/>
		<Variable name="A1415799150509" variable="acc_identifier" displayname="acc_identifier" editortype="Default" type="String" multivalued="false" visibility="in" description="Account identifier" notstoredvariable="false"/>
		<Variable name="A1415799166853" variable="acc_login" displayname="acc_login" editortype="Default" type="String" multivalued="false" visibility="in" description="Account login" notstoredvariable="false"/>
		<Variable name="A1415799177881" variable="acc_givenname" displayname="acc_givenname" editortype="Default" type="String" multivalued="false" visibility="in" description="Account givenname" notstoredvariable="false"/>
		<Variable name="A1415799190203" variable="acc_surname" displayname="acc_surname" editortype="Default" type="String" multivalued="false" visibility="in" description="Account surname" notstoredvariable="false"/>
		<Variable name="A1415799200986" variable="acc_username" displayname="acc_username" editortype="Default" type="String" multivalued="false" visibility="in" description="Account username" notstoredvariable="false"/>
		<Variable name="A1415799211520" variable="acc_employeenumber" displayname="acc_employeenumber" editortype="Default" type="String" multivalued="false" visibility="in" description="Account employeenumber" notstoredvariable="false"/>
		<Variable name="A1415799222005" variable="acc_mail" displayname="acc_mail" editortype="Default" type="String" multivalued="false" visibility="in" description="Account mail" notstoredvariable="false"/>
		<Variable name="A1415799232252" variable="acc_creationdate" displayname="acc_creationdate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account creationdate" notstoredvariable="false"/>
		<Variable name="A1415799242682" variable="acc_lastlogindate" displayname="acc_lastlogindate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account lastlogindate" notstoredvariable="false"/>
		<Variable name="A1415799253447" variable="acc_passwordlastsetdate" displayname="acc_passwordlastsetdate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account passwordlastsetdate" notstoredvariable="false"/>
		<Variable name="A1415799265272" variable="acc_expiredate" displayname="acc_expiredate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account expiredate" notstoredvariable="false"/>
		<Variable name="A1415799277678" variable="acc_nextpwdchangedate" displayname="acc_nextpwdchangedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="Account nextpwdchangedate" notstoredvariable="false"/>
		<Variable name="A1415799288677" variable="acc_service" displayname="acc_service" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account service" notstoredvariable="false"/>
		<Variable name="A1415799299104" variable="acc_disabled" displayname="acc_disabled" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account disabled" notstoredvariable="false"/>
		<Variable name="A1415799310231" variable="acc_locked" displayname="acc_locked" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account locked" notstoredvariable="false"/>
		<Variable name="A1415799322924" variable="acc_logincount" displayname="acc_logincount" editortype="Default" type="Number" multivalued="false" visibility="in" description="Account logincount" notstoredvariable="false"/>
		<Variable name="A1415799334541" variable="acc_badpasswordcount" displayname="acc_badpasswordcount" editortype="Default" type="Number" multivalued="false" visibility="in" description="Account badpasswordcount" notstoredvariable="false"/>
		<Variable name="A1415799347734" variable="acc_passwordnotrequired" displayname="acc_passwordnotrequired" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account passwordnotrequired" notstoredvariable="false"/>
		<Variable name="A1415799358707" variable="acc_passwordcantchange" displayname="acc_passwordcantchange" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account passwordcantchange" notstoredvariable="false"/>
		<Variable name="A1415799369091" variable="acc_notnormalaccount" displayname="acc_notnormalaccount" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account notnormalaccount" notstoredvariable="false"/>
		<Variable name="A1415799379648" variable="acc_dontexpirepassword" displayname="acc_dontexpirepassword" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account dontexpirepassword" notstoredvariable="false"/>
		<Variable name="A1415799390422" variable="acc_passwordexpired" displayname="acc_passwordexpired" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account passwordexpired" notstoredvariable="false"/>
		<Variable name="A1415799402631" variable="acc_smartcardrequired" displayname="acc_smartcardrequired" editortype="Default" type="Boolean" multivalued="false" visibility="in" description="Account smartcardrequired" notstoredvariable="false"/>
		<Variable name="A1415799413297" variable="acc_custom1" displayname="acc_custom1" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom1" notstoredvariable="false"/>
		<Variable name="A1415799424235" variable="acc_custom2" displayname="acc_custom2" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom2" notstoredvariable="false"/>
		<Variable name="A1415799436369" variable="acc_custom3" displayname="acc_custom3" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom3" notstoredvariable="false"/>
		<Variable name="A1415799445865" variable="acc_custom4" displayname="acc_custom4" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom4" notstoredvariable="false"/>
		<Variable name="A1415799456621" variable="acc_custom5" displayname="acc_custom5" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom5" notstoredvariable="false"/>
		<Variable name="A1415799466428" variable="acc_custom6" displayname="acc_custom6" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom6" notstoredvariable="false"/>
		<Variable name="A1415799477422" variable="acc_custom7" displayname="acc_custom7" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom7" notstoredvariable="false"/>
		<Variable name="A1415799488346" variable="acc_custom8" displayname="acc_custom8" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom8" notstoredvariable="false"/>
		<Variable name="A1415799499035" variable="acc_custom9" displayname="acc_custom9" editortype="Default" type="String" multivalued="false" visibility="in" description="Account custom9" notstoredvariable="false"/>
		<Variable name="A1415810993277" variable="acc_profile" displayname="acc_profile" editortype="Default" type="String" multivalued="false" visibility="in" description="Account profile" notstoredvariable="false"/>
		<Variable name="A1422607980763" variable="requester" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1415718115056" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everyone" description="Everyone">
			<Rule name="A1415718125120" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
