// ----------------------------------------------------------
//
// Brainwave GRC
// 2010 - Sebastien Faivre
//
// Scripts used in the reports
//
//
//

/**
 * Add spaces after comma character (,)
 * @param str the string to patch
 * @return the patched string
 */
function addSpaces(str) {
	str = str.replace(/,/g,", ");
	return str;
}


/**
 * Replace all occurrences of a given substring within a string with another substring
 * @param Source the string to search in 
 * @param stringToFind the substring to find
 * @param stringToReplace the substring to replace with
 * @return the patched string 
 */
function replaceAll(Source,stringToFind,stringToReplace){
  var temp = Source;
  var index = temp.indexOf(stringToFind);
    while(index != -1){
        temp = temp.replace(stringToFind,stringToReplace);
        index = temp.indexOf(stringToFind);
    }
    return temp;
}

/**
 * Trim a string like in Java or PHP
 * @param string the string to trim
 * @returns {String} the trimed string
 */
function trim(string){
	var val = ' '+string;
	return val.replace(/^\s+|\s+$/g, '');
}

//var debugTimeslot = "20100817155241"; // Set this attribute to an arbitrary timeslot value to debug your reports

/**
 * Set the timeslot of the dataset to the current timeslot.
 * This function retrieve the timeslot from the HTTP session and set the "CIMPORTDATE" Parameter of the dataset
 * 
 * @param dataset the dataset on which you want to set the timeslot
 */
/*
function setCurrentTimeslot(dataset) {
	if(debugTimeslot != null && debugTimeslot.length>0) {
		setTimeslot(dataset, debugTimeslot);
	}
	else {
		var context = reportContext.getHttpServletRequest();
		if(context != null) {
			var session = context.getSession();
			var importdate = session.getAttribute("CIMPORTDATE");
			if(importdate != null)
				setTimeslot(dataset, importdate);
		}
	}
}
*/

/**
 * Set the timeslot of the dataset to a timeslot value.
 * This function set the "CIMPORTDATE" Parameter of the dataset
 * 
 * @param dataset the dataset on which you want to set the timeslot
 * @param timeslot the timeslot value in a form of a string "yyyyMMddHHmmss"
 */
/*
function setTimeslot(dataset, timeslot) {
	dataset.setInputParameterValue("CIMPORTDATE", timeslot);
}
*/

/**
 * Set the http session timeslot informations.
 * 
 * @param timeslot the timeslot in string format 'yyyyMMddHHmmss'
 * @param timeslotinfos the timeslot in a readable date format
 * @param comments comments associated with the timeslot
 */
/*
function setHTTPTimeslotInfos(timeslot, timeslotinfos, comments) {
	if(reportContext != null) {}
		var servlet = reportContext.getHttpServletRequest();
		if(servlet != null) {
			var session = reportContext.getHttpServletRequest().getSession();
			session.setAttribute("CIMPORTDATE", timeslot);
			session.setAttribute("CCIMPORTDATE", timeslotinfos);
			session.setAttribute("CIMPORTDATECOMMENTS", comments);
		}
	}
} 
*/

/**
 * function to call on every initialize event of your reports
 * 
 * @returns
 */
/*
function initialize() {
	// Set the http session variables to an arbitrary value if debug mode is activated 
	if(debugTimeslot != null && debugTimeslot.length>0) {
		setHTTPTimeslotInfos(debugTimeslot, debugTimeslot, "DEBUG SESSION -- DO NOT USE IN PRODUCTION");
	}
}
*/

/**
* Disable the hyperlink depending on the type of output format.
* By default, hyperlinks are disabled if we don't generate HTML
*
* @param ctx the reportContext object
* @param element the element on which to disable the hyperlink 
*/
function conditionalHyperlink(ctx, element) {
	if(ctx.getOutputFormat()!="html") {
		element.action = null;
	}
}

/**
 * Function to be called on every report.beforeFactory() event
 * 
 */
function beforeFactory() {
	try {
		pathMultivaluedParameters();
		dropAllHyperlinksNonHTML();
		manageAccessRights();
//		getReportTitle();
//		getReportParameters();
//		getReportEntity();
		changeResolution();
//		if(containsCustomTitle())
//			insertBreadcrumCustomTitle();
//		else
//			insertBreadcrum();
	}catch(e) {
		logToDebugWindow('before factory exception: '+e.toString());
	}
}

