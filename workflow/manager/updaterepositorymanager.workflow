<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updaterepositorymanager" displayname="Update repository manager" description="Update repository manager" scriptfile="/workflow/manager/updaterepositorymanager.javascript">
		<Component name="CSTART" type="startactivity" x="49" y="193" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Page name="updaterepositorymanager_start" template="/library/pagetemplates/workflow/startProcess.pagetemplate"/>
			<Candidates name="role" role="A1435858866632"/>
			<FormVariable name="A1436164056406" variable="repository" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1444924405858" variable="managertype" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1435904784676" variable="manager" action="input" mandatory="false" longlist="false"/>
			<Actions>
				<Action name="U1437719801899" action="update" attribute="managertype" newvalue="businessowner" condition="(! dataset.equals(&apos;managertype&apos;, &apos;businessowner&apos;, true, true)) &amp;&amp; (! dataset.equals(&apos;managertype&apos;, &apos;technicalowner&apos;, true, true))"/>
				<Action name="U1436014223203" action="executeview" viewname="br_identityDetail" attribute="managerhrcode">
					<ViewParam name="P14360142232030" param="uid" paramvalue="{dataset.manager.get()}"/>
					<ViewAttribute name="P1436014223203_1" attribute="hrcode" variable="managerhrcode"/>
					<ViewAttribute name="P1436014223203_2" attribute="fullname" variable="managerfullname"/>
				</Action>
				<Action name="U1436164802578" action="executeview" viewname="br_repositoryDetail" attribute="repositorycode">
					<ViewParam name="P14361648025780" param="uid" paramvalue="{dataset.repository.get()}"/>
					<ViewAttribute name="P1436164802578_1" attribute="code" variable="repositorycode"/>
					<ViewAttribute name="P1436164802578_2" attribute="displayname" variable="repositorydisplayname"/>
				</Action>
				<Action name="U1436014795240" action="update" attribute="ticketdescription" newvalue="{dataset.action.get()} {dataset.managertype.get()} management information on repository {dataset.repositorycode.get()}.{!dataset.isEmpty(&apos;managerfullname&apos;)?(&apos; new manager set to &apos;+dataset.managerhrcode.get()+&apos;-&apos;+dataset.managerfullname.get()):&apos;&apos;}. {!dataset.isEmpty(&apos;comments&apos;)?dataset.comments.get():&apos;&apos;}" condition="(! dataset.isEmpty(&apos;action&apos;))"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="status" attribute="status"/>
				<Attribute name="custom2" attribute="manager"/>
				<Attribute name="description" attribute="ticketdescription"/>
				<Attribute name="custom1" attribute="repository"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticketaction"/>
			<FormVariable name="A1444927843465" variable="comments" action="input" mandatory="false" longlist="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="717" y="193" w="200" h="98" title="End" compact="true" inexclusive="false">
			<Actions>
				<Action name="U1444924436087" action="update" attribute="status" newvalue="done"/>
			</Actions>
		</Component>
	<Component name="C1444924444529" type="writemanageractivity" x="186" y="168" w="200" h="98" title="update owners">
			<WriteManager name="writemanager" entitytype="R" entityuid="repository" domaincode="managertype" identityvariable="manager"/>
		</Component>
		<Component name="C1444924448479" type="ticketreviewactivity" x="446" y="168" w="200" h="98" title="review tickets">
			<TicketReview ticketaction="ticketaction">
				<Attribute name="comment" attribute="ticketdescription"/>
            <Attribute name="custom1" attribute="repository"/>				
				<Repository repositoryvariable="repository"/>
			</TicketReview>
		</Component>
		<Link name="L1444924451656" source="CSTART" target="C1444924444529" priority="1"/>
		<Link name="L1444924452676" source="C1444924444529" target="C1444924448479" priority="1"/>
		<Link name="L1444924454016" source="C1444924448479" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1435829483156" variable="action" displayname="action" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="defines the action to perform, can be either:&#xA;delete&#xA;create&#xA;modify">
			<StaticValue name="delete"/>
			<StaticValue name="create"/>
			<StaticValue name="modify"/>
		</Variable>
		<Variable name="A1435829523776" variable="manager" displayname="manager" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The new manager UID"/>
		<Variable name="A1435929633314" variable="DELEGATIONFLAG" displayname="delegation flag" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1436014095041" variable="managerhrcode" displayname="manager hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014105812" variable="managerfullname" displayname="manager fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014511173" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="REPOSITORYMANAGER"/>
		<Variable name="A1436014613796" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436163502208" variable="repository" displayname="repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436163693848" variable="repositorycode" displayname="repository code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436163715894" variable="repositorydisplayname" displayname="repository displayname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436340819362" variable="status" displayname="status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false">
			<StaticValue name="in progress"/>
			<StaticValue name="done"/>
		</Variable>
		<Variable name="A1436780414401" variable="managertype" displayname="manager type" editortype="Default" type="String" multivalued="false" visibility="in" description="Can be either businessowner or technical owner" notstoredvariable="false">
			<StaticValue name="businessowner"/>
			<StaticValue name="technicalowner"/>
		</Variable>
		<Variable name="A1436780528448" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="Comments are optional, if provided they are added at the end of the ticketlog description field." notstoredvariable="false"/>
		<Variable name="A1444924355043" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1435858866632" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="people who can start this process">
			<Rule name="A1436163457775" rule="updaterepositorymanagerstart" description="People who can start an update on a repository manager workflow"/>
		</Role>
	</Roles>
</Workflow>
