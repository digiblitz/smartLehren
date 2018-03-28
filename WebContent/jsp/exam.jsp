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
	   <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
     <link rel="stylesheet" href="css/gender.css">
	 
	   <script  src="js/ts_picker.js"></script>
     <script src="js/cscombo_new.js" type="text/javascript" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 
  
  
     <script src="js/jquery.js"></script>
	 <script src="js/script.js"></script>     
     <script src="js/datetimepicker_css.js"></script>      
     <script src="js/jquery.leanModal.min.js"></script>            
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 
    <script src="js/lib/script_2.js"></script>
    <script src="js/lib/script1.js"></script>
    
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
	font-size:17px;
	text-align: left;
	}
	
	table.exam table{
	border:1px solid black;
	align:center;
	height:25px;
}

table.exam tr{
	height:25px;
}

table.exam th{
	border:1px solid black;
	align:center;
	height:25px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.exam td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:25px;
	font-family:"Times New Roman", Times, serif;
	
}	

table.exam1 table{
	border:1px solid black;
	align:center;
	height:25px;
}

table.exam1 tr{
	height:25px;
}

table.exam1 th{
	border:1px solid black;
	align:center;
	height:25px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.exam1 td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:25px;
	font-family:"Times New Roman", Times, serif;
	
}	
	</style>
          
          <script>
	$(document).ready(function() {
		
		
jQuery("#assign").validate({                      
        rules: {                    
                coursecode:{
					required: true
				},
				examnname:{
					required:true
				},
				shquestion1:{
					required: true
				},
				keytwo1:{
					required: true
				},				
				brquestion1:{
					required: true
				},
				keysixtn1:{
					required: true
				},
				password: {
					required: true
				},
                allowdate:{
                    required:true,
					date:true
                },
				shortmark:{
					required:true,
					number:true
				},
				briefmark:{
					required:true,
					number:true
				}				
        },
        messages: {
               
			   coursecode: "Please select Course code",
			   examnname: "Please provide Assignment name",
			   shquestion1: "Please provide question",
			   keytwo1 : "Please provide Keyword",
			   brquestion1: "Please provide question",
			   keysixtn1 : "Please provide Keyword",
			   password : "Please provide Password",
               allowdate: "Please select date",
			   shortmark: "Please provide Mark",
			   briefmark: "Please provide Mark"
            },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}			
    });
	
	
	
	var counter = 1;
	$("#click").click(function(){
			event.preventDefault();
    counter++;
	var newRow = jQuery('<tr><td><textarea style="border:none; font-family:Times New Roman, Times, serif; font-size:15px;" rows=4 cols=30 name="shquestion' +
        counter + '"/></td><td><textarea style="border:none; font-family:Times New Roman, Times, serif; font-size:15px;" rows=4 cols=30 name="keytwo' +
        counter + '"/> &nbsp; <a href="javascript:void(0);" class="remCF">Remove</a></td></tr>');
		
		jQuery('table.exam').append(newRow);
		$("#shquescount").val(counter)
				
		return false;
	});
	
	var counter1 = 1;
	$("#click1").click(function(){
		event.preventDefault();
    counter1++;
	var newRow = jQuery('<tr><td><textarea style="border:none; font-family:Times New Roman, Times, serif; font-size:15px;" rows=4 cols=30 name="brquestion' +
        counter1 + '"/></td><td><textarea style="border:none; font-family:Times New Roman, Times, serif; font-size:15px;" rows=4 cols=30 name="keysixtn' +
        counter1 + '"/> &nbsp; <a href="javascript:void(0);" class="remCF">Remove</a></td></tr>');
		
		jQuery('table.exam1').append(newRow);
	$("#brquescount").val(counter1)
	
		return false;
	});
	
	    $(".exam").on('click','.remCF',function(){
        $(this).parent().parent().remove();
		counter = counter-1;
    });
	
	$(".exam1").on('click','.remCF',function(){
        $(this).parent().parent().remove();
		counter1 = counter1-1;
    });
	
	
	});
	</script>
          
          
     </head>
	 <body class="page1" id="top">
 <headere><div>
  