/**
 * Function to be called on every report.beforeRender() event
 * 
 */
function beforeRender() {
}

/**
 * Set the master page depending on the output format
 * 
 */
function setMasterPage() {
	rptDesignHandle = reportContext.getReportRunnable( ).designHandle.getDesignHandle( );
		
	var content = reportContext.getReportRunnable().designHandle.getBody().getContents();
	var iterator = content.iterator();
	if(iterator.hasNext()) {
		var elementHandle = iterator.next();
		var element = elementHandle.getElement();
		
		var myoutputformat = reportContext.getOutputFormat( );
		if( myoutputformat == "html" ){
			element.setProperty("masterPage","Brainwave Master Page Landscape html");
		}else{
			element.setProperty("masterPage","Brainwave Master Page Landscape");
		}
	}
}

/**
* Disable all the hyperlinks depending on the type of output format.
* By default, hyperlinks are disabled if we don't generate HTML.
* Call this method on the report.beforeFactory() event
*
*/
function dropAllHyperlinksNonHTML() {
	innerdropHyperlinks(reportContext.getReportRunnable().designHandle.getBody());
}

/**
 * INTERNAL FUNCTION
 * DO NOT CALL
 */
function innerdropHyperlinks(/*SlotHandle*/ slotHandle) {
	try {
		
	// search into the slot content for the element corresponding to an 'actionable' element
	var content = slotHandle.getContents();
	var iterator = content.iterator();
	while(iterator.hasNext()) {
		var elementHandle = iterator.next();

		if(elementHandle.getActionHandle != null) {
			if(elementHandle.getOnRender() == null) {
				// remove hyperlink when rendering on other formats than HTML
				elementHandle.setOnRender("if(reportContext.getOutputFormat() != 'html') this.action = null;");
			}
			
			var actionHandle = elementHandle.getActionHandle();
			if(actionHandle!=null) {
				if(actionHandle.getLinkType().equals('drill-through')) {
					// add a parameter __showtitle=false in drillthrough hyperlinks

					var iterator = actionHandle.paramBindingsIterator();
					var already = false;
					while(iterator.hasNext()) {
						var paramBindingHandle = iterator.next();
						var paramName = paramBindingHandle.getParamName();
						if(paramName.equals('__showtitle')) {
							already = true;
							break;
						}
					}
					
					if(!already) {
						var paramBinding = new Packages.org.eclipse.birt.report.model.api.elements.structures.ParamBinding();
						paramBinding.setParamName('__showtitle');
						var list = new Packages.java.util.ArrayList();
						list.add('false');
						paramBinding.setExpression(list);
						actionHandle.addParamBinding(paramBinding);
					}
				}
			}
		}
		
		if(elementHandle.getDefn().getSlotCount != null) {
			var elementSlotCount = elementHandle.getDefn().getSlotCount();
			for (var i = 0; i < elementSlotCount ; i++) {
				innerdropHyperlinks(elementHandle.getSlot(i));
			}
		}
	}
	
	}catch(e) {
		logToDebugWindow("innerdropHyperlinks Exception : "+e);
	}
}

/**
 * Path multi valued parameters to give them in the correct format to the Brainwave ODA connector.
 * INTERNAL USE ONLY
 * 
 * @returns
 */
function pathMultivaluedParameters() {
	try {

		importPackage(Packages.org.eclipse.birt.report.model.api);
		importPackage(Packages.org.eclipse.birt.report.model.api.elements);


		var params = reportContext.getReportRunnable().designHandle.getDesignHandle().getAllParameters();
		var elements = params.iterator();
		while(elements.hasNext()) {
			var param = elements.next(); 
			var paramtype = param.getProperty("paramType");
			// patch multi valued parameter
			if(paramtype!=null && paramtype.equals("multi-value")) {
				var paramname = param.getFullName();
				var vals = reportContext.getParameterValue(paramname);
				if(vals != null) {
					var result = "";
					for(var i=0;i<vals.length;i++) {
						if(vals[i] != null && !vals[i].equals(''))
							result = result+vals[i]+String.fromCharCode(182);
					}	
					if(result.length>0) {
						result = result.substring(0, result.length-1);
					}
					
					if(result == null || result.length == 0) {
						reportContext.setParameterValue(paramname, null);
					}
					else {
						reportContext.setParameterValue(paramname, result);
					}
				
					param.setProperty("paramType", "simple");
				}
			}
			// replace '*' by null
			else if(paramtype!=null && paramtype.equals("simple")) {
				var paramname = param.getFullName();
				var val = reportContext.getParameterValue(paramname);
				if(val != null) {
					try {
						// traitement du * en Null pour que les vues puissent l'interpreter correctement
						if(val.equals('*')) {
							reportContext.setParameterValue(paramname, null);
							//logToDebugWindow("paramname : "+val+" after :"+reportContext.getParameterValue(paramname));
						}
						else {
							// traitement du multi valu� pass� en parametre de requete (bizarremenr, cela ajoute des caracteres ascii($C2) parasites)
							while(val.indexOf(String.fromCharCode(194))!=-1) {
								val = val.replace(String.fromCharCode(194),'');
							}
							reportContext.setParameterValue(paramname, val);
						}
					}catch(e) {}
				}
			}
		}

		}catch(e) {
				logToDebugWindow("pathMultivaluedParameters Exception : "+e);
		}
}

