<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="org.eclipse.birt.report.utility.ParameterAccessor,
				 org.eclipse.birt.report.IBirtConstants,
				 org.eclipse.birt.report.session.*" %>

<%-- Map Java attributes to Javascript constants --%>
<script type="text/javascript">
// <![CDATA[
            
    Constants.nullValue = '<%= IBirtConstants.NULL_VALUE %>';
    
	// Request attributes
	if ( !Constants.request )
	{
		Constants.request = {};
	}
	Constants.request.format = '<%= ParameterAccessor.getFormat(request) %>';
	Constants.request.rtl = <%= ParameterAccessor.isRtl( request ) %>;
	Constants.request.isDesigner = <%= ParameterAccessor.isDesigner() %>;
	Constants.request.servletPath = "<%= request.getAttribute( "ServletPath" ) %>".substr(1);
	<%  IViewingSession viewingSession = ViewingSessionUtil.getSession(request);
		String subSessionId = null;
		if ( viewingSession != null )
		{
			subSessionId = viewingSession.getId();
		}%>
	Constants.viewingSessionId = <%= subSessionId!=null?"\"" + subSessionId + "\"":"null" %>;	
// ]]>
</script>
