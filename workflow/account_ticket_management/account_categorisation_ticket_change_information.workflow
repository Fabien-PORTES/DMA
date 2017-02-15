<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="account_categorisation_ticket_change_information" displayname="Technical workflow to change ticket information" description="Technical workflow to change ticket information" scriptfile="/workflow/account_ticket_management/account_categorisation_ticket_status.javascript" technical="true" statictitle="account_categorisation_ticket_change_information">
		<Component name="CSTART" type="startactivity" x="32" y="34" w="200" h="114" title="Start" compact="true">
			<Candidates name="role" role="A1486550951860"/>
			<Actions>
				<Action name="U1486551255631" action="executeview" viewname="get_infos_account_categorisation_ticket_close_status" append="false" attribute="ticket_review_custom1">
					<ViewParam name="P14865512556310" param="ticket_review_recorduid" paramvalue="{dataset.ticket_review_recorduid.get()}"/>
					<ViewAttribute name="P1486551255631_1" attribute="ticket_review_custom1" variable="ticket_review_custom1"/>
					<ViewAttribute name="P1486551255631_2" attribute="ticket_review_custom10" variable="ticket_review_custom10"/>
					<ViewAttribute name="P1486551255631_3" attribute="ticket_review_custom11" variable="ticket_review_custom11"/>
					<ViewAttribute name="P1486551255631_4" attribute="ticket_review_custom12" variable="ticket_review_custom12"/>
					<ViewAttribute name="P1486551255631_5" attribute="ticket_review_custom13" variable="ticket_review_custom13"/>
					<ViewAttribute name="P1486551255631_6" attribute="ticket_review_custom14" variable="ticket_review_custom14"/>
					<ViewAttribute name="P1486551255631_7" attribute="ticket_review_custom15" variable="ticket_review_custom15"/>
					<ViewAttribute name="P1486551255631_8" attribute="ticket_review_custom16" variable="ticket_review_custom16"/>
					<ViewAttribute name="P1486551255631_9" attribute="ticket_review_custom17" variable="ticket_review_custom17"/>
					<ViewAttribute name="P1486551255631_10" attribute="ticket_review_custom18" variable="ticket_review_custom18"/>
					<ViewAttribute name="P1486551255631_11" attribute="ticket_review_custom19" variable="ticket_review_custom19"/>
					<ViewAttribute name="P1486551255631_12" attribute="ticket_review_custom2" variable="ticket_review_custom2"/>
					<ViewAttribute name="P1486551255631_13" attribute="ticket_review_custom3" variable="ticket_review_custom3"/>
					<ViewAttribute name="P1486551255631_14" attribute="ticket_review_custom4" variable="ticket_review_custom4"/>
					<ViewAttribute name="P1486551255631_15" attribute="ticket_review_custom5" variable="ticket_review_custom5"/>
					<ViewAttribute name="P1486551255631_16" attribute="ticket_review_custom6" variable="ticket_review_custom6"/>
					<ViewAttribute name="P1486551255631_17" attribute="ticket_review_custom7" variable="ticket_review_custom7"/>
					<ViewAttribute name="P1486551255631_18" attribute="ticket_review_custom9" variable="ticket_review_custom9"/>
					<ViewAttribute name="P1486551255631_19" attribute="ticket_review_custom8" variable="ticket_review_custom8"/>
					<ViewAttribute name="P1486551255631_20" attribute="ticket_review_recorduid" variable="old_ticket_review_recorduid"/>
					<ViewAttribute name="P1486551255631_21" attribute="account_uid" variable="account_uid"/>
					<ViewAttribute name="P1486551255631_22" attribute="ticket_review_comment" variable="ticket_review_comment"/>
				</Action>
				<Action name="U1486589733438" action="update" attribute="ticket_review_comment" newvalue="{dataset.new_ticket_review_comment.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_comment&apos;))"/>
				<Action name="U1486599733438" action="update" attribute="ticket_review_custom1" newvalue="{dataset.new_ticket_review_custom1.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom1&apos;))"/>
				<Action name="U1486609733438" action="update" attribute="ticket_review_custom2" newvalue="{dataset.new_ticket_review_custom2.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom2&apos;))"/>
				<Action name="U1486619733438" action="update" attribute="ticket_review_custom3" newvalue="{dataset.new_ticket_review_custom3.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom3&apos;))"/>
				<Action name="U1486629733438" action="update" attribute="ticket_review_custom4" newvalue="{dataset.new_ticket_review_custom4.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom4&apos;))"/>
				<Action name="U1486639733438" action="update" attribute="ticket_review_custom5" newvalue="{dataset.new_ticket_review_custom5.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom5&apos;))"/>
				<Action name="U148664733438" action="update" attribute="ticket_review_custom6" newvalue="{dataset.new_ticket_review_custom6.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom6&apos;))"/>
				<Action name="U1486659733438" action="update" attribute="ticket_review_custom7" newvalue="{dataset.new_ticket_review_custom7.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom7&apos;))"/>
				<Action name="U1486669733438" action="update" attribute="ticket_review_custom8" newvalue="{dataset.new_ticket_review_custom8.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom8&apos;))"/>
				<Action name="U1486679733438" action="update" attribute="ticket_review_custom9" newvalue="{dataset.new_ticket_review_custom9.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom9&apos;))"/>
				<Action name="U1486689733438" action="update" attribute="ticket_review_custom10" newvalue="{dataset.new_ticket_review_custom10.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom10&apos;))"/>
				<Action name="U1486699733438" action="update" attribute="ticket_review_custom11" newvalue="{dataset.new_ticket_review_custom11.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom11&apos;))"/>
				<Action name="U1486709733438" action="update" attribute="ticket_review_custom12" newvalue="{dataset.new_ticket_review_custom12.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom12&apos;))"/>
				<Action name="U1486719733438" action="update" attribute="ticket_review_custom13" newvalue="{dataset.new_ticket_review_custom13.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom13&apos;))"/>
				<Action name="U1486729733438" action="update" attribute="ticket_review_custom14" newvalue="{dataset.new_ticket_review_custom14.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom14&apos;))"/>
				<Action name="U1486739733438" action="update" attribute="ticket_review_custom15" newvalue="{dataset.new_ticket_review_custom15.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom15&apos;))"/>
				<Action name="U1486749733438" action="update" attribute="ticket_review_custom16" newvalue="{dataset.new_ticket_review_custom16.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom16&apos;))"/>
				<Action name="U1486759733438" action="update" attribute="ticket_review_custom17" newvalue="{dataset.new_ticket_review_custom17.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom17&apos;))"/>
				<Action name="U1486769733438" action="update" attribute="ticket_review_custom18" newvalue="{dataset.new_ticket_review_custom18.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom18&apos;))"/>
				<Action name="U1486779733438" action="update" attribute="ticket_review_custom19" newvalue="{dataset.new_ticket_review_custom19.get()}" condition="(! dataset.isEmpty(&apos;new_ticket_review_custom19&apos;))"/>
			</Actions>
			<Ticket create="true" createaction="true">
				<Attribute name="tickettype" attribute="TICKETTYPE"/>
			</Ticket>
			<Output name="output" ticketactionnumbervariable="ticket_action_number" startidentityvariable="process_actor"/>
		</Component>
		<Component name="CEND" type="endactivity" x="635" y="34" w="200" h="98" title="End" compact="true"/>
		<Link name="CLINK" source="CSTART" target="C1486551297022" priority="1"/>
		<Component name="C1486551297022" type="deleteticketactivity" x="128" y="9" w="200" h="98" title="First delete OPEN ticket">
			<DeleteTicket name="deleteticket" tickettype="TicketReview" ticketrecordnumber="old_ticket_review_recorduid"/>
		</Component>
		<Link name="L1486551345544" source="C1486551297022" target="C1486551374396" priority="1"/>
		<Component name="C1486551374396" type="ticketreviewactivity" x="386" y="9" w="200" h="98" title="Then create OPEN ticket with new infos">
			<TicketReview ticketaction="ticket_action_number">
				<Account accountvariable="account_uid"/>
				<Attribute name="status" attribute="ticket_review_status"/>
				<Attribute name="custom1" attribute="ticket_review_custom1"/>
				<Attribute name="custom2" attribute="ticket_review_custom2"/>
				<Attribute name="custom3" attribute="ticket_review_custom3"/>
				<Attribute name="custom4" attribute="ticket_review_custom4"/>
				<Attribute name="custom5" attribute="ticket_review_custom5"/>
				<Attribute name="custom6" attribute="ticket_review_custom6"/>
				<Attribute name="custom7" attribute="ticket_review_custom7"/>
				<Attribute name="custom8" attribute="ticket_review_custom8"/>
				<Attribute name="custom9" attribute="ticket_review_custom9"/>
				<Attribute name="custom10" attribute="ticket_review_custom10"/>
				<Attribute name="custom11" attribute="ticket_review_custom11"/>
				<Attribute name="custom12" attribute="ticket_review_custom12"/>
				<Attribute name="custom13" attribute="ticket_review_custom13"/>
				<Attribute name="custom14" attribute="ticket_review_custom14"/>
				<Attribute name="custom15" attribute="ticket_review_custom15"/>
				<Attribute name="custom16" attribute="ticket_review_custom16"/>
				<Attribute name="custom17" attribute="ticket_review_custom17"/>
				<Attribute name="custom18" attribute="ticket_review_custom18"/>
				<Attribute name="custom19" attribute="ticket_review_custom19"/>
				<Attribute name="comment" attribute="ticket_review_comment"/>
			</TicketReview>
		</Component>
		<Link name="L1486551391684" source="C1486551374396" target="CEND" priority="1"/>
	</Definition>
	<Roles>
		<Role name="A1486550951860" icon="/reports/icons/48/people/personal_yellow_48.png" smallicon="/reports/icons/16/people/personal_yellow_16.png" displayname="operators" description="Operators">
			<Rule name="A1486559115249" rule="operator_with_uid" description="Operator with {uid}">
				<Param name="uid" variable="process_actor"/>
			</Rule>
		</Role>
	</Roles>
	<Variables>
		<Variable name="A1486550997979" variable="ticket_review_recorduid" displayname="ticket_review_recorduid" editortype="Default" type="Number" multivalued="true" visibility="in" notstoredvariable="false"/>
		<Variable name="A148655125563121" variable="ticket_review_comment" displayname="ticket_review_comment" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556310" variable="ticket_review_custom1" displayname="ticket_review_custom1" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556311" variable="ticket_review_custom10" displayname="ticket_review_custom10" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556312" variable="ticket_review_custom11" displayname="ticket_review_custom11" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556313" variable="ticket_review_custom12" displayname="ticket_review_custom12" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556314" variable="ticket_review_custom13" displayname="ticket_review_custom13" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556315" variable="ticket_review_custom14" displayname="ticket_review_custom14" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556316" variable="ticket_review_custom15" displayname="ticket_review_custom15" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556317" variable="ticket_review_custom16" displayname="ticket_review_custom16" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556318" variable="ticket_review_custom17" displayname="ticket_review_custom17" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A14865512556319" variable="ticket_review_custom18" displayname="ticket_review_custom18" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563110" variable="ticket_review_custom19" displayname="ticket_review_custom19" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563111" variable="ticket_review_custom2" displayname="ticket_review_custom2" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563112" variable="ticket_review_custom3" displayname="ticket_review_custom3" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563113" variable="ticket_review_custom4" displayname="ticket_review_custom4" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563114" variable="ticket_review_custom5" displayname="ticket_review_custom5" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563115" variable="ticket_review_custom6" displayname="ticket_review_custom6" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563116" variable="ticket_review_custom7" displayname="ticket_review_custom7" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563117" variable="ticket_review_custom9" displayname="ticket_review_custom9" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148655125563118" variable="ticket_review_custom8" displayname="ticket_review_custom8" multivalued="true" visibility="local" type="String" editortype="Default"/>
		<Variable name="A148656125663121" variable="new_ticket_review_comment" displayname="new_ticket_review_comment" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566310" variable="new_ticket_review_custom1" displayname="new_ticket_review_custom1" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566311" variable="new_ticket_review_custom10" displayname="new_ticket_review_custom10" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566312" variable="new_ticket_review_custom11" displayname="new_ticket_review_custom11" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566313" variable="new_ticket_review_custom12" displayname="new_ticket_review_custom12" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566314" variable="new_ticket_review_custom13" displayname="new_ticket_review_custom13" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566315" variable="new_ticket_review_custom14" displayname="new_ticket_review_custom14" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566316" variable="new_ticket_review_custom15" displayname="new_ticket_review_custom15" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566317" variable="new_ticket_review_custom16" displayname="new_ticket_review_custom16" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566318" variable="new_ticket_review_custom17" displayname="new_ticket_review_custom17" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A14865612566319" variable="new_ticket_review_custom18" displayname="new_ticket_review_custom18" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663110" variable="new_ticket_review_custom19" displayname="new_ticket_review_custom19" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663111" variable="new_ticket_review_custom2" displayname="new_ticket_review_custom2" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663112" variable="new_ticket_review_custom3" displayname="new_ticket_review_custom3" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663113" variable="new_ticket_review_custom4" displayname="new_ticket_review_custom4" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663114" variable="new_ticket_review_custom5" displayname="new_ticket_review_custom5" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663115" variable="new_ticket_review_custom6" displayname="new_ticket_review_custom6" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663116" variable="new_ticket_review_custom7" displayname="new_ticket_review_custom7" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663117" variable="new_ticket_review_custom9" displayname="new_ticket_review_custom9" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148656125663118" variable="new_ticket_review_custom8" displayname="new_ticket_review_custom8" multivalued="true" visibility="in" type="String" editortype="Default"/>
		<Variable name="A148655125563119" variable="old_ticket_review_recorduid" displayname="old_ticket_review_recorduid" multivalued="true" visibility="local" type="Number" editortype="Default"/>
		<Variable name="A1486551274273" variable="account_uid" displayname="account_uid" editortype="Ledger Account" type="String" multivalued="true" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486551333690" variable="ticket_review_status" displayname="ticket_review_status" editortype="Default" type="String" multivalued="true" visibility="local" initialvalue="OPEN" notstoredvariable="false"/>
		<Variable name="A1486551529069" variable="ticket_action_number" displayname="ticket_action_number" editortype="Default" type="Number" multivalued="false" visibility="local" notstoredvariable="false"/>
		<Variable name="A1486556704148" variable="TICKETTYPE" displayname="TICKETTYPE" editortype="Default" type="String" multivalued="false" visibility="local" notstoredvariable="false" initialvalue="ACCOUNTCATEGORISATION"/>
		<Variable name="A1486559075067" variable="process_actor" displayname="process_actor" editortype="Process Actor" type="String" multivalued="false" visibility="in" notstoredvariable="false"/>
	</Variables>
</Workflow>
