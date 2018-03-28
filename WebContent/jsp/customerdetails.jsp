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
   
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://lab.iamrohit.in/js/location.js"></script>

        
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
 label{
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
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Customer Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

      <table width="1000" >
<%String user_id=(String)request.getAttribute("user_id"); %>
         
         <%
	String upstatus=(String)request.getAttribute("upstatus");
	 if(upstatus!=null){
	 %>
        <span width="139" style="height:30" align="center" colspan="2">
        <strong><font color="#FF0000"><%=upstatus%></font></strong></span>       
	 <%}%>  
<form id="form" name="insert" action="customer.html?cmd=updatecustomer&user_id=<%=user_id%>" method=post name="uploadfile">
		<input type="hidden" name="customeridold" value=<%=(String)request.getAttribute("customerid")%>>

	<br><br>


<tr><td>
<table width="750" border="0" align="center" style="margin-left:250px; margin-top:20px" >
 		
            
		<tr height="50" width="122">
			<td>
				<label id="lfirstname" for="firstname">First Name:</label>
			</td>
			<td>
				<input id="firstname" name="firstname" type="text" maxlength="100" value="<%=nullCheck((String)request.getAttribute("firstname"))%>">
			</td>
			<td class="status"></td>
		</tr>
                            
      
                       
		<tr height="50" width="122">
			<td>
				<label id="llastname" for="lastname">Last Name:</label>
			</td>
			<td>
				<input id="lastname" name="lastname" type="text" maxlength="100" value="<%=nullCheck((String)request.getAttribute("lastname"))%>">
			</td>
			<td class="status"></td>
		</tr>
		
		<tr height="50" width="122"><td>
				<label for="email">Email:</label></td>
				<td><input id="email" name="email" type="email" value="<%=nullCheck((String)request.getAttribute("e_mail"))%>" >
			</td><td class="status"></td></tr>
			
			<tr height="50" width="122">
  			<td>
  				<label for="mobileno">Mobile No:</label>
 			 </td>			
			<td>
               <input  type="text" name="countrycode" id="countrycode" style="width:30px">
			   <input  type="text" name="mobileno" id="mobileno" style="width:130px"  value="<%=nullCheck((String)request.getAttribute("mobile_no"))%>">
            </td>
              <td class="status"></td>
			</tr>
		
										  
                <tr height="50" width="122">
    <td   height="50" width="224"><label> Date of Birth:</label></td>
    <td width="473">
  <input  type="text" name="date" id="date" value="<%=nullCheck((String)request.getAttribute("date"))%>" >&nbsp
  <img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('date')" />

  </td>
  <td width=150 style="color:red">
  </td>
  </tr>
  			
		
		<tr height="50" width="122"><td>
				<label for="institution">Institution Name:</label></td>
				<td><input id="institution" name="institution" type="text" value="<%=nullCheck((String)request.getAttribute("institution_name"))%>">
				
			</td></tr>
					
						

					
			<tr height="50" width="122"><td>
				<label for="country">Country:</label></td>
				<td><select name="country" class="countries" id="countryId" style="width:172px; height:20px" >
	<option value="<%=nullCheck((String)request.getAttribute("country"))%>"><%=nullCheck((String)request.getAttribute("country"))%></option>
					</select>
					</td><td class="status"></td>
					</tr>
			
			<tr height="50" width="122"><td>
				<label for="state">State:</label></td>
				<td><select name="state" class="states" id="stateId">	
			<option value="<%=nullCheck((String)request.getAttribute("state"))%>"><%=nullCheck((String)request.getAttribute("state"))%></option>
				</select>
					</td><td class="status"></td></tr>
					
					<tr height="50" width="122"><td>
				<label for="city">City:</label></td>
				<td><select name="city" class="cities" id="cityId">
					<option value="<%=nullCheck((String)request.getAttribute("city"))%>"><%=nullCheck((String)request.getAttribute("city"))%></option>
						</select>
             </td><td class="status"></td></tr>
			
		<tr height="50" width="122"><td><label for="pincode">Zip/Postal Code:</label></td>
				<td><input  type="text" name="pincode" id="pincode" value="<%=nullCheck((String)request.getAttribute("pincode"))%>"><td class="status"></td><td width="135"></td>
               
			</tr>
			
			
			<tr height="50" width="122"><td>
				<label for="amount">Amount:</label></td>
				<td><input id="amount" name="amount" type="text" value="<%=nullCheck((String)request.getAttribute("amount"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="cardtype">Card Type:</label></td>
				<td><input id="cardtype" name="cardtype" type="text" value="<%=nullCheck((String)request.getAttribute("card_type"))%>">
			</td></tr>
			
			
			<tr height="50" width="122"><td>
				<label for="cardnumber">Card Number:</label></td>
				<td><input id="cardnumber" name="cardnumber" type="text" value="<%=nullCheck((String)request.getAttribute("card_number"))%>">
			</td></tr>
			
			
			<tr height="50" width="122"><td>
				<label for="cvvno">CVV Number:</label></td>
				<td><input id="cvvno" name="cvvno" type="text" value="<%=nullCheck((String)request.getAttribute("cvv_no"))%>">
			</td></tr>
 
 		<tr height="50" width="122"><td>
				<label for="cardholdername">Cardholder Name:</label></td>
				<td><input id="cardholdername" name="cardholdername" type="text" value="<%=nullCheck((String)request.getAttribute("cardholder_name"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="expirydate">Expiry Date:</label></td>
				<td><input id="expirydate" name="expirydate" type="text" value="<%=nullCheck((String)request.getAttribute("expiry_date"))%>">
			</td></tr>
			
				<tr height="50" width="122"><td>
				<label for="registerid">Register Id:</label></td>
				<td><input id="registerid" name="registerid" type="text" value="<%=nullCheck((String)request.getAttribute("register_id"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="subscriptionid">Subscription Id:</label></td>
				<td><input id="subscriptionid" name="subscriptionid" type="text" value="<%=nullCheck((String)request.getAttribute("subscription_id"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="subscriptiontype">Subscription Type:</label></td>
				<td><input id="subscriptiontype" name="subscriptiontype" type="text" value="<%=nullCheck((String)request.getAttribute("subscription_type"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="orderid">Order Id:</label></td>
				<td><input id="orderid" name="orderid" type="text" value="<%=nullCheck((String)request.getAttribute("order_id"))%>">
			</td></tr>
			
			
			<tr height="50" width="122"><td>
				<label for="plantype">Plan Type:</label></td>
				<td><input id="plantype" name="plantype" type="text" value="<%=nullCheck((String)request.getAttribute("plan_type"))%>">
			</td></tr>
			
			
			
			<tr height="50" width="122"><td>
				<label for="customerid">Customer Id:</label></td>
				<td><input id="customerid" name="customerid" type="text" value="<%=nullCheck((String)request.getAttribute("customerid"))%>">
			</td></tr>
			
			
<tr  align="center" ><td colspan="2">
<label class="lab"><img src="images/update.jpg"   alt="update" width="20" height="20" style="cursor:pointer"/>
<input type="submit" name="Insert" value="Update" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"></label>
&nbsp;<label class="lab">
<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label>
</td></tr>

</table></td></tr></form></table>

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
    </div>  
  </footer>
</body>


</html>

