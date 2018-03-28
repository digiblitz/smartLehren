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
	
     <link rel="stylesheet" href="css/gender.css">
	 
     <script src="js/datetimepicker_css.js"></script>
       <script src="js/script.js"></script>   

    
    <script src="js/lib/jquery.js"></script>
	<script src="js/dist/jquery.validate.js"></script>	
          
          
          <style>	
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
          
          <script>
	$(document).ready(function() {
		
		
			 	 jQuery.validator.addMethod("greaterThan", 
function(value, element, params) {
    if (!/Invalid|NaN/.test(new Date(value))) {
        return new Date(value) > new Date($(params).val());
    }
    return isNaN(value) && isNaN($(params).val()) 
        || (Number(value) > Number($(params).val())); 
},'Must be greater than {0}.');

jQuery("#assign").validate({                      
        rules: {                    
                coursecode:{
					required: true
				},
				assignname:{
					required:true
				},
				question:{
					required: true
				},
                allowdate:{
                    required:true
                },
                 lastdate:{
                    required:true,
                    greaterThan: "#allowdate"              
                }
        },
        messages: {
               
			   coursecode:"Please select Course code",
			   assignname:"Please give Assignment name",
			   question: "Please provide question",
               allowdate:"Please select date",
               lastdate:
               { 
                    required:"Please select date",
                    greaterThan:"End date must be greater than start date "
               }
        },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}			
    });
	});
	</script>
	         
          
     </head>
	 <body class="page1" id="top">
 <headere><div>
  
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
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Event Report</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
    <% String user_id = (String)request.getAttribute("user_id");
    String show = (String)request.getAttribute("show");
    String username = (String)request.getAttribute("username");
        	String programname = (String)request.getAttribute("programname");
        	String subprogram = (String)request.getAttribute("subprogramname");  
        	
        	String nameidentification = (String)request.getAttribute("nameidentification");
        	String programidentification = (String)request.getAttribute("programidentification");
        	String program_id = (String)request.getAttribute("program_id");
        	String sub_program_id = (String)request.getAttribute("sub_program_id"); 
        	String startdate = (String)request.getAttribute("allowdate");
        	String enddate = (String)request.getAttribute("lastdate");
       %>
      <table   width="1100" > <br><br>
	 <tr><td >
        <FORM ACTION="report.html?cmd=eventreportschedule" METHOD=POST id="assign" >
		 <input type="hidden" name="user_id" value="<%=user_id%>">
		 
		 <input type="hidden" name="program_id" value="<%=program_id%>">
		 <input type="hidden" name="sub_program_id" value="<%=sub_program_id%>">
		 
<table width="550" align="center" style="margin-left:250px; margin-top:20px">

      <tr >
			<td height="40" width="150">
				<label class="lab">Program Name:</label>
			</td>
			<td>
				<label class="lab"><input id="programname" name="programname" type="text" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("programname"))%>" readonly></label>
			</td>			
		</tr>

		
                            
		<tr >
			<td height="40" width="305" >
				<label class="lab">Sub Program Name:</label>
			</td>
			<td align="left">
	<label class="lab"><input id="subprogram" name="subprogram" type="text" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("subprogramname"))%>" readonly></label>
			</td>			
		</tr>

			
 <tr ><td height="40" width="305"><label class="lab">Start Date:</label></td>
 
			<td height="40" width="616">
			<label class="lab">
<input  type="text" name="allowdate" style="font-family:'Times New Roman', Times, serif; width:165px; height:20px;" value="<%=nullCheck((String)request.getAttribute("allowdate"))%>" id="allowdate">
  
 <img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
		style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('allowdate')" />
       </label>
            
					</td>
				</tr>

		<tr ><td height="40" width="305">
		<label class="lab">Last Date:</label></td>
			<td height="40" width="616">
			
<label class="lab"><input   type="text" name="lastdate"  style="font-family:'Times New Roman', Times, serif; width:165px; height:20px;" value="<%=nullCheck((String)request.getAttribute("lastdate"))%>" id="lastdate">
<img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
	style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('lastdate')" /></label>
   
					</td>
		</tr>
		 
<tr  align="center" ><td colspan="2">
<img src="images/submit.jpg"  alt="submit" width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:55px; height:20px;">
&nbsp;
<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>
</table>
   </FORM></td></tr></table></div>  </div>  
   
   <!--  =============================================================================================== -->
   <%if(show != null){ %>
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0; 
  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; width:100%;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Name: <%=nullCheck((String)request.getAttribute("username")) %></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
 <FORM id="form" METHOD=POST >
 
 <%-- <table class="attendancestatus" width="100%">

<%if(programidentification != null){ %>

<tr height="40"><th align="center">Course Mentor List</th><th align="center">Individual</th></tr>		
					<%
					ArrayList coursementorlist = (ArrayList)request.getAttribute("roledetails1");
					
					if(coursementorlist != null){
						Iterator itr = coursementorlist.iterator();
						while(itr.hasNext()){		
							String strarr[] = (String[])itr.next();
							String coursementorname = strarr[0];
							String coursementorid = strarr[1];
					%>
<tr>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=coursementorname%></div></td>
<td><a href="#" style="height:40px; margin-top:15px;" onClick="showVal('<%=coursementorid%>','<%=coursementorname%>','<%=program_id%>','<%=sub_program_id%>','<%=startdate%>','<%=enddate%>','<%=user_id%>','<%=username%>');">click</a></td>
</tr>
					<%}}
						}
					else{
					%>		
<tr><td colspan="4">No Records Found</td></tr></table>
					<% }
		if( nameidentification != null){
					%> --%>
 
<table class="attendancestatus" width="100%">

<tr height="40"><th align="center">Event</th><th align="center">Start Date</th><th align="center">End Date</th><th align="center">Description</th>

						<% ArrayList eventdetails = (ArrayList)request.getAttribute("eventdetails"); 
						
							
						if(eventdetails != null && eventdetails.size()!= 0){
							Iterator itr = eventdetails.iterator();
							while(itr.hasNext()){
								String userlist[] = (String[])itr.next();								
								String title = userlist[0];	
								String startdate1 = userlist[1];
								String enddate1 = userlist[2];
								String description = userlist[3];								
						%>
						
<tr>

<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=title%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=startdate1%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=enddate1%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=description%></div></td>
</tr>

					<%}}	
					%>		

					
		 					</table>
							<br><br>
			</FORM>		
			
</div></div>
 <%} %>
  <div>&nbsp;</div>
       
       </div>   
</div> 

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
