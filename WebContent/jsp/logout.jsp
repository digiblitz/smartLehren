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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>smartLehren</title>
<link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />

<script type="text/javascript">

$(document).ready(function(){
	window.history.forward(-1);
});

function delayer(){
    window.location = "login.html?cmd=Logout"
}
</script>

<SCRIPT type="text/javascript">
    window.history.forward(-1);
    function noBack() { 
    	var url = window.location.href;
window.history.go(-window.history.length);
window.location.href = url;
    	}
</SCRIPT>

</head>



<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
    if(session.getAttribute("token")==null){
	%>
	 <BODY onLoad="setTimeout('delayer()', 500)"
    onpageshow="if (event.persisted) noBack();" onUnload="">
	
	<p>Please Wait...!</p>
  
</body>
<%
}
%>

<!-- <body onLoad="setTimeout('delayer()', 500)"> -->

</html>
