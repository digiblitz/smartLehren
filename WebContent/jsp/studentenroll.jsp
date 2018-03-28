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
     <link rel="stylesheet" href="css/form.css">
     
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
	

   
     </head>
	 <body>
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Student Enroll</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
       <table width="800" >
 <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="84" style="height:30" align="center"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>


<form align="center" action="./trainer.html" name="enroll" id="enroll"method="post">
<input type="hidden" name="TrainerProcess"  value="studentenroll">
<%String username=(String)request.getAttribute("username");%>
<input type="hidden" name="username" value="<%=username%>">
<%
	String estatus=(String)request.getAttribute("estatus");
	 if(estatus!=null){
	 %>
       <tr>
        <td width="84" style="height:30" align="center"><strong><font color="#FF0000"><%=estatus%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>   
            <tr><td>
			
<tr ><td height="40" width="160" align="left"  class="textBold">Course Mentor:</td>
<td><select class="pp" name="trainername" id="trainername"  style="width:250px; height:20px;"  >
								 		<option  value="">---select---</option>
								 			<jsp:scriptlet> 
								 				
												ArrayList trainerlist = (ArrayList)request.getAttribute("trainerlist");
												if(trainerlist!=null && trainerlist.size()!=0){
													
													Iterator itr = trainerlist.iterator();
													 while (itr.hasNext()) {
													 String sr[] = (String[]) itr.next();
													
													 String first = sr[0]; 
													 String last = sr[1]; 
													 String course = sr[1]; 
															   
														
														if(course!=null)
														{
															</jsp:scriptlet>
															<option value="<%=first%><%=last%>"><%=first%><%=last%></option>
															<jsp:scriptlet>
														 }
														//System.out.println(course_name);
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		

 
<tr ><td height="40" width="160" align="left"  class="textBold">Program Name:</td>
<td><select class="pp" name="couName" id="couName"  style="width:250px; height:20px;"  >
								 		<option  value="">---select---</option>
								 			<jsp:scriptlet> 
								 				
												ArrayList list = (ArrayList)request.getAttribute("list");
												if(list!=null && list.size()!=0){
													
													Iterator itr = list.iterator();
													 while (itr.hasNext()) {
													 String sr[] = (String[]) itr.next();
													
													 String course_id = sr[0]; 
													 String course_namee = sr[1]; 
															   
														
														if(course_namee!=null)
														{
															</jsp:scriptlet>
															<option value="<%=course_namee%>"><%=course_namee%></option>
															<jsp:scriptlet>
														 }
														//System.out.println(course_name);
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
<tr ><td height="40" width="160" align="left"  class="textBold">SubProgram Name:</td>
<td><select  name="subname" id="subcou"  style="width:250px; height:20px;" >
								 		<option  value="">---select---</option>
								 			<jsp:scriptlet> 
								 				
												ArrayList courselist = (ArrayList)request.getAttribute("courselist");
												if(courselist!=null && courselist.size()!=0){
													
													Iterator itr = courselist.iterator();
													 while (itr.hasNext()) {
													 String s[] = (String[]) itr.next();
													
													 String sub_id = s[0]; 
													 String course_id= s[1]; 
													 String subcourse_name = s[2]; 
															   
														
														if(subcourse_name!=null)
														{
															</jsp:scriptlet>
															<option value="<%=subcourse_name%>"><%=subcourse_name%></option>
															<jsp:scriptlet>
														 }
														
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
								 		<tr ><td height="40" width="160" align="left"  class="textBold">Course Name:</td>
<td><select  name="subname" id="subcou"  style="width:250px; height:20px;" >
								 		<option  value="">---select---</option>
								 			<jsp:scriptlet> 
								 				
												ArrayList subjectlist = (ArrayList)request.getAttribute("subjectlist");
												if(subjectlist!=null && subjectlist.size()!=0){
													
													Iterator itr = subjectlist.iterator();
													 while (itr.hasNext()) {
													 String s[] = (String[]) itr.next();
													
													 String sub_id = s[0]; 
													 String course_id= s[1]; 
													 String subcourse_name = s[2]; 
															   
														
														if(subcourse_name!=null)
														{
															</jsp:scriptlet>
															<option value="<%=subcourse_name%>"><%=subcourse_name%></option>
															<jsp:scriptlet>
														 }
														
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
<tr ><td height="40" width="160"  align="left"  class="textBold">Start Date:</td>
<td><input type="text" name="startdate"  style="width:250px; height:20px;">
<a href="javascript:show_calendar('document.enroll.startdate', document.enroll.startdate.value);"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a></td><td width=10 style="color:red" align="right">*</td>
</tr>

<tr ><td height="40" width="160"  align="left"  class="textBold">End Date:</td>
<td><input type="text" name="enddate"  style="width:250px; height:20px;">
<a href="javascript:show_calendar('document.enroll.enddate', document.enroll.enddate.value);"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a></td><td width=10 style="color:red" align="right">*</td>
</tr>






 
<tr><td></td><td width="200"><label><img src="images/submit.jpg"  width="20" height="20" alt="submit" style="cursor:pointer"/><input type="submit" name="appenroll" style="background-color: transparent; border:none; cursor:pointer; width:48px; height:20px;" value="Submit" onClick="return(onValidate());"></label>
<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label>
</td></tr>

</form></table>

  </div>   
</div>  
  </div>   
</div>
<div>&nbsp;</div>
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>
<script type="text/javascript">

/*
function onValidate()
{
	if(document.enroll.setrole.value==""){
		alert("Role name cannot be empty");
		document.enroll.setrole.focus();
		return false;
	}
	if(document.enroll.couName.value==""){
		alert("Category name cannot be empty");
		document.enroll.couName.focus();
		return false;
	}
	if(document.enroll.subname.value==""){
		alert("Course name cannot be empty");
		document.enroll.subname.focus();
		return false;
	}
	if(document.enroll.startdate.value==""){
		alert("Startdate cannot be empty");
		document.enroll.startdate.focus();
		return false;
	}
	if(document.enroll.enddate.value==""){
		alert("Lastdate cannot be empty");
		document.enroll.enddate.focus();
		return false;
	}
	
	return true;
}*/
</script>
</html>

