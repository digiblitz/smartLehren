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
		
		
jQuery("#assign").validate({                      
        rules: {
        	month:{
				required:true
                },
                 year:{
                    required:true                                
                }
        },		
		groups:{
			somegroup:"month year"
		},
        messages: {
        	month:"Please Select valid Month",        	
        	year:"Please Select valid Year",        	
        },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}			
    });
	});
	
	function showVal(coursementorid,coursementorname,program_id,sub_program_id,startdate,enddate,user_id,username){ 
  		 var coursementorid = coursementorid;		 
  		 var coursementorname = coursementorname;
  		var program_id = program_id;
  		var sub_program_id = sub_program_id;
  		var startdate = startdate;
  		var enddate = enddate;
  		var user_id = user_id;
  		var username = username;
		window.location.assign('report.html?cmd=initmonthlyscheduleindividual&coursementorid='+coursementorid+'&coursementorname='+coursementorname+'&program_id='+program_id+'&sub_program_id='+sub_program_id+'&startdate='+startdate+'&enddate='+enddate+'&user_id='+user_id+'&username='+username);			
      }
	  
	  
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
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Monthly Report</div>
<div class="pps" style="font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
    <% String username = (String)request.getAttribute("username");
	
        	String programname = (String)request.getAttribute("programname");
        	String subprogram = (String)request.getAttribute("subprogramname");     	
        	
        	String program_id = (String)request.getAttribute("program_id");
        	String sub_program_id = (String)request.getAttribute("sub_program_id"); 
        	String startdate = (String)request.getAttribute("startdate");
        	String enddate = (String)request.getAttribute("lastdate");
			System.out.println(startdate+" "+enddate);
        	String user_id = (String)request.getAttribute("user_id");
        	
        	String show = (String)request.getAttribute("show");
        	String nameidentification = (String)request.getAttribute("nameidentification");
        	String programidentification = (String)request.getAttribute("programidentification");
       %>
      <table   width="1100" > <br><br>
	 <tr><td >
        <FORM ACTION="report.html?cmd=monthlyschedule" METHOD=POST id="assign" >
		  <input type="hidden" name="user_id" value="<%=user_id%>">
		  
		 <input type="hidden" name="program_id" value="<%=program_id%>">
		 <input type="hidden" name="sub_program_id" value="<%=sub_program_id%>">

<table width="550" align="center" style="margin-left:250px; margin-top:20px">

      <tr >
			<td height="40" width="150">
				<label class="lab">Program Name:</label>
			</td>
			<td>
				<input id="programname" name="programname" type="text" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("programname"))%>" readonly>
			</td>			
		</tr>

		
                            
		<tr >
			<td height="40" width="150" >
				<label class="lab">Sub Program Name:</label>
			</td>
			<td align="left">
	<input id="subprogram" name="subprogram" type="text" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("subprogramname"))%>" readonly>
			</td>			
		</tr>

<tr height="50" width="150">
			<td>
				<label class="lab">Date:</label>
			</td>
			<td>
<label class="lab"><select name="month" id="month" style="font-family:'Times New Roman', Times, serif;" >
                        <option value=""> Month</option>
                        <option value="01">January</option>
                        <option value="02">Febrauary</option>
                        <option value="03"> March</option>
                        <option value="04"> April</option>
                        <option value="05"> May</option>
                        <option value="06"> June</option>
                        <option value="07">July</option>
                        <option value="08"> August</option>
                        <option value="09"> September</option>
                        <option value="10"> October</option>
                        <option value="11">Novenmber</option>
                        <option value="12"> December</option>
                                            
                   </select>
				   
		<select name="year" id="year" style="width:70px;" style="font-family:'Times New Roman', Times, serif;">
                        <option value="">Year</option>
                        <option value="2015">2015</option>
                        <option value="2016">2016</option>
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                   </select></label>
			</td>			
		</tr>
			
					 
<tr  align="center" ><td colspan="2">
<img src="images/submit.jpg"  alt="submit" width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:55px; height:20px;">
&nbsp;
<img src="images/Cancel.png"  alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>
</table>
   </FORM></td></tr></table></div>  </div>  
   
   <!--  =============================================================================================== -->
   
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0; 
  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; width:100%;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Name: <%=nullCheck((String)request.getAttribute("username")) %></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
 <% if(show != null){%>


<%if(programidentification != null){ %>
<table class="attendancestatus" width="100%">
<tr height="40"><th align="center">Course Mentor List</th><th align="center">Particulars</th></tr>		
					<%
					ArrayList coursementorlist = (ArrayList)request.getAttribute("coursementordetails");
					
					if(coursementorlist != null){
						Iterator itr = coursementorlist.iterator();
						while(itr.hasNext()){		
							String strarr[] = (String[])itr.next();
							String coursementorname = strarr[0];
							String coursementorid = strarr[1];
					%>
<tr>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=coursementorname%></div></td>
<td><a href="#" style="height:40px; margin-top:15px;" onClick="showVal('<%=coursementorid%>','<%=coursementorname%>','<%=program_id%>','<%=sub_program_id%>','<%=startdate%>','<%=enddate%>','<%=user_id%>','<%=username%>');">View</a></td>
</tr>
					<%}}
					else{
					%>		
<tr><td colspan="4">No Records Found</td></tr>

<%}}
%>
 </table><br><br>
<%if(nameidentification != null){%>  

<table class="attendancestatus" width="100%">
<tr height="50"><td>Class Schedule Report</td></tr>
<tr height="40"><th align="center">Course Name</th><th align="center">Monthly Schedule</th><th align="center">Date</th><th align="center">Description</th>


						<% ArrayList eventdetails = (ArrayList)request.getAttribute("classscheduledetails"); 
						
							
						if(eventdetails != null && eventdetails.size()!= 0){
							Iterator itr = eventdetails.iterator();
							while(itr.hasNext()){
								String userlist[] = (String[])itr.next();								
								String course_name = userlist[0];	
								String title = userlist[1];
								String date = userlist[2];
								String description = userlist[3];
								String time = userlist[4];
						%>
						
<tr>

<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=course_name%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=title%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=date+" "+time%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=description%></div></td>
</tr>

					<%}}
					else{
					%>		
<tr><td colspan="4">No Records Found</td></tr>
					<% }%>
		 					</table>
 <br><br>
<table class="attendancestatus" width="100%">
<tr height="50"><td>Event Report</td></tr>
<tr height="40"><th align="center">Event</th><th align="center">Start Date</th><th align="center">End Date</th><th align="center">Description</th>


						<% ArrayList eventcheduledetails = (ArrayList)request.getAttribute("eventcheduledetails"); 
						
							
						if(eventcheduledetails != null && eventcheduledetails.size()!= 0){
							Iterator itr = eventcheduledetails.iterator();
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
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=description%></div></td></tr>

					<%}}
					else{
					%>		
<tr><td colspan="4">No Records Found</td></tr>
					<% }%>
		 					</table>
		 					<%} %>
											
		 <%} %>	
</div></div>

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
