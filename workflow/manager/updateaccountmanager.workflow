<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="updateaccountmanager" displayname="Update account manager" description="Update account manager" scriptfile="/workflow/manager/updatepermissionmanager.javascript">
		<Component name="CSTART" type="startactivity" x="80" y="199" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Page name="updateaccountmanager_start" template="/library/pagetemplates/workflow/startProcess.pagetemplate"/>
			<Candidates name="role" role="A1435858866632"/>
			<FormVariable name="A1436270412299" variable="account" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1435904784676" variable="manager" action="input" mandatory="false" longlist="false"/>
			<Actions>
				<Action name="U1436014223203" action="executeview" viewname="br_identityDetail" attribute="managerhrcode">
					<ViewParam name="P14360142232030" param="uid" paramvalue="{dataset.manager.get()}"/>
					<ViewAttribute name="P1436014223203_1" attribute="hrcode" variable="managerhrcode"/>
					<ViewAttribute name="P1436014223203_2" attribute="fullname" variable="managerfullname"/>
				</Action>
				<Action name="U1436014287780" action="executeview" viewname="br_accountDetail" attribute="accountlogin">
					<ViewParam name="P14360142877800" param="uid" paramvalue="{dataset.account.get()}"/>
					<ViewAttribute name="P1436014287780_1" attribute="login" variable="accountlogin"/>
					<ViewAttribute name="P1436014287780_2" attribute="repository_code" variable="repositorycode"/>
				</Action>
				<Action name="U1444927195785" action="update" attribute="action" newvalue="{dataset.isEmpty(&quot;manager&quot;) ? &quot;delete&quot;: &quot;create or update&quot;}"/>
				<Action name="U1436014795240" action="update" attribute="ticketdescription" newvalue="{dataset.action.get()} management information on account {dataset.accountlogin.get()}, for repository {dataset.repositorycode.get()}.{!dataset.isEmpty(&apos;managerfullname&apos;)?(&apos; new manager set to &apos;+dataset.managerhrcode.get()+&apos;-&apos;+dataset.managerfullname.get()):&apos;&apos;}. {!dataset.isEmpty(&apos;comments&apos;)?dataset.comments.get():&apos;&apos;}" condition="(! dataset.isEmpty(&apos;action&apos;))"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
				<Attribute name="status" attribute="status"/>
				<Attribute name="custom2" attribute="manager"/>
				<Attribute name="description" attribute="ticketdescription"/>
				<Attribute name="custom1" attribute="account"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticketaction"/>
			<FormVariable name="A1444927997873" variable="comments" action="input" mandatory="false" longlist="false"/>
		</Component>
		<Component name="C1444905806645" type="writemanageractivity" x="195" y="173" w="200" h="98" title="update owners">
			<WriteManager name="writemanager" entitytype="C" entityuid="account" domaincode="MANAGERTYPE" identityvariable="manager"/>
		</Component>
		<Link name="L1444905823734" source="CSTART" target="C1444905806645" priority="1"/>
		<Component name="C1444918116354" type="ticketreviewactivity" x="479" y="171" w="200" h="98" title="ticket review">
			<TicketReview ticketaction="ticketaction">
				<Attribute name="comment" attribute="ticketdescription"/>
				<Attribute name="custom1" attribute="account"/>
				<Account accountvariable="account"/>
			</TicketReview>
		</Component>
		<Link name="L1444918888778" source="C1444918116354" target="CEND" priority="1"/>
		<Link name="L1444927598918" source="C1444905806645" target="C1444918116354" priority="1"/>
		<Component name="CEND" type="endactivity" x="740" y="195" w="200" h="98" title="End" compact="true" inexclusive="true">
			<Actions>
				<Action name="U1444927591597" action="update" attribute="status" newvalue="done"/>
			</Actions>
		</Component>
	</Definition>
	<Variables>
		<Variable name="A1435829483156" variable="action" displayname="action" editortype="Default" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="defines the action to perform, can be either:&#xA;delete&#xA;create&#xA;modify" initialvalue=""/>	
		<Variable name="A1435829523776" variable="manager" displayname="manager" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The new manager UID"/>
		<Variable name="A1435929633314" variable="delegationflag" displayname="delegation flag" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1436014095041" variable="managerhrcode" displayname="manager hrcode" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014105812" variable="managerfullname" displayname="manager fullname" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436014511173" variable="TICKETTYPE" displayname="ticket type" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="ACCOUNTMANAGER"/>
		<Variable name="A1436014613796" variable="ticketdescription" displayname="ticket description" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436270374548" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" notstoredvariable="false" description="The account UID to update"/>
		<Variable name="A1436270392724" variable="accountlogin" displayname="account login" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436270398176" variable="repositorycode" displayname="repository code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1436340769507" variable="status" displayname="status" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="in progress" notstoredvariable="false">
			<StaticValue name="in progress"/>
			<StaticValue name="done"/>
		</Variable>
		<Variable name="A1436780528448" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="Comments are optional, if provided they are added at the end of the ticketlog description field." notstoredvariable="false"/>
		<Variable name="A1437744049221" variable="MANAGERTYPE" displayname="manager type" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="businessowner" notstoredvariable="false"/>
		<Variable name="A1444918146568" variable="ticketaction" displayname="ticketaction" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>	
	<Roles>
		<Role name="A1435858866632" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="owners" description="people who can start this process">
			<Rule name="A1436269874467" rule="updateaccountmanagerstart" description="People who can start an update on an account manager workflow"/>
		</Role>
	</Roles>
</Workflow>
