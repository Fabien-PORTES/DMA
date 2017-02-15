<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updatepermissionmanager" displayname="Update permission manager" description="Update permission manager" scriptfile="/workflow/manager/updatepermissionmanager.javascript">
		<Component name="CSTART" type="startactivity" x="49" y="191" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Page name="updatepermissionmanager_start" template="/library/pagetemplates/workflow/startProcess.pagetemplate"/>
			<Candidates name="role" role="A1435858866632"/>
			<FormVariable name="A1435904776072" variable="permission" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1435904784676" variable="manager" action="input" mandatory="false" longlist="false"/>
			<Actions>
				<Action name="U1436014223203" action="executeview" viewname="br_identityDetail" attribute="managerhrcode">
					<ViewParam name="P14360142232030" param="uid" paramvalue="{dataset.manager.get()}"/>
					<ViewAttribute name="P1436014223203_1" attribute="hrcode" variable="managerhrcode"/>
					<ViewAttribute name="P1436014223203_2" attribute="fullname" variable="managerfullname"/>
				</Action>
				<Action name="U1436014287780" action="executeview" viewname="br_permissionDetail" attribute="permissioncode">
					<ViewParam name="P14360142877800" param="uid" paramvalue="{dataset.permission.get()}"/>
					<ViewAttribute name="P1436014287780_1" attribute="code" variable="permissioncode"/>
					<ViewAttribute name="P1436014287780_2" attribute="displayname" variable="permissiondisplayname"/>
					<ViewAttribute name="P1436014287780_3" attribute="application_displayname" variable="applicationdisplayname"/>
					<ViewAttribute name="P1436014287780_4" attribute="application_code" variable="applicationcode"/>
					<ViewAttribute name="P1436014287780_5" attribute="isfoldertype" variable="isfoldertype"/>
				</Action>
				<Action name="U1444927195785" action="update" attribute="action" newvalue="{dataset.isEmpty(&quot;manager&quot;) ? &quot;delete&quot;: &quot;create or update&quot;}"/>				
				<Action name="U1436014795240" action="update" attribute="ticketdescription" newvalue="{dataset.action.get()} management information on {dataset.isfoldertype.get() ? &quot;folder&quot;: &quot;permission&quot;} {dataset.permissioncode.get()}, for {dataset.isfoldertype.get() ? &quot;share&quot;: &quot;application&quot;} {dataset.applicationcode.get()}{!dataset.isEmpty(&apos;managerfullname&apos;)?(&apos;. new manager set to &apos;+dataset.managerhrcode.get()+&apos;-&apos;+dataset.managerfullname.get()):&apos;&apos;}. {!dataset.isEmpty(&apos;comments&apos;)?dataset.comments.get():&apos;&apos;}" condition="(! dataset.isEmpty(&apos;action&apos;))"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="status" attribute="status"/>
				<Attribute name="custom1" attribute="permission"/>
				<Attribute name="custom2" attribute="manager"/>
				<Attribute name="description" attribute="ticketdescription"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticketaction"/>
			<FormVariable name="A1444927898876" variable="comments" action="input" mandatory="false" longlist="false"/>
		</Component>
		<Component name="C1444923845474" type="writemanageractivity" x="142" y="166" w="200" h="98" title="update owner">
			<WriteManager name="writemanager" entitytype="P" entityuid="permission" domaincode="MANAGERTYPE" identityvariable="manager"/>
			<Output name="output"/>
		</Component>
		<Link name="L1444923851045" source="CSTART" target="C1444923845474" priority="1"/>
		<Component name="C1444923858726" type="ticketreviewactivity" x="425" y="168" w="200" h="98" title="review ticket">
			<TicketReview ticketaction="ticketaction">
				<Permission permissionvariable="permission"/>
				<Attribute name="comment" attribute="ticketdescription"/>
            <Attribute name="custom1" attribute="permission"/>				
			</TicketReview>
		</Component>
		<Link name="L1444923868667" source="C1444923858726" target="CEND" priority="1"/>
		<Link name="L1444924018142" source="C1444923845474" target="C1444923858726" priority="1"/>
		<Component name="CEND" type="endactivity" x="673" y="193" w="200" h="98" title="End" compact="true" inexclusive="true">
			<Actions>
				<Action name="U1444924002261" action="update" attribute="status" newvalue="done"/>
			</Actions>
		</Component>
	</Definition>
	<Variables>
		<Variable name="A1435829425785" variable="permission" displayname="permission" editortype="Ledger Permission" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The permission UID to manage"/>
		<Variable name="A1435829483156" variable="action" displayname="action" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="defines the action to perform, can be either:&#xA;delete&#xA;create&#xA;modify">
			<StaticValue name="delete"/>
			<StaticValue name="create"/>
			<StaticValue name="modify"/>
		</Variable>
		<Variable name="A1435829523776" variable="manager" displayname="manager" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The new manager UID"/>
		<Variable name="A1435929633314" variable="DELEGATIONFLAG" displayname="delegation flag" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1436014095041" variable="managerhrcode" displayname="manager hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014105812" variable="managerfullname" displayname="manager fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014126545" variable="permissioncode" displayname="permission code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014137046" variable="permissiondisplayname" displayname="permission displayname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014142758" variable="applicationcode" displayname="application code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014151679" variable="applicationdisplayname" displayname="application displayname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014511173" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="PERMISSIONMANAGER"/>
		<Variable name="A1436014613796" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436284669529" variable="status" displayname="status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false">
			<StaticValue name="in progress"/>
			<StaticValue name="done"/>
		</Variable>
		<Variable name="A1436780528448" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="Comments are optional, if provided they are added at the end of the ticketlog description field." notstoredvariable="false"/>
		<Variable name="A1437744130975" variable="MANAGERTYPE" displayname="manager type" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="businessowner" notstoredvariable="false"/>
		<Variable name="A1444923805136" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1445011290110" variable="isfoldertype" displayname="isfoldertype" editortype="Default" type="Boolean" multivalued="false" visibility="local" initialvalue="false" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1435858866632" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="people who can start this process">
			<Rule name="A1435858901957" rule="updatepermissionmanagerstart" description="People who can start an update on a permission manager workflow"/>
		</Role>
	</Roles>
</Workflow>
