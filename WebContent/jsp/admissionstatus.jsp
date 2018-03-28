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
      

    
    <script src="js/lib/jquery.js"></script>
	<script src="js/dist/jquery.validate.js"></script>	
          
		  <script type="text/javascript">
	function showVal(programid){ 
   		 var programid = programid;
		window.location.assign('enroll.html?cmd=getsubprogramlist&programid='+programid);			
       }
	   
	</script>
          
          <style>	
	.lab{
	font-family:"Times New Roman", Times, serif;
	font-size:15px;
	text-align: center;
}

.title{
	font-family:"Times New Roman", Times, serif;
	font-size:35px;
	text-align: left;
	color:#9400D3;
}

table.attendancestatus th{
	border:1px solid black;
	align:center;
	height:35px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.attendancestatus td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:35px;
	font-family:"Times New Roman", Times, serif;
	
}

.attendancestatus tr:nth-child(odd){ 
		background: #b8d1f3;
}
	
.attendancestatus tr:nth-child(even){
		background: #dae5f4;
}

	</style>
          
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
  <div class="container_123">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Admission Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
  
  <table class="attendancestatus" width="100%">

<tr height="40">
<th align="center">Register No.</th><th align="center">Name</th><th align="center">Mail Id</th><th align="center">Mobile No</th><th align="center">Address</th><th align="center">Category</th><th align="center">Batch</th><th align="center">Payment Status</th>

	<% ArrayList admissionlist = (ArrayList)request.getAttribute("admissionlist");
		
		if(admissionlist != null){
			
			Iterator itr = admissionlist.iterator();
			while(itr.hasNext()){
				String [] strarr= (String[])itr.next();
				
				String register_no = strarr[0];
            	String firstname= strarr[1];
            	String lastname= strarr[2];
            	String e_mail= strarr[3];            	
            	String mobile_no= strarr[4];
            	String address1= strarr[5];
            	String address2= strarr[6]; 
            	String city= strarr[7];
            	String state= strarr[8];
            	String country= strarr[9];
            	String pincode= strarr[10];
            	String category= strarr[11];
            	String batch= strarr[12];            	
            	String paymentstatus= strarr[13]; 
				
            	String name = firstname+" "+lastname;
            	String address = " Address: "+address1+" "+address2+" City: "+city+" State: "+state+" Country: "+country+" Pincode: "+pincode;
		%>
						
<tr>
<td ><div name="userregid" id="userregid" align="center" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:50px;" ><%=register_no%></div></td>
<td><div name="name" id="name" align="left" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:120px;"   ><%=name%></div></td>
<td><div name="e_mail" id="e_mail" align="left" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:200px;"  ><%=e_mail%></div></td>
<td><div name="mobile_no" id="mobile_no" align="left" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:120px;" ><%=mobile_no%></div></td>
<td><marquee behavior="scroll" onmouseover="this.stop();" onmouseout="this.start();"><div name="address" id="address" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:1500px;" ><%=address%></div></marquee></td>
<td><div name="category" id="category" align="center" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:50px;"  ><%=category%></div></td>
<td><div name="batch" id="batch" align="center" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:80px;"  ><%=batch%></div></td>
<td><div name="paymentstatus" id="paymentstatus" align="center" style="font-family:'Times New Roman', Times, serif; font-size:16px; border:none; width:80px;"  ><%=paymentstatus%></div></td>

</tr>

					<%}}
					else{
					%>		
<tr><td colspan="3">No Records Found</td></tr>
					<% }%>
		 					</table>
			
    </div>  </div>  </div></div>

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
