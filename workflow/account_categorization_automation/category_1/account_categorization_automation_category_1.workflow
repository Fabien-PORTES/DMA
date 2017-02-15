<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="account_categorization_automation_category_1" displayname="Account categorization automation (category 1)" scriptfile="/workflow/account_categorization_automation/category_1/account_categorization_automation_category_1.javascript" technical="true">
		<Component name="CSTART" type="startactivity" x="-25" y="53" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Actions>
				<Action name="U1486740700379" action="executeview" viewname="account_categorization_automation_category_1" append="false" attribute="accounts">
					<ViewAttribute name="P1486740700379_0" attribute="account_uid" variable="accounts"/>
				</Action>
				<Action name="U1486993882934" action="update" attribute="now" newvalue="{dataset.now}"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
			</Ticket>
			<Output name="output" ticketnumbervariable="ticket_action" startidentityvariable="operator"/>
			<Candidates name="role" role="A1486742219548"/>
			<FormVariable name="A1486996532446" variable="Category1_label" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1486996539686" variable="operator" action="input" mandatory="false" longlist="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="466" y="53" w="200" h="98" title="End" compact="true" inexclusive="true"/>
		<Link name="CLINK" source="CSTART" target="C1479826342107_1" priority="1" expression="(! dataset.isEmpty(&apos;accounts&apos;))" labelcustom="true" label="Something to do"/>
		<Component name="C1479826342107_1" type="ticketreviewactivity" x="181" y="28" w="200" h="98" title="Add categorisation" inexclusive="true">
			<TicketReview ticketaction="ticket_action">
				<Account accountvariable="accounts"/>
				<Attribute name="status" attribute="ticket_status"/>
				<Attribute name="custom1" attribute="Category1_label"/>
			</TicketReview>
		</Component>
		<Link name="L1486740925709" source="C1479826342107_1" target="CEND" priority="1"/>
		<Component name="C1486743064593" type="routeactivity" x="263" y="194" w="200" h="50" compact="true" title="Route 1"/>
		<Link name="L1486743068503" source="CSTART" target="C1486743064593" priority="2" expression="(dataset.isEmpty(&apos;accounts&apos;))" labelcustom="true" label="Nothing to categorize"/>
		<Link name="L1486743069538" source="C1486743064593" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A14867407003790" variable="accounts" displayname="Account uids" multivalued="true" visibility="local" type="String" editortype="Ledger Account"/>
		<Variable name="A1486740740445" variable="ticket_action" displayname="ticket_action" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486740794718" variable="ticket_status" displayname="ticket_status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="OPEN" notstoredvariable="false"/>
		<Variable name="A1486740836385" variable="TICKETTYPE" displayname="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="ACCOUNTCATEGORISATION" notstoredvariable="false"/>
		<Variable name="A1486742251999" variable="operator" displayname="Operator" editortype="Process Actor" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
		<Variable name="A1486993655973" variable="Category1_label" displayname="Category1_label" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="1-Already Mapped, UID# Matches (ID OK)"/>
		<Variable name="A1486993810837" variable="now" displayname="now" editortype="Default" type="Date" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1486742219548" icon="/reports/icons/48/people/personal_yellow_48.png" smallicon="/reports/icons/16/people/personal_yellow_16.png" displayname="operators" description="operators">
			<Rule name="A1486742237320" rule="operator_with_uid" description="Operator with {uid}">
				<Param name="uid" variable="operator"/>
			</Rule>
		</Role>
	</Roles>
</Workflow>
