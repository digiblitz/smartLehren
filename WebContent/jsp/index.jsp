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
     
    <meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
		
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="css/tabstyles.css" />
  		<script src="js/modernizr.custom.js"></script>
	 <script>
	 
	 
	 function initload(){

 //document.getElementById("proname").style.display = "block";
 //document.getElementById("subproname").style.display = "none";
//document.getElementById("course").style.display = "none";
		$("#proname").css("display", "block");
		$("#subproname").css("display", "none");
		$("#course").css("display", "none");

  }
  
  function displaysubpro(){
 
		$("#proname").css("display", "block");
		$("#subproname").css("display", "block");
		
	 // document.getElementById("proname").style.display = "block"; 
	  //document.getElementById("subproname").style.display = "block";
  
  } 
  function displaycourse(){
 
			$("#proname").css("display", "block");
		$("#subproname").css("display", "block");
		$("#course").css("display", "block");
		
	  //document.getElementById("proname").style.display = "block"; 
	 // document.getElementById("subproname").style.display = "block";
	//document.getElementById("course").style.display = "block";
  } 



</script>

</head>

<% 		
 					adminDB dbb = adminDB.getInstance(); 					
					
 		   			String user_id = (String)session.getAttribute("user_id");
				   String role_id = (String)session.getAttribute("role_id");
        		   String astatus = (String)request.getAttribute("astatus");
        		   String pstatus = (String)request.getAttribute("pstatus");
				   
				   String prog_name = (String)request.getAttribute("colist");
				   String subprog_name = (String)request.getAttribute("subcolist");
				   
				   String emp_id = (String)request.getAttribute("emp_id");
				   
				   boolean flagg = dbb.getConfirmAdmin(user_id); 
				   