function getReportTitle() {
	importPackage(Packages.org.eclipse.birt.report.model.api);
	importPackage(Packages.org.eclipse.birt.report.model.api.elements);

	var title;
	
	// retrieving the breadcrumb title in a two step process :
	// 1. If a nationalized string exists then take it (key : Report.breadcrumb)
	// 2. Else take the report title
	title = reportContext.getMessage("Report.breadcrumb", reportContext.getLocale());
	if(title != null)
		title = title.replace("'", "\\'");
	
	if(title == null) {
		title = reportContext.getDesignHandle().getProperty("title");
	}

	reportContext.setPersistentGlobalVariable("title", title);
	
	return title;
}

function getReportParameters() {
	importPackage(Packages.org.eclipse.birt.report.model.api);
	importPackage(Packages.org.eclipse.birt.report.model.api.elements);


	var rparam = '';
	
	var params = reportContext.getReportRunnable().designHandle.getDesignHandle().getAllParameters();
	var elements = params.iterator();
	while(elements.hasNext()) {
		var param = elements.next(); 
		var paramtype = param.getProperty("paramType");
		if(paramtype.equals("multi-value")) {
			var paramname = param.getFullName();
			var vals = reportContext.getParameterValue(paramname);
			if(vals != null) {		
				if(rparam.length>0)
					rparam=rparam+'&';
				rparam=rparam+paramname;
				rparam=rparam+'=';
			
				var result = "";
				for(var i=0;i<vals.length;i++) {
					result = result+vals[i]+String.fromCharCode(182);
				}	
				if(result.length>0) {
					result = result.substring(0, result.length-1);
				}
			
				rparam = rparam+result;
			}
		}
		else if(paramtype.equals("simple")) {
			var paramname = param.getFullName();
			var val = reportContext.getParameterValue(paramname);

			if(val!= null) {
				if(rparam.length>0)
					rparam=rparam+'&';
				rparam=rparam+paramname;
				rparam=rparam+'=';
				rparam = rparam+val;
			}
		}
	}

	reportContext.setPersistentGlobalVariable("parameters", rparam);
	
}

function insertBreadcrum() {
	var slot = reportContext.getDesignHandle().getBody().getSlotID();
	var text = reportContext.getDesignHandle().getElementFactory().newTextItem('BR_BREADCRUM');
	text.setProperty('contentType', 'html');
	text.setProperty('content', '<img src="../icons/s.gif" width="1" height="1" onload="if (window.parent.reportTabChanged) { window.parent.reportTabChanged(\'<VALUE-OF>reportContext.getPersistentGlobalVariable("title");</VALUE-OF>\', window.location, \'<VALUE-OF>reportContext.getPersistentGlobalVariable("parameters");</VALUE-OF>\', \'<VALUE-OF>reportContext.getPersistentGlobalVariable("entity");</VALUE-OF>\',true); }"/>');
	reportContext.getDesignHandle().addElement(text, slot);

	var pos = text.getIndex();
	reportContext.getDesignHandle().getBody().getSlot().moveContent(pos, 0);
}

