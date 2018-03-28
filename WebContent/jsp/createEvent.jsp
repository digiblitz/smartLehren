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
<meta charset="utf-8">

     <meta name = "format-detection" content = "telephone=no" />
    <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">
     
 <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
 <script src="js/datetimepicker_css.js"></script>

   <style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
	}
	</style>
  
	
     </head>
	 <body class="page1" id="top" onLoad="initload();">
	
 <headere><div>

<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Request Form</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
<table >

  <form  name="createEvent" align="center" action="./trainer.html" method="post" id="createEvent"  >
<input type="hidden" name="TrainerProcess"  value="createEvent">

	<tr align="center"><td colspan="2"><div  style="font-family:'Times New Roman', Times, serif; margin-bottom:20px; color:#FF0000">All Fields are * required.</div></td>
</tr>

			<tr>
			<td>
			<table width="550" align="center" style="margin-left:250px; margin-top:20px">

	
		<jsp:scriptlet> 
			
				ArrayList programList = (ArrayList)request.getAttribute("programList");
					if(programList!=null && programList.size()!=0){
					
						Iterator itr = programList.iterator();
							 while (itr.hasNext()) {
							 String sr[] = (String[]) itr.next();
							 String program_id = sr[0]; 
							 String subprogram_id = sr[1]; 
								   
					
				
				</jsp:scriptlet>
											
              <input type="hidden" name="program_id" value="<%=program_id%>">
               <input type="hidden" name="subprogram_id" value="<%=subprogram_id%>">
             <jsp:scriptlet> 
				 }										 
					}
				</jsp:scriptlet>
              
											
					<tr>
<td  height="40" width="157" ><label class="lab">Course Name:</label></td>
	 								  <td width="350" align="left">
	 								<label class="lab">  <select name="coursecode" id="coursecode" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" >
								 <option value="">Select Course</option>
								 			<% 
								 				
								 			ArrayList cmcourselist =(ArrayList)request.getAttribute("courselist");
											
											if(cmcourselist!=null && cmcourselist.size()!=0){
											
											Iterator itr = cmcourselist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String course_code = sr[0]; 
											 String course_name = sr[1];
											  
														
														if(course_name!=null)
														{
															%>
															<option value="<%=course_code%>"><%=course_name %></option>
															<% 
														 }
													}
												}
											%>
											 
		 		  </select></label></td></tr>
								 		

								 		
			
		<tr height="40">
		<td><label class="lab">Title</label></td>
		<td><input type="text" name="title" id="title" style="font-family:'Times New Roman', Times, serif;"></td>
		</tr> 
		
		<tr height="40">
		<td><label class="lab">Start Date</label></td>
		<td><input type="text" name="startdate" id="startdate" style="font-family:'Times New Roman', Times, serif;">
		<img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
		style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('startdate')" />
		</td>
		</tr> 
		
		<tr height="40">
		<td><label class="lab">End Date</label></td>
		<td><input type="text" name="enddate" id="enddate" style="font-family:'Times New Roman', Times, serif;">
		<img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
		style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('enddate')" />
		
		</td>
		</tr> 
								 		
		<tr height="40">
			<td><label class="lab">Description</label></td>
			<td><textarea cols="50" rows="5" name="description" id="description" style="font-family:'Times New Roman', Times, serif;"></textarea></td>
		</tr>		
 
 

</table>
</td></tr>

<tr ><td height="40" colspan="2" align="center"><br><label><img src="images/create.jpg"  alt="submit" width="20" height="20" style="cursor:pointer"><input  type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"   ></label>
&nbsp;<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label>
</td>
</tr>
</form>
						
</td>
</tr>
</table></div>   </div>   
     <br><br>  
    
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

</html>

