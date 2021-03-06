<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="org.eclipse.birt.report.resource.BirtResources" %>

<%-- Map Java resource messages to Javascript constants --%>
<script type="text/javascript">
// <![CDATA[	
	// Error msgs
	Constants.error.invalidPageRange = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.dialog.page.error.invalidpagerange" )%>';
	Constants.error.parameterRequired = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.error.parameterrequired" )%>';
	Constants.error.parameterNotAllowBlank = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.error.parameternotallowblank" )%>';
	Constants.error.parameterNotSelected = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.error.parameternotselected" )%>';
	Constants.error.invalidPageNumber = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.navbar.error.blankpagenum" )%>';
	Constants.error.unknownError = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.error.unknownerror" )%>';
	Constants.error.generateReportFirst = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.error.generatereportfirst" )%>';
	Constants.error.printPreviewAlreadyOpen = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.dialog.print.printpreviewalreadyopen" )%>';
	Constants.error.confirmCancelTask = '<%= BirtResources.getJavaScriptMessage( "birt.viewer.progressbar.confirmcanceltask" )%>';
// ]]>
</script>
