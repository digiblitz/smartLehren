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
     
    <script src="js/cscombo_new.js" type="text/javascript" ></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 
   
    <script  src="js/ts_picker.js"></script>
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
    <script type="text/javascript">
function initload(){

 document.getElementById('fordd').style.display = "none";
 document.getElementById('foronline').style.display = "none";

  }
  
  function disp(){
  var selValue = null;		 
   			 var e = document.getElementById("paytype");//get the combobox
    		 selValue = e.options[e.selectedIndex].value; //get selected value
			// alert(selValue);
  			 if(selValue == "DD") {
	  document.getElementById('fordd').style.display = "block"; 
	  document.getElementById('foronline').style.display = "none";
  }else{
	  document.getElementById('fordd').style.display = "none";
	  document.getElementById('foronline').style.display = "block";   
  }
  }
</script> 
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

</head>
<body class="page1" id="top"  onLoad="initload();">
<headere>
  

 

<div><%@ include file = "../../include/header.jsp" %></div>
<div> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Payment Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  

<form align="center" action="./map.html" method="post" name="pay_ment" id="pay_ment">
<input type="hidden" name="cmd"  value="payment">

<table width="552">
<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="266" align="center"  style="height:30"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>
	<tr align="center"><td height="53" colspan="2"><div  style="margin-bottom:20px; color:#FF0000">All Fields are * required.</div></td>
</tr>
<tr ><td height="40" align="left"><div style="margin-left:150px">Card Type:</div></td>
<td width="274" align="left">
 <input type="radio" name="cardtype" id="cardtype" value="visa"  /> <img src="images/visa.png" alt="visa card" height="20">
 <input type="radio" name="cardtype" id="cardtype" value="mastercard" /> <img src="images/master.png" alt="master" height="20">
 <input type="radio" name="cardtype" id="cardtype" value="amex" /> <img src="images/american.png" alt="american" height="20">
 <label style=" color:#FF0000">*</label></td></tr>
			
<tr><td height="40" width="568" align="left"> <div style="margin-left:150px">Card Number: </div></td>
<td align="left"><input type="text" id="cardno" name="cardno" style="width:250px; height:20px;"></td><td width=7 style="color:red" align="right">*</td></tr>

<tr><td height="40" width="568" align="left"><div style="margin-left:150px">Expiration Date:  </div></td>
<td align="left"><select name="expirymonth" id="expirymonth" style="width:70px; height:20px" >
  <option value="">Month</option>
  <option value="1">January</option>
  <option value="2">February</option>
  <option value="3">March</option>
  <option value="4">April</option>
  <option value="5">May</option>
  <option value="6">June</option>
  <option value="7">July</option>
  <option value="8">August</option>
  <option value="9">september</option>
  <option value="10">October</option>
  <option value="11">November</option>
 <option value="12">December</option>
  </select>
  <select name="expiryyear" id="expiryyear" style="width:80px; height:20px" >
  <option value="">Year</option>
  
  <option value="2010">2010</option>
  <option value="2011">2011</option>
  <option value="2012">2012</option>
  <option value="2013">2013</option>
  <option value="2014">2014</option>
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
  <option value="2031">2031</option>
  <option value="2032">2032</option>
  <option value="2033">2033</option>
  <option value="2034">2034</option>
  <option value="2035">2035</option>
  <option value="2036">2036</option>
  <option value="2037">2037</option>
  <option value="2038">2038</option>
  <option value="2039">2039</option>
  <option value="2040">2040</option>
  <option value="2041">2041</option>
  <option value="2042">2042</option>
  </select></td>
  <td width=7 style="color:red" align="right">*</td></tr>

