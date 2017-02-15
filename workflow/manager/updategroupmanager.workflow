<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updategroupmanager" displayname="Update group manager" description="Update group manager" scriptfile="/workflow/manager/updategroupmanager.javascript">
		<Component name="CSTART" type="startactivity" x="49" y="193" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Page name="updategroupmanager_start" template="/library/pagetemplates/workflow/startProcess.pagetemplate"/>
			<Candidates name="role" role="A1435858866632"/>
			<FormVariable name="A1436081273403" variable="group" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1435904784676" variable="manager" action="input" mandatory="false" longlist="false"/>
			<Actions>
				<Action name="U1436014223203" action="executeview" viewname="br_identityDetail" attribute="managerhrcode">
					<ViewParam name="P14360142232030" param="uid" paramvalue="{dataset.manager.get()}"/>
					<ViewAttribute name="P1436014223203_1" attribute="hrcode" variable="managerhrcode"/>
					<ViewAttribute name="P1436014223203_2" attribute="fullname" variable="managerfullname"/>
				</Action>
				<Action name="U1436081878171" action="executeview" viewname="br_groupDetail" attribute="groupcode">
					<ViewParam name="P14360818781710" param="uid" paramvalue="{dataset.group.get()}"/>
					<ViewAttribute name="P1436081878171_1" attribute="code" variable="groupcode"/>
					<ViewAttribute name="P1436081878171_2" attribute="displayname" variable="groupdisplayname"/>
					<ViewAttribute name="P1436081878171_3" attribute="repository_code" variable="repositorycode"/>
					<ViewAttribute name="P1436081878171_4" attribute="repository_displayname" variable="repositorydisplayname"/>
				</Action>
				<Action name="U1444927195785" action="update" attribute="action" newvalue="{dataset.isEmpty(&quot;manager&quot;) ? &quot;delete&quot;: &quot;create or update&quot;}"/>				
				<Action name="U1436014795240" action="update" attribute="ticketdescription" newvalue="{dataset.action.get()} management information on group {dataset.groupcode.get()}, for repository {dataset.repositorycode.get()}.{!dataset.isEmpty(&apos;managerfullname&apos;)?(&apos; new manager set to &apos;+dataset.managerhrcode.get()+&apos;-&apos;+dataset.managerfullname.get()):&apos;&apos;}. {!dataset.isEmpty(&apos;comments&apos;)?dataset.comments.get():&apos;&apos;}" condition="(! dataset.isEmpty(&apos;action&apos;))"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="status" attribute="status"/>
				<Attribute name="custom2" attribute="manager"/>
				<Attribute name="description" attribute="ticketdescription"/>
				<Attribute name="custom1" attribute="group"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticketaction"/>
			<FormVariable name="A1444927932143" variable="comments" action="input" mandatory="false" longlist="false"/>
		</Component>
		<Component name="C1444916904257" type="writemanageractivity" x="190" y="173" w="200" h="98" title="update owners">
			<WriteManager name="writemanager" entityuid="group" domaincode="MANAGERTYPE" identityvariable="manager" entitytype="G"/>
		</Component>
		<Link name="L1444916998575" source="CSTART" target="C1444916904257" priority="1"/>
		<Component name="C1444923579787" type="ticketreviewactivity" x="473" y="177" w="200" h="98" title="review ticket">
			<TicketReview ticketaction="ticketaction">
				<Attribute name="comment" attribute="ticketdescription"/>
            <Attribute name="custom1" attribute="group"/>				
				<Group groupvariable="group"/>
			</TicketReview>
		</Component>
		<Link name="L1444923588250" source="C1444923579787" target="CEND" priority="1"/>
		<Link name="L1444925020974" source="C1444916904257" target="C1444923579787" priority="1"/>
		<Component name="CEND" type="endactivity" x="763" y="199" w="200" h="98" title="End" compact="true" inexclusive="true">
			<Actions>
				<Action name="U1444925041475" action="update" attribute="status" newvalue="done"/>
			</Actions>
		</Component>
	</Definition>
	<Variables>
		<Variable name="A1435829483156" variable="action" displayname="action" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="defines the action to perform, can be either:&#xA;delete&#xA;create&#xA;modify">
			<StaticValue name="delete"/>
			<StaticValue name="create"/>
			<StaticValue name="modify"/>
		</Variable>
		<Variable name="A1435829523776" variable="manager" displayname="manager" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The new manager uid"/>
		<Variable name="A1435929633314" variable="DELEGATIONFLAG" displayname="delegation flag" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1436014095041" variable="managerhrcode" displayname="manager hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014105812" variable="managerfullname" displayname="manager fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014511173" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="GROUPMANAGER"/>
		<Variable name="A1436014613796" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436080955950" variable="group" displayname="group" editortype="Ledger Group" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The group UID to update"/>
		<Variable name="A1436080988495" variable="groupcode" displayname="groupcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436080997946" variable="groupdisplayname" displayname="group displayname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436081004083" variable="repositorycode" displayname="repository code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436081016295" variable="repositorydisplayname" displayname="repository displayname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436340801228" variable="status" displayname="status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false">
			<StaticValue name="in progress"/>
			<StaticValue name="done"/>
		</Variable>
		<Variable name="A1436780528448" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="Comments are optional, if provided they are added at the end of the ticketlog description field." notstoredvariable="false"/>
		<Variable name="A1437744089025" variable="MANAGERTYPE" displayname="manager type" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="businessowner" notstoredvariable="false"/>
		<Variable name="A1444923609224" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1435858866632" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="people who can start this process">
			<Rule name="A1436081124127" rule="updategroupmanagerstart" description="People who can start an update on a group manager workflow"/>
		</Role>
	</Roles>
</Workflow>
