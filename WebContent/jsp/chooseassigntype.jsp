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
     <script src="js/datetimepicker_css.js"></script>
      
     <script src="js/jquery.leanModal.min.js"></script>
      <script  src="js/ts_picker.js"></script>
      
      
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
       
    <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 
    <script src="js/lib/script_2.js"></script>
    <script src="js/lib/script1.js"></script>
    
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
	font-size:17px;
	text-align: left;
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
  



<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<%String user_id = (String)request.getAttribute("user_id"); %>
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12 ">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Choose Assignment</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
<div class="lab">
<div class="tabLeft">
 <label>Assigntype Type:</label>
 </div>
 <div class="tabRight">
  <input type="radio" name="questiontype" id="questiontype" value="descriptive" 
	 onClick="document.location.href='./trainer.html?cmd=assignmentforall&user_id=<%=user_id %>'" />
	  <label>For All Students</label>	
	 
	 <input type="radio" name="questiontype" id="questiontype" value="objective" 
	onClick="document.location.href='./trainer.html?cmd=assignmentforparticular&user_id=<%=user_id %>'" />	
<label> For Particular Students</label>	
		</div>	 
 </div>
	

	 
	
	
  
  
 </div>  </div>  
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
  </footer>
</body>

</html>

