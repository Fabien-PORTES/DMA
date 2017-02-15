<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="recon_update" displayname="Reconciliation Update" description="Reconciliation Update" scriptfile="/workflow/bw_recon/recon_update.javascript" statictitle="Reconciliation Update">
		<Component name="CSTART" type="startactivity" x="93" y="195" w="200" h="114" title="Start - recon_update" compact="true" outexclusive="true">
			<Actions>
				<Action name="U1462386437231" action="update" attribute="account" newvalue="{dataset.account.get()}"/>
				<Action name="U1462386446936" action="update" attribute="action" newvalue="{dataset.action.get()}"/>
				<Action name="U1462386456222" action="update" attribute="comment" newvalue="{dataset.comment.get()}"/>
				<Action name="U1462386466009" action="update" attribute="identity" newvalue="{dataset.identity.get()}"/>
			</Actions>
		</Component>
		<Component name="CEND" type="endactivity" x="596" y="195" w="200" h="98" title="End - recon_update" compact="true" inexclusive="true"/>
		<Link name="CLINK" source="CSTART" target="C1462382552655" priority="1" expression="(dataset.equals(&apos;action&apos;, &apos;1&apos;, false, true))" labelcustom="true" label="Reconciliation"/>
		<Component name="C1462382552655" type="updatereconciliationactivity" x="260" y="68" w="200" h="98" title="Reconciliation - recon_update">
			<Reconciliation name="reconciliation" accountrecordnumber="account" updateidentity="identity" updatecomment="comment"/>
		</Component>
		<Link name="L1462382563431" source="C1462382552655" target="CEND" priority="1"/>
		<Component name="C1462382812493" type="routeactivity" x="336" y="314" w="200" h="50" compact="true" title="Route  - recon_update (not reconciliation action)"/>
		<Link name="L1462382816593" source="CSTART" target="C1462382812493" priority="2" labelcustom="true" label="Not a reconciliation"/>
		<Link name="L1462382817810" source="C1462382812493" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1462382624584" variable="account" displayname="account" editortype="Ledger Account" type="String" multivalued="false" visibility="in" description="Account" notstoredvariable="false"/>
		<Variable name="A1462382641075" variable="comment" displayname="comment" editortype="Default" type="String" multivalued="false" visibility="in" description="Reconciliation Comment" notstoredvariable="false"/>
		<Variable name="A1462382661675" variable="identity" displayname="Identity" editortype="Ledger Identity" type="String" multivalued="false" visibility="in" description="Identity to Reconcile the Account to" notstoredvariable="false"/>
		<Variable name="A1462382801784" variable="action" displayname="action" editortype="Default" type="String" multivalued="false" visibility="in" description="Action (1 = recon)" notstoredvariable="false"/>
	</Variables>
</Workflow>
