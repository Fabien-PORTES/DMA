<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="bw_recon_remediation" displayname="Recon Process {dataset.reviewid} on repo {dataset.repositoryName} : Remediations" scriptfile="/workflow/bw_recon/recon_remediation.javascript" statictitle="Recon - Remediations" description="Recon - Remediation Process">
		<Component name="CSTART" type="startactivity" x="32" y="287" w="200" h="114" title="Start - bw_recon_remediation" compact="true" duedatevariable="duedate" priorityvariable="prioritylevel" progressvariable="progressCurrent">
			<Output name="output" processtitlevariable="processtitle" startidentityvariable="processOwner" startdisplaynamevariable="processOwnerName" startdatevariable="startdate" processidvariable="processid" ticketnumbervariable="ticketnumber"/>
			<Ticket create="true">
				<Attribute name="tickettype" attribute="tickettype"/>
				<Attribute name="status" attribute="ticketstatus"/>
				<Attribute name="description" attribute="processtitle"/>
				<Attribute name="priority" attribute="ticketpriority"/>
			</Ticket>
			<Actions>
				<Action name="U1426796524036" action="multiresize" attribute="accounts" attribute1="results" attribute2="resultsDescriptions"/>
				<Action name="U1427286255983" action="multifilter" attribute="accountsActions" regexp="[123]" remove="false" attribute1="accounts" attribute2="accountsActionsLabels" attribute3="accountsComments" attribute4="results" attribute5="resultsDescriptions" attribute6="accountsIdentities"/>
			</Actions>
		</Component>
		<Component name="CEND" type="endactivity" x="902" y="287" w="200" h="98" title="End - bw_recon_remediation" compact="true">
			<Actions>
				<Action name="U1423498384068" action="update" attribute="ticketstatus" newvalue="Closed"/>
				<Action name="U1423498472502" action="update" attribute="progressCurrent" newvalue="100"/>
			</Actions>
		</Component>
		<Link name="CLINK" source="CSTART" target="C1426796286048" priority="1"/>
		<Component name="C1426789040083" type="callactivity" x="357" y="22" w="200" h="98" title="ab_disableAccount">
			<Process workflowfile="/workflow/bw_action_pack/actionbroker/ab_disableAccount.workflow">
				<Input name="A1426789135957" variable="account" content="accounts"/>
				<Input name="A1426789214230" variable="duedate" content="duedate"/>
				<Input name="A1426789222805" variable="parentprocessid" content="processid"/>
				<Input name="A1426789296920" variable="prioritylevel" content="prioritylevel"/>
				<Input name="A1426789357646" variable="requester" content="requester"/>
				<Output name="A1426796650880" variable="result" content="results"/>
				<Output name="A1426796655962" variable="resultdescription" content="resultsDescriptions"/>
			</Process>
			<Iteration/>
		</Component>
		<Link name="L1426789052099" source="C1426789040083" target="C1426796344799" priority="1"/>
		<Component name="C1426796286048" type="startsubactivity" x="174" y="287" w="200" h="50" compact="true" title="Subprocess start - bw_recon_remediation" outexclusive="true">
			<Iteration listvariable="accounts">
				<Variable name="A1426796413119" variable="accountsActions"/>
				<Variable name="A1426796416382" variable="accountsActionsLabels"/>
				<Variable name="A1426796420766" variable="accountsComments"/>
				<Variable name="A1426796425077" variable="results"/>
				<Variable name="A1426796566870" variable="resultsDescriptions"/>
				<Variable name="A1462388500943" variable="accountsIdentities"/>
			</Iteration>
		</Component>
		<Component name="C1426796304619" type="callactivity" x="361" y="178" w="200" h="98" title="ab_removeAccount">
			<Process workflowfile="/workflow/bw_action_pack/actionbroker/ab_removeAccount.workflow">
				<Input name="A1426796605727" variable="account" content="accounts"/>
				<Input name="A1426796610015" variable="duedate" content="duedate"/>
				<Input name="A1426796615971" variable="parentprocessid" content="processid"/>
				<Input name="A1426796622000" variable="prioritylevel" content="prioritylevel"/>
				<Input name="A1426796625920" variable="requester" content="requester"/>
				<Output name="A1426796633331" variable="result" content="results"/>
				<Output name="A1426796639327" variable="resultdescription" content="resultsDescriptions"/>
			</Process>
		</Component>
		<Component name="C1426796344799" type="endsubactivity" x="710" y="287" w="200" h="50" compact="true" title="Subprocess end - bw_recon_remediation" inexclusive="true"/>
		<Link name="L1426796355591" source="C1426796286048" target="C1426789040083" priority="1" expression="(dataset.equals(&apos;accountsActions&apos;, &apos;2&apos;, false, true)) || (dataset.equals(&apos;accountsActionsLabels&apos;, &apos;deactivate&apos;, false, true))" labelcustom="true" label="Deactivate"/>
		<Link name="L1426796356748" source="C1426796286048" target="C1426796304619" priority="2" expression="(dataset.equals(&apos;accountsActions&apos;, &apos;3&apos;, false, true)) || (dataset.equals(&apos;accountsActionsLabels&apos;, &apos;delete&apos;, false, true))" labelcustom="true" label="Delete"/>
		<Link name="L1426796357782" source="C1426796304619" target="C1426796344799" priority="1"/>
		<Link name="L1426796359034" source="C1426796344799" target="CEND" priority="1"/>
		<Link name="L1426799762954" source="C1426796286048" target="C1462386702639" priority="4"/>
		<Component name="C1462386702639" type="routeactivity" x="432" y="287" w="200" h="50" compact="true" title="Route Other Action - bw_recon_remediation"/>
		<Link name="L1462386710123" source="C1462386702639" target="C1426796344799" priority="1"/>
		<Component name="C1462388355128" type="callactivity" x="369" y="374" w="200" h="98" title="Reconciliation - bw_recon_update call">
			<Process workflowfile="/workflow/bw_recon/recon_update.workflow">
				<Input name="A1462388470650" variable="account" content="accounts"/>
				<Input name="A1462388476380" variable="action" content="accountsActions"/>
				<Input name="A1462388483088" variable="comment" content="accountsComments"/>
				<Input name="A1462388487229" variable="identity" content="accountsIdentities"/>
			</Process>
		</Component>
		<Link name="L1462388360813" source="C1426796286048" target="C1462388355128" priority="3" expression="false &amp;&amp; ((dataset.equals(&apos;accountsActions&apos;, &apos;1&apos;, false, true)) || (dataset.equals(&apos;accountsActionsLabels&apos;, &apos;Reconciled&apos;, false, true)))" labelcustom="true" label="Reconcile (DISABLED)"/>
		<Link name="L1462388362159" source="C1462388355128" target="C1426796344799" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1423497397861" variable="accounts" displayname="Accounts" editortype="Ledger Account" type="String" multivalued="true" visibility="in" description="Accounts Uids" notstoredvariable="false"/>
		<Variable name="A1423497409631" variable="accountsActions" displayname="Accounts Actions" editortype="Default" type="String" multivalued="true" visibility="in" description="Actions on Accounts" notstoredvariable="false"/>
		<Variable name="A1423497431263" variable="accountsActionsLabels" displayname="Accounts Actions Labels" editortype="Default" type="String" multivalued="true" visibility="in" description="Actions Labels on Accounts" notstoredvariable="false"/>
		<Variable name="A1423497454513" variable="accountsIdentities" displayname="Accounts Identities" editortype="Ledger Identity" type="String" multivalued="true" visibility="in" description="Identities to reconcile to accounts" notstoredvariable="false"/>
		<Variable name="A1423497494378" variable="accountsComments" displayname="AccountsComments" editortype="Default" type="String" multivalued="true" visibility="in" description="Comments on accounts" notstoredvariable="false"/>
		<Variable name="A1423497530212" variable="duedate" displayname="Due Date" editortype="Default" type="Date" multivalued="false" visibility="in" description="Due Date" notstoredvariable="false"/>
		<Variable name="A1423497558171" variable="prioritylevel" displayname="Priority Level" editortype="Default" type="String" multivalued="false" visibility="in" description="Process Priority Level" notstoredvariable="false"/>
		<Variable name="A1423497584148" variable="processid" displayname="Process Id" editortype="Default" type="String" multivalued="false" visibility="local" description="Process Identifier" notstoredvariable="false"/>
		<Variable name="A1423497653784" variable="processtitle" displayname="Process Title" editortype="Default" type="String" multivalued="false" visibility="local" description="Process Title" notstoredvariable="false"/>
		<Variable name="A1423497672281" variable="progressCurrent" displayname="Progress Current" editortype="Default" type="Number" multivalued="false" visibility="local" description="Current Progress" notstoredvariable="false" initialvalue="0"/>
		<Variable name="A1423497685843" variable="progressTotal" displayname="Progress Total" editortype="Default" type="Number" multivalued="false" visibility="local" description="Total Progress" notstoredvariable="false" initialvalue="100"/>
		<Variable name="A1423497709070" variable="reviewid" displayname="Review Id" editortype="Default" type="String" multivalued="false" visibility="in" description="Review Identifier" notstoredvariable="false"/>
		<Variable name="A1423497756999" variable="startdate" displayname="Start Date" editortype="Default" type="Date" multivalued="false" visibility="local" description="Process Start Date" notstoredvariable="false"/>
		<Variable name="A1423497771634" variable="ticketloguid" displayname="Ticket Log Uid" editortype="Default" type="String" multivalued="false" visibility="local" description="Ticket Log Uid" notstoredvariable="false"/>
		<Variable name="A1423497783358" variable="ticketnumber" displayname="Ticket Number" editortype="Default" type="Number" multivalued="false" visibility="local" description="Ticket Number" notstoredvariable="false"/>
		<Variable name="A1423497801330" variable="ticketpriority" displayname="Ticket Priority" editortype="Default" type="String" multivalued="false" visibility="in" description="Ticket Priority" notstoredvariable="false"/>
		<Variable name="A1423497824327" variable="ticketstatus" displayname="Ticket Status" editortype="Default" type="String" multivalued="false" visibility="local" description="Ticket Status" initialvalue="Open" notstoredvariable="false"/>
		<Variable name="A1423497849707" variable="tickettype" displayname="Ticket Type" editortype="Default" type="String" multivalued="false" visibility="local" description="Ticket Type" initialvalue="RECONREMEDIATION" notstoredvariable="false"/>
		<Variable name="A1423497878548" variable="parentProcessId" displayname="Parent Process Id" editortype="Default" type="String" multivalued="false" visibility="in" description="Parent Process Id" notstoredvariable="false"/>
		<Variable name="A1423497961346" variable="repository" displayname="Repository" editortype="Ledger Repository" type="String" multivalued="false" visibility="in" description="Repository" notstoredvariable="false"/>
		<Variable name="A1423497975296" variable="repositoryName" displayname="Repository Name" editortype="Default" type="String" multivalued="false" visibility="in" description="Repository Name" notstoredvariable="false"/>
		<Variable name="A1423498227959" variable="processOwner" displayname="Process Owner" editortype="Process Actor" type="String" multivalued="false" visibility="local" description="Process Owner" notstoredvariable="false"/>
		<Variable name="A1423498246936" variable="processOwnerName" displayname="Process Owner Name" editortype="Default" type="String" multivalued="false" visibility="local" description="Process Owner Name" notstoredvariable="false"/>
		<Variable name="A1426789347983" variable="requester" displayname="Requester" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="Identity requesting modifications" notstoredvariable="false"/>
		<Variable name="A1426796398886" variable="results" displayname="results" editortype="Default" type="String" multivalued="true" visibility="out" description="Results from deactivations/deletions" notstoredvariable="false"/>
		<Variable name="A1426796549978" variable="resultsDescriptions" displayname="Results Descriptions" editortype="Default" type="String" multivalued="true" visibility="out" description="Results Descriptions" notstoredvariable="false"/>
	</Variables>
</Workflow>