System.out.println(user_id+" =========== from index ===================== ");
 
 System.out.println(prog_name+" =========== prog_name ===================== subprog_name " +subprog_name);
 
 System.out.println(emp_id+" =========== emp_id ===================== ");
 
 if(user_id != null){ 
 %>

	 <body class="page1" id="top">
	 <% String enroll = (String)request.getAttribute("enroll"); 	 
	 %>
	 
 <headere>
<%@ include file = "../../include/header.jsp" %>

<% if(enroll == null && emp_id != null){%>
<%@ include file = "../../include/Hmenu.jsp" %>
<%}else if(enroll == null && astatus.equals("Approved") && pstatus.equals("Approved")){
%>
<%@ include file = "../../include/Hmenu.jsp" %>
<%
}else if(flagg){%>
<%@ include file = "../../include/Hmenu.jsp" %>
<% }%>
</headere>
<!--==============================Content=================================-->
<div class="content">
   <div class="container_12 ">
 
      <div class="">
     
 			  <div style="float: left; margin-top: 35px;">
					<%
					
					
				if(role_id==null && astatus.equals("Pending")){
				ArrayList enrolL = (ArrayList)request.getAttribute("userlist");

					if(enrolL!=null && enrolL.size()!=0){
					Iterator itr = enrolL.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
					 String first_name = sr4[2]; 
					 String last_name = sr4[3]; 
					 	
			%>
			
						
		<!--<tr ><td align="center"><div style="color:#000000; font-size:14px; margin-top:30px; font-weight:bold; margin-top:10px; color:#442222; font-family:'trebuchet MS', verdana; margin-left:80px" ><a href="login.html?cmd=initselfenroll" style="font-size:20px"><img src="images/enrollnew.gif" width="120" height="35" ></a></div></td></tr>-->
		<div class="linkss" style=" position: fixed; top: 25%; left: 25%; right:25%; "><a href="login.html?cmd=initselfenroll">Enroll Now</a></div>	
		
				<%}}}else if(role_id==null && astatus.equals("StillPending")){ %>  
					  	
						
		
		<div style="color:#000033; margin-top:100px; font-family:'Times New Roman', Times, serif;">Your Approval is in Process...You will get e-mail soon...</div>
			
					  <!-- Student not approved starts -->
					  
					<%}else if(role_id!=null){
					
					if(astatus.equals("Approved") && pstatus.equals("Pending")){ %>  
					
		<div style="color:#000033; font-family:'Times New Roman', Times, serif; margin:200px 0 0 300px; font-size:18px; text-align:justify">Admission Officer Verified Your Documents.</div>
<div style="color:#000033; margin:5px 0 0 300px; font-family:'Times New Roman', Times, serif;">Next You Want to Make Payment for Course.</div>
<br>
<div style="margin:5px 0 0 300px; color:#660033; font-size:22px"><a href="login.html?cmd=initpayment" style="font-family:'Times New Roman', Times, serif; font-size:18px; text-decoration:underline;">Click Here</a> <label style="font-family:'Times New Roman', Times, serif; font-size:30px;">to make payment </label>
</div>
 	
					<%}else if(astatus.equals("Approved") && pstatus.equals("StillPending")){%>
					
		<div style="color:#000033; font-family:'Times New Roman', Times, serif; margin-top:50px; width:450px; font-size:18px; text-align:justify">Payment is in Under Process...</div>
				
				<!-- Student not approved ends -->
				
					<%}else {%>

<!-- Student starts -->
<%
if(prog_name != null){%>
<div style=" color:#ac2c00; font-size:30px; font-weight:bold; margin-top:20px;margin-left:10px; font-family:'Times New Roman', Times, sans-serif;"><img src="images/study.png" alt="my program and courses" width="30" height="30">My Program & Courses:</div>

<div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-left:10px;">&nbsp;</div>

<div style="margin-bottom:25px; color:#FF0000; font-size:26px; margin-left:30px; font-family:'Times New Roman', Times, sans-serif;" onClick="displaysubpro()" id="proname"><img src="images/arrow.png" alt="<%=prog_name %>" width="30" height="15"><a href="#"><%=prog_name %></a></div>

<div style="margin-bottom:25px; color:#FF0000; font-size:20px; margin-left:40px; font-family:'Times New Roman', Times, sans-serif;" onClick="displaycourse()" id="subproname"><img src="images/arrow.png" alt="<%=subprog_name %>" width="30" height="15"><a href="#"><%=subprog_name %></a></div>	

<%}%>
<div id="course">
<%	
				ArrayList stucourselist = (ArrayList)request.getAttribute("stucourselist");
				
					if(stucourselist!=null && stucourselist.size()!=0){
						
					Iterator itr = stucourselist.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
										 
					  String course_code = sr4[0]; 
					 String course_name = sr4[1]; 
					 	
			%>
				
		<div class="jp" align="left"  style="margin-left:60px; font-family:'Times New Roman', Times, sans-serif;" ><img src="images/arrow.png" alt="<%=course_name%>" width="30" height="15"><a href="student.html?cmd=initshowwork&course_name=<%=course_name%>&course_code=<%=course_code%>" style="text-decoration: none"><%=course_name%></a></div>
		<br>
				
				<%}}else{ %>
				
				<% }%>
</div>

<!-- Student ends -->

<!-- for course mentor starts -->

				<%	
				ArrayList cmcourselist = (ArrayList)request.getAttribute("cmcourselist");
				
					if(cmcourselist!=null && cmcourselist.size()!=0){
						%>
						
						<div class="ap" align="left" style="color:#ac2c00; font-family:'Times New Roman', Times, sans-serif;"><img src="images/study.png" alt="my courses" width="30" height="30">My courses</div>
						
	<div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-top:0px;">&nbsp;</div>
						
						<%
					Iterator itr = cmcourselist.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
										 
					  String course_code = sr4[0]; 
					 String course_name = sr4[1]; 
					 	
			%>
				
		<div class="jp" align="left" ><img src="images/arrow.png" alt="<%=course_name%>" width="30" height="15"><a href="trainer.html?cmd=initshowwork&course_name=<%=course_name%>&course_code=<%=course_code%>" style="text-decoration: none; font-family:'Times New Roman', Times, sans-serif;"><%=course_name%></a></div>
		<br>
				
				<%}}else{ %>
				
				<% }%>
				
				<%	
				ArrayList polist = (ArrayList)request.getAttribute("polist");
				
					if(polist!=null && polist.size()!=0){
						%>
		<div class="ap" align="left" style="color:#ac2c00; font-family:'Times New Roman', Times, serif;"><img src="images/study.png" alt="sub program" width="30" height="30"> My Sub Program</div>

 <div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-top:0px;">&nbsp;</div>
						
						<%
					Iterator itr1 = polist.iterator();
					while(itr1.hasNext()){
					 String sr4[] = (String[]) itr1.next();
										 
					 String course_name = sr4[0]; 
					 String subcourse_name = sr4[1]; 
					 	
			%>
			
		<div class="jp" align="left" style="font-family:'Times New Roman', Times, serif;"><img src="images/arrow.png" alt="<%=subcourse_name%>" width="30" height="15"><%=subcourse_name%></a></div>
		<br>
				
				<%}}else{ %>
				
				<% }%>
				
				<!-- for course mentor and program mentor ends -->
				
				<!-- for non teaching staffs starts -->
				
				<%	
				ArrayList allprogramlist = (ArrayList)request.getAttribute("allprogramlist");
				
					if(allprogramlist!=null && allprogramlist.size()!=0){
						%>
		<!-- <div class="ap" align="left" style="margin-left:10px; width:250px; color:#ac2c00; font-family:'Times New Roman', Times, sans-serif;">
		<img src="images/student.png" width="30" height="30">All Programs</div>
	
	<div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-top:0px;">&nbsp;</div>
			-->			
						<%
					Iterator itr2 = allprogramlist.iterator();
					while(itr2.hasNext()){
					 String sr4[] = (String[]) itr2.next();
										 
					 String pro_id = sr4[0]; 
					 String pro_name = sr4[1]; 
					 	
			%>
			
		<!-- <div class="jp" align="left" style="margin-top:20px; margin-bottom:10px; margin-left:100px; font-family:'Times New Roman', Times, sans-serif;"  ><%=pro_name%></a></div> -->
		<%	
				ArrayList subcourselist = (ArrayList)request.getAttribute("subcourselist");
				
					if(subcourselist!=null && subcourselist.size()!=0){
						
					Iterator itr3 = subcourselist.iterator();
					while(itr3.hasNext()){
					 String sr3[] = (String[]) itr3.next();

					 String subpro_id = sr3[0]; 
					 String cpro_id = sr3[1]; 
					 String subpro_name = sr3[2]; 
	
			if(pro_id.equals(cpro_id)){
			%>	
			<!-- <div  align="left"  style="margin-top:20px; margin-bottom:10px; margin-left:150px; color:#000000; font-size:18px; font-family:'Times New Roman', Times, sans-serif;" ><%=subpro_name%></a></div> -->
				<%}}}}
				%>
				<!-- for non teaching staffs ends -->
				
				<%
				}} %>
				
			
