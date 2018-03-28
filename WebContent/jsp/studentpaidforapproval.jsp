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


<div><%@ include file = "../../include/header.jsp" %></div>
<div > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
    <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Approve User</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
       <table width="800" >
 <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="84" style="height:30" align="center"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>


<form align="center" action="./login.html" name="enroll" id="enroll"method="post">
<input type="hidden" name="LoginProcess"  value="approvpayment">
<%String user_id=(String)request.getAttribute("user_id");%>
<input type="hidden" name="user_id" value="<%=user_id%>">
<%
	String estatus=(String)request.getAttribute("estatus");
	 if(estatus!=null){
	 %>
       <tr>
        <td width="84" style="height:30" align="center"><strong><font color="#FF0000"><%=estatus%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>   

 <tr><td><table width="469" border="0" align="center" style="color:#000000; font-size:16px; margin-left:150px">


								 		<% 		
												ArrayList paidlist = (ArrayList)request.getAttribute("paidlist");
												if(paidlist!=null && paidlist.size()!=0){
													
													Iterator itr = paidlist.iterator();
													 while (itr.hasNext()) {
													 String sr[] = (String[]) itr.next();
													
													 String userid = sr[0]; 
										 	        	String reg_no = sr[1]; 									
										 	        	String firstname = sr[2]; 
										 	        	String lastname = sr[3]; 
										 	        	String e_mail = sr[4]; 
										 	        	String paymenttype = sr[5]; 
										 	        	String ddnum = sr[6]; 
										 	        	String dddate = sr[7]; 
										 	        	String bankname = sr[8]; 
										 	        	String bankbranch = sr[9]; 
										 	        	String amount = sr[10]; 
										 	        	 
										 	        	 
															   
													%>
<tr ><td height="40" width="164" align="left" ><label class="lab">Register No:</label></td>
<td>
<label class="lab"><input type="text" name="regno" id="regno" value="<%=reg_no%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>													

	<tr ><td height="40" width="164" align="left" ><label class="lab">First Name:</label></td>
	<td><label class="lab"><input type="text" name="firstname" id="firstname" value="<%=firstname%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">Last Name:</label></td>
	<td><label class="lab"><input type="text" name="lastname" id="lastname" value="<%=lastname%>" readonly="readonly" border="0"  style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">E-mail:</label></td>
	<td><label class="lab"><input type="text" name="email" id="email" value="<%=e_mail%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">Payment Type:</label></td>
	<td><label class="lab"><input type="text" name="paymenttype" id="paymenttype" value="<%=paymenttype%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">DD Number:</label></td>
	<td><label class="lab"><input type="text" name="ddnum" id="ddnum" value="<%=ddnum%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">Bank Name:</label></td>
	<td><label class="lab"><input type="text" name="bankname" id="bankname" value="<%=bankname%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">Bank Branch:</label></td>
	<td><label class="lab"><input type="text" name="bankbranch" id="bankbranch" value="<%=bankbranch%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
	<tr ><td height="40" width="164" align="left" ><label class="lab">Amount:</label></td>
	<td><label class="lab"><input type="text" name="amount" id="amount" value="<%=amount%>" readonly="readonly" border="0" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"/></label></td></tr>	
	
													<%	
													
													}
												}
											
											 
												%>
								 		
<tr ><td height="40" width="164"><label class="lab">Approval:</label></td>
<td width="295">
  
    <select  id="approval"   name="approval" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;">
      <option value="Approved"><label class="lab">Approved</label></option>
      <option value="Pending" ><label class="lab">Pending</label></option>
      <option value="Rejected" ><label class="lab">Rejected</label></option>
    </select>
 
 </td></tr>


</table></td></tr>


 
<tr align="center"><td width="200" colspan="2"><label><img src="images/submit.jpg"  height="25" alt="submit" style="cursor:pointer"/>
<input type="submit" name="appenroll" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; " value="Submit" onClick="return(onValidate());"></label>
<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; "  onClick="javascript:history.back(-1);" value="Cancel" ></label>
</td></tr>

</form></table>
</div>   
</div>
    
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
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}
	

function onValidate()
{
if(document.enroll.regno.value==""){
		alert("Register No cannot be empty");
		document.enroll.regno.focus();
		return false;
	}
	
	if(Dospace(document.enroll.regno.value)||((document.enroll.regno.value.indexOf(' '))==0))
	   { alert("Enter valid Register No");
	   document.enroll.regno.focus();
	   return false; }
	if(document.enroll.firstname.value==""){
		alert("Firstname cannot be empty");
		document.enroll.firstname.focus();
		return false;
	}
	
	if(Dospace(document.enroll.firstname.value)||((document.enroll.firstname.value.indexOf(' '))==0))
	   { alert("Enter valid Firstname");
	   document.enroll.firstname.focus();
	   return false; }
	
	   if(document.enroll.lastname.value==""){
		alert("Lastname cannot be empty");
		document.enroll.lastname.focus();
		return false;
	}
	
	if(Dospace(document.enroll.lastname.value)||((document.enroll.lastname.value.indexOf(' '))==0))
	   { alert("Enter valid Lastname");
	   document.enroll.lastname.focus();
	   return false; }
	   if(document.enroll.email.value==""){
		alert("Email cannot be empty");
		document.enroll.email.focus();
		return false;
	}
	
	if(Dospace(document.enroll.email.value)||((document.enroll.email.value.indexOf(' '))==0))
	   { alert("Enter valid Email");
	   document.enroll.firstname.focus();
	   return false; }
	   if(document.enroll.paymenttype.value==""){
		alert("PaymentType cannot be empty");
		document.enroll.paymenttype.focus();
		return false;
	}
	
	if(Dospace(document.enroll.paymenttype.value)||((document.enroll.paymenttype.value.indexOf(' '))==0))
	   { alert("Enter valid PaymentType");
	   document.enroll.paymenttype.focus();
	   return false; }
	   if(document.enroll.ddnum.value==""){
		alert("DDNumber cannot be empty");
		document.enroll.ddnum.focus();
		return false;
	}
	
	if(Dospace(document.enroll.ddnum.value)||((document.enroll.ddnum.value.indexOf(' '))==0))
	   { alert("Enter valid DDNumber");
	   document.enroll.ddnum.focus();
	   return false; }
	   if(document.enroll.bankname.value==""){
		alert("BankName cannot be empty");
		document.enroll.bankname.focus();
		return false;
	}
	
	if(Dospace(document.enroll.bankname.value)||((document.enroll.bankname.value.indexOf(' '))==0))
	   { alert("Enter valid BankName");
	   document.enroll.bankname.focus();
	   return false; }
	   
	      if(document.enroll.bankbranch.value==""){
		alert("Bank branch cannot be empty");
		document.enroll.bankbranch.focus();
		return false;
	}
	
	if(Dospace(document.enroll.bankbranch.value)||((document.enroll.bankbranch.value.indexOf(' '))==0))
	   { alert("Enter valid Bank branch");
	   document.enroll.bankbranch.focus();
	   return false; }
	   
	     if(document.enroll.amount.value==""){
		alert("Amount cannot be empty");
		document.enroll.amount.focus();
		return false;
	}
	
	if(Dospace(document.enroll.amount.value)||((document.enroll.amount.value.indexOf(' '))==0))
	   { alert("Enter valid Amount");
	   document.enroll.amount.focus();
	   return false; }
	    
	   
	 
	return true;
}
</script>
</html>