function getReportEntity() {
	var entities = new Array('account',
			'application',
			'asset',
			'group',
			'identity',
			'job',
			'organisation',
			'permission',
			'physicalaccess',
			'physicalroom',
			'repository',
			'sharedfolder'
	);
	var ret = 'empty';
	
	var name = reportContext.getReportRunnable().getReportName();
	name = name.substring(name.lastIndexOf('/')+1);
	
	for(var i=0;i<entities.length;i++) {
		var entity = entities[i];
		
		if(name.indexOf(entity)==0) {
			ret=entity;
			break;
		}
	}

	reportContext.setPersistentGlobalVariable("entity", ret);
	
}

function containsCustomTitle() {
	var breadcrumb = reportContext.getDesignHandle().findDataSet('breadcrumb');
	return breadcrumb != null;
}

function insertBreadcrumCustomTitle() {
	var breadcrumb = reportContext.getDesignHandle().findDataSet('breadcrumb');	
	if(breadcrumb == null)
		return;

	// create a list element
	var slot = reportContext.getDesignHandle().getBody().getSlotID();
	var list = reportContext.getDesignHandle().getElementFactory().newList('BR_BREADCRUM_LIST');
	
	// associate the breadcrumb dataset to the list
	list.setDataSet(breadcrumb);
	
	// column mapping
	var structureFactory = Packages.org.eclipse.birt.report.model.api.StructureFactory;
	var column = structureFactory.createComputedColumn(); 
	column.setName('displayname');
	column.setExpression('dataSetRow[\"displayname\"]');
	list.getColumnBindings().addItem(column);
	
	// create the inner text element
	var text = reportContext.getDesignHandle().getElementFactory().newTextItem('BR_BREADCRUM');
	text.setProperty('contentType', 'html');
	
	if(reportContext.getMessage("Report.breadcrumb", reportContext.getLocale())!=null) {
		text.setProperty('content', '<img src="../icons/s.gif" width="1" height="1" onload="if (window.parent.reportTabChanged) { window.parent.reportTabChanged(\'<VALUE-OF>var l10nParams = new Array(1); l10nParams[0] = row["displayname"]; reportContext.getMessage("Report.breadcrumb", reportContext.getLocale(), l10nParams);</VALUE-OF>\', window.location, \'<VALUE-OF>reportContext.getPersistentGlobalVariable("parameters");</VALUE-OF>\', \'<VALUE-OF>reportContext.getPersistentGlobalVariable("entity");</VALUE-OF>\',true); }"/>');
	}
	else {
		text.setProperty('content', '<img src="../icons/s.gif" width="1" height="1" onload="if (window.parent.reportTabChanged) { window.parent.reportTabChanged(\'<VALUE-OF>row["displayname"];</VALUE-OF>\', window.location, \'<VALUE-OF>reportContext.getPersistentGlobalVariable("parameters");</VALUE-OF>\', \'<VALUE-OF>reportContext.getPersistentGlobalVariable("entity");</VALUE-OF>\',true); }"/>');
	}
	
	// insert the text element in the list
	var iterator = list.slotsIterator();
	var slotid = iterator.next().getSlotID();
	list.addElement(text, slotid);

	// insert the list element in the report	
	reportContext.getDesignHandle().addElement(list, slot);

	var pos = list.getIndex();
	reportContext.getDesignHandle().getBody().getSlot().moveContent(pos, 0);
}



/**
 * Automatically manage access rights based on components names.
 * You can externalize components access rights based on the user role on the webportal.
 * in order to externalize access right :
 * 1. name your component
 * 2. add your component in the property files to manage show/hide and enable/disable hyperlink
 * Component should be named with a _ notation which starts by the name of the report, for instance : identitydetail_sharedfolders
 * The properties take the form of : 
 * [id].show=role1,role2
 * [id].enable=role1,role2
 * where .show specify the role which can see the component
 * and .enable specify the roles on which the hyperlink is activated (if any)
 * don't forget to add your rights property file in the report ressources
 * @returns
 */
function manageAccessRights() {
	managerAccessRightsVisibility(reportContext.getReportRunnable().designHandle.getBody());
	managerAccessRightsHyperLinks(reportContext.getReportRunnable().designHandle.getBody());
}


/**
 * INTERNAL FUNCTION
 * DO NOT CALL
 */