<tr><td height="40" width="568" align="left"><div style="margin-left:150px">CVV : </div></td>
<td align="left"><input type="text" id="cvvno" name="cvvno" style="width:150px; height:20px;"><img src="images/cvv.png" alt=" cvv number" height="20"></td>
<td width=7 style="color:red" align="right">*</td></tr>
<tr><td height="40" width="568" align="left"> <div style="margin-left:150px">Cardholder Name: </div></td>
<td><input type="text" id="name" name="name" style="width:250px; height:20px;"></td>
<td width=7 style="color:red" align="right">*</td></tr>

 <tr>
    <td   height="40" width="568"   align="left"><div style="margin-left:150px">Country:</div></td>
    <td>
  <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');" style="width:250px">
  
  <option selected="selected">Select One</option>
                    <option value="United States of America">United States of America</option></select>
  </td>
  <td width=7 style="color:red" align="right">*</td>
  </tr>
   <tr>
    <td   height="40" width="568"  align="left"><div style="margin-left:150px">State:</div></td>
    <td>
	<select name="state" id="state" style="width:250px">
 <option value="">Select State</option>
<option value="TamilNadu">TamilNadu</option>
<option value="Kerala">Kerala</option>
<option value="Delhi">Delhi</option></select>
  </td>
  <td width=7 style="color:red" align="right">*</td>
  </tr>
 
   <tr>
    <td   height="40" width="568"  align="left"><div style="margin-left:150px">City:</div></td>
    <td>
  <input  type="text" name="city" id="city" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=7 style="color:red" align="right">*</td>
  </tr>
    <tr>
    <td   height="40" width="288"  align="left"><div style="margin-left:150px">Address:</div></td>
    <td>
  <input  type="text" name="address" id="address" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=7 style="color:red" align="right">*</td>
  </tr>
    <tr>
    <td   height="40" width="288"  align="left"><div style="margin-left:150px">Postal Code:</div></td>
    <td>
  <input  type="text" name="pincode" id="pincode" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=7 style="color:red" align="right">*</td>
  </tr>
  <tr>
    <td   height="40" width="288"  align="left"><div style="margin-left:150px">Email:</div></td>
    <td>
  <input  type="text" name="email" id="email" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=7 style="color:red" align="right">*</td>
  </tr>

<tr><td height="40" width="568"  align="left"> <div style="margin-left:150px">Total Amount: </div></td>
<td><input type="text" id="amount" name="amount" style="width:250px; height:20px;"></td></tr>


 
<tr align="center"><td colspan="2"> <div style="margin-left:150px"><label><img src="images/submit.jpg"  alt="submit" width="20" height="20" style="cursor:pointer"/> <input type="submit" id="nobranch" name="Submit"  style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;">
&nbsp;</lable><label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label></div></td></tr></table>
</form>

      </div>
     
     </div>
  </div>   
</div>
<!--==============================footer=================================-->
 <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
   
  </footer>
</body>
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}
	

function onValidate()
{
if(document.pay_ment.cardtype.value==""){
		alert("Cardtype cannot be empty");
		document.pay_ment.cardtype.focus();
		return false;
	}

	if(document.pay_ment.cardno.value==""){
		alert("Card Number cannot be empty");
		document.pay_ment.cardno.focus();
		return false;
	}
	
	if(document.pay_ment.expirymonth.value==""){
		alert("Expiry Month cannot be empty");
		document.pay_ment.expirymonth.focus();
		return false;
	}
	
	if(document.pay_ment.expiryyear.value==""){
		alert("Expiry Year cannot be empty");
		document.pay_ment.expiryyear.focus();
		return false;
	}
	
	 if(document.pay_ment.cvvno.value==""){
		alert("CVV Number cannot be empty");
		document.pay_ment.cvvno.focus();
		return false;
	}
	
	   if(document.pay_ment.name.value==""){
		alert("CardHolder cannot be empty");
		document.pay_ment.name.focus();
		return false;
	}
	
	   if(document.pay_ment.country.value==""){
		alert("Country cannot be empty");
		document.pay_ment.country.focus();
		return false;
	}
	 
	
	return true;
}
</script>
</html>
