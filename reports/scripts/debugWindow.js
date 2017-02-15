
importPackage(Packages.java.util.logging);
importPackage(Packages.javax.swing);


/****************************************************
 * Set "blnDisplayDebugWindow" to true/false
 * to enable/disable the debug window
 ***************************************************/
blnDisplayDebugWindow = true;


/*****************************************************
 * Name: 		logToDebugWindow
 * Description: Quick and dirty way of displaying a debug 
 * 				messages to a Window in eclipse using Swing.
 * 				Uses global variable so all function calls
 * 				print to same window
 * Parameters:  strMessage - message to display
 * Returns:  	void
 ****************************************************/
function logToDebugWindow(strMessage) {
	
	// can turn on/off using this variable
	if(!blnDisplayDebugWindow) { return; }
	
	// current JTextArea - global parameter
	var currJTextArea = reportContext.getGlobalVariable("jfDebugWindow");
	
	// if null, then create and store as global variable
	if(currJTextArea == null) {
		
		// Create JFrame
		var jFrame = new JFrame("Debug Window"); 
		
		// Create JTextArea - append message and new-line
		var jTextArea = new JTextArea(20, 100);
		jTextArea.append(strMessage);
		jTextArea.append("\n");					
		
		//Create a JPanel
		var jPanel = new JPanel();
		// add text area to scroll pane
		jPanel.add(jTextArea);
		
		//Create a vert and horiz scroll bar using JScrollPane 
		var jScrollPane = new JScrollPane(jPanel, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		jScrollPane.getHorizontalScrollBar().setUnitIncrement(5);
		jScrollPane.getVerticalScrollBar().setUnitIncrement(5);
		
		//Add JScrollPane into JFrame
		jFrame.add(jScrollPane);
		jFrame.setSize(400, 400); 
		jFrame.show();
		
		// set JTextArea as a Global Parameter for future reference
		reportContext.setGlobalVariable("jfDebugWindow", jTextArea);
	} else {
		// Print to Global Reference of the JTextArea
		currJTextArea.append(strMessage);
		currJTextArea.append("\n");
	}
}