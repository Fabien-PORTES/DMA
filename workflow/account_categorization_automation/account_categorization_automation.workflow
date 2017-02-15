<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="account_categorization_automation" displayname="Account categorization automation" scriptfile="/workflow/account_categorization_automation/account_categorization_automation.javascript">
		<Component name="CSTART" type="startactivity" x="32" y="219" w="200" h="114" title="Start" compact="true">
			<Output name="output" startidentityvariable="process_actor"/>
			<Candidates name="role" role="A1486742195012"/>
			<FormVariable name="A1486990551371" variable="category" action="input" mandatory="true" longlist="false"/>
			<FormVariable name="A1486990563969" variable="process_actor" action="input" mandatory="true" longlist="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="580" y="219" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1486741008601" priority="1"/>
		<Component name="C1486740969475" type="callactivity" x="199" y="11" w="200" h="98" title="Category 1">
			<Process workflowfile="/workflow/account_categorization_automation/category_1/account_categorization_automation_category_1.workflow">
				<Input name="A1486742333721" variable="operator" content="process_actor"/>
			</Process>
		</Component>
		<Link name="L1486740993380" source="C1486740969475" target="C1486741008601_1" priority="1"/>
		<Component name="C1486741008601" type="routeactivity" x="112" y="219" w="200" h="50" compact="true" title="Route 1" outexclusive="true"/>
		<Component name="C1486741008601_1" type="routeactivity" x="479" y="219" w="200" h="50" compact="true" title="Route 1" inexclusive="true"/>
		<Link name="L1486741022113" source="C1486741008601" target="C1486740969475" priority="1" expression="(dataset.equals(&apos;category&apos;, &apos;1-already mapped, uid# matches (id ok)&apos;, false, true))" labelcustom="true" label="Category 1"/>
		<Link name="L1486741023575" source="C1486741008601_1" target="CEND" priority="1"/>
		<Link name="L1486742936547" source="C1486741008601" target="C1486741008601_1" priority="2" expression="(! dataset.equals(&apos;category&apos;, &apos;1-already mapped, uid# matches (id ok)&apos;, false, true))" labelcustom="true" label="Not Category 1"/>
	</Definition>
	<Variables>
		<Variable name="A1486741057626" variable="category" displayname="category" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486742270353" variable="process_actor" displayname="Process actor" editortype="Process Actor" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486992590858" variable="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="ACCOUNTCATEGORISATION"/>
	</Variables>
	<Roles>
		<Role name="A1486742195012" icon="/reports/icons/48/people/personal_yellow_48.png" smallicon="/reports/icons/16/people/personal_yellow_16.png" displayname="operators" description="operators">
			<Rule name="A1486742210231" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
