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
<meta charset="utf-8">

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
	
<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
	
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
	 <body class="page1" id="top">
 <headere><div>


<div><%@ include file = "../../include/header.jsp" %></div>
<div > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<!-- <img src="images/approvenew.jpg" width="30" height="30"> -->
<div class="content">
  <div class="container_12 ">
  <div>&nbsp;</div>
       <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Student Approval</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
      
       <table width="800">
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
<input type="hidden" name="LoginProcess"  value="approvenroll">
<%String user_id=(String)request.getAttribute("userid");%>
<%String category=(String)request.getAttribute("category");%>
<input type="hidden" name="user_id" value="<%=user_id%>">

	 
 <tr><td>
 <table width="616" border="0" align="center" style="color:#000000; font-size:16px; margin-left:150px">


								 		<% 		
												ArrayList selflist = (ArrayList)request.getAttribute("selflist");
												if(selflist!=null && selflist.size()!=0){
													
													Iterator itr = selflist.iterator();
													 while (itr.hasNext()) {
													 String sr[] = (String[]) itr.next();
													
													 String userid = sr[0];										
										 	        	String firstname = sr[2]; 
										 	        	String lastname = sr[3]; 
										 	        	String gender = sr[4]; 
										 	        	String e_mail = sr[5]; 
										 	        	String dob = sr[6]; 
										 	        	String mobile_no = sr[7]; 
										 	        	String father_name = sr[8]; 
										 	        	String mother_name = sr[9]; 
										 	        	String address1 = sr[10]; 
										 	        	String address2 = sr[11]; 
										 	        	String city = sr[12]; 
										 	        	String state = sr[13]; 
										 	        	String country = sr[14]; 
										 	        	String pincode = sr[15]; 
										 	        	String category1 = sr[16]; 
										 	        	String program_name = sr[17]; 
										 	        	String subprogram_name = sr[18]; 
										 	        	String sslc_schoolname = sr[19]; 
										 	        	String sslc_board = sr[20]; 
										 	        	String sslc_mark = sr[21]; 
										 	        	String sslc_yop = sr[22]; 
										 	        	String hsc_schoolname = sr[23]; 
										 	        	String hsc_board = sr[24]; 
										 	        	String hsc_mark = sr[25]; 
										 	        	String hsc_yop = sr[26]; 
															   
													%>
													
	<tr><td height="40" width="288" >First Name:</td>
	
	<td>
<input type="text" name="firstname" id="firstname" value="<%=firstname%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
</td></tr>	
	
	<tr>
	<td height="40" width="288" >Last Name:</td>		
	<td>
	<input type="text" name="lastname" id="lastname" value="<%=lastname%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0" />
	</td></tr>	
	
	<tr><td height="40" width="288" >Gender:</td>
	<td>
	<input type="text" name="gender" id="gender" value="<%=nullCheck(gender)%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr><td height="40" width="288"  >Email:</td>
	<td>
	<input type="text" name="e_mail" id="e_mail" value="<%=e_mail%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288"  >Date of Birth:</td>
	<td>
	<input type="text" name="dob" id="dob" value="<%=dob%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288"  >Mobile No:</td>
	<td>
	<input type="text" name="mobile_no" id="mobile_no" value="<%=mobile_no%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288"  >Father Name:</td>
	<td>
	<input type="text" name="father_name" id="father_name" value="<%=father_name%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>		
	
	<tr ><td height="40" width="288"  >Mother Name:</td>
	<td>
	<input type="text" name="mother_name" id="mother_name" value="<%=mother_name%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288"  >Address 1:</td>
	<td>
	<input type="text" name="address1" id="address1" value="<%=address1%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288" >Address 2:</td>
	<td>
	<input type="text" name="address2" id="address2" value="<%=address2%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288" >City:</td>
	<td>
	<input type="text" name="city" id="city" value="<%=city%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/>
	</td></tr>	
	
	<tr ><td height="40" width="288"  >State:</td>
	<td>
	<input type="text" name="state" id="state" value="<%=state%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >Country:</td>
	<td>
	<input type="text" name="country" id="country" value="<%=country%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288" >Pincode:</td>
	<td>
	<input type="text" name="pincode" id="pincode" value="<%=pincode%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >Category:</td>
	<td>
	<input type="text" name="category" id="category" value="<%=category1%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288" >Program Name:</td>
	<td>
	<input type="text" name="program_name" id="program_name" value="<%=program_name%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >SubProgram Name:</td>
	<td>
	<input type="text" name="subprogram_name" id="subprogram_name" value="<%=subprogram_name%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >10th School Name:</td>
	<td>
	<input type="text" name="sslc_schoolname" id="sslc_schoolname" value="<%=sslc_schoolname%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288" >10th Board:</td>
	<td>
	<input type="text" name="sslc_board" id="sslc_board" value="<%=sslc_board%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288" >10th Mark:</td>
	<td>
	<input type="text" name="sslc_mark" id="sslc_mark" value="<%=sslc_mark%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >10th YOP:</td>
	<td>
	<input type="text" name="sslc_yop" id="sslc_yop" value="<%=sslc_yop%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" /></td></tr>	
	
	<tr ><td height="40" width="288"  >12th School Name:</td>
	<td>
	<input type="text" name="hsc_schoolname" id="hsc_schoolname" value="<%=hsc_schoolname%>" readonly="readonly"style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >12th Board:</td>
	<td>
	<input type="text" name="hsc_board" id="hsc_board" value="<%=hsc_board%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288"  >12th Mark:</td>
	<td>
	<input type="text" name="hsc_mark" id="hsc_mark" value="<%=hsc_mark%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>	
	
	<tr ><td height="40" width="288" >12th YOP:</td>
	<td>
	<input type="text" name="hsc_yop" id="hsc_yop" value="<%=hsc_yop%>" readonly="readonly" style="font-family:'Times New Roman', Times, serif;" border="0"/></td></tr>											
	
													
													<%	
													
													}
												}
											
											 
												%>
								 		
