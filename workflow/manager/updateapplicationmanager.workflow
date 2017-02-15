<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updateapplicationmanager" displayname="Update application manager" description="This workflow is used to update management information on an Application object in the Identity Ledger.&#xA;All modifications are directly written into the Identity Ledger and are automatically maintained from one timeslot to another by the collect engine.&#xA;&#xA;Two king of managers can be declared :&#xA;business owner = he is &quot;accountable&quot; for the application, mainly responsible for granting access rights and performing reviews&#xA;technical owner=he is &quot;responsible&quot; for the application, mainly responsible for performing  changes upon request&#xA;" scriptfile="/workflow/manager/updateapplicationmanager.javascript">
		<Component name="CSTART" type="startactivity" x="49" y="193" w="200" h="114" title="Start" compact="true" outexclusive="false" inexclusive="true">
			<Page name="updateapplicationmanager_start" template="/library/pagetemplates/workflow/startProcess.pagetemplate"/>
			<Candidates name="role" role="A1435858866632"/>
			<FormVariable name="A1436037573847" variable="application" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1435904784676" variable="manager" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1444927956477" variable="managertype" action="input" mandatory="true" longlist="false"/>
			<Actions>
				<Action name="U1437719580408" action="update" attribute="managertype" newvalue="businessowner" condition="(! dataset.equals(&apos;managertype&apos;, &apos;businessowner&apos;, true, true)) &amp;&amp; (! dataset.equals(&apos;managertype&apos;, &apos;technicalowner&apos;, true, true))"/>
				<Action name="U1436014223203" action="executeview" viewname="br_identityDetail" attribute="managerhrcode">
					<ViewParam name="P14360142232030" param="uid" paramvalue="{dataset.manager.get()}"/>
					<ViewAttribute name="P1436014223203_1" attribute="hrcode" variable="managerhrcode"/>
					<ViewAttribute name="P1436014223203_2" attribute="fullname" variable="managerfullname"/>
				</Action>
				<Action name="U1436037472937" action="executeview" viewname="wf_getapplications" attribute="applicationcode">
					<ViewParam name="P14360374729370" param="applicationuids" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1436037472937_1" attribute="code" variable="applicationcode"/>
					<ViewAttribute name="P1436037472937_2" attribute="displayname" variable="applicationdisplayname"/>
					<ViewAttribute name="P1436037472937_3" attribute="applicationtype" variable="applicationtype"/>
				</Action>
				<Action name="U1445009760820" action="update" attribute="applicationtype" newvalue="{dataset.applicationtype.get() ==&quot;Filesystem&quot; ? &quot;share&quot;: &quot;application&quot;}"/>				
				<Action name="U1444927195785" action="update" attribute="action" newvalue="{dataset.isEmpty(&quot;manager&quot;) ? &quot;delete&quot;: &quot;create or update&quot;}"/>
				<Action name="U1436014795240" action="update" attribute="ticketdescription" newvalue="{dataset.action.get()} {dataset.managertype.get()} on {dataset.applicationtype.get()} {dataset.applicationcode.get()}.{!dataset.isEmpty(&apos;managerfullname&apos;)?(&apos; new manager set to &apos;+dataset.managerhrcode.get()+&apos;-&apos;+dataset.managerfullname.get()):&apos;&apos;}. {!dataset.isEmpty(&apos;comments&apos;)?dataset.comments.get():&apos;&apos;}" condition="(! dataset.isEmpty(&apos;action&apos;))"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="status" attribute="status"/>
				<Attribute name="custom2" attribute="manager"/>
				<Attribute name="description" attribute="ticketdescription"/>
				<Attribute name="custom1" attribute="application"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticketaction"/>
		</Component>
		<Component name="CEND" type="endactivity" x="803" y="200" w="200" h="98" title="End" compact="true" inexclusive="true">
			<Actions>
				<Action name="U1444925106570" action="update" attribute="status" newvalue="done"/>
			</Actions>
		</Component>
		<Component name="C1444907469698" type="writemanageractivity" x="212" y="174" w="200" h="98" title="set owner">
			<WriteManager name="writemanager" entitytype="A" entityuid="application" domaincode="managertype" identityvariable="manager"/>
		</Component>
		<Link name="L1444913689551" source="CSTART" target="C1444907469698" priority="1"/>
		<Component name="C1444917358555" type="ticketreviewactivity" x="525" y="174" w="200" h="98" title="ticket review">
			<TicketReview ticketaction="ticketaction" expression="(! dataset.isEmpty(&apos;action&apos;))">
				<Application applicationvariable="application"/>
				<Attribute name="comment" attribute="ticketdescription"/>
            <Attribute name="custom1" attribute="application"/>				
			</TicketReview>
		</Component>
		<Link name="L1444917372446" source="C1444917358555" target="CEND" priority="1"/>
		<Link name="L1444925089301" source="C1444907469698" target="C1444917358555" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1435829483156" variable="action" displayname="action" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="[Deprecated] computed automatically">
		</Variable>
		<Variable name="A1435829523776" variable="manager" displayname="manager" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The UID of the new manager"/>
		<Variable name="A1435929633314" variable="DELEGATIONFLAG" displayname="delegation flag" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1436014095041" variable="managerhrcode" displayname="manager hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014105812" variable="managerfullname" displayname="manager fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014142758" variable="applicationcode" displayname="application code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014151679" variable="applicationdisplayname" displayname="application displayname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014511173" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="APPLICATIONMANAGER"/>
		<Variable name="A1436014613796" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436036980203" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The application on which to apply &quot;manager&quot; changes"/>
		<Variable name="A1436340785258" variable="status" displayname="status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false">
			<StaticValue name="in progress"/>
			<StaticValue name="done"/>
		</Variable>
		<Variable name="A1436780414401" variable="managertype" displayname="manager type" editortype="Default" type="String" multivalued="false" visibility="in" description="Can be either businessowner or technical owner" notstoredvariable="false">
			<StaticValue name="businessowner"/>
			<StaticValue name="technicalowner"/>
		</Variable>
		<Variable name="A1436780528448" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="Comments are optional, if provided they are added at the end of the ticketlog description field." notstoredvariable="false"/>
		<Variable name="A1444917432419" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1445009455498" variable="applicationtype" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1435858866632" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="people who can start this process">
			<Rule name="A1436036937144" rule="updateapplicationmanagerstart" description="People who can start an update on an application manager workflow"/>
		</Role>
	</Roles>
</Workflow>
