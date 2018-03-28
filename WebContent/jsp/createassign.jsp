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
	 
	   <script  src="js/ts_picker.js"></script>
     <script src="js/cscombo_new.js" type="text/javascript" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 
  
     <script src="js/jquery.js"></script>    
     <script src="js/superfish.js"></script>  
     <script src="js/datetimepicker_css.js"></script>  
      <script  src="js/ts_picker.js"></script>   
     
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
	font-size:17px;
	height:75px;
	padding:0 10px;
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
				question1:{
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
			   question1: "Please provide question",
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
	
	
	var counter = 1;
	$("#click").click(function(){
			event.preventDefault();
    counter++;
	var newRow = jQuery('<div style=" border-radius:1px; margin-top:15px;"><span><textarea style="margin-left:120px;font-family:Times New Roman, Times, serif; font-size:15px;" rows=4 cols=41 name="question' +
        counter + '"/> &nbsp; <a href="javascript:void(0);" style="font-family:Times New Roman, Times, serif;" class="remCF">Remove</a></span></div>');
		
		jQuery('div.assignment').append(newRow);
		$("#shquescount").val(counter)
					
		return false;
	});
	
	 $(".assignment").on('click','.remCF',function(){
        $(this).parent().parent().remove();
		counter = counter-1;
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
<div class="content">
  <div class="container_12">
     <div>&nbsp;</div>
     <div class="pp" style="margin: 25px 0 0 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Assignment</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
  
  <%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
         <form action="./trainer.html" method="post" class="assign" id="assign" name="assign">
		 <input type="hidden" name="TrainerProcess"  value="AssignProcess">


<div class="head" style="margin-bottom:20px; color:#FF0000; font-size:20px; font-family:'Times New Roman', Times, serif;"> 
	<p>All fields are mandatory</p>
</div>

<div class="lab">
<div class="tabLeft">
<label>Course Name<span>:</span></label>
</div>
<div class="tabRight">
<select name="coursecode" id="coursecode" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" >
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
											 
		 		  </select></div>
</div>



<div class="lab">
<div class="tabLeft">
<label>Assignment Name<span>:</span></label>
</div>
<div class="tabRight">
<input type="text" name="assignname" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;">
</div></div>



 <div id="myTable"  class="assignment" style="margin-bottom:35px;">	
 
<div class="lab">
<div class="tabLeft">
<label>Question<span>:</span></label>
</div>
<div class="tabRight">
<textarea name="question1" rows=7 cols=50  style="font-family:'Times New Roman', Times, serif; width:350px; height:70px;">
</textarea><a href="" id="click">Add Question</a></div>
</div>

<input type="hidden" name="assignmentquesC" id="shquescount" />
</div>


 
<div class="lab">
<div class="tabLeft">
<label>Assignment start date<span>:</span></label>
</div>
<div class="tabRight">
<input  type="text" name="allowdate" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" value="" id="allowdate"><img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('allowdate')" /></div>
</div>

<div class="lab">
<div class="tabLeft">
<label>Last Date of submission<span>:</span></label>
</div>
<div class="tabRight">
<input   type="text" name="lastdate"  style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" value="" id="lastdate"><img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" 
	style="vertical-align:bottom;cursor:pointer" border="0" onClick="javascript:NewCssCal('lastdate')" /></div>
</div>


<div class="lab">
<span><img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/> <input type="submit" name="Assign" value="Create" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());"></span>

<span> <img src="images/Cancel.png" alt="back"  width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);"style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></span>
</div>


</form></div>  </div>  
     <br><br>  
     
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

