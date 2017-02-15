<?xml version="1.0" encoding="UTF-8"?>
<Workflow version="1.0">
	<Definition name="taskinquiry" displayname="Email sent to {dataset.candidatename.get()} for task {dataset.taskname} of process {dataset.processname}" description="This workflow is used by the task manager whenever a Principal want to push a message to a Candidate by mail" scriptfile="/workflow/bw_task_manager/taskinquiry.javascript" statictitle="Send an email" technical="true">
		<Component name="CSTART" type="startactivity" x="50" y="107" w="200" h="114" title="Start" compact="true" outexclusive="true">
			<Candidates name="role" role="A1386351115546"/>
			<FormVariable name="A1386401926387" variable="message" action="input" mandatory="true"/>
			<FormVariable name="A1386401932003" variable="sendermail" action="input" mandatory="true"/>
			<FormVariable name="A1386401937523" variable="sendername" action="input" mandatory="true"/>
			<FormVariable name="A1386401943041" variable="title" action="input" mandatory="true"/>
			<FormVariable name="A1386402511664" variable="candidateuid" action="input" mandatory="true"/>
			<FormVariable name="A1386405404442" variable="processcreationdate" action="input" mandatory="false"/>
			<FormVariable name="A1386405409331" variable="processduedate" action="input" mandatory="false"/>
			<FormVariable name="A1386405413432" variable="processname" action="input" mandatory="false"/>
			<FormVariable name="A1386405417671" variable="taskcreationdate" action="input" mandatory="false"/>
			<FormVariable name="A1386405421685" variable="taskduedate" action="input" mandatory="false"/>
			<FormVariable name="A1386405426073" variable="taskname" action="input" mandatory="false"/>
			<FormVariable name="A1386405747732" variable="processcreatorname" action="input" mandatory="false"/>
		</Component>
		<Component name="CEND" type="endactivity" x="704" y="107" w="200" h="98" title="End" compact="true" inexclusive="true"/>
		<Link name="CLINK" source="CSTART" target="C1386350108894" priority="1" expression="(! dataset.isEmpty(&apos;candidateuid&apos;))" labelcustom="true" label="Candidate fulfilled"/>
		<Component name="C1386350108894" type="mailnotificationactivity" x="277" y="82" w="200" h="98" title="Push a mail to the Candidate">
			<Notification name="mail" mail="A1386351151111"/>
		</Component>
		<Link name="L1386350131126" source="C1386350108894" target="CEND" priority="1"/>
		<Link name="L1386403057019" source="CSTART" target="C1386403133678" priority="2"/>
		<Component name="C1386403133678" type="routeactivity" x="341" y="277" w="200" h="50" compact="true" title="Route 1"/>
		<Link name="L1386403144924" source="C1386403133678" target="CEND" priority="1"/>
	</Definition>
	<Variables>
		<Variable name="A1386350191117" variable="message" displayname="message" editortype="Default" type="String" multivalued="false" visibility="in" description="The mail message"/>
		<Variable name="A1386350242928" variable="title" displayname="title" editortype="Default" type="String" multivalued="false" visibility="in" description="The mail title"/>
		<Variable name="A1386351574384" variable="sendername" displayname="sender name" editortype="Default" type="String" multivalued="false" visibility="in" description="The sender name"/>
		<Variable name="A1386351589684" variable="sendermail" displayname="sender mail" editortype="Default" type="String" multivalued="false" visibility="in" description="The sender mail"/>
		<Variable name="A1386402479864" variable="candidateuid" displayname="candidate UID" editortype="Default" type="String" multivalued="false" visibility="in" description="The candidate UID"/>
		<Variable name="A1386405302377" variable="taskname" displayname="task name" editortype="Default" type="String" multivalued="false" visibility="in" description="Task name"/>
		<Variable name="A1386405319539" variable="taskcreationdate" displayname="task creation date" editortype="Default" type="String" multivalued="false" visibility="in" description="Task creation date"/>
		<Variable name="A1386405334723" variable="taskduedate" displayname="task due date" editortype="Default" type="String" multivalued="false" visibility="in" description="Task due date"/>
		<Variable name="A1386405348464" variable="processname" displayname="process name" editortype="Default" type="String" multivalued="false" visibility="in" description="Process name"/>
		<Variable name="A1386405372614" variable="processcreationdate" displayname="process creation date" editortype="Default" type="String" multivalued="false" visibility="in" description="Process creation date"/>
		<Variable name="A1386405386371" variable="processduedate" displayname="process due date" editortype="Default" type="String" multivalued="false" visibility="in" description="Process due date"/>
		<Variable name="A1386405733808" variable="processcreatorname" displayname="process creator name" editortype="Default" type="String" multivalued="false" visibility="in" description="Process creator name"/>
		<Variable name="A1386669266326" variable="processcompletedate" displayname="Process complete date" editortype="Default" type="String" multivalued="false" visibility="in" description="Process complete date"/>
		<Variable name="A1386669282796" variable="taskcompletedate" displayname="Task complete date" editortype="Default" type="String" multivalued="false" visibility="in" description="Task complete date"/>
		<Variable name="A1386670234413" variable="candidatename" displayname="Candidate name" editortype="Default" type="String" multivalued="false" visibility="in" description="Candidate name"/>
	</Variables>
	<Roles>
		<Role name="A1386351115546" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" displayname="everybody" description="Everybody can launch this process">
			<Rule name="A1386351147411" rule="control_activeidentities" description="Active Identities"/>
		</Role>
		<Role name="A1386351474135" displayname="candidate" icon="/reports/icons/48/people/personal_48.png" smallicon="/reports/icons/16/people/personal_16.png" description="The candidate">
			<Rule name="A1386351496468" rule="identitypicker" description="identity picker by {uid}">
				<Param name="uid" variable="candidateuid"/>
			</Rule>
		</Role>
	</Roles>
	<Mails>
		<Mail name="A1386351151111" displayname="inquiry" description="mail inquiry" torole="A1386351474135" notifyrule="taskinquiry">
			<Param name="title" variable="title"/>
			<Param name="message" variable="message"/>
			<Param name="sendermail" variable="sendermail"/>
			<Param name="sendername" variable="sendername"/>
			<Param name="processname" variable="processname"/>
			<Param name="processcreationdate" variable="processcreationdate"/>
			<Param name="processduedate" variable="processduedate"/>
			<Param name="taskname" variable="taskname"/>
			<Param name="taskcreationdate" variable="taskcreationdate"/>
			<Param name="taskduedate" variable="taskduedate"/>
			<Param name="processcreatorname" variable="processcreatorname"/>
			<Param name="processcompletedate" variable="processcompletedate"/>
			<Param name="taskcompletedate" variable="taskcompletedate"/>
		</Mail>
	</Mails>
</Workflow>