function managerAccessRightsHyperLinks(/*SlotHandle*/ slotHandle) {
	try {
		var context = reportContext.getHttpServletRequest();
		if(context == null) // not in a servlet environment
				return;
		if(context.getUserPrincipal() == null) // not authenticated, assume that we are not in the webportal
			return;	

	// search into the slot content for the element corresponding to an 'actionable' element
	var content = slotHandle.getContents();
	var iterator = content.iterator();
	while(iterator.hasNext()) {
		var elementHandle = iterator.next();

		// component with hyperlink
		if(elementHandle.getActionHandle != null) {

			var name = elementHandle.getName();
			// a name is defined, check if some roles are associated with this name  
			if(name!=null) {

				var key = name+'.enable';
				var roles = reportContext.getMessage(key);
				// roles are defined for this component, limit the hyperlinks accordingly
				if(roles!=null) {
					var rolearray = roles.split(',');
					var allowed = false;
					for(var i=0;i<rolearray.length;i++) {
						var role = rolearray[i];
						role = trim(role);
						if(isUserInRole(context, role))
							allowed = true;
					}
					
					if(!allowed) {
						if(elementHandle.getOnRender() == null) {
							// remove hyperlink when rendering on other formats than HTML
							elementHandle.setOnRender("this.action = null;");
						}
						else {
							elementHandle.setOnRender("this.action = null; "+elementHandle.getOnRender());
						}
						
					}
				}
				
			}
		}
		
		// manage next
		if(elementHandle.getDefn().getSlotCount != null) {
			var elementSlotCount = elementHandle.getDefn().getSlotCount();
			for (var i = 0; i < elementSlotCount ; i++) {
				managerAccessRightsHyperLinks(elementHandle.getSlot(i));
			}
		}
	}
	
	}catch(e) {
		logToDebugWindow("managerAccessRightsHyperLinks Exception : "+e);
	}
}

/*
 * Check if the current user is having the role or feature
 */
function isUserInRole(context, roleorfeature) {
	// check if the user is granted to the role through the WebServer security context
	if(context.isUserInRole(roleorfeature))
		return true;
	
	var /*javax.servlet.http.HttpSession*/ session = context.getSession();
	if(session == null)
		return false;
	
	// check if the user is granted to the role through the Roles declared in Analytics
	var /*java.util.Set*/ set = session.getAttribute('USER_ROLES');
	if(set!= null) {
		if(set.contains(roleorfeature))
			return true;
	}

	// check if the user is granted to the role through the Features declared in Analytics
	set = session.getAttribute('USER_FEATURES');
	if(set!= null) {
		if(set.contains(roleorfeature))
			return true;
	}

	return false;
}

/**
 * INTERNAL FUNCTION
 * DO NOT CALL
 */
function managerAccessRightsVisibility(/*SlotHandle*/ slotHandle) {
	try {
		var context = reportContext.getHttpServletRequest();
		if(context == null) // not in a servlet environment
				return;
		if(context.getUserPrincipal() == null) // not authenticated, assume that we are not in the webportal
			return;	

	// search into the slot content for the element corresponding to an 'actionable' element
	var content = slotHandle.getContents();
	var iterator = content.iterator();
	while(iterator.hasNext()) {
		var elementHandle = iterator.next();

		var visible = true;
		var name = elementHandle.getName();

		// a name is defined, check if some roles are associated with this name  
		if(name!=null) {

			var key = name+'.show';
			var roles = reportContext.getMessage(key);
			// roles are defined for this component, limit the hyperlinks accordingly
			if(roles!=null) {
				var rolearray = roles.split(',');
				visible = false;
				for(var i=0;i<rolearray.length;i++) {
					var role = rolearray[i];
					role = trim(role);
					if(isUserInRole(context, role))
						visible = true;
				}
			}
		}
		
		if(!visible) {
			elementHandle.drop();
		}
		else if (elementHandle.getDefn().getSlotCount != null) {
			// manage next
			var elementSlotCount = elementHandle.getDefn().getSlotCount();
			for (var i = 0; i < elementSlotCount ; i++) {
				managerAccessRightsVisibility(elementHandle.getSlot(i));
			}
		}
	}
	
	}catch(e) {
		logToDebugWindow("managerAccessRightsVisibility Exception : "+e);
	}
}


/**
 * Update report resolution : High resolution for outputs other than HTML
 */
function changeResolution() {
    
    var dpi=0;
    var myoutputformat = reportContext.getOutputFormat( );
    if( myoutputformat == "html" ){
        dpi=72;
    } else {
        dpi=300;
    }        
        
    reportContext.getAppContext().put("CHART_RESOLUTION", dpi);
}