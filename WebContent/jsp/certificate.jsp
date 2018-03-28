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
		font-family:"Times New Roman", Times, serif;
	}
	assign.assign label.error, label.error {
		color: red;
		font-size:15px;
	}	
	
	.lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}



}	
	
	</style>
          
          <script>
	$(document).ready(function() {
		
		
			 	 

jQuery("#assign").validate({                      
        rules: {                    
                
                uplogo:{
                    required:true
                },
                 universityname:{
                    required:true                               
                },
				address:{
					required:true
				},
				upsign:{
					required:true
				}
				
        },
        messages: {			   
			
               uplogo:"Please Provide Logo",
               universityname: "Please enter University name",   
			   address:"Please enter Address",	
			   upsign:"Please Provide Signature"
               
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
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Certificate</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
     <table   width="1100" >
	 <tr><td >
        <FORM ACTION="enroll.html?cmd=createcertificate" METHOD=POST id="assign" ENCTYPE="multipart/form-data">
		 

<table width="650" align="center" style="margin-left:250px; margin-top:20px">

      
			
 <tr><td height="47" width="184">Upload Logo:</td>
 
			<td height="47">			
<input  type="file" name="uplogo" style="font-family:'Times New Roman', Times, serif; width:185px; height:20px;" value="" id="uplogo">
	</td>
	</tr>

<tr><td height="49" width="184">
		University Name:</td>
			<td height="49" width="454">

<input   type="text" name="universityname"  style="font-family:'Times New Roman', Times, serif; width:185px; height:20px;" value="" id="universityname">
</td>
</tr>
		
<tr height="100"><td width="184">
		Address:</td>
			<td height="40" width="454">

<textarea  name="address"  style="font-family:'Times New Roman', Times, serif; width:250px; height:75px;" value="" id="address"></textarea>
</td></tr>


			
 <tr><td height="51" width="184">Upload Signature:</td>
 
			<td height="51">
	
<input  type="file" name="upsign" style="font-family:'Times New Roman', Times, serif; width:185px; height:20px;" value="" id="upsign">
</td></tr>
				
		 
<tr  align="center" ><td colspan="2">
<img src="images/submit.jpg"  alt="submit" width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:55px; height:20px;">
&nbsp;
<img src="images/Cancel.png"  alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>
</table>
   </FORM></td></tr></table></div>  </div>  
   
 
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
