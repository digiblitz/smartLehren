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
       <script  src="js/ts_picker.js"></script>
     <script src="js/TMForm.js"></script> 
     
     
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

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

<%String userid=(String)session.getAttribute("user_id"); %>

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Plan and Package</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

     
<%String user_id=(String)request.getAttribute("user_id"); %>
         
<%
	String upstatus=(String)request.getAttribute("upstatus");
	 if(upstatus!=null){
	 %>
        <span width="139" style="height:30" align="center" colspan="2">
        <strong><font color="#FF0000"><%=upstatus%></font></strong></span>       
	 <%}%>     
<FORM  ACTION="login.html?LoginProcess=updateplanpackage&user_id=<%=user_id%>" METHOD=POST name="uploadfile">


	<br><br>
<table width="500" border="0" align="center" style="margin-left:150px; margin-top:20px" >


<tr><td style="font-size:18px; height:50px; ">Plan and Bundle History</td></tr>

<tr><td   height="40" width="220" >Plan Type:</td>
<td width="220"><input  type="text" name="plan_type"   style="width:250px; height:20px;"
 value="<%=nullCheck((String)request.getAttribute("plan_type"))%>" readonly></td>
</tr>

<tr><td   height="40" width="220" >Subscription Type:</td>
<td width="220"><input  type="text" name="subscription_type"   style="width:250px; height:20px;"
 value="<%=nullCheck((String)request.getAttribute("subscription_type"))%>" readonly></td>
</tr>


<tr><td   height="40" width="220" >Payment History:</td>
<td width="220"><input  type="text" name="amount"   style="width:250px; height:20px;"
 value="<%=nullCheck((String)request.getAttribute("amount"))%>" readonly></td>
</tr>

<tr><td   height="40" width="220" >Alter Plan And Bundle:</td>
<td width="220"><button type="button" value="Purchase" onClick="location.href='http://74.208.110.192:8480/yes-shop/category/smartLehren'">Purchase</button></td>
</tr>

<tr><td   height="40" width="220" >Subscription Expiry:</td>
<td width="220"><input  type="text" name="subscriptionexpiry"   style="width:250px; height:20px;"
 value="<%=nullCheck((String)request.getAttribute("difference"))%>" readonly></td>
</tr>

<tr><td   height="40" width="220" >Renew Subscription:</td>
<td width="220"><button type="button" value="Renew" onClick="location.href='map.html?cmd=initgetstart'"><label class="lab">Renew</button></td>
</tr>


<tr  align="center" ><td colspan="2"><img src="images/update.jpg" alt="update" width="20" height="20" style="cursor:pointer"/>

<input type="submit" name="Insert" value="Update" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;">
&nbsp;<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>
<input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>


 
</table></FORM>

 </div>   </div>  
						

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

