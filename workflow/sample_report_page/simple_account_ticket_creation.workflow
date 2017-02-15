<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="simple_account_ticket_creation" displayname="simple_account_ticket_creation" scriptfile="/workflow/sample_report_page/simple_account_ticket_creation.javascript" technical="true">
		<Component name="CSTART" type="startactivity" x="32" y="70" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
			</Ticket>
			<Candidates name="role" role="A1479826482206"/>
			<FormVariable name="A1479892327256" variable="account_categorisation_label" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1479892396222" variable="erase_categorisation" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1479826518856" variable="comment" action="input" mandatory="false" longlist="false"/>
			<Output name="output" ticketactionnumbervariable="ticket_action"/>
			<Actions>
				<Action name="U1479892727599" action="executeview" viewname="simple_account_categorisation" append="false" attribute="existing_ticket_review">
					<ViewParam name="P14798927275990" param="account_uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1479892727599_1" attribute="ticket_recorduid" variable="existing_ticket_review"/>
				</Action>
				<Action name="U1479896721105" action="update" attribute="ticket_review_already_exists" newvalue="true" condition="(! dataset.isEmpty(&apos;existing_ticket_review&apos;))"/>
			</Actions>
		</Component>
		<Component name="CEND" type="endactivity" x="674" y="73" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1479826342107" priority="2"/>
		<Component name="C1479826342107" type="ticketreviewactivity" x="392" y="50" w="200" h="98" title="Add categorisation" inexclusive="true">
			<TicketReview ticketaction="ticket_action">
				<Account accountvariable="account"/>
				<Attribute name="comment" attribute="comment"/>
				<Attribute name="custom1" attribute="account_categorisation_label"/>
				<Attribute name="custom2" attribute="ticket_review_already_exists"/>
			</TicketReview>
		</Component>
		<Link name="L1479826649293" source="C1479826342107" target="CEND" priority="1"/>
		<Component name="C1479892414848" type="deleteticketactivity" x="201" y="267" w="200" h="98" title="Erasing previous categorisation">
			<DeleteTicket name="deleteticket" tickettype="TicketReview" ticketrecordnumber="existing_ticket_review"/>
		</Component>
		<Link name="L1479892425696" source="CSTART" target="C1479892414848" priority="1" expression="(dataset.equals(&apos;erase_categorisation&apos;, &apos;true&apos;, false, true)) &amp;&amp; (dataset.equals(&apos;ticket_review_already_exists&apos;, &apos;true&apos;, false, true))" labelcustom="true" label="If requested by the process owner and if a ticket review exists"/>
		<Link name="L1479892427061" source="C1479892414848" target="C1479826342107" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1479826309709" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479826324702" variable="comment" displayname="comment" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479826447014" variable="ticket_action" displayname="ticket_action" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479826574591" variable="TICKETTYPE" displayname="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="ACCOUNTCATEGORISATION" notstoredvariable="false"/>
		<Variable name="A1479890665112" variable="account_categorisation_label" displayname="Account categorisation label" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false">
			<StaticValue name="1-Already Mapped, UID# Matches (ID OK)"/>
			<StaticValue name="2-Already Mapped, ID OK Mismatched UID#"/>
			<StaticValue name="3-Already Mapped, ID OK Mismatched UID# (Conflicting)"/>
			<StaticValue name="4-New mapping to new SAM_N using changed NIS UID, current UID#"/>
			<StaticValue name="5-New mapping to new SAM_N using changed NIS UID, newly allocated UID#"/>
			<StaticValue name="6-New mapping to existing SAM_N using changed NIS UID, current UID#"/>
			<StaticValue name="7-New mapping to existing SAM_N using changed NIS UID, new UID#"/>
			<StaticValue name="8-Use existing mapping (SAM_N): change NIS UID and UID# to match existing mapping"/>
			<StaticValue name="9-Use existing mapping (SAM_N): change NIS UID and UID# to match existing mapping, after resolving conflicting UID# issue"/>
			<StaticValue name="10-Use existing mapping (SAM_N): change NIS UID to match existing mapping."/>
			<StaticValue name="11-New mapping to new SAM_N using NIS UID, UID#"/>
			<StaticValue name="12-New mapping to new SAM_N using NIS UID, new UID#"/>
			<StaticValue name="13-Mapping already exists for this identity in this domain – transfer usage to mapped account UID_N, deactivate this one (UID)"/>
			<StaticValue name="14-Use existing mapping (SAM_N): change NIS UID and UID# to match existing mapping"/>
			<StaticValue name="15-Use existing mapping (SAM_N): change NIS UID and UID# to match existing mapping, after resolving conflicting UID# issue"/>
			<StaticValue name="16-Use existing mapping (SAM_N): change NIS UID to match existing mapping"/>
			<StaticValue name="17-New mapping (using SAM_N, NIS UID and UID#)"/>
			<StaticValue name="18-New Mapping using SAM_N, NIS UID, new UID#"/>
			<StaticValue name="19-To be Deactivated"/>
			<StaticValue name="20-Unidentifiable (Lock NIS account to provoke reaction"/>
		</Variable>
		<Variable name="A1479892389536" variable="erase_categorisation" displayname="Erase existing categorisation" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479892490693" variable="existing_ticket_review" displayname="Existing ticket review" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479896687587" variable="ticket_review_already_exists" displayname="Ticket review already exists" editortype="Default" type="String" multivalued="false" visibility="local" description="True if the account has already an ticket review associated" initialvalue="false" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1479826482206" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="process_owner" description="Process owner">
			<Rule name="A1479895591209" rule="simple_account_categorisation_process_owner" description="simple_account_categorisation_process_owner"/>
		</Role>
	</Roles>
</Workflow>
