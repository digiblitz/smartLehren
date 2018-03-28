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

	 
	 <style>
 label{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}


table.attendancestatus table{
	border:1px solid black;
	align:center;
	height:25px;
}

table.attendancestatus tr{

	height:25px;
}

table.attendancestatus th{
	border:1px solid black;
	align:center;
	height:25px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.attendancestatus td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:25px;
	font-family:"Times New Roman", Times, serif;
	
}	

.attendancestatus tr{
		background: #b8d1f3;
	}

.attendancestatus tr:nth-child(odd){ 
		background: #b8d1f3;
}
	
.attendancestatus tr:nth-child(even){
		background: #dae5f4;
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
    


<%String user_id=(String)request.getAttribute("user_id");

%>
  <input type="hidden" name="user_id"  value="<%=user_id%>">
  
    
  
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


<%
	String restatus=(String)request.getAttribute("restatus");
	 if(restatus!=null){
	 %>
                <tr> <td colspan="2"><span style="font-family:'Times New Roman', Times, serif; font-size:20px; "><font color="#FF0000"><%=restatus%></font></span></td>  <%
	}
	
	%>

<form align="center" action="exam.html?cmd=submitexam" method="post">

<table class="attendancestatus" width="100%" id="panel" style="margin-top:50px;">

<tr><td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" >Exam Details</div></td></tr>
<tr height="40"><th align="center">Course Name</th><th align="center">Semester</th><th align="center">Exam Name</th><th align="center">Exam Date</th><th align="center">Your Mark</th><th align="center">Total Mark</th><th align="center">Status</th><th align="center">Revaluation</th></tr>


<% ArrayList sarrearlist = (ArrayList)request.getAttribute("sarrearlist");
if(sarrearlist != null && sarrearlist.size() != 0){	

	Iterator itr = sarrearlist.iterator();
	while(itr.hasNext()){
		String str[] = (String[])itr.next();
		String exam_name = str[0];	
    	String exam_date = str[1];    	
    	String totalmark = str[2];
    	String marktook = str[3];
    	String coursename = str[4];
    	String status = str[5];
    	String semester = str[6];
    	String course_code = str[7];
    	String revaluation_status = str[8];
				
		%>
		<tr>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=coursename%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=semester%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=exam_name%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=exam_date%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=totalmark%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=marktook%></div></td>
<% if(status.equalsIgnoreCase("Pass")){%>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=status%></div></td>
<% }else{%>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px; color:#b70000;" ><%=status%></div></td>
<%} %>

<%if(revaluation_status.equalsIgnoreCase("Not Applied")){
	%>

<td><a href="#" onClick="document.location.href='./exam.html?cmd=assignrevaluation&user_id=<%=user_id %>&exam_name=<%=exam_name %>&coursename=<%=coursename %>&exam_date=<%=exam_date %>&course_code=<%=course_code %>'" style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px;" >Apply</a></td>
		<%}else{
			%>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" >Applied</div></td>		
		
		<%} %>
		
		</tr><%
	}
}else{
	
		%>
<tr>
<td colspan="8"><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" >No Arrears</div></td>
</tr>	
<%
	
}

%>

</table>

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

