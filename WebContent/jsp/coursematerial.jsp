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
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="grid_12">

<table  width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin;  color:#000000; font-size:16px" >
<h3>Download Course materials</h3>
<form align="center" action="./trainer.html" method="post">
<input type="hidden" name="TrainerProcess"  value="Process">
<%String course_name=(String)request.getAttribute("course_name"); %>
<%String user_id=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=course_name%>">
<tr><td>
<table align="left" style="margin-top:0px;">


<%
ArrayList enrolList3 = (ArrayList)request.getAttribute("coursematerial");
if(enrolList3!=null && enrolList3.size()!=0){
Iterator itr = enrolList3.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String file_name = sr[0];
 String path_name = sr[1];
   %>
<div  style="color:#000000; font-size:20px; margin-bottom:10px;"><img src="images/download.png" width="20" ><a href="trainer.html?cmd=initshowcoursematerial&filename=<%=file_name%>&pathname=<%=path_name%>" style="text-decoration: none"  target="_blank">click and save  <%=file_name%> </a></div>
<%}
} %>
</table ></td></tr></form></table>
<div style="color:#000000; font-size:30px; margin-bottom:20px; margin-top:30px;">View Course Materials</div>
<table width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin;  color:#000000; font-size:16px"><tr><td>

<div style="margin-bottom:20px"><a href="login.html?cmd=initdrupalfile" style="text-decoration:none" ><img src="images/course new.jpg" alt="Html Tutorials" width="20" height="20">&nbsp;Html Tutorials</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initmarketing" style="text-decoration:none" ><img src="images/course new.jpg" alt="Marketing Study Area" width="20" height="20">&nbsp;Marketing Study Area</a> </div>

<div style="margin-bottom:20px"><a href="login.html?cmd=initmarketing" style="text-decoration:none" ><img src="images/course new.jpg" alt="Eye Study Area" width="20" height="20">&nbsp;Eye Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initmarketing" style="text-decoration:none" ><img src="images/course new.jpg" alt="Hurricanes Study Area"width="20" height="20">&nbsp;Hurricanes Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initlin" style="text-decoration:none" ><img src="images/course new.jpg" alt="Linguistics Study Area" width="20" height="20">&nbsp;Linguistics Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initmarketing" style="text-decoration:none" ><img src="images/course new.jpg" alt="Maslow's Hierarchy Study Area" width="20" height="20">&nbsp;Maslow's Hierarchy Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initmarketing" style="text-decoration:none" ><img src="images/course new.jpg" alt="Pareto chart Study Area" width="20" height="20">&nbsp;Pareto chart Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initqur" style="text-decoration:none" ><img src="images/course new.jpg" alt="Quadratic Study Area" width="20" height="20">&nbsp;Quadratic Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=inittamil" style="text-decoration:none" ><img src="images/course new.jpg" alt="Tamil Study Area" width="20" height="20">&nbsp;Tamil Study Area</a> </div>
<div style="margin-bottom:20px"><a href="login.html?cmd=initww" style="text-decoration:none" ><img src="images/course new.jpg" alt="World War II  Study Area"  width="20" height="20">&nbsp;World War II  Study Area</a> </div>
<div align="center"><label><img src="images/back.png" alt="Back"  width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Back" ></label></div>
</td></tr></table>

							
       
      </div>
     
      <div class="clear"></div>  
      
      <div class="clear"></div>
   <div>&nbsp;</div>
  </div>   
</div>
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