<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_123">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Questions</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
   
  <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
      <table> 
	 <tr><td >
		
   <form action="exam.html?cmd=examschedule" method="post" class="assign" id="assign" name="assign">
		 
<table align="left" style="margin-left:110px; margin-top:20px">
  <tr><td colspan="2" align="center"><div  style="margin-bottom:20px; color:#FF0000; font-size:20px; font-family:'Times New Roman', Times, serif;"> All fields are mandatory</div></td></tr>
<tr>
<td  height="50" width="180" ><label class="lab">Course Name:</label></td>
	 								  <td width="616" align="left">
	 		<label class="lab">  <select name="coursecode" id="coursecode" style="width:250px; height:25px; font-family:'Times New Roman', Times, serif; font-size:15px;" >
								 		<option value="">Select Course</option>
								 			<% 
								 				
								 			ArrayList cmcourselist =(ArrayList)request.getAttribute("cmcourselist");
											
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
				  
<tr ><td height="50" width="180" ><label class="lab">Exam Name:</label></td>
<td align="left">
<label class="lab"><input type="text" name="examnname" style="width:250px; height:25px; font-family:'Times New Roman', Times, serif; font-size:15px;">
  </label></td>
</tr>

 
<tr height="200"><td height="75" width="180" ><label class="lab" >Short Questions:</label></td>
<td align="left">
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:10px;">
Mark per Question: <input type="text" name="shortmark" style="font-family:'Times New Roman', Times, serif; font-size:15px; width:25px; height:25px;"></div>
<label class="lab">

<table style="border:1px solid black; width:500px;" class="exam" id="myTable">

<tr><th>Questions</th><th>Keywords</th></tr>
<tr>
<td>
<textarea name="shquestion1" rows=4 cols=30  style="border:none; font-family:'Times New Roman', Times, serif; font-size:15px;">
</textarea>
</td>

<td>
<textarea name="keytwo1" rows=4 cols=30  style="border:none; font-family:'Times New Roman', Times, serif; font-size:15px;">
</textarea>
</td></tr>

 <a href="" id="click" >Add Question</a> 
</table>
</label></td>
</tr>

<input type="hidden" name="shquestioncount" id="shquescount" />

<tr height="200"><td height="75" width="180" ><label class="lab" >Brief Questions:</label></td>
<td align="left">
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:10px;">
Mark per Question: <input type="text" name="briefmark" style="font-family:'Times New Roman', Times, serif; font-size:15px; width:25px; height:25px;"></div>
<label class="lab">
<table style="border:1px solid black; width:500px;" class="exam1" id="myTable1">
<tr><th>Questions</th><th>Keywords</th></tr>
<tr>
<td>
<textarea name="brquestion1" rows=4 cols=30  style="border:none; font-family:'Times New Roman', Times, serif; font-size:15px;">
</textarea>
</td>

<td>
<textarea name="keysixtn1" rows=4 cols=30  style="border:none; font-family:'Times New Roman', Times, serif; font-size:15px;">
</textarea>
</td></tr>
<a href='' id="click1">Add Question</a> 
</table>
</label></td>
</tr>

<tr ><td height="50" width="180" ><label class="lab">Exam Password:</label></td>
<td align="left">
<label class="lab"><input type="text" name="password" style="width:250px; height:25px; font-family:'Times New Roman', Times, serif; font-size:15px;">
  </label></td>
</tr>
		<tr ><td height="50" width="180" ><label class="lab">Exam Date:</label></td>
			<td align="left" height="40" width="616">
<label class="lab"><input  type="text" name="allowdate" style="width:250px; height:25px; font-family:'Times New Roman', Times, serif; font-size:15px;" value="" id="allowdate">
  
 <img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('allowdate')" />
       	</label></td>
				</tr>

	<tr class="row2"><td colspan="2" align="center"><label><img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/>
 <input type="submit" name="Assign" value="Create" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());"></label>

 <label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);"style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></td></tr>
</table>

<input type="hidden" name="brquestioncount" id="brquescount" />

</form></td></tr>



</table></div>  </div>  
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

