<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="account_ticket_management_campaign" displayname="account_ticket_management_campaign" scriptfile="/workflow/account_ticket_management/account_ticket_management_campaign.javascript" statictitle="account_ticket_management_campaign" technical="true">
		<Component name="CEND" type="endactivity" x="852" y="43" w="200" h="98" title="End" compact="true" inexclusive="true"/>
		<Component name="C1486558262186" type="callactivity" x="249" y="-52" w="200" h="98" title="account_categorisation_ticket_close_status">
			<Process workflowfile="/workflow/account_ticket_management/account_categorisation_ticket_status.workflow">
				<Input name="A1486558404167" variable="ticket_review_recorduid" content="ticket_review_recorduids"/>
				<Input name="A1486559167212" variable="process_actor" content="process_actor"/>
				<Input name="A1486632478376" variable="ticket_review_status" content="ticket_status"/>
			</Process>
			<Iteration listvariable="ticket_review_recorduids"/>
		</Component>
		<Component name="CSTART" type="startactivity" x="32" y="43" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Candidates name="role" role="A1486558496565"/>
			<Output name="output" startidentityvariable="process_actor"/>
		</Component>
		<Link name="CLINK" source="CSTART" target="C1486558262186" priority="1" expression="(! dataset.isEmpty(&apos;ticket_status&apos;))" labelcustom="true" label="Change status"/>
		<Component name="C1486568189774" type="callactivity" x="249" y="102" w="200" h="98" title="account_categorisation_ticket_change_information">
			<Process workflowfile="/workflow/account_ticket_management/account_categorisation_ticket_change_information.workflow">
				<Input name="A1486568444599" variable="new_ticket_review_comment" content="new_ticket_review_comment"/>
				<Input name="A1486568453218" variable="new_ticket_review_custom1" content="new_ticket_review_custom1"/>
				<Input name="A1486568465587" variable="new_ticket_review_custom10" content="new_ticket_review_custom10"/>
				<Input name="A1486568480612" variable="new_ticket_review_custom11" content="new_ticket_review_custom11"/>
				<Input name="A1486568486802" variable="new_ticket_review_custom12" content="new_ticket_review_custom12"/>
				<Input name="A1486568493573" variable="new_ticket_review_custom13" content="new_ticket_review_custom13"/>
				<Input name="A1486568502741" variable="new_ticket_review_custom14" content="new_ticket_review_custom14"/>
				<Input name="A1486568508972" variable="new_ticket_review_custom15" content="new_ticket_review_custom15"/>
				<Input name="A1486568516167" variable="new_ticket_review_custom16" content="new_ticket_review_custom16"/>
				<Input name="A1486568522257" variable="new_ticket_review_custom17" content="new_ticket_review_custom17"/>
				<Input name="A1486568532489" variable="new_ticket_review_custom18" content="new_ticket_review_custom18"/>
				<Input name="A1486568551834" variable="new_ticket_review_custom19" content="new_ticket_review_custom19"/>
				<Input name="A1486568558855" variable="new_ticket_review_custom2" content="new_ticket_review_custom2"/>
				<Input name="A1486568575573" variable="new_ticket_review_custom3" content="new_ticket_review_custom3"/>
				<Input name="A1486568581796" variable="new_ticket_review_custom4" content="new_ticket_review_custom4"/>
				<Input name="A1486568588534" variable="new_ticket_review_custom5" content="new_ticket_review_custom5"/>
				<Input name="A1486568600278" variable="new_ticket_review_custom6" content="new_ticket_review_custom6"/>
				<Input name="A1486568619820" variable="new_ticket_review_custom7" content="new_ticket_review_custom7"/>
				<Input name="A1486568626843" variable="new_ticket_review_custom8" content="new_ticket_review_custom8"/>
				<Input name="A1486568632281" variable="new_ticket_review_custom9" content="new_ticket_review_custom9"/>
				<Input name="A1486568637564" variable="process_actor" content="process_actor"/>
				<Input name="A1486568644548" variable="ticket_review_recorduid" content="ticket_review_recorduids"/>
			</Process>
			<Iteration listvariable="ticket_review_recorduids"/>
		</Component>
		<Link name="L1486558285845" source="CSTART" target="C1486568189774" priority="2" labelcustom="true" label="Change ticket" expression="(dataset.isEmpty(&apos;ticket_status&apos;))"/>
		<Component name="C1486558282315" type="routeactivity" x="628" y="43" w="200" h="50" compact="true" title="Route 1" inexclusive="true"/>
		<Link name="L1486558286838" source="C1486558282315" target="CEND" priority="1"/>
		<Link name="L1486558276000" source="C1486558262186" target="C1486558282315" priority="1"/>
		<Link name="L1486568201018" source="C1486568189774" target="C1486558282315" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1486558380610" variable="ticket_review_recorduids" displayname="ticket_review_recorduids" editortype="Default" type="Number" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486559156285" variable="process_actor" displayname="process_actor" editortype="Process Actor" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A148657125763121" variable="new_ticket_review_comment" displayname="new_ticket_review_comment" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576310" variable="new_ticket_review_custom1" displayname="new_ticket_review_custom1" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576311" variable="new_ticket_review_custom10" displayname="new_ticket_review_custom10" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576312" variable="new_ticket_review_custom11" displayname="new_ticket_review_custom11" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576313" variable="new_ticket_review_custom12" displayname="new_ticket_review_custom12" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576314" variable="new_ticket_review_custom13" displayname="new_ticket_review_custom13" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576315" variable="new_ticket_review_custom14" displayname="new_ticket_review_custom14" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576316" variable="new_ticket_review_custom15" displayname="new_ticket_review_custom15" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763113" variable="new_ticket_review_custom4" displayname="new_ticket_review_custom4" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763114" variable="new_ticket_review_custom5" displayname="new_ticket_review_custom5" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763117" variable="new_ticket_review_custom9" displayname="new_ticket_review_custom9" multivalued="true" visibility="in" type="String" editortype="Default"/>
			
		<Variable name="A148657125763110" variable="new_ticket_review_custom19" displayname="new_ticket_review_custom19" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576319" variable="new_ticket_review_custom18" displayname="new_ticket_review_custom18" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576318" variable="new_ticket_review_custom17" displayname="new_ticket_review_custom17" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865712576317" variable="new_ticket_review_custom16" displayname="new_ticket_review_custom16" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763111" variable="new_ticket_review_custom2" displayname="new_ticket_review_custom2" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763116" variable="new_ticket_review_custom7" displayname="new_ticket_review_custom7" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763112" variable="new_ticket_review_custom3" displayname="new_ticket_review_custom3" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763115" variable="new_ticket_review_custom6" displayname="new_ticket_review_custom6" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148657125763118" variable="new_ticket_review_custom8" displayname="new_ticket_review_custom8" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A1486627922277" variable="ticket_status" displayname="ticket_status" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false"/>
	</Variables>
	<Roles>
		<Role name="A1486558496565" icon="/reports/icons/48/people/personal_yellow_48.png" smallicon="/reports/icons/16/people/personal_yellow_16.png" displayname="operators" description="Operators">
			<Rule name="A1486558511286" rule="control_activeidentities" description="Active Identities"/>
		</Role>
	</Roles>
</Workflow>
