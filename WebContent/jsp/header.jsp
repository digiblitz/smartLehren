<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
 <%@ page import="java.util.*"%>
 
 <%String uName=(String)session.getAttribute("username");
 String uPassword=(String)session.getAttribute("password");
 String rolename=(String)session.getAttribute("rolename");
 String registerno=(String)session.getAttribute("registerno");
 String imageData=(String)session.getAttribute("imageData");
 
 session.setAttribute("username", uName);
 session.setAttribute("password", uPassword);
 %>
 <%
			ArrayList enrolList1 = (ArrayList)session.getAttribute("userlist");
					if(enrolList1!=null && enrolList1.size()!=0){
					Iterator itr = enrolList1.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
				 
					 String first_name = sr4[2]; 
					 String last_name = sr4[3]; 
					 session.setAttribute("firstName", first_name);
					 session.setAttribute("lastName", last_name);
					 	
			%>
	
        <div class="tabs1" >		
<div  style="background-color: #CCCCCC; width:auto; height:45px; margin-top:0px; vertical-align:bottom; text-transform:uppercase;" >
<table width="1200">
  <tr>
<td width="254" align="left"><img src="images/smartLehrenlogo.png"  height="45"/></td>
<td width="951" align="right">Welcome&nbsp;&nbsp;&nbsp;&nbsp;<%if(imageData != null){ %><img src="data:image/jpeg;base64,<%=imageData%>"  width="40" height="50" style="vertical-align:middle;">
<%}else{ %>
<img src="images/user.jpg">
<%} %>&nbsp;&nbsp; 
<%=first_name %> <%=last_name %>&nbsp;&nbsp;
<%if(rolename != null){ %>
Role:&nbsp;<%=rolename %>
<%}else{ %>
 
<%} %>
<%if(registerno != null){ %>
&nbsp;&nbsp; Register_No:&nbsp;<%= registerno%>
<%}else{ %>

<%} %>
&nbsp;&nbsp;
<a href="login.html?cmd=initlogout" style="text-decoration:none; vertical-align:bottom;"><img src="images/logout new.png" alt="logout" width="18" height="25" style="vertical-align:middle;" />Logout</a></span></td>
</tr></table>
</div></div>
     
	 <%}}else{
		 %>
		   <div class="tabs1" >		
	<div  style="background-color:#CCCCCC; width:auto; height:45px; margin-top:0px; vertical-align:bottom; text-transform:uppercase;" >
	<table width="1300">
	  <tr>
	<td width="254" align="left"><img src="images/smartLehrenlogo.png" alt="smartlehren" height="45"/></td>
	<td width="1051" align="right">

	</td>
	</tr></table>
	</div></div> 
		 <%}%></div>


	
