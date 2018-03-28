<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
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
     
     <script>

      
 
        $(document).ready(function(){  
           $(".menu li a").each(function() { 

               if ($(this).next().length > 0) { 

                   $(this).addClass("parent");  
               };  
           })  
           var menux = $('.menu li a.parent');  
           $( '<div class="more"><img src="btn-hamburger.png" alt=""></div>' ).insertBefore(menux);  
           $('.more').click(function(){  
                $(this).parent('li').toggleClass('open');  
           });  
           $('.menu-btn').click(function(){  
              $('nav').toggleClass('menu-open');  
          });  
       });  
    
	


     </script>
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:20px;
	float:right;
}
	</style>
	
     </head>
	 <body class="page1" id="top">
	<%
	String programId = (String) request.getAttribute("progId");
	if(programId==null){
		programId = "";
	}
	
	

%>
	
 <headere><div>
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->

<%String fromCourseMentor = (String)request.getAttribute("fromCourseMentor"); %>


<div class="content">

<%if(fromCourseMentor == null){%>

  <div class="container_12 ">
     
      <%String firstn=(String)request.getAttribute("firstname"); %>
      <%String lastn=(String)request.getAttribute("lastname"); %>
	  
       <div style="color:#000000; font-size:20px;" align="right"><label class="lab">Student Name: <%=firstn %><%=lastn %> </label></div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Assign Course</div>
<div class="pps" style=" font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
       
     
<table width="800" >
<form name="AssignCourseforStudent" id="AssignCourseforStudent" action="./trainer.html" method="post">
<input type="hidden" name="TrainerProcess"  value="AssignCourseforStudent">
<%String user_id=(String)request.getAttribute("user_id"); 
String category=(String)request.getAttribute("category");
String semester=(String)request.getAttribute("semester");
String pro_id=(String)request.getAttribute("pro_id");
String subpro_id=(String)request.getAttribute("subpro_id");%>

<input type="hidden" name="user_id"  value="<%=user_id%>">
<input type="hidden" name="category"  value="<%=category%>">
<input type="hidden" name="semester"  value="<%=semester%>">
<input type="hidden" name="pro_id"  value="<%=pro_id%>">
<input type="hidden" name="subpro_id"  value="<%=subpro_id%>">
<input type="hidden" name="firstname"  value="<%=firstn%>">
<input type="hidden" name="lastname"  value="<%=lastn%>">
<%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	 <tr height="45"><td style=""></td><td colspan="2" style="font-family:'Times New Roman', Times, serif; font-size:18px;color:red"><%=status%></td></tr><%} %>
	
	 								 
<tr height="130">
<td  height="40" width="100" align="left"  class="textBold">Select Course:</td>
	 								  <td width="200">

					<%ArrayList student =(ArrayList)request.getAttribute("student");				
									int i=1;
									if(student!=null && student.size()!=0){
									
									Iterator itr = student.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String course_code = sr[0]; 
									 String course_name = sr[1]; 
											   
						
											%>                    
		<input type="checkbox" name="checkbox_<%=i%>" value="<%=course_code%>/<%=course_name%>"><%=course_name%><br>
                      <%i++; }}%>
					 											 
								 		</td></tr>
										
				
				
	<tr height="50">
<td  height="40" width="100" align="left"  class="textBold">Course Mentor Name:</td>
	 								  <td width="200">
	 	<select name="cmname" id="cmname" style="font-family:'Times New Roman', Times, serif; width:230px; height:20px;">
								 		
						<%ArrayList cmlist =(ArrayList)request.getAttribute("cmlist");									
									if(cmlist!=null && cmlist.size()!=0){
									
									Iterator itr = cmlist.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									 String userid = sr[0];
									 String firstname = sr[1]; 
									 String lastname = sr[2]; 
											   
											
											%> 

                      <option value="<%=userid%>" ><%=firstname%>  <%=lastname%></option>

                      <% }}%>
                    </select></td></tr>		
											
										
									

	  <td align="center" colspan="2">
	  	  <img src="images/assign.jpg"   alt="Assign" width="20" height="20" style="cursor:pointer"/>
		  <input type="submit" name="Insert" value="Assign" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return onValidate();" >
		&nbsp;<img src="images/Cancel.png" alt="cancel"  width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
								 		</td></tr>	
								 		
								 		
	

