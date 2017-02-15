<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="account_categorization" displayname="account_categorization" scriptfile="workflow/account_categorization/account_categorization.javascript" technical="true" statictitle="account_categorization">
		<Component name="CSTART" type="startactivity" x="32" y="75" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
			</Ticket>
			<Candidates name="role" role="A1479826482206"/>
			<FormVariable name="A1479892327256" variable="account_categorisation_label" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1479892396222" variable="erase_categorisation" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1479826518856" variable="comment" action="input" mandatory="false" longlist="false"/>
			<Output name="output" ticketactionnumbervariable="ticket_action"/>
			<Actions>
				<Action name="U1486479941360" action="multiresize" attribute="accounts" attribute1="accounts_GECOS" attribute2="accounts_categorisation_label" attribute3="accounts_samaccountname" attribute4="accounts_uid" attribute5="accounts_uid_number" attribute6="comments"/>
				<Action name="U1486479974687" action="multireplace" attribute="accounts_GECOS" newvalue="{dataset.account_GECOS.get()}"/>
				<Action name="U1486479990107" action="multireplace" attribute="accounts_categorisation_label" newvalue="{dataset.account_categorisation_label.get()}"/>
				<Action name="U1486480011074" action="multireplace" attribute="accounts_samaccountname" newvalue="{dataset.account_samaccountname.get()}"/>
				<Action name="U1486480028419" action="multireplace" attribute="accounts_uid" newvalue="{dataset.account_uid.get()}"/>
				<Action name="U1486480051735" action="multireplace" attribute="accounts_uid_number" newvalue="{dataset.account_uid_number.get()}"/>
				<Action name="U1486480077227" action="multireplace" attribute="comments" newvalue="{dataset.comment.get()}"/>
			</Actions>
			<FormVariable name="A1485355051649" variable="account_uid" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1485355056162" variable="account_uid_number" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1485355062233" variable="account_GECOS" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1485355068305" variable="account_samaccountname" action="input" mandatory="false" longlist="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="674" y="75" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1479826342107" priority="2"/>
		<Component name="C1479826342107" type="ticketreviewactivity" x="247" y="50" w="200" h="98" title="Add categorisation" inexclusive="true">
			<TicketReview ticketaction="ticket_action">
				<Account accountvariable="accounts"/>
				<Attribute name="comment" attribute="comment"/>
				<Attribute name="custom1" attribute="account_categorisation_label"/>
				<Attribute name="custom3" attribute="account_uid"/>
				<Attribute name="custom4" attribute="account_uid_number"/>
				<Attribute name="custom5" attribute="account_GECOS"/>
				<Attribute name="custom6" attribute="account_samaccountname"/>
				<Attribute name="status" attribute="ticket_status"/>
			</TicketReview>
		</Component>
		<Link name="L1479826649293" source="C1479826342107" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1479826309709" variable="accounts" displayname="accounts" editortype="Ledger Account" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479826324702" variable="comment" displayname="comment" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479826447014" variable="ticket_action" displayname="ticket_action" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1479826574591" variable="TICKETTYPE" displayname="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="ACCOUNTCATEGORISATION" notstoredvariable="false"/>
		<Variable name="A1479890665112" variable="account_categorisation_label" displayname="account_categorisation_label" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false">
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
		<Variable name="A1485354982127" variable="account_uid" displayname="account_uid" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1485354993501" variable="account_uid_number" displayname="account_uid_number" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1485355000805" variable="account_GECOS" displayname="account_GECOS" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1485355020633" variable="account_samaccountname" displayname="account_samaccountname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1485356100939" variable="ticket_status" displayname="ticket_status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="OPEN" notstoredvariable="false"/>
		<Variable name="A1486479710387" variable="accounts_GECOS" displayname="accounts_GECOS" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486479746707" variable="accounts_categorisation_label" displayname="accounts_categorisation_label" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486479760838" variable="accounts_samaccountname" displayname="accounts_samaccountname" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486479798918" variable="accounts_uid" displayname="accounts_uid" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486479812723" variable="accounts_uid_number" displayname="accounts_uid_number" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486479852917" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486479876321" variable="tickets_status" displayname="tickets_status" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1479826482206" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="operators" description="operators">
			<Rule name="A1485353431111" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
