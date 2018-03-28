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
      <%@ page import="com.util.userDB" %>
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
       
     <script src="js/jquery.js"></script>
       
    
	<script>
	
	$(document).ready(function(){
	
		$("#update").click(function(){
			
					
			var couponid = $("#couponid").val();
			var couponcode = $("#couponcode").val();
			var coupondesc = $("#coupondesc").val();
			var couponoffer = $("#couponoffer").val();
			
			$("#coupon_id").val(couponid);
			$("#coupon_code").val(couponcode);
			$("#coupon_desc").val(coupondesc);
			$("#coupon_offer").val(couponoffer);		
			
			$(".pp").show('slow');
		});
	
	});
	
	 function deactivate(couponid) {
        	var coupon_id = couponid;
                       
            if (confirm("Are you sure want to Deactivate") == true) {
            	window.location="customer.html?cmd=deActiveCoupon&coupon_id="+coupon_id; 
            } else {
            	//window.location="login.html?cmd=inituserlist"; 
            }
            
        }
		
		 function updateCoupon(a,b,c,d) {
        	var coupon_id = a;
			var coupon_code = b;
			var coupon_desc = c;
			var coupon_offer = d;
           
            window.location="customer.html?cmd=updateCoupon&coupon_id="+coupon_id+"&coupon_id="+coupon_code+"&coupon_code="+coupon_id+"&coupon_desc="+coupon_desc+"&coupon_offer="+coupon_offer; 
            
            
        }
	
	</script>
	
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
 <headere> 

<div><%@ include file = "../../include/header.jsp" %>
<%@ include file = "../../include/Hmenu.jsp" %>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
     
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  
	 -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; 
	 width:1100px;">
	 
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">
 Coupon List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; 
color:black;">
	 
         <form id="form" name="insert" align="center" action="./login.html" method="post">
 
<input type="hidden" name="LoginProcess"  value="insert">

    <table width="1100" >
            <tr  style="font-family:'Times New Roman', Times, serif; font-size:18px; height:20px; font-weight:bold;   color:#000000; ">
			
			<td width="122"  height="50" >Coupon Code</td>
			<td width="122"  height="50" >Coupon Description</td>
			<td width="171"  height="50" >Coupon Offer</td>
			<td width="171"  height="50" >Coupon Status</td>			
			<td width="171"  height="50" >Edit</td>
		   </tr>

			<%
				
				
				ArrayList couponlist = (ArrayList)request.getAttribute("couponlist");
					if(couponlist!=null && couponlist.size()!=0){
					Iterator itr = couponlist.iterator();
					while(itr.hasNext()){
					 String sr[] = (String[]) itr.next();
					 String couponid = sr[0];
					 String couponcode = sr[1];
					 String coupondesc = sr[2];
					 String couponoffer = sr[3];
						
			%> 
			
			<input type="hidden" name="couponid" id="couponid" value="<%=couponid%>" >
			<input type="hidden" name="couponcode" id="couponcode" value="<%=couponcode%>" >
			<input type="hidden" name="coupondesc" id="coupondesc" value="<%=coupondesc%>" >
			<input type="hidden" name="couponoffer" id="couponoffer" value="<%=couponoffer%>" >
			
		  <tr style="font-family:'Times New Roman', Times, serif; font-size:17px;">
		  <td  width="92"  height="50" ><%=couponcode%></td>
			<td  width="102"  height="50"><%=coupondesc%></td>			
			<td width="161"  height="50" ><%=couponoffer%></td>	
			<td width="92"  height="50" >
			<a href="#" onClick="deactivate('<%=couponid%>')" ><img src="images/wrong.png"  alt="Deactive" width="20" height="20" style="cursor:pointer"/>&nbsp;Deactivate</a></td>
			<td width="92"  height="50" >
			<a href="#" id="update" ><img src="images/update.jpg"  alt="update" width="20" height="20" style="cursor:pointer"/>&nbsp;Update</a></td>
			
	    </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19" colspan="3" width="500" align="right"><strong>Coupon Details are empty</label></strong></td>
           </tr>
		   <%} %></table><br><br>
		   

</form></div></div>

 
 
 <div class="pp" style="display:none; margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  
	 -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; 
	 width:1100px;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">
 Update Coupon</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; 
color:black;">


 <form id="form" name="insert" align="center" action="customer.html?cmd=updateCoupon" method="post">
<input type="hidden" name="coupon_id" id="coupon_id" value="" >

<table width="900" >
<tr><td width="129" height="54">Coupon Code:</td>
<td width="159">
<input type="text" name="coupon_code" id="coupon_code" value="" >
</td></tr>

<tr><td height="54">Description:</td>
<td>
<input type="text" name="coupon_desc" id="coupon_desc" value="" >
</td></tr>

<tr><td height="57">Coupon Offer:</td>
<td>
<input type="text" name="coupon_offer" id="coupon_offer" value="" >
</td></tr>

<tr><td height="55" colspan="2">
<img src="images/map.png" alt="submit" width="20" height="20" style="cursor:pointer"/><input type="submit" name="map" value="Submit"
		style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;" >&nbsp;
		<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; font-family:'Times New Roman', Times, serif; cursor:pointer;  width:50px; height:20px;" value="Cancel" >
</td></tr>

</table>
</form>

</div></div>


</div></div>
     

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
	

</script>
</html>

