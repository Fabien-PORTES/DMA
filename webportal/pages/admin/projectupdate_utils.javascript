
function getListOfFacetFiles () {
	
	var facetId = dataset.get("facetId"); 
	var results = dataset.get("results"); 
	var extensions = dataset.get("extensions");
	results.clear();
	
	// If we dont have a facetId
	if (facetId.length == 0 ) {
		return ;
	}
	
	// Identify the target
	var target = facetId.get(0);
	
	// Open the file .installedarchives and parse it
	var file = new java.io.File(config.projectPath + "/.installedarchives");
	var dbfactory = javax.xml.parsers.DocumentBuilderFactory.newInstance();
	var db = dbfactory.newDocumentBuilder();
	var doc = db.parse(file);
	
	// Get the root of the document
	var root = doc.getDocumentElement();
	
	// Read all the installed facets
	allFacets = root.getElementsByTagName ("facet");
	for (var i=0; i< allFacets.getLength() ; i ++ ){
		
		// Identify the facet by its instance id
		var instanceId = allFacets.item(i).getElementsByTagName ("instance").item(0).getAttribute("name").toString();
	
		// If the instance id matches the target
		if ( instanceId.equals ( target )  ){
			
			// Get all files installed with this facet
			var global =  allFacets.item(i).getElementsByTagName ("global").item(0);
			var files = global.getElementsByTagName ("files").item(0);
			var allFiles = files.getElementsByTagName ("file");
			for ( var j = 0; j < allFiles.getLength(); j++ ){
				var path = allFiles.item(j).getAttribute("path");
				results.add ( path );
				extensions.add ( path.substr(path.lastIndexOf('.')+1)  );
			}
		}
	}
}

function generateConfirmationCode()
{
	return  (Math.floor(Math.random()*90000) + 10000).toString();	
}
