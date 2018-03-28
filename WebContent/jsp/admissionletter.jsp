<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="head">
<title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">
	<link rel="stylesheet" type="text/css" media="print" href="print.css" />
     <link rel="stylesheet" href="css/gender.css">
	      <script src="js/jquery.js"></script>
     
	 
	  <script src="js/script.js"></script>   
          <script src="js/touchTouch.jquery.js"></script>
<script src="js/jquery.min.js"></script>

<script>


function myFunction() {
	document.getElementById("header").style.display = "none";
	document.getElementById("foot").style.display = "none";
	document.getElementById("generatepdf").style.display = "none";
    window.print();	
}

</script>

          
          <style>	
		  
		  @page 
    {
        size:  auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */
    }
	
#assign label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
}

assign.assign label.error, label.error {
		color: red;
		font-size:17px;
}	
	
.lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
.logo{
    width:120px;
    height:120px;
}

.esign{
    width:180px;
    height:80px;
}

.certificate{
	width: 740px;
	margin-left: 160px; 
	margin-top:50px;
	height:950px;
}

.univname{
	font-family:"Times New Roman", Times, serif;
	font-size:35px;
	margin-left:150px;
	margin-top:20px;
	color:#b70000;	
}

.univaddr{
	font-family:"Times New Roman", Times, serif;
	font-size:25px;
	margin-left:150px;
	color:#b70000;
}

.admissioncontents{
	font-family:"Times New Roman", Times, serif;
	font-size:25px;	
}


</style>
	         
          
     </head>
	 <body class="page1" id="top">
 <headere id="header"><div>
  
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>


<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>

				<%
				String universityname = (String)request.getAttribute("universityname");
				String universityaddress = (String)request.getAttribute("universityaddress");
				String logodata = (String)request.getAttribute("logodata");				
				String signdata = (String)request.getAttribute("signdata");
				String name = (String)request.getAttribute("name");
				String programname = (String)request.getAttribute("programname");
				String subprogramname = (String)request.getAttribute("subprogramname");
				%>

<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">

<% if(universityname != null && universityaddress != null && logodata != null && signdata != null && name != null && programname != null && subprogramname != null){
%>

<div class="certificate">

<table>
<tr><td>
    <img src="data:image/jpeg;base64,<%=logodata %>" class="logo">	
	</td>
	
	<td>
<div class="univname"><%=universityname %></div>&nbsp;&nbsp;&nbsp;
<div class="univaddr"><%=universityaddress %></div>
</td></tr>
</table>    
    <br><br>
<div>
<textarea name="contents" class="admissioncontents" rows="20" cols="50">
Dear <%=name%>,
				From <%=subprogramname%> department of <%=programname%> Degree.

</textarea>
</div>	
<br><br>


<div style="font-family:'Times New Roman', Times, serif; font-size:35px; color:#b70000;">
Signature
</div>

<div style="margin-top:10px; float:left;">
 <img src="data:image/jpeg;base64,<%=signdata %>" class="esign">
</div>

<div style="font-family:'Times New Roman', Times, serif; font-size:20px; margin-top:10px; margin-right:100px; float:right;">
 <label style="color:#b70000;">Name: </label><label> <%=name%></label><br><br>
 <label style="color:#b70000;">Department: </label><label> <%=subprogramname%></label><br><br>
 <label style="color:#b70000;">Degree: </label><label> <%=programname%></label><br><br>
</div>

</div>

<button id="generatepdf" onClick="myFunction()" style="font-family:'Times New Roman', Times, serif;">generate PDF</button>
  
 <%}else{ %>
 
 <div style="font-family:'Times New Roman', Times, serif; font-size:20px; color:#b70000;">
 <marquee behavior="scroll" onMouseOver="this.stop();" onMouseOut="this.start();">Administration will upload your Admission Letter Very Soon.</marquee></div>

 <% }%>
	
</div></div>
       </div>   
</div> 

 <!--==============================footer=================================-->
  <footer id="foot">   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
  
  </footer>
</body>



</html>
