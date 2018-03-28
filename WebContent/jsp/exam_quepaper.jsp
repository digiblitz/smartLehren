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
      
    
      
     	     
      <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">


    <![endif]-->
    
      <!-- =============================start date end date script includes=============  -->
    <!-- Load jQuery from Google's CDN -->
  
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
       
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> 
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
		font-size:5px;
	}	
	#assign label{
		font-family: sans-serif;
		display: inline-block;
		font-size:15px;
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
				}
        },
        messages: {
               
			   coursecode:"Please select Course code",
			   assignname:"Please give Exam name",
			   question: "Please provide question",
              
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
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12 ">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Assignment</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
  
  <%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; style="font-size:12pt;"><%=status%></span><%} %>
  
      <table   width="800" > 
	 <tr><td >
	
	
 
	
         <form align="center" action="./exam.html" method="post" class="assign" id="assign" name="assign">
		 <input type="hidden" name="cmd"  value="CreateQuestion">


<table width="1000" border="1" style=" color:#000000; font-size:16px">
<tr>
<td  height="40" width="305" align="left" >Course Name:</td>
	 								  <td width="616" align="left">
	 								  <select name="coursecode" id="coursecode" style="width:250px; height:20px;" >
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
											 
		 		  </select><em>*</em></td></tr>
<tr ><td height="40" width="305" align="left">Exam Name:</td>
<td align="left"><input type="text" name="examname" style="width:250px; height:20px;">
  <em>*</em></td><td width=57 style="color:red" align="right">&nbsp;</td>
</tr>
<tr ><td height="100" width="305" align="left">2 Mark Questions (2x10):</td>
<td align="left"><textarea NAME="smallquestion" ROWS=7 COLS=50  style="width:350px; height:70px;"></textarea><em>*</em></td><td width=57 style="color:red" align="right">&nbsp;</td>
</tr>

<tr ><td height="100" width="305" align="left">16 Mark Questions (5x16):</td>
<td align="left"><textarea NAME="bigquestion" ROWS=7 COLS=50  style="width:350px; height:70px;"></textarea><em>*</em></td><td width=57 style="color:red" align="right">&nbsp;</td>
</tr>	
        

<tr class="row2"><td colspan="2" align="center"><label><img src="images/create.jpg" alt="Create" width="20" height="20" style="cursor:pointer"/>
 <input type="submit" name="Assign" value="Create" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());"></label>

 <label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);"style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></td></tr>
</table>


</form></td></tr></table></div>  </div>  
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

