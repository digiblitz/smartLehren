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
<title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.1.1.js"></script>
     <script src="js/script.js"></script> 
     <script src="js/superfish.js"></script>
     <script src="js/touchTouch.jquery.js"></script>
     <script src="js/jquery.ui.totop.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.mobilemenu.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
     <script src="js/owl.carousel.js"></script> 
     <script src="js/jquery.tabs.min.js"></script>

     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
    
<form align="center" action="exam.html?cmd=submitexam" method="post">

<%String course_name=(String)request.getAttribute("course_name");
String course_code=(String)request.getAttribute("course_code");%>
<%String exam_name=(String)request.getAttribute("exam_name");
String examdate=(String)request.getAttribute("examdate");%>
  <input type="hidden" name="exam_name"  value="<%=exam_name%>">
  <input type="hidden" name="course_code"  value="<%=course_code%>">
  <input type="hidden" name="course_name"  value="<%=course_name%>">
  <input type="hidden" name="examdate"  value="<%=examdate%>">
  
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<div style="text-align:left; font-size:20px; color:#000000; font-family:'Times New Roman', Times, serif; font-weight:bold;">Exam name:<%=exam_name%></div>

<div>&nbsp;</div>
<div align="left" style="color:#000000; font-family:'Times New Roman', Times, serif; font-size:16px; font-weight:bold; margin-top:25px;"> Short Questions </div>


<% ArrayList ashortmark = (ArrayList)request.getAttribute("ashortmark");
if(ashortmark != null){	

	Iterator itr = ashortmark.iterator();
	while(itr.hasNext()){
		String str = (String)itr.next();
		str = str.replaceAll("<p>","");
		str = str.replaceAll("</p>","");
		
		%>
<div align="left" style="color:#000000; font-family:'Times New Roman', Times, serif; margin-top:15px;"><%=str %></div>
		<%
	}
}

%>



<div>&nbsp;</div>
<div align="left" style="color:#000000; font-family:'Times New Roman', Times, serif; font-size:16px; font-weight:bold; margin-top:25px;"> Brief Questions </div>


<% ArrayList abriefmark = (ArrayList)request.getAttribute("abriefmark");
if(abriefmark != null){	

	Iterator itr = abriefmark.iterator();
	while(itr.hasNext()){
		String str = (String)itr.next();
		str = str.replaceAll("<p>","");
		str = str.replaceAll("</p>","");
		
		%>
<div align="left" style="color:#000000; font-family:'Times New Roman', Times, serif; margin-top:15px;"><%=str %></div>
		<%
	}
}

%>

</form>
  
   <div>&nbsp;</div>
  </div>   
</div>

</div></div>
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>
</html>

