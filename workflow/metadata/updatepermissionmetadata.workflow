<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updatepermissionmetadata" displayname="Update permission metadata" description="Update shared-folder metadata" scriptfile="/workflow/metadata/updatepermissionmetadata.javascript" statictitle="Update permission metadata" publish="false">
		<Component name="CSTART" type="startactivity" x="60" y="137" w="200" h="114" title="Start" compact="true">
			<Output name="output" ticketnumbervariable="ticketlog" ticketactionnumbervariable="ticketaction"/>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="description" attribute="ticketdescription"/>
				<Attribute name="status" attribute="ticketstatus"/>
			</Ticket>
			<Actions>
				<Action name="U1437988949694" action="update" attribute="ticketdescription" newvalue="update metadata on (&apos;{dataset.permission.length}&apos;) shared folder(s)"/>
			</Actions>
			<Candidates name="role" role="A1437989337599"/>
			<FormVariable name="A1445352315290" variable="permission" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1437989372486" variable="description" action="input" mandatory="true" longlist="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="810" y="137" w="200" h="98" title="End" compact="true">
			<Actions>
				<Action name="U1437988821040" action="update" attribute="ticketstatus" newvalue="done"/>
			</Actions>
		</Component>
		<Link name="L1444222470044" source="CSTART" target="C1444232855613" priority="2"/>
		<Component name="C1444225941064" type="updatepermissioninfoactivity" x="527" y="112" w="200" h="98" title="Update the metadata">
			<PermissionInfo name="perminfo" update="whattoupdate" description="description" permission="permission"/>
		</Component>
		<Link name="L1444225958082" source="C1444225941064" target="CEND" priority="1"/>
		<Component name="N1444230132222" type="note" x="25" y="235" w="269" h="140" title="Notes&#xA;&#xA;- Workflow receives multivalued variables&#xA;only description is handled for the moment"/>
		<Component name="C1444232855613" type="ticketreviewactivity" x="192" y="112" w="200" h="98" title="Write the tickets">
			<TicketReview ticketaction="ticketaction" expression="(dataset.equals(&apos;createReviewTickets&apos;, &apos;true&apos;, false, true))">
				<Permission permissionvariable="resultingUids"/>
				<Attribute name="comment" attribute="ticket_descriptions"/>
			</TicketReview>
		</Component>
		<Link name="L1444234072755" source="C1444232855613" target="C1444225941064" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1437988414131" variable="description" displayname="description" editortype="Default" type="String" multivalued="true" visibility="in" description="Input: Description" notstoredvariable="false"/>
		<Variable name="A1437988437527" variable="managed" displayname="managed" editortype="Default" type="Boolean" multivalued="true" visibility="in" description="Input: Managed" notstoredvariable="false"/>
		<Variable name="A1437988472472" variable="sensitivityreason" displayname="sensitivity reason" editortype="Default" type="String" multivalued="true" visibility="in" description="Input: sensitivity, ex: CTU" notstoredvariable="false"/>
		<Variable name="A1437988656376" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="SHAREDFOLDERMETADATA" notstoredvariable="false" description="SHAREDFOLDERMETADATA"/>
		<Variable name="A1437988671470" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" description="internal, used for the ticketlog"/>
		<Variable name="A1437988809253" variable="ticketstatus" displayname="ticket status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false" description="internal, used for the ticketlog"/>
		<Variable name="A1444225117989" variable="whattoupdate" displayname="whattoupdate" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" description="internal, used in javascript" initialvalue="D"/>
		<Variable name="A1444227903424" variable="resultingUids" editortype="Ledger Permission" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227937304" variable="resultingManaged" displayname="resultingManaged" editortype="Default" type="Boolean" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227950137" variable="resultingDescription" displayname="resultingDescription" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227985046" variable="resultingReason" displayname="resultingReason" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444227994833" variable="resultingLevel" displayname="resultingLevel" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="output, calculated in javascript"/>
		<Variable name="A1444233051422" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false" description="internal"/>
		<Variable name="A1444233900846" variable="ticketlog" displayname="ticketlog" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false" description="internal"/>
		<Variable name="A1444234477149" variable="createReviewTickets" displayname="createReviewTickets" editortype="Default" type="Boolean" multivalued="false" visibility="local" initialvalue="true" notstoredvariable="false" description="Default: true&#xA;"/>
		<Variable name="A1444234604064" variable="ticket_descriptions" displayname="ticket_descriptions" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false" description="Input Descriptions"/>
		<Variable name="A1445352183805" variable="permission" displayname="permission" editortype="Ledger Permission" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1437989337599" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="owners">
			<Rule name="A1445351634714" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
