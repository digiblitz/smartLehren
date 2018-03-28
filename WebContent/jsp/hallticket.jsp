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
<head>
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
       <script  src="js/ts_picker.js"></script>
     <script src="js/TMForm.js"></script> 
	 
	<style>
	
	
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

.attendancestatus tr:nth-child(odd){ 
		background: #F2F2EB;
}
	
.attendancestatus tr:nth-child(even){
		background: #ffffff;
}
	
	.head{	
		font-family:"Times New Roman", Times, serif;
		font-size: 20px;
		color: #000000;
		float:right;
		margin-right:200px;
		margin-top:30px;
	}
	
	.logo{
		height:100px;
		width:100px;
		margin-left:300px;
		float:left;
	}
	.logo1{
		height:100px;
		width:125px;
		margin-right:100px;
		margin-bottom:5px;
		float:right;
	}
	.course{
		margin-left:700px;
		font-family:"Times New Roman", Times, serif;
		font-size: 18px;
		color: #000000;
	}
	
	.studetails{
		color:#b70000;
		text-align:left;
		margin-top:25px;
		font-size:20px; 
		font-family:"Times New Roman", Times, serif;
	}
	.studetails1{
		color:#000000;
		text-align:left;
		margin-top:25px;
		font-size:20px; 
		font-family:"Times New Roman", Times, serif;
	}
	
	.examdetails{
		margin-top:200px;
		margin-left:100px;
		margin-right:50px;
	}
	
	</style>
	
</head>
<body class="page1" id="top">
 <header><div>

<div><%@ include file = "../../include/header.jsp" %></div>
<div> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></header>


<div class="content">
  <div class="container_123 ">
  <div class="grid_8">
      <div>&nbsp;</div>
	  
 <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">



<div style="height:150px;">
<div class="logo"><img src="images/tnou-logo.png" alt="Tamilnadu open university" height="100" width="100"></div><div class="head"><label style="font-weight:bold; font-size:35px; height:150px; width:150px;" >Tamilnadu Open University</label> <br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Anna salai, saidapet, Chennai-15</div>
</div>


<div height="100%">
<div style="float:left; margin-left:100px;">
<%
String programname = (String)request.getAttribute("progname");
String subprogramname = (String)request.getAttribute("suprogname");
									ArrayList studentlsist = (ArrayList)request.getAttribute("studentlsist");
									if(studentlsist!=null && studentlsist.size()!=0){
										Iterator cou = studentlsist.iterator();
										int i=0;
										while(cou.hasNext()){
											String[] temp = (String [])cou.next();
											
											 String register_no = temp[0];
								            	String firstname = temp[1];
								            	String lastname = temp[2];
								            	String program_id = temp[3];
								            	String sub_program_id = temp[4];
								            	String batch = temp[5];
											
											%>


		 <label class="studetails">Register No:</label> <label class="studetails1"><%=register_no %></label><br><br>
			<label class="studetails">Name:</label> <label class="studetails1"><%=firstname+" "+lastname %></label><br><br>
			<label class="studetails">Program Name:</label> <label class="studetails1"><%=programname %></label><br><br>
			<label class="studetails">Sub Program Name:</label> <label class="studetails1"><%=subprogramname %></label>
					
		   
			<% 
				}}			
				%>
	</div>			
<div class="logo1"><img src="data:image/jpeg;base64,<%=imageData%>"   width="150" height="150" style="vertical-align:middle;"></div>



</div>


<div class="examdetails">

<table width="870" class="attendancestatus" style="font-family:'Times New Roman', Times, serif; color:#000000;">
            <tr  style="font-size:18px; height:20px; font-weight:bold">
			<td width="150"  height="50" >Subject Name</td>
			<td width="150"  height="50" >Exam Date</td>
			<td width="150"  height="50" >Section</td>
			<td width="210"  height="50" >Start Time</td>
			<td width="150"  height="50" >End Time</td>
			
		   </tr>

				<%
									ArrayList examdetails = (ArrayList)request.getAttribute("examdetails");
									if(examdetails!=null && examdetails.size()!=0){
										Iterator cou = examdetails.iterator();
										int i=0;
										while(cou.hasNext()){
											String[] coursena = (String [])cou.next();
											
											String subject = coursena[0];
											String examdate = coursena[1];
											String section = coursena[2];
											String starttime = coursena[3];
											String endtime = coursena[4];
											
											%>

 <tr>
		  <td  height="50" ><%=subject%></td>
			<td  height="50" ><%=examdate%></td>
			<td  height="50" ><%=section%></td>	
			<td  height="50" ><%=starttime%></td>	
			<td  height="50" ><%=endtime%></td>
			
		   </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19"colspan="5" align="center"><strong>Currently you have no exam</strong></td>
           </tr><%} %>
           </table>
		   
		  </div>

</div></div>

</div>
</div></div>




 <footer id="foot">   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
  
  </footer>
</body>
</html>
