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
     
     <script src="js/TMForm.js"></script>  
	  <script src="js/datetimepicker_css.js"></script>
    
  	<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
	        <script src="js/lib/jquery.js"></script>
			<script src="js/dist/jquery.validate.js"></script>
			<script src="jquery-1.11.3.min.js"></script> 
	 
	     <script type="text/javascript">
	 $(document).ready(function() {
	 
	 $('#paytype').change(function(event) {
	 		var paytype = $('#paytype').val();
			if(paytype=="DD"){
				$('#fordd').show();
				$('#foronline').hide();
				$('#paymenttypei').val(paytype);		
				
				var a = $('#paymenttypei').val();
				//alert(a);
						
			}else if(paytype=="Online"){
				$('#fordd').hide();
				$('#foronline').show();
				$('#paymenttypei').val(paytype);
			}else{
				$('#fordd').hide();
				$('#foronline').hide();
			}		
	 });
	 
	 });
	 
	 </script>
	 
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
<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
</head>
<body class="page1" id="top"  onLoad="initload();">
<headere>
  

 

<div><%@ include file = "../../include/header.jsp" %></div>
<!-- <div><%@ include file = "../../include/Hmenu.jsp" %></div>   -->

</headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Payment Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  



<table width="729">
<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="386" align="center"  style="height:30"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>
	<tr align="center"><td height="53" colspan="2"><div  style="margin-bottom:20px; color:#FF0000"></div></td>
</tr>
<tr ><td height="76" align="right">Category:</td>
<td width="331" >
<select  id="paytype"   style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" name="paytype" required>
						<option value="">Select One</option>
						<option value="DD">Demand Draft</option>
						<option value="Online">Debit Card/Credit Card</option>
						
        </select><label style=" color:#FF0000">*</label></td></tr></table>
			
 <table>
<tbody id="fordd">

<form align="center" action="./login.html" method="post" name="pay_ment" id="pay_ment">
<input type="hidden" name="LoginProcess"  value="payment">

<input type="hidden" name="paytype" id="paymenttypei"/>

<tr><td width="157" height="41" align="left">DD Number: </td>

<td width="275"><input type="text" id="ddno" name="ddno" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td></tr>

<tr><td height="40" align="left">DD Date:</td>

<td>
<input type="text" id="dd_date" name="dd_date" value="" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td><td width="33">
<img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('dd_date')" /></td>
</tr>

<tr><td height="40" align="left">Name of Bank:</td>
<td><input type="text" id="nobank" name="nobank" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000" >*</label></td></tr>

<tr><td height="40" align="left">Name of Branch:</td>
<td><input type="text" id="nobranch" name="nobranch" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td></tr>

<tr><td height="40" align="left">Enter the Amount:</td>
<td><input type="text" id="amount" name="amount" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td></tr>


<tr align="center"><td colspan="2"><img src="images/submit.jpg" alt="submit" width="20" height="20" style="cursor:pointer"/><input type="submit" id="nobranch" name="Submit"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:45px; height:20px;">

<img src="images/Cancel.png"  alt="cancel" width="20" height="20" style=" margin-left:25px; cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></td></tr>

</form>
</tbody>

<tbody id="foronline">

<form align="center" action="./login.html" method="post" name="pay_ment" id="pay_ment">
<input type="hidden" name="LoginProcess"  value="payment">

<input type="hidden" name="paytype" id="paymenttypei"/>

<tr><td height="40" align="left">Card Type:</td>
<td><input type="text" id="debittype" name="debittype" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td></tr>

<tr><td height="40" align="left">Card No:</td>
<td><input type="text" id="debitno" name="debitno" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td></tr>

<tr><td height="40" align="left">CVV No:</td>
<td><input type="password" id="dddate" name="password" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required ><label style=" color:#FF0000">*</label></td></tr>

<tr><td height="40" align="left">Print Name On Card:</td>
<td><input type="text" id="ddno" name="debitno" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required><label style=" color:#FF0000">*</label></td></tr>

