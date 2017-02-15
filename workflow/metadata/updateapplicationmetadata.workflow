<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updateapplicationmetadata" displayname="Update shared metadata" description="Update shared metadata" scriptfile="/workflow/metadata/updateapplicationmetadata.javascript" statictitle="Update shared metadata" publish="false">
		<Component name="CSTART" type="startactivity" x="55" y="148" w="200" h="114" title="Start" compact="true">
			<Output name="output" ticketnumbervariable="ticketlog" ticketactionnumbervariable="ticketaction"/>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="description" attribute="ticketdescription"/>
				<Attribute name="status" attribute="ticketstatus"/>
			</Ticket>
			<Actions>
				<Action name="U1437988949694" action="update" attribute="ticketdescription" newvalue="Update metadata on (&apos;{dataset.application.length}&apos;) share(s)"/>
			</Actions>
			<Candidates name="role" role="A1437989337599"/>
			<FormVariable name="A1437989372486" variable="description" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1445361515503" variable="application" action="input" mandatory="true" longlist="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="801" y="148" w="200" h="98" title="End" compact="true">
			<Actions>
				<Action name="U1437988821040" action="update" attribute="ticketstatus" newvalue="done"/>
			</Actions>
		</Component>
		<Component name="N1444230132222" type="note" x="57" y="261" w="267" h="104" title="Notes&#xA;&#xA;- Workflow receives multivalued variables"/>
		<Component name="C1444232855613" type="ticketreviewactivity" x="214" y="123" w="200" h="98" title="Write the tickets">
			<TicketReview ticketaction="ticketaction" expression="(dataset.equals(&apos;createReviewTickets&apos;, &apos;true&apos;, false, true))">
				<Permission/>
				<Attribute name="comment" attribute="ticket_descriptions"/>
				<Application applicationvariable="resultingUids"/>
			</TicketReview>
		</Component>
		<Component name="C1444318181914" type="updateapplicationinfoactivity" x="493" y="123" w="200" h="98" title="Update the metadata">
			<ApplicationInfo name="appinfo" application="application" update="whattoupdate" description="description"/>
		</Component>
		<Link name="L1444319017152" source="C1444232855613" target="C1444318181914" priority="1"/>
		<Link name="L1444319024744" source="C1444318181914" target="CEND" priority="1"/>
		<Link name="L1445361479401" source="CSTART" target="C1444232855613" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1437988414131" variable="description" displayname="description" editortype="Default" type="String" multivalued="true" visibility="in" description="Input: Description" notstoredvariable="false"/>
		<Variable name="A1437988472472" variable="sensitivityreason" displayname="sensitivity reason" editortype="Default" type="String" multivalued="true" visibility="in" description="Input: sensitivity, ex: CTU" notstoredvariable="false"/>
		<Variable name="A1437988656376" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="SHAREMETADATA" notstoredvariable="false" description="SHAREMETADATA"/>
		<Variable name="A1437988671470" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" description="internal, used for the ticketlog"/>
		<Variable name="A1437988809253" variable="ticketstatus" displayname="ticket status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false" description="internal, used for the ticketlog"/>
		<Variable name="A1444225117989" variable="whattoupdate" displayname="whattoupdate" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" description="internal, used in javascript" initialvalue="D"/>
		<Variable name="A1444227903424" variable="resultingUids" editortype="Ledger Application" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227950137" variable="resultingDescription" displayname="resultingDescription" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227985046" variable="resultingReason" displayname="resultingReason" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227994833" variable="resultingLevel" displayname="resultingLevel" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444233051422" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false" description="internal"/>
		<Variable name="A1444233900846" variable="ticketlog" displayname="ticketlog" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false" description="internal"/>
		<Variable name="A1444234477149" variable="createReviewTickets" displayname="createReviewTickets" editortype="Default" type="Boolean" multivalued="false" visibility="local" initialvalue="true" notstoredvariable="false" description="Default: true&#xA;"/>
		<Variable name="A1444234604064" variable="ticket_descriptions" displayname="ticket_descriptions" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="internal, used in javascript"/>
		<Variable name="A1444318225262" variable="category" displayname="category" editortype="Default" type="String" multivalued="true" visibility="local" description="Input: Category" notstoredvariable="false"/>
		<Variable name="A1444318250236" variable="resultingCategory" displayname="resultingCategory" editortype="Default" type="String" multivalued="true" visibility="local" description="output, calculated in javascript" notstoredvariable="false"/>
		<Variable name="A1445361246681" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1437989337599" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="owners">
			<Rule name="A1445361267084" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
