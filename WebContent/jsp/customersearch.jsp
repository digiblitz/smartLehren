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
     
     <script src="js/jquery.js"></script>
   
   
 
	     
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
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
     </head>
	 <body class="page1" id="top">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;
	   -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Customer Search</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
     <form align="center" action="customer.html?cmd=initsearch" method="post" name="search">
<%String status=(String)request.getAttribute("status"); %>
<input type="hidden" name="CustomerProcess"  value="Search">

<div align="center">
<table >
<%	 if(status!=null){
	 %>
	   <tr height="40">
        <td style="height:30" align="center"><strong>
        <font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%	}else{%>
		<tr><td></td></tr>
	<%}%>
	 </tr>
				
<tr ><td height="40" ><label class="lab">Customer Id:</label></td><td width="5">&nbsp;&nbsp;</td>
<td >
  <input style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" type="text" name="customerid">
    <label style=" color:#FF0000">*</label></td></tr>
    
<tr align="center" ><td colspan="3"><label >
<img src="images/search-icon-button.png" alt="search" width="20" height="20">
<input  type="submit" name="Search" value="Search"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"></label>

&nbsp;<label>
<img src="images/Cancel.png" alt="Cancel" width="20" height="20" style="cursor:pointer"/>
<input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;" value="Cancel" ></label>
</td></tr>

</table></div>  

</form>
						
    
  </div>   
</div>
<div>&nbsp;</div></div> </div> 
 <!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    
  </footer>
</body>

</html>

