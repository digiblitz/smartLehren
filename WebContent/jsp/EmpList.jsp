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
    
        function myFunction(userid) {
            var x=userid;
            if (confirm("Are you sure want to delete") == true) {
            	window.location="login.html?cmd=initdeleteuser&user_id="+x; 
            } else {
            	window.location="login.html?cmd=inituserlist"; 
            }
            
        }
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
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Employee List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

	 <table align="center"   width="1006" >
            <tr  style="font-size:18px; height:20px; font-weight:bold; color:#000000;">
			<td width="75" height="40" >First Name</td>
			<td width="75" height="40" >Last Name</td>
			<td width="75" height="40" >Email Id</td>
			<td width="75" height="40" >City</td>
			<td width="75" height="40" >State</td>
			<td width="75" height="40" >Country</td>
			<td width="75" height="40" >Delete</td>
			<td width="75" height="40" >Update</td>
			
		   </tr>

			<%
				
				
				ArrayList emplist1 = (ArrayList)request.getAttribute("emplist");
					if(emplist1!=null && emplist1.size()!=0){
					Iterator itr = emplist1.iterator();
					while(itr.hasNext()){
					 String sr[] = (String[]) itr.next();
					 String user_id=sr[0];
					 String emp_id=sr[1];
					 String first_name = sr[2]; 
					 String last_name = sr[3]; 
					 String email = sr[4]; 										   	
					 String city = sr[5];
					 String state = sr[6];
					 String country = sr[7];
						
			%>
			
		  <tr>
		  <td width="75" height="40" ><%=first_name%></td>
			<td width="75" height="40" ><%=last_name%></td>
			<td width="75" height="40" ><%=email%></td>	
			<td width="75" height="40" ><%=city%></td>	
			<td width="75" height="40" ><%=state%></td>	
			<td width="75" height="40" ><%=country%></td>			
			
			<td width="75" height="40" >
			<img src="images/delete.jpg" alt="delete" width="30" height="20" style="cursor:pointer"/><input type="button" name="process" value="" class="oneBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="myFunction('<%=emp_id%>')"></td>
			
			<td width="118" >
			<img src="images/update.jpg"  alt="update" width="30" height="20" style="cursor:pointer"/>
		    <input type="button" name="process" value="" class="oneBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="location.href='login.html?cmd=initupdateuser&user_id=<%=user_id%>'" ></td>
	    </tr>
		  
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="40" colspan="7" align="center"><strong><label class="lab">No Records Found</label></strong></td>
           </tr>
	    <%} %></table>
	  
	  
</div></div></div></div>	  
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>   
  </footer>
</body>

</html>

