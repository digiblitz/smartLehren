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
       
     <script src="js/TMForm.js"></script> 
     
     <script>

      
 
        $(document).ready(function(){  
           $(".menu li a").each(function() { 

               if ($(this).next().length > 0) { 

                   $(this).addClass("parent");  
               };  
           })  
           var menux = $('.menu li a.parent');  
           $( '<div class="more"><img src="btn-hamburger.png" alt=""></div>' ).insertBefore(menux);  
           $('.more').click(function(){  
                $(this).parent('li').toggleClass('open');  
           });  
           $('.menu-btn').click(function(){  
              $('nav').toggleClass('menu-open');  
          });  
       });  
    

     </script>
 
	     
      <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">


    <![endif]-->
     </head>
	 <body class="page1" id="top">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="">
      
      <h3>Enroll User:</h3>
	  <table width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin; color:#000000; font-size:16px; background-color:#B2E0C2">
<tr><td  >
         <form id="form" name="insert" align="center" action="./login.html" method="post">
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
<input type="hidden" name="LoginProcess"  value="insert">
<tr><td>
<div align="center" style="color:#000000; font-size:24px; font-weight:bold ; margin-bottom:20px;" ><img src="images/unenroll.jpg" alt="UnEnrolled User" width="30" height="30">UnEnrolled User</div>
    <table width="870" align="center" >
            <tr  style="font-size:18px; height:20px; font-weight:bold">
			<td width="121"  height="50" >User Name</td>
			<td width="121"  height="50" >First Name</td>
			<td width="121"  height="50" >Last Name</td>
			<td width="261"  height="50" >Email Id</td>
			<td width="222"  height="50" >Approve</td>
			
		   </tr>

			<%
				
				
				ArrayList enrolList = (ArrayList)request.getAttribute("elist");
					if(enrolList!=null && enrolList.size()!=0){
					Iterator itr = enrolList.iterator();
					while(itr.hasNext()){
					 String sr[] = (String[]) itr.next();
					 String user_id = sr[0];
					 String username = sr[1];
					 String first_name = sr[2]; 
					 String last_name = sr[3]; 
					 String email = sr[4]; 										   	
						
						
			%>
			
		  <tr>
		  <td  height="50" ><%=username%></td>
			<td  height="50" ><%=first_name%></td>
			<td  height="50" ><%=last_name%></td>	
			<td  height="50" ><%=email%></td>	
						
			<td  height="50" ><label><img src="images/approve.png"  alt="Approve" width="20" height="20" style="cursor:pointer"/><input  type="button" name="process" value="Approve" class="oneBtn"  style="background-color: transparent; border:none; cursor:pointer; width:60px; height:20px;" onClick="location.href='login.html?cmd=initpgmentorApprovEnroll&user_id=<%=user_id%>'" ></label></td>
			
		   </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19"colspan="5" align="center"><strong>No user to enroll</strong></td>
           </tr>
		   <%} %></table><br><br>
		  
</td></tr></form></td></tr></table></div></div></div>
     
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

