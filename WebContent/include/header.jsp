<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
 <%@ page import="java.util.*"%>
 <html>
 
<head>
<script src="js/fontsize.js"></script>
 <script type="text/javascript">
 

 
 $(document).ready(function(){
 
	
function delayer(){
	//var userId1 = document.getElementById("userid").value;
   // alert('session expired');
	window.location = "login.html?cmd=initlogout"
	
}



    function noBack() { 
    	var url = window.location.href;
window.history.go(-window.history.length);
window.location.href = url;
    	}
		
		 });
		 
		
}
		
</script>


 <style>

	.button {
    background-color: #e59859; /* Green */
    border: none;
    color: white;
    padding: 4px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 0px 2px;
    cursor: pointer;
    }

	.button2 {background-color: #779f59;} /* Green */
	.button3 {background-color: #b70000;} /* Red */ 
 body{
	 background-color: black;
 }
 .labb{	
	display: inline-block;
	font-size:17px;
	text-align: left;
	margin:0 15px 0 15px;
}
	</style>
</head>
<body >
 
 <%String uName = (String)session.getAttribute("username");
 String uPassword = (String)session.getAttribute("password");
 String rolename = (String)session.getAttribute("rolename");
 String registerno = (String)session.getAttribute("registerno");
 String imageData = (String)session.getAttribute("imageData");
 String sessionId = (String)session.getAttribute("sessionId");
 
 String userId1 = (String)session.getAttribute("user_id");
 session.setAttribute("username", uName);
 session.setAttribute("password", uPassword);
 
 if(userId1 != null){
	
			ArrayList enrolList1 = (ArrayList)session.getAttribute("userlist");
					if(enrolList1 != null && enrolList1.size()!= 0){
					Iterator itr = enrolList1.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
				 
					 String first_name = sr4[2]; 
					 String last_name = sr4[3]; 
					 session.setAttribute("firstName", first_name);
					 session.setAttribute("lastName", last_name);
					 	
			%>
	
	
		
        <div class="tabs2" style="font-family:'Times New Roman', Times, serif;">		
<div  style="background-color: #CCCCCC; width:auto; height:50px; margin-top:0px; vertical-align:bottom; text-transform:uppercase;" >
  
  <span>
  <input type="hidden" id="clickcount" value="0">
<a href="map.html?cmd=inithome"><img src="images/smartLehrenlogo.png" alt="smartLehren"  height="45"/></a>
</span>
      <input type="submit" value="A-" class="button" id="btn-decrease"  style="font-family:'Times New Roman', Times, serif; ">
	  <input type="submit" value="A" class="button button2" id="btn-orig"  style="font-family:'Times New Roman', Times, serif; ">
	  <input type="submit" value="A+" class="button button3" id="btn-increase"  style="font-family:'Times New Roman', Times, serif; ">


<span style="margin-right:80px; float:right;">
<label class="labb">Welcome&nbsp;&nbsp;
<%if(imageData != null){
	%><img src="data:image/jpeg;base64,<%=imageData%>"  width="40"  style="height:50px; padding:0 0 0 0; vertical-align:middle;">
<%}else{ %>
<img src="images/user.jpg" alt="userimage">
<%} %>&nbsp;&nbsp; 
<%=first_name %> <%=last_name %></label>
<%if(rolename != null){ %>
<label class="labb">Role : <%=rolename %></label>
<%}else{ %>
 
<%} %>
<%if(registerno != null){ %>
 <label class="labb">Register_No : <%= registerno%></label>
<%}else{ %>

<%} %>

		<label class="labb">		
		<a href="login.html?cmd=initlogout" style="color:#cc0000; text-decoration:none; vertical-align:bottom;">				
	<img src="images/logout new.png" alt="Logout" width="18" height="25" style="vertical-align:middle; margin:0 0 12px 10px;" />
				Logout</a></label>
<a href='login.html?cmd=initmainindex'><img src="images/home.png" alt="home" height="35" style="margin:5px 0 0 35px;" /></a>

</span>
				
				</div></div>
     
	 <%}}else{
		 %>
		   <div class="tabs1" >		
<div  style="background-color:#CCCCCC; width:auto; height:45px; margin-top:0px; vertical-align:bottom; text-transform:uppercase;" >
	<span><img src="images/smartLehrenlogo.png" alt="smartLehren" height="45">
	</span>
	</div></div> 
		 <%}  
		 %>
		 </body>
		 
		 <%}else{
			 System.out.println("session expired from else header ");
			 %>
		 
		 
		 <BODY onLoad="setTimeout('delayer()', 100)"
    onpageshow="if (event.persisted) noBack();" onUnload="">	
	 </body>
	 
	 <%}%>

	
 	 </html>
