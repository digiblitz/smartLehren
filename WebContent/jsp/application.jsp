<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/org/cometd.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/org/cometd/AckExtension.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/org/cometd/ReloadExtension.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/chat/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/jquery/jquery.cometd.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/jquery/jquery.cometd-reload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/chat.window.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chat/comet.chat.js"></script>

<script type="text/javascript">
    
    var chatWindowArray = [];
    
    var config = {
        contextPath: '${pageContext.request.contextPath}'
    };
	
	function getChatWindowByUserPair(loginUserName, peerUserName) {
		
		var chatWindow;
		
		for(var i = 0; i < chatWindowArray.length; i++) {
			var windowInfo = chatWindowArray[i];
			if (windowInfo.loginUserName == loginUserName && windowInfo.peerUserName == peerUserName) {
				chatWindow =  windowInfo.windowObj;
			}
		}
		
		return chatWindow;
	}
	
	function createWindow(loginUserName, peerUserName) {
		
		var chatWindow = getChatWindowByUserPair(loginUserName, peerUserName);
		
		if (chatWindow == null) { //Not chat window created before for this user pair.
			chatWindow = new ChatWindow(); //Create new chat window.
			chatWindow.initWindow({
				loginUserName:loginUserName, 
				peerUserName:peerUserName,
				windowArray:chatWindowArray});
			
			//collect all chat windows opended so far.
			var chatWindowInfo = { peerUserName:peerUserName, 
					               loginUserName:loginUserName,
					               windowObj:chatWindow 
					             };
			
			chatWindowArray.push(chatWindowInfo);
    	}
		
		chatWindow.show();
		
		return chatWindow;
	}

	function join(userName){
		$.cometChat.join(userName);
	}
</script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/chat/comet.chat.css"/>
</head>
<body>
<script type="text/javascript">
	var userName = '<%=session.getAttribute("username")%>';
	$(document).ready(function(){ 
		$.cometChat.onLoad({memberListContainerID:'members'});
		join(userName);
	});
</script>
<div id="members" style="font-family:'Times New Roman', Times, serif;"></div>
</body>
</html>
