<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="bw_recon_start" displayname="Reconciliation Process {dataset.reviewid} on repository {dataset.repositoryName.get()}" scriptfile="/workflow/bw_recon/recon_start.javascript" statictitle="Start a Reconciliation Process" description="Start a Reconciliation Process on a given Repository for a given no owner code" publish="true" smallicon="/reports/icons/16/audit/reconciliation_identity.png" largeicon="/reports/icons/48/audit/reconciliation_48.png">
		<Component name="CSTART" type="startactivity" x="8" y="144" w="200" h="114" title="Start - bw_recon_start" compact="true" duedatevariable="duedate" priorityvariable="prioritylevel" progressvariable="progressCurrent" progresstotalvariable="progressTotal">
			<Page name="bw_recon_start" template="/library/pagetemplates/workflow/startProcess.pagetemplate"/>
			<Candidates name="role" role="A1423063244109"/>
			<Output name="output" processtitlevariable="processtitle" startidentityvariable="processOwner" startdisplaynamevariable="processOwnerName" startdatevariable="startdate" processidvariable="processid" ticketnumbervariable="ticketnumber"/>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="tickettype"/>
				<Attribute name="status" attribute="ticketstatus"/>
				<Attribute name="description" attribute="processtitle"/>
				<Attribute name="priority" attribute="ticketpriority"/>
			</Ticket>
			<FormVariable name="A1423249428710" variable="duedate" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1423249436215" variable="prioritylevel" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1423249446171" variable="repository" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1423249455070" variable="reviewid" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1423249466513" variable="noownercode" action="input" mandatory="false" longlist="false"/>
			<Actions function="recon">
				<Action name="U1423249592762" action="executeview" viewname="bw_recon_accounts" attribute="accounts">
					<ViewParam name="P14232495927620" param="noownercode" paramvalue="{dataset.noownercode.get()}"/>
					<ViewParam name="P14232495927621" param="repouid" paramvalue="{dataset.repository.get()}"/>
					<ViewAttribute name="P1423249592762_2" attribute="acc_uid" variable="accounts"/>
					<ViewAttribute name="P1423249592762_3" attribute="acc_mail" variable="accountsMail"/>
					<ViewAttribute name="P1423249592762_4" attribute="acc_surname" variable="accountsSurname"/>
					<ViewAttribute name="P1423249592762_5" attribute="acc_givenname" variable="accountsGivenname"/>
					<ViewAttribute name="P1423249592762_6" attribute="acc_employeenumber" variable="accountsHRCode"/>
					<ViewAttribute name="P1423249592762_7" attribute="hasID" variable="accountsHasID"/>
					<ViewAttribute name="P1423249592762_8" attribute="acc_username" variable="accountsFullname"/>
					<ViewAttribute name="P1423249592762_9" attribute="action" variable="accountsActions"/>
					<ViewAttribute name="P1423249592762_10" attribute="comment" variable="accountsComments"/>
					<ViewAttribute name="P1423249592762_11" attribute="identity" variable="accountsIdentities"/>
					<ViewAttribute name="P1423249592762_12" attribute="identityFullname" variable="accountsIdentitiesFullname"/>
				</Action>
				<Action name="U1426797959099" action="update" attribute="noOwnerCodeName" newvalue="{dataset.isEmpty(&apos;noownercode&apos;) || dataset.noownercode.get().length &lt; 1 ? &apos;All&apos; : dataset.noownercode.get()}"/>
				<Action name="U1423498445080" action="update" attribute="progressCurrent" newvalue="33"/>
			</Actions>
		</Component>
		<Component name="CEND" type="endactivity" x="1111" y="144" w="200" h="98" title="End - bw_recon_start" compact="true" inexclusive="true">
			<Actions>
				<Action name="U1423498409981" action="update" attribute="ticketstatus" newvalue="Closed"/>
				<Action name="U1423498429076" action="update" attribute="progressCurrent" newvalue="100"/>
			</Actions>
		</Component>
		<Link name="CLINK" source="CSTART" target="C1423492018621" priority="1"/>
		<Component name="C1423251813464" type="manualactivity" x="328" y="111" w="200" h="114" title="Manual Recononcliation for repository {dataset.repositoryName.get()} of type {dataset.noOwnerCodeName.get()}" duedate="{dataset.duedate.get()}" outexclusive="true">
			<Candidates name="role" role="A1423499553427" mail="A1423499757425" reassignmentmail="A1423499757425">
				<Reminder name="reminder" number="1" period="2" delay="2" mail="A1423499952247"/>
			</Candidates>
			<Page name="bw_recon_review"/>
			<TicketAction create="true">
				<Attribute name="status" attribute="tickettype"/>
				<Attribute name="description" attribute="processtitle"/>
				<Attribute name="custom1" attribute="repositoryName"/>
			</TicketAction>
			<Actions>
				<Action name="U1423493143180" action="multiadd" attribute="accountsActionsLabels" oldname="accountsActions" duplicates="false"/>
				<Action name="U1423493270464" action="multireplace" attribute="accountsActionsLabels" newvalue="{dataset.isEmpty(&apos;accountsActionsLabels&apos;) || dataset.accountsActionsLabels.get().length &lt; 1 || dataset.accountsActionsLabels.get().equals(&quot;0&quot;) ? &quot;&quot; : dataset.accountsActionsLabels.get()}"/>
				<Action name="U1423493231681" action="multireplace" attribute="accountsActionsLabels" newvalue="{dataset.accountsActionsLabels.get().equals(&quot;1&quot;) ? &quot;Reconciled&quot; : dataset.accountsActionsLabels.get()}"/>
				<Action name="U1423493252213" action="multireplace" attribute="accountsActionsLabels" newvalue="{dataset.accountsActionsLabels.get().equals(&quot;2&quot;) ? &quot;Deactivate&quot; : dataset.accountsActionsLabels.get()}"/>
				<Action name="U1426796062136" action="multireplace" attribute="accountsActionsLabels" newvalue="{dataset.accountsActionsLabels.get().equals(&quot;3&quot;) ? &quot;Delete&quot; : dataset.accountsActionsLabels.get()}"/>
				<Action name="U1423498454850" action="update" attribute="progressCurrent" newvalue="66"/>
			</Actions>
			<Output name="output" activitytitlevariable="activityTitle" claimidentityvariable="activityClaimer" claimdisplaynamevariable="activityClaimerName" startdatevariable="activityStart" claimdatevariable="activityAssignment" completedatevariable="activityCompletion" lastnotificationdatevariable="activityReminder" reassignidentityvariable="activityReassigner" reassigndisplaynamevariable="activityReassignerName" ticketactionnumbervariable="activityAction"/>
			<Escalation name="escalation" role="A1423063244109" mail="A1423499757425">
				<Start name="start" delay="5"/>
				<Reminder name="reminder" mail="A1423499952247" number="1" period="1" alternateduedate="{dataset.duedate.get()}"/>
			</Escalation>
			<FormVariable name="A1426798993234" layoutelement="beginjointedition" elementtitle="Actions on accounts" jointeditionadd="true" jointeditionmodify="true" jointeditiondelete="true" action="input"/>
			<FormVariable name="A1426799002248" variable="accounts" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1426799008175" variable="accountsActions" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1426799013084" variable="accountsComments" action="input" mandatory="false" longlist="false"/>
			<FormVariable name="A1426799019974" layoutelement="endjointedition" jointeditionadd="false" jointeditionmodify="false" jointeditiondelete="false" action="input"/>
			<Expiration name="expiration" delay="10"/>
		</Component>
		<Link name="L1423251821174" source="C1423251813464" target="C1423492138278" priority="1" expression="dataset.isManual.get()" labelcustom="true" label=" Manual"/>
		<Component name="C1423492018621" type="variablechangeactivity" x="87" y="119" w="200" h="98" title="Get ticket recorduid">
			<Actions>
				<Action name="U1423492087635" action="executeview" viewname="bw_recon_ticketrecorduid" attribute="ticketloguid">
					<ViewParam name="P14234920876350" param="ticketnumber" paramvalue="{dataset.ticketnumber.get()}"/>
					<ViewParam name="P14234920876351" param="tickettype" paramvalue="{dataset.tickettype.get()}"/>
					<ViewAttribute name="P1423492087635_2" attribute="recorduid" variable="ticketloguid"/>
				</Action>
			</Actions>
		</Component>
		<Link name="L1423492035702" source="C1423492018621" target="C1423251813464" priority="1"/>
		<Component name="C1423492138278" type="ticketreviewactivity" x="590" y="119" w="200" h="98" title="Create Tickets (delete/deactivate) - bw_recon_start">
			<TicketReview ticketaction="activityAction" expression="(! dataset.isEmpty(&apos;accountsActionsLabels&apos;))">
				<Attribute name="status" attribute="accountsActionsLabels"/>
				<Attribute name="comment" attribute="accountsComments"/>
				<Account accountvariable="accounts"/>
				<Attribute name="custom1" attribute="accountsIdentitiesFullname"/>
			</TicketReview>
		</Component>
		<Link name="L1423492223112" source="C1423492138278" target="C1423492298878" priority="1"/>
		<Component name="C1423492298878" type="callactivity" x="844" y="119" w="200" h="98" title="Remediation - bw_recon_remediation call">
			<Process workflowfile="/workflow/bw_recon/recon_remediation.workflow">
				<Input name="A1423498055707" variable="accounts" content="accounts"/>
				<Input name="A1423498060012" variable="accountsActions" content="accountsActions"/>
				<Input name="A1423498064843" variable="accountsActionsLabels" content="accountsActionsLabels"/>
				<Input name="A1423498069016" variable="accountsComments" content="accountsComments"/>
				<Input name="A1423498072520" variable="accountsIdentities" content="accountsIdentities"/>
				<Input name="A1423498076714" variable="duedate" content="duedate"/>
				<Input name="A1423498082454" variable="parentProcessId" content="processid"/>
				<Input name="A1423498087837" variable="prioritylevel" content="prioritylevel"/>
				<Input name="A1423498092146" variable="repository" content="repository"/>
				<Input name="A1423498096913" variable="repositoryName" content="repositoryName"/>
				<Input name="A1423498101663" variable="reviewid" content="reviewid"/>
				<Input name="A1423498170054" variable="ticketpriority" content="ticketpriority"/>
				<Input name="A1426789473966" variable="requester" content="requester"/>
				<Output name="A1426796724804" variable="results" content="results"/>
				<Output name="A1426796730484" variable="resultsDescriptions" content="resultsDescriptions"/>
			</Process>
		</Component>
		<Component name="C1462373238424" type="routeactivity" x="404" y="390" w="200" h="50" compact="true" title="Task Expiration (1) - bw_recon_start"/>
		<Component name="C1462373243538" type="routeactivity" x="1111" y="390" w="200" h="50" compact="true" title="Task Expiration (2) - bw_recon_start"/>
		<Link name="L1462373250750" source="C1462373238424" target="C1462373243538" priority="1"/>
		<Link name="L1462373252184" source="C1462373243538" target="CEND" priority="1"/>
		<Link name="L1462373453220" source="C1423251813464" target="C1462373238424" priority="3" errorlink="true" linecustom="true" color="255,0,0" labelcustom="true" label="Task Expiration" expression="!dataset.isManual.get()"/>
		<Link name="L1462382233921" source="C1423492298878" target="CEND" priority="1"/>
		<Component name="N1462389634540" type="note" x="594" y="238" w="447" h="130" title="Actions:&#xA;1 - recon&#xA;2 - disable&#xA;3 - delete&#xA;Please note that already disabled accounts will not generate a notification&#xA;(as there is a test in the actionBroker, but no filter in this workflow)"/>
		<Component name="N1462389807173" type="note" x="844" y="29" w="200" h="80" title="Warning:&#xA;effective reconciliation not effective yet !!"/>
	</Definition>
	<Roles>
		<Role name="A1423063244109" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="recon_pro_managers" description="Reconciliation Process Managers">
			<Rule name="A1462297518206" rule="bw_recon_pro_managers" description="Recon Process Managers"/>
		</Role>
		<Role name="A1423499553427" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="repomgrs" description="Repository Managers">
			<Rule name="A1423499572073" rule="bw_recon_repo_mgr" description="Recon - Repository Manager for repo {repouid}">
				<Param name="repouid" variable="repository"/>
			</Rule>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1423063300085" variable="processOwner" displayname="Process Owner" editortype="Process Actor" type="String" multivalued="false" visibility="local" description="Process Owner" notstoredvariable="false"/>
		<Variable name="A1423063315033" variable="processOwnerName" displayname="Process Owner Name" editortype="Default" type="String" multivalued="false" visibility="local" description="Process Owner Fullname" notstoredvariable="false"/>
		<Variable name="A1423063352846" variable="duedate" displayname="Due Date" editortype="Default" type="Date" multivalued="false" visibility="local" description="Due Date" notstoredvariable="false"/>
		<Variable name="A1423063374527" variable="prioritylevel" displayname="Priority Level" editortype="Default" type="String" multivalued="false" visibility="local" description="Priority Level" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1423063397631" variable="processid" displayname="Process Id" editortype="Default" type="String" multivalued="false" visibility="local" description="Process Identifier" notstoredvariable="false"/>
		<Variable name="A1423063418192" variable="processtitle" displayname="Process Title" editortype="Default" type="String" multivalued="false" visibility="local" description="Process Title" notstoredvariable="false"/>
		<Variable name="A1423063435010" variable="progressCurrent" displayname="Process Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" notstoredvariable="false" initialvalue="0"/>
		<Variable name="A1423063451580" variable="progressTotal" displayname="Progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" notstoredvariable="false" initialvalue="100"/>
		<Variable name="A1423063470142" variable="reviewid" displayname="Review Id" editortype="Default" type="String" multivalued="false" visibility="local" description="Review Id" notstoredvariable="false"/>
		<Variable name="A1423063487408" variable="startdate" displayname="Start Date" editortype="Default" type="Date" multivalued="false" visibility="local" description="Process Start Date" notstoredvariable="false"/>
		<Variable name="A1423063507190" variable="ticketloguid" displayname="Ticketlog uid" editortype="Default" type="String" multivalued="false" visibility="local" description="Ticket Log uid" notstoredvariable="false"/>
		<Variable name="A1423063526083" variable="ticketnumber" displayname="Ticket Number" editortype="Default" type="Number" multivalued="false" visibility="local" description="Ticket Number (associated to the review)" notstoredvariable="false"/>
		<Variable name="A1423063559508" variable="ticketpriority" displayname="Ticket Priority" editortype="Default" type="String" multivalued="false" visibility="local" description="Ticket Priority" notstoredvariable="false" initialvalue="2"/>
		<Variable name="A1423063573017" variable="ticketstatus" displayname="Ticket Status" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" description="Ticket status (associated to the review)" initialvalue="Open"/>
		<Variable name="A1423063603258" variable="tickettype" displayname="Ticket Type" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" description="Ticket Type associated to the review" initialvalue="RECON"/>
		<Variable name="A1423249205608" variable="repository" displayname="Repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="local" description="Repository for review" notstoredvariable="false"/>
		<Variable name="A1423249223198" variable="repositoryName" displayname="Repository Name" editortype="Default" type="String" multivalued="false" visibility="local" description="Respository DisplayName" notstoredvariable="false"/>
		<Variable name="A1423249238134" variable="noownercode" displayname="NoOwnerCode" editortype="Default" type="String" multivalued="false" visibility="local" description="No Owner Code" notstoredvariable="false"/>
		<Variable name="A1423249284843" variable="accounts" displayname="Accounts" editortype="Ledger Account" type="String" multivalued="true" visibility="local" description="Accounts for review (on choosen repo with choosen noOwnerCode)" notstoredvariable="false"/>
		<Variable name="A1423249307498" variable="accountsGivenname" displayname="Accounts Givenname" editortype="Default" type="String" multivalued="true" visibility="local" description="Account Givenname" notstoredvariable="false"/>
		<Variable name="A1423249335506" variable="accountsSurname" displayname="Accounts Surname" editortype="Default" type="String" multivalued="true" visibility="local" description="Accounts Surname" notstoredvariable="false"/>
		<Variable name="A1423249367978" variable="accountsFullname" displayname="Accounts Fullname" editortype="Default" type="String" multivalued="true" visibility="local" description="Accounts Fullname" notstoredvariable="false"/>
		<Variable name="A1423249392536" variable="accountsMail" displayname="Accounts Mail" editortype="Default" type="String" multivalued="true" visibility="local" description="Accounts Mail" notstoredvariable="false"/>
		<Variable name="A1423249651912" variable="identities" displayname="Identities" editortype="Ledger Identity" type="String" multivalued="true" visibility="local" description="Identities" notstoredvariable="false"/>
		<Variable name="A1423249667730" variable="identitiesAccounts" displayname="Identities Accounts" editortype="Ledger Account" type="String" multivalued="true" visibility="local" description="Identities Accounts" notstoredvariable="false"/>
		<Variable name="A1423249752297" variable="accountsHasID" displayname="Accounts Has ID" editortype="Default" type="Boolean" multivalued="true" visibility="local" description="True if we found a potential identity for the account" notstoredvariable="false"/>
		<Variable name="A1423250048033" variable="accountsHRCode" displayname="Accounts HR Code" editortype="Default" type="String" multivalued="true" visibility="local" description="Accounts HR Code" notstoredvariable="false"/>
		<Variable name="A1423250243916" variable="fuzzyNB" displayname="Fuzzy NB" editortype="Default" type="Number" multivalued="false" visibility="local" description="Fuzzy matching parameter" initialvalue="2" notstoredvariable="false"/>
		<Variable name="A1423256668300" variable="accountsActions" displayname="Accounts Actions" editortype="Default" type="String" multivalued="true" visibility="local" description="Actions on accounts" notstoredvariable="false"/>
		<Variable name="A1423256682620" variable="accountsComments" displayname="Accounts Comments" editortype="Default" type="String" multivalued="true" visibility="local" description="Comments on accounts" notstoredvariable="false"/>
		<Variable name="A1423493110121" variable="accountsActionsLabels" displayname="Accounts Actions Labels" editortype="Default" type="String" multivalued="true" visibility="local" description="Accounts Actions Labels" notstoredvariable="false"/>
		<Variable name="A1423493423646" variable="activityTitle" displayname="Activity Title" editortype="Default" type="String" multivalued="false" visibility="local" description="Activity Title" notstoredvariable="false"/>
		<Variable name="A1423493439967" variable="activityClaimer" displayname="Activity Claimer" editortype="Process Actor" type="String" multivalued="false" visibility="local" description="Activity Claimer" notstoredvariable="false"/>
		<Variable name="A1423493457181" variable="activityClaimerName" displayname="Activity Claimer Name" editortype="Default" type="String" multivalued="false" visibility="local" description="Activity Claimer Name" notstoredvariable="false"/>
		<Variable name="A1423493469303" variable="activityStart" displayname="Activity Start" editortype="Default" type="Date" multivalued="false" visibility="local" description="Activity Start" notstoredvariable="false"/>
		<Variable name="A1423493486560" variable="activityAssignment" displayname="Activity Assignment" editortype="Default" type="Date" multivalued="false" visibility="local" description="Activity Assignment" notstoredvariable="false"/>
		<Variable name="A1423493501587" variable="activityCompletion" displayname="Activity Completion" editortype="Default" type="Date" multivalued="false" visibility="local" description="Activity Completion" notstoredvariable="false"/>
		<Variable name="A1423493517287" variable="activityReminder" displayname="Activity Reminder" editortype="Default" type="Date" multivalued="false" visibility="local" description="Activity Reminder" notstoredvariable="false"/>
		<Variable name="A1423493530736" variable="activityReassigner" displayname="Activity Reassigner" editortype="Process Actor" type="String" multivalued="false" visibility="local" description="Activity Reassigner" notstoredvariable="false"/>
		<Variable name="A1423493547884" variable="activityReassignerName" displayname="Activity Reassigner Name" editortype="Default" type="String" multivalued="false" visibility="local" description="Activity Reassigner Name" notstoredvariable="false"/>
		<Variable name="A1423493563696" variable="activityAction" displayname="Activity Action" editortype="Default" type="Number" multivalued="false" visibility="local" description="Activity Action" notstoredvariable="false"/>
		<Variable name="A1423493854110" variable="accountsIdentities" displayname="Accounts Identities" editortype="Ledger Identity" type="String" multivalued="true" visibility="local" description="Accounts Identities (for reconciliation)" notstoredvariable="false"/>
		<Variable name="A1426789455442" variable="requester" displayname="Requester" editortype="Ledger Identity" type="String" multivalued="false" visibility="local" description="Person Requesting modifications" notstoredvariable="false"/>
		<Variable name="A1426796696063" variable="results" displayname="results" editortype="Default" type="String" multivalued="true" visibility="local" description="Results of remediations" notstoredvariable="false"/>
		<Variable name="A1426796713945" variable="resultsDescriptions" displayname="Results Descriptions" editortype="Default" type="String" multivalued="true" visibility="local" description="Description of remediation results" notstoredvariable="false"/>
		<Variable name="A1426801358827" variable="noOwnerCodeName" displayname="No Owner Code Name" editortype="Default" type="String" multivalued="false" visibility="local" description="Display Name for no Owner Code" notstoredvariable="false"/>
		<Variable name="A1462373379078" variable="isManual" displayname="Is Manual" editortype="Default" type="Boolean" multivalued="false" visibility="local" description="True if manual task (as opposed to expired task)" notstoredvariable="false" initialvalue="false"/>
		<Variable name="A1462381104666" variable="accountsIdentitiesFullname" displayname="Accounts Identities Fullname" editortype="Default" type="String" multivalued="true" visibility="local" description="Fullname of identities reconciled to the account" notstoredvariable="false"/>
	</Variables>
	<Mails>
		<Mail name="A1423499757425" displayname="reviewpending" description="Review Pending" torole="A1423499553427" notifyrule="bw_recon_reviewpending">
			<Param name="deadline" variable="duedate"/>
			<Param name="repositoryname" variable="repositoryName"/>
		</Mail>
		<Mail name="A1423499952247" displayname="reminderpending" description="Reminder of pending Review" notifyrule="bw_recon_reviewpendingreminder">
			<Param name="deadline" variable="duedate"/>
			<Param name="repositoryname" variable="repositoryName"/>
		</Mail>
	</Mails>
</Workflow>