<tr><td height="40" align="left">Expiry Date:</td>
<td><select name="month" id="month" style="font-family:'Times New Roman', Times, serif; width:70px; height:20px" required >
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
 
  <select name="year" id="year" style="font-family:'Times New Roman', Times, serif; width:80px; height:20px" required >
  <option value="">Year</option>
   
 
  <option value="2011">2015</option>
  <option value="2012">2016</option>
  <option value="2013">2017</option>
  <option value="1981">1981</option>
  <option value="1982">1982</option>
  <option value="1983">1983</option>
  <option value="1984">1984</option>
  <option value="1985">1985</option>
  <option value="1986">1986</option>
  <option value="1987">1987</option>
  <option value="1988">1988</option>
  <option value="1989">1989</option>
  <option value="1990">1990</option>
  <option value="1991">1991</option>
  <option value="1992">1992</option>
  <option value="1993">1993</option>
  <option value="1994">1994</option>
  <option value="1995">1995</option>
  <option value="1996">1996</option>
  <option value="1997">1997</option>
  <option value="1998">1998</option>
  <option value="1999">1999</option>
  <option value="2000">2000</option>
  <option value="2001">2001</option>
  <option value="2002">2002</option>
  <option value="2003">2003</option>
  <option value="2004">2004</option>
  <option value="2005">2005</option>
  <option value="2006">2006</option>
  <option value="2007">2007</option>
  <option value="2008">2008</option>
  <option value="2009">2009</option>
  <option value="2010">2010</option>
  </select>
  <label style=" color:#FF0000">*</label></td></tr>

<tr align="center"><td colspan="2"> 

<img src="images/submit.jpg"  alt="submit" width="20" height="20" style="cursor:pointer"/>
<input type="submit" id="nobranch" name="Submit"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:45px; height:20px;">

<img src="images/Cancel.png" alt="cancel" width="20" height="20" style=" margin-left:25px; cursor:pointer"/>
<input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>

</form>

</tbody>
 
</table>


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
if(document.pay_ment.ddno.value==""){
		alert("DDno cannot be empty");
		document.pay_ment.ddno.focus();
		return false;
	}
	
	if(Dospace(document.pay_ment.ddno.value)||((document.payment.ddno.value.indexOf(' '))==0))
	   { alert("Enter valid ddno");
	   document.pay_ment.ddno.focus();
	   return false; }
	if(document.pay_ment.dddate.value==""){
		alert("DDdate cannot be empty");
		document.pay_ment.dddate.focus();
		return false;
	}
	
	if(Dospace(document.pay_ment.dddate.value)||((document.pay_ment.dddate.value.indexOf(' '))==0))
	   { alert("Enter valid DDdate");
	   document.pay_ment.dddate.focus();
	   return false; }
	if(document.pay_ment.nobank.value==""){
		alert("Name of Bank cannot be empty");
		document.pay_ment.nobank.focus();
		return false;
	}
	
	if(Dospace(pay_ment.payment.nobank.value)||((document.payment.nobank.value.indexOf(' '))==0))
	   { alert("Enter valid Name of Bank");
	   document.pay_ment.nobank.focus();
	   return false; }
	if(document.pay_ment.nobranch.value==""){
		alert("Name of Branch cannot be empty");
		document.pay_ment.nobranch.focus();
		return false;
	}
	
	if(Dospace(document.pay_ment.nobranch.value)||((document.pay_ment.nobranch.value.indexOf(' '))==0))
	   { alert("Enter valid Name of Branch");
	   document.payment.nobranch.focus();
	   return false; }
	   
	   
	   if(document.payment.amount.value==""){
		alert("Amount cannot be empty");
		document.pay_ment.amount.focus();
		return false;
	}
	
	if(Dospace(document.payment.amount.value)||((document.payment.amount.value.indexOf(' '))==0))
	   { alert("Enter valid Name of Amount");
	   document.payment.nobranch.focus();
	   return false; }
	   if(document.payment.debitno.value==""){
		alert("Debitno cannot be empty");
		document.payment.debitno.focus();
		return false;
	}
	
	if(Dospace(document.payment.debitno.value)||((document.payment.debitno.value.indexOf(' '))==0))
	   { alert("Enter valid Debitno");
	   document.payment.nobranch.focus();
	   return false; }
	   if(document.payment.debittype.value==""){
		alert("Debittype cannot be empty");
		document.payment.debittype.focus();
		return false;
	}
	
	if(Dospace(document.payment.debittype.value)||((document.payment.debittype.value.indexOf(' '))==0))
	   { alert("Enter valid Debittype");
	   document.payment.debittype.focus();
	   return false; }
	  
	   if(document.payment.month.value==""){
		alert("Expiry month cannot be empty");
		document.payment.month.focus();
		return false;
	}
	if(document.payment.year.value==""){
		alert("Expiry Year cannot be empty");
		document.payment.year.focus();
		return false;
	}
	return true;
}
</script>
</html>