</form>	   

</table>				
</div></div>
     <br><br>  
	 <div >&nbsp;</div>
	<div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Already Assigned Course</div>
<div class="pps" style=" font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;"> 
								 		<table width="800" >
<tr>
											
											<td class="tableRight" colspan="5" ></td>		
										   	
											</tr> 
		 							
		 							<%ArrayList courselists =(ArrayList)request.getAttribute("corslist");
									
									if(courselists!=null && courselists.size()!=0){
									
									Iterator itr = courselists.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String co_code = sr[0]; 
									 String co_name = sr[1]; 
											   
											
											%> 
											<tr>
											
		<td class="tableRight" colspan="5" ><div  style="margin-bottom:10px;" >
		<a href="#" onClick="showVal('<%=co_code%>','<%=co_name%>');"><%=co_name%></a></div></td>		
										   	
											</tr> 
										
											<%
											}
											}else{%>
											
											<tr>
											<td colspan="2" align="center">
										<label class="lab">	No records found </label>
											</td>
											
											</tr>
										<%}%>
		</table>
								 		
		<br>						 		
    </div>   </div> 
  </div> 

<%}else{%>


<div class="container_12 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Program</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
<div align="center">
<table border="0" >
<form name="Assigncourse" id="Assigncourse" action="./login.html" method="post">
<input type="hidden" name="LoginProcess"  value="AssignCourse">
<%String user_id=(String)request.getAttribute("user_id"); %>
<input type="hidden" name="user_id"  value="<%=user_id%>">

<input type="hidden" name="fromCourseMentor"  value="<%=fromCourseMentor%>">

<%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	 <tr height="50"><td colspan="3 " style="color:red"><label class="lab"><%=status%></label></td></tr><%} %>
	
	 								 
<tr>
<td  height="40" align="left"  class="textBold"><label class="lab">Program Name</label></td><td width="5">&nbsp;</td>
	 								  <td>
	 								  <select name="selProg" id="selProg" style="width:230px; height:25px;" onChange="postData('selProg');">
								 		<option selectedselProg="selected" value=""><label class="lab">Select Program Name</label></option>
								 			 <%
									ArrayList progList = (ArrayList)request.getAttribute("progList");
									if(progList!=null && progList.size()!=0){
										Iterator itProgList = progList.iterator();
										while(itProgList.hasNext()){
											String[] progLists = (String [])itProgList.next();
											
											String progId = progLists[0];
											String progName = progLists[1];
											if(programId.equals(progId)){
											%>
                      <option value="<%=progId%>" selected="selected"><label class="lab"><%=progName%></label></option>
                      <%
											 }
											 
											 else{
											 %>
                      <option value="<%=progId%>"><label class="lab"><%=progName%></label></option>
                      <%
											 }
										}
									}
							%>
                    </select>
											 
								 		</td></tr>
										
				
				
	<tr>
<td  height="40" align="left"  class="textBold"><label class="lab">Sub Program Name</label></td><td width="5">&nbsp;</td>
	 								  <td>
	 								  <select name="selSubProg" id="selSubProg" style="width:230px; height:25px;">
								 		<option selected="selected" value=""><label class="lab">Select Sub Program Name</label></option>
								 			 <%
									ArrayList subProgList = (ArrayList)request.getAttribute("subProgList");
									if(subProgList!=null && subProgList.size()!=0){
										Iterator itSubProgList = subProgList.iterator();
										while(itSubProgList.hasNext()){
											String[] subProgLists = (String [])itSubProgList.next();
											
											String subProgId = subProgLists[0];
											String subProgName = subProgLists[1];
											
											%>
                 			
                      <option value="<%=subProgId%>"><%=subProgName%></option>
                      <%
										}
									}
							%>
                    </select>
											 
								 		</td></tr>		
											
										
										<tr>
