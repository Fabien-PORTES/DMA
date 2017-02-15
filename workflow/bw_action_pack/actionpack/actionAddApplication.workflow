<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="actionAddApplication" displayname="Application manual add" description="Add a new application for a given individual" scriptfile="/workflow/bw_action_pack/actionpack/actionAddApplication.javascript" statictitle="Add a new application for a given individual">
		<Component name="CSTART" type="startactivity" x="35" y="85" w="200" h="114" title="Start" compact="true">
			<Actions>
				<Action name="U1415617182203" action="executeview" viewname="actionpackIdentitypicker" attribute="identityfullname">
					<ViewParam name="P14156177812110" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415617781211_1" attribute="fullname" variable="identityfullname"/>
					<ViewAttribute name="P1415617781211_2" attribute="hrcode" variable="identityhrcode"/>
				</Action>
				<Action name="U1415617219545" action="executeview" viewname="actionpackApplicationpicker" attribute="applicationname">
					<ViewParam name="P14156172195450" param="uid" paramvalue="{dataset.application.get()}"/>
					<ViewAttribute name="P1415617219545_1" attribute="displayname" variable="applicationname"/>
				</Action>
				<Action name="U1415617683803" action="executeview" viewname="actionpackPermissionspicker" attribute="profilescodes">
					<ViewParam name="P14157391242780" param="uids" paramvalue="{dataset.profiles}"/>
					<ViewAttribute name="P1415739124278_1" attribute="code" variable="profilescodes"/>
					<ViewAttribute name="P1415739124278_2" attribute="displayname" variable="profilesnames"/>
				</Action>
				<Action name="U1415627838474" action="executeview" viewname="actionpackIdentityApplicationAccount" attribute="accountLogin">
					<ViewParam name="P14156278384740" param="applicationuid" paramvalue="{dataset.application.get()}"/>
					<ViewParam name="P14156278384741" param="uid" paramvalue="{dataset.identity.get()}"/>
					<ViewAttribute name="P1415627838474_2" attribute="login" variable="accountLogin"/>
				</Action>
				<Action name="U1416238610506" action="update" attribute="identityhrcode" newvalue="{dataset.hrcode.get()}"/>
				<Action name="U1416238634850" action="default" attribute="identityfullname" newvalue="{dataset.firstname.get()} {dataset.lastname.get()}"/>
				<Action name="U1422622486851" action="update" attribute="profilecodestring" newvalue="{dataset.profilescodes.toString()}"/>
				<Action name="U1422622643507" action="executeview" viewname="actionpackIdentitypicker" attribute="referername">
					<ViewParam name="P14226226435070" param="uid" paramvalue="{dataset.referer.get()}"/>
					<ViewAttribute name="P1422622643507_1" attribute="fullname" variable="referername"/>
				</Action>
			</Actions>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="TICKETTTYPE"/>
				<Attribute name="custom1" attribute="applicationname"/>
				<Attribute name="custom3" attribute="identityhrcode"/>
				<Attribute name="custom4" attribute="identityfullname"/>
				<Attribute name="custom5" attribute="requester"/>
				<Attribute name="custom6" attribute="profilecodestring"/>
				<Attribute name="custom7" attribute="referername"/>
			</Ticket>
		</Component>
		<Component name="CEND" type="endactivity" x="454" y="85" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1415616284251" priority="1"/>
		<Component name="C1415616284251" type="manualactivity" x="165" y="52" w="200" h="114" title="Create a new {dataset.applicationname.get()} application access for {dataset.identityfullname.get()}" duedate="{dataset.duedate.get()}">
			<Candidates name="role" role="A1415616386153" mail="A1415616743442" reassignmentmail="A1415616743442">
				<Reminder name="reminder" mail="A1415616743442" number="4" period="1" delay="1"/>
			</Candidates>
			<Escalation name="escalation" role="A1415616369629" includetaskrole="true" mail="A1415616743442">
				<Reminder name="reminder" mail="A1415616743442" number="4" period="1" delay="1"/>
				<Start name="start" delay="1"/>
			</Escalation>
			<Page name="actionAddApplication" template="/library/pagetemplates/workflow/manualActivity.pagetemplate"/>
			<FormVariable name="A1415617423255" layoutelement="inserttitle" elementtitle="Please add a new Application access for this individual" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617715693" layoutelement="begingroup" elementtitle="Beneficiary informations" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617800450" variable="identityhrcode" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617807654" variable="identityfullname" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617814542" layoutelement="endgroup" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617828265" layoutelement="begingroup" elementtitle="Application informations" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617834185" variable="applicationname" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617857458" layoutelement="beginjointedition" elementtitle="Profiles" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617864558" variable="profilescodes" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617869963" variable="profilesnames" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617874608" layoutelement="endjointedition" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617884932" variable="comments" action="display" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617889761" layoutelement="endgroup" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<FormVariable name="A1415617896261" variable="result" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1415627455295" variable="accountLogin" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1415617900497" variable="resultdescription" action="input" mandatory="false" longlist="false"/>
			<TicketAction create="true"/>
		</Component>
		<Link name="L1415617232399" source="C1415616284251" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1415615761377" variable="requester" displayname="requester" editortype="Default" type="String" multivalued="false" visibility="in" description="the action requester" notstoredvariable="false"/>
		<Variable name="A1415615800231" variable="identity" displayname="identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="The invididual on which the new application will be added" notstoredvariable="false"/>
		<Variable name="A1415615880689" variable="profiles" displayname="profiles" editortype="Ledger Permission" type="String" multivalued="true" visibility="in" description="the application profiles to assign" notstoredvariable="false"/>
		<Variable name="A1415615933839" variable="referer" displayname="referer" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="The referer in case of smart confguration: cloning another individual access rights" notstoredvariable="false"/>
		<Variable name="A1415615959856" variable="comments" displayname="comments" editortype="Default" type="String" multivalued="false" visibility="in" description="action comments" notstoredvariable="false"/>
		<Variable name="A1415616445134" variable="application" displayname="application" editortype="Ledger Application" type="String" multivalued="false" visibility="in" description="The application to assign" notstoredvariable="false"/>
		<Variable name="A1415616468183" variable="result" displayname="result" editortype="Default" type="String" multivalued="false" visibility="out" notstoredvariable="false">
			<StaticValue name="ok"/>
			<StaticValue name="error"/>
		</Variable>
		<Variable name="A1415616478857" variable="resultdescription" displayname="Additional action description that you want to push  back to the requester" editortype="Default" type="String" multivalued="false" visibility="out" notstoredvariable="false" description="Additional action description that you want to push  back to the requester"/>
		<Variable name="A1415616781413" variable="applicationname" displayname="application name" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415616794669" variable="identityfullname" displayname="Beneficiary name" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415617356742" variable="accountLogin" displayname="account login" editortype="Default" type="String" multivalued="false" visibility="out" description="The account login associated with the application" notstoredvariable="false"/>
		<Variable name="A1415617495886" variable="profilescodes" displayname="profiles codes" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415617505075" variable="profilesnames" displayname="profiles names" editortype="Default" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415617745274" variable="identityhrcode" displayname="Beneficiary HR code" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1415736757526" variable="prioritylevel" displayname="Priority Level" editortype="Default" type="String" multivalued="false" visibility="in" description="Priority Level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1415736827389" variable="progressCurrent" displayname="progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" initialvalue="0" notstoredvariable="false"/>
		<Variable name="A1415736839137" variable="progressTotal" displayname="progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" notstoredvariable="false"/>
		<Variable name="A1415736855164" variable="parentprocessid" displayname="parent process id" editortype="Default" type="String" multivalued="false" visibility="in" description="parent process id" notstoredvariable="false"/>
		<Variable name="A1415737895132" variable="duedate" displayname="duedate" editortype="Default" type="Date" multivalued="false" visibility="in" description="duedate" notstoredvariable="false"/>
		<Variable name="A1416237371946" variable="hrcode" displayname="hrcode" editortype="Default" type="String" multivalued="false" visibility="in" description="the hrcode of the individual, could be used as a substitute for the &quot;identity&quot; attribute in case of a &quot;newcomer&quot; which is not yet in the database" notstoredvariable="false"/>
		<Variable name="A1416237383957" variable="firstname" displayname="firstname" editortype="Default" type="String" multivalued="false" visibility="in" description="the firstname of the individual, could be used as a substitute for the &quot;identity&quot; attribute in case of a &quot;newcomer&quot; which is not yet in the database" notstoredvariable="false"/>
		<Variable name="A1416237394034" variable="lastname" displayname="lastname" editortype="Default" type="String" multivalued="false" visibility="in" description="the lastname of the individual, could be used as a substitute for the &quot;identity&quot; attribute in case of a &quot;newcomer&quot; which is not yet in the database" notstoredvariable="false"/>
		<Variable name="A1416238779347" variable="arrivaldate" displayname="arrival date" editortype="Default" type="Date" multivalued="false" visibility="in" description="arrival date" notstoredvariable="false"/>
		<Variable name="A1416238792813" variable="departuredate" displayname="departure date" editortype="Default" type="Date" multivalued="false" visibility="in" description="departure date" notstoredvariable="false"/>
		<Variable name="A1422608615712" variable="TICKETTTYPE" editortype="Default" type="String" multivalued="false" visibility="local" initialvalue="AP-ADDAPP" notstoredvariable="false"/>
		<Variable name="A1422622341302" variable="referername" displayname="referer name" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1422622353790" variable="profilecodestring" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1415616369629" icon="/reports/icons/48/people/personal_red_48.png" smallicon="/reports/icons/16/people/personal_red_16.png" displayname="admin" description="workflow administrator">
			<Rule name="A1415616382911" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
		<Role name="A1415616386153" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="applicationOwner" description="Application owner">
			<Rule name="A1415616399686" rule="actionpackApplicationowner" description="Application owner for {uid}">
				<Param name="uid" variable="application"/>
			</Rule>
			<Rule name="A1415616415253" rule="actionpackAdmin" description="workflow administrators"/>
		</Role>
		<Role name="A1415619628941" displayname="everybody" description="everybody" icon="/reports/icons/48/people/personal_grey_48.png" smallicon="/reports/icons/16/people/personal_grey_16.png">
			<Rule name="A1415619646437" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
	<Mails>
		<Mail name="A1415616743442" displayname="New application" description="New application" toaddtaskrole="true" notifyrule="actionpackAddApplication"/>
	</Mails>
</Workflow>