<tr>
<td  height="40" width="288" align="left"  class="textBold">File(s) to Download:</td>
<td><%
ArrayList enrolList3 = (ArrayList)request.getAttribute("flist");
if(enrolList3!=null && enrolList3.size()!=0){
Iterator itr = enrolList3.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String file_name = sr[0];
 String path_name = sr[1];
   %>
<div  style="color:#000000; font-size:20px; margin-bottom:10px;"><img src="images/download.png" alt="download" width="20" ><a href="trainer.html?cmd=initdownloadfile&filename=<%=file_name%>&pathname=<%=path_name%>" style="font-family:'Times New Roman', Times, serif; text-decoration: none"  target="_blank"><%=file_name%> </a></div>
<%}
} %></td></tr>	
							 		
<tr>
<td  height="40" width="288" align="left"  class="textBold">Role Name:</td>
	 								  <td width="318">
						
				<input type="text" name="rolename" id="rolename" value="Student" readonly >
						
	 								 <!-- <select name="rolename" id="rolename" >
								 		<option value="">Select role</option>
										<option value="">Student</option>
										
								 		<%-- <jsp:scriptlet> 								 				
								 			ArrayList rolist =(ArrayList)request.getAttribute("rolist");
											if(rolist!=null && rolist.size()!=0){
											
											Iterator itr = rolist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String role_id = sr[0]; 
											 String rolee_name = sr[1];
											  
														
														if(rolee_name!=null)
														{
															</jsp:scriptlet>
							<option value="<%=rolee_name%>"><label class="lab"><%=rolee_name %></label></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet> --%>
											 
		 		</select>
				-->
				
				</td></tr>
								 		
								 		<tr>
<td  height="40" width="288" align="left"  class="textBold">Batch:</td>
	 								  <td width="318">
	 				 <select name="batch" id="batch" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" >
						<option value="">Select batch</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList batchlist =(ArrayList)request.getAttribute("batchlist");
											
											if(batchlist!=null && batchlist.size()!=0){
											
											Iterator itr = batchlist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String batch_name = sr[0];
											  
														
														if(batch_name!=null)
														{
															</jsp:scriptlet>
							<option value="<%=batch_name%>"><%=batch_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
<tr ><td height="40" width="288">Approval:</td>
<td width="318">
  
    <select  id="selCateg"   name="approval" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;">
      <option value="Approved">Approved</option>
      <option value="Pending" >Pending</option>
      <option value="Rejected" >Rejected</option>
    </select>
 
 </td></tr>


<tr width="250" >
<td align="right" width="288">
<img src="images/submit.jpg" height="25" alt="" style="cursor:pointer"/>
<input type="submit" name="appenroll" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;" value="Submit" onClick="return(onValidate());">
</td>

<td align="left">
<img src="images/Cancel.png" alt="cancel" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>
</table></td></tr>




</form></table>
<br>
    
	</div></div></div>
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
  
	    if(document.enroll.rolename.value==""){
		alert("Role_name cannot be empty");
		document.enroll.rolename.focus();
		return false;
	}
	
	    if(document.enroll.batch.value==""){
			alert("Program_name cannot be empty");
			document.enroll.batch.focus();
			return false;
		}
	   
}
	

</script>
</html>

