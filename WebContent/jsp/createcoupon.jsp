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
	 
	   <script src="js/jquery.js"></script>    
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
		
		
jQuery("#createcoupon").validate({                      
        rules: {    
        	coupon_code:{
					required: true
				},                
				coupon_description:{
					required: true
				},
				coupon_offer:{
					required:true					
				}
        },
        messages: {               
        	coupon_code:"Please Enter Coupon Code",
        	coupon_description:"Please Enter Description",
        	coupon_offer: "Please Enter Coupon Offer",              
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
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12">
     <div>&nbsp;</div>
     <div class="pp" style="margin: 25px 0 0 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Coupon</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
  
  <%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
        <form align="center" id="createcoupon" action="./customer.html" name="changepassword" method="post" >
<input type="hidden" name="CustomerProcess"  value="createcoupon">


<div class="head" style="margin-bottom:20px; color:#FF0000; font-size:20px; font-family:'Times New Roman', Times, serif;"> 
	<p>All fields are mandatory</p>
</div>

<div class="lab">
<div class="tabLeft">
				  Coupon Code:</td>
                  </div>
		 <div class="tabRight"  style="margin-right:150px;">
		<input type="text" name="coupon_code" id="coupon_code" style="width:150px; height:25px;" size="18" />
                </div></div>


<div class="lab">
<div class="tabLeft">
				  Description:</td>
                   </div>
				  <div class="tabRight"  style="margin-right:140px;">
	<input type="text"  name="coupon_description" id="coupon_description" style="width:150px; height:25px;" size="18" />
              </div></div>


 <div class="lab">
<div class="tabLeft">
				Coupon Offer in %:</td>
                   </div>
				  <div class="tabRight" style="margin-right:185px;">
				  <input type="text"  name="coupon_offer" id="coupon_offer" style="width:150px; height:25px;" size="18" />
                 </div></div>


 <div>
      <img src="images/submit.jpg" alt="submit" width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:55px; height:20px;">
                    &nbsp;
     <img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
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

