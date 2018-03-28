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
       <%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
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

	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
	
     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
      
     

<form align="center" action="./trainer.html" >
<input type="hidden" name="TrainerProcess"  value="addassign">
<%String course_code = (String)request.getAttribute("course_code"); %>
<%String course_name = (String)request.getAttribute("course_name"); %>
<%String exam_name = (String)request.getAttribute("exam_name");
String exam_id = (String)request.getAttribute("exam_id"); 
%>

<input type="hidden" name="course_code"  value="<%=course_code%>">
<input type="hidden" name="exam_name"  value="<%=exam_name%>">

<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


<div style="text-align:left; font-size:18px; font-family:'Times New Roman', Times, serif; color:#000000; font-weight:bold; margin-bottom:10px;"  >Exam name:<%=exam_name%></div>
<div style="margin-top:25px; text-align:left; font-size:15px; font-family:'Times New Roman', Times, serif; color:#000000; font-weight:bold; margin-bottom:10px;"  >Short Questions</div>

<%String tmquestion=(String)request.getAttribute("tmquestion");


String criteria= "</p>";
String [] strarr = tmquestion.split(criteria);
for( int i =0; i<strarr.length; i++)
{%>
 <div align="left" style="font-family:'Times New Roman', Times, serif; font-size: 14px; color:#000000"><%=strarr[i]%></div>
<%} %>
<input type="hidden" name="question"  value="<%=tmquestion%>">

<div style="margin-top:25px; text-align:left; font-size:15px; font-family:'Times New Roman', Times, serif; color:#000000; font-weight:bold; margin-bottom:10px;"  >Brief Questions</div>
<%String smquestion=(String)request.getAttribute("smquestion");


String criteria1= "</p>";
String [] strarr1 = smquestion.split(criteria1);
for( int i =0; i<strarr1.length; i++)
{%>
 <div align="left" style="font-family:'Times New Roman', Times, serif; font-size: 14px; color:#000000"><%=strarr1[i]%></div>
<%} %>
<input type="hidden" name="question"  value="<%=smquestion%>">


<div style="font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px"><a href="exam.html?cmd=valuationanswers&course_code=<%=course_code%>&course_name=<%=course_name%>&exam_name=<%=exam_name%>&exam_id=<%=exam_id%>">View/Grade</a></div>

<div align="center"><label><img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div></td></tr></table>

</div></div></form>	
							
       
      </div>
     
      <div class="clear"></div>  
      
      <div class="clear"></div>
   <div>&nbsp;</div>
  </div>   
</div>
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
   
  </footer>
</body>
</html>

