<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="recon_suggest_dialog" displayname="Technical workflow to create recon" scriptfile="/workflow/recon_suggest_dialog/recon_suggest_dialog.javascript" technical="true">
		<Component name="CSTART" type="startactivity" x="85" y="51" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Actions>
				<Action name="U1485279015598" action="executeview" viewname="recon_suggest_dialog" append="false" attribute="identity_already_present_uid">
					<ViewParam name="P14852790155980" param="account_uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1485279015598_1" attribute="identity_already_present_uid" variable="identity_already_present_uid"/>
					<ViewAttribute name="P1485279015598_2" attribute="identity_already_present_fullname" variable="identity_fullname"/>
					<ViewAttribute name="P1485279015598_3" attribute="identity_already_present_custom4" variable="identity_repositoryname"/>
					<ViewAttribute name="P1485279015598_4" attribute="identity_already_present_custom8" variable="identity_samaccountname"/>
					<ViewAttribute name="P1485279015598_5" attribute="identity_already_present_hrcode" variable="identity_hrcode"/>
				</Action>
			</Actions>
			<Candidates name="role" role="A1485278492032"/>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="ticket_type"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticket_action_number"/>
		</Component>
		<Component name="CEND" type="endactivity" x="974" y="55" w="200" h="98" title="End" compact="true"/>
		<Component name="C1485278680377" type="updatereconciliationactivity" x="242" y="30" w="200" h="98" inexclusive="true" title="Create recon">
			<Reconciliation name="reconciliation" accountrecordnumber="account" updateidentity="identity"/>
		</Component>
		<Link name="L1485278686698" source="CSTART" target="C1485278680377" priority="2" labelcustom="false" label="No reconciliation present"/>
		<Component name="C1486376143897" type="ticketreviewactivity" x="653" y="30" w="200" h="98" title="Informations about the recon" inexclusive="true">
			<TicketReview ticketaction="ticket_action_number">
				<Account accountvariable="account"/>
				<Attribute name="custom1" attribute="identity_fullname"/>
				<Attribute name="custom2" attribute="identity_repositoryname"/>
				<Attribute name="custom3" attribute="identity_samaccountname"/>
				<Attribute name="custom4" attribute="identity_hrcode"/>
			</TicketReview>
		</Component>
		<Link name="L1486376152945" source="C1486376143897" target="CEND" priority="1"/>
		<Link name="L1486399828219" source="C1485278680377" target="C1486376143897" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1485278492032" icon="/reports/icons/48/people/personal_yellow_48.png" smallicon="/reports/icons/16/people/personal_yellow_16.png" displayname="operators" description="Operators">
			<Rule name="A1485278508902" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1485278550934" variable="account" displayname="Account" editortype="Ledger Account" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1485278569760" variable="identity" displayname="Identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A14852790155980" variable="identity_already_present_uid" displayname="identity_already_present_uid" multivalued="true" visibility="local" type="String" editortype="Ledger Identity"/>
		<Variable name="A1486376238403" variable="ticket_action_number" displayname="ticket_action_number" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486376380886" variable="ticket_type" displayname="ticket_type" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="MANUALRECONCILIATION" notstoredvariable="false"/>
		<Variable name="A14852790155981" variable="identity_fullname" displayname="Identity fullname" multivalued="false" visibility="local" type="String" editortype="Default" notstoredvariable="false"/>
		<Variable name="A14852790155982" variable="identity_repositoryname" displayname="Identity repository name" multivalued="false" visibility="local" type="String" editortype="Default" notstoredvariable="false"/>
		<Variable name="A1487065893345" variable="identity_hrcode" displayname="identity_hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1487065907025" variable="identity_samaccountname" displayname="identity_samaccountname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
</Workflow>