<td  height="40"  align="left"  class="textBold"><label class="lab">Semester</label></td><td width="5">&nbsp;</td>
	 								  <td>
	 						<select name="Semester" id="Semester" style="width:150px; height:25px;">
								 		<option  value=""><label class="lab">Select Semester</label></option>
								 			 <%
									for(int i=1;i<=8;i++){
										String semLabel="";
									if(i==1){	
								 semLabel="st Semester";	}
									else if(i==2){
								 semLabel="nd Semester";	}
									else if(i==3){
								 semLabel="rd Semester";	}	
									else{
								semLabel="th Semester";	}			
									
											%>
                 			
                      <option value="<%=i%>"><label class="lab"><%=i%><%=semLabel%></label></option>
                      <%
										}
									
							%>
                    </select>
								 		</td></tr>			
				
			
				
			
			
			<tr>
<td height="40" align="left"  class="textBold"><label class="lab">Course Code/CourseName:</label></td><td width="5">&nbsp;</td>
	 								  <td>
									  <select name="courseCode" style="width:250px; height:25px"  id="courseCode" >
									  <option  value=""><label class="lab">Select CourseCode/CourseName</label></option>
	 				
					<%ArrayList assigncourse1 =(ArrayList)request.getAttribute("coursecode");
									
									if(assigncourse1!=null && assigncourse1.size()!=0){
									
									Iterator itr = assigncourse1.iterator();
									 while (itr.hasNext()) {
									 String sr1[] = (String[]) itr.next();
									 //String sub_id = sr[0];
									 String course_code= sr1[0]; 
				                     String course_name = sr1[1]; 
											   
											
											%> 
					<option value="<%=course_code%>/ <%=course_name%>"><label class="lab"><%=course_code%> / <%=course_name%></label></option><%}} %></select>
								 		</td></tr>		
				
				

	 								  <td align="center" colspan="3"><img src="images/assign.jpg"   alt="assign" width="20" height="20" style="cursor:pointer"/>
<input type="submit" name="Insert" value="Assign" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());" >
&nbsp;<label><img src="images/Cancel.png" alt="cancel"  width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="submitbutton" style="background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label>
								 		</td></tr>		
	

</form>	   

</table>				
</div></div></div>
     
       <br><br>  
	<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Already Assigned Course:</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 12px;">
								 		<table >
<tr>
											
											<td class="tableRight" colspan="5" ></td>		
										   	
											</tr> 
		 							
		 							<%ArrayList courselists =(ArrayList)request.getAttribute("cmList");
									
									if(courselists!=null && courselists.size()!=0){
									
									Iterator itr = courselists.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String co_code = sr[0]; 
									 String co_name = sr[1]; 
											   
											
											%> 
											<tr>
											
		<td class="tableRight" colspan="5" ><div  style="margin-bottom:10px; color:#000000;" ><a href="#" onClick="showVal('<%=co_code%>','<%=co_name%>');"><%=co_name%></a></div></td>		
										   	
											</tr> 
										
											<%
											}
											}else{%>
											
											<tr>
											<td colspan="2" align="center" style="color:#000000;">
											No records found
											</td>
											
											</tr>
										<%}%>
		</table>
				</div>	</div>  			 		
		<br>						 		
     
  </div>  
  
<%}%>
  
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

	

function onValidate()
{

if(document.AssignCourseforStudent.cmname.value==""){
		alert("CourseMentor Name cannot be empty");
		document.AssignCourseforStudent.cmname.focus();
		return false;
	}
	return true;
}
</script>
</html>