<div style="width:300px; height:200px; margin-top:80px; ">
				  
					<%   ArrayList cmlist= (ArrayList)request.getAttribute("cmlist");
     if(cmlist!=null && cmlist.size()!=0){%>
    
	
	<div class="ap" style="color:#ac2c00; font-family:'Times New Roman', Times, sans-serif; width:302px; "><img src="images/student.png" alt="my course mentors" width="30" height="30">My Course Mentors</div>
	
<div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-top:0px;">&nbsp;</div>
        
    <% Iterator itr2 = cmlist.iterator();
     while(itr2.hasNext()){
      String sr2[] = (String[]) itr2.next();
      String userid = sr2[0]; 
      String firstname2 = sr2[1]; 
      String lastname2= sr2[2];
   
    %> 
   <div><span class="style4" style="color:#007edf; font-size:18px; font-family:'Times New Roman', Times, sans-serif;"><img src="images/arrow.png" alt="<%=firstname2 %>  <%=lastname2 %>" width="30" height="15"><%=firstname2 %>  <%=lastname2 %></li></span></div>
    &nbsp; &nbsp;
	<%}
	}%>		  
					 </div>
					 
					 
					 </div>




<!-- Calendar and Chat starts  -->

<div style="float:right; width: 300px; margin-top: 35px;">
			<%if(!astatus.equals("Approved") || pstatus.equals("Approved")){ %>
				

		<div class="ap" style="font-family:'Times New Roman', Times, sans-serif;"><img src="images/cal.gif" alt="calender" width="20" height="20"> Calendar</div>
	
<div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-top:0px;">&nbsp;</div>
				<div style="color:#ac2c00"><%@ include file = "../../jsp/calendar.jsp" %></div>
					
<div class="ap" style="font-family:'Times New Roman', Times, sans-serif;"><img src="images/cal.gif" alt="calendar" width="20" height="20"> Chat</div>
					       
 <div>&nbsp;</div><div style="border-top-color:#000000; border-top-width:thin; border-top-style:groove;margin-top:0px;">&nbsp;</div>
					<div style="color:#ac2c00"><%@ include file = "../../jsp/application.jsp" %></div>
				
					<%}%>
					
				 <%} %>
				
				</div>
				
       
      </div>
     
   <div>&nbsp;</div>
  
  </div>   
</div>
<!--==============================footer=================================-->
 <footer>   
    <div class="container_12"><br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
     
  </footer>
  
  <script src="js/cbpFWTabs.js"></script>
		<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
		</script> 
</body>

<% }else{ %>


<%
 } %>

</html>

