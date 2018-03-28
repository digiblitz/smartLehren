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
	
     </head>
	 <body >
 
  <%@ include file = "../../include/header.jsp" %>
	 <%@ include file = "../../include/Hmenu.jsp" %>
	
	<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="grid_12" style="font-family:'Times New Roman', Times, serif;">
	 
	  <h3><img src="images/resourse.jpg" alt="available resources" width="30"  height="30"/>Available Resources:</h3>
	  <table width="1000" height="400" border="0" cellpadding="2" cellspacing="2" align="center" style="margin-top:50px; color:#000000; font-size:16px;  margin-top:20px">
 
  
  <tr><td width="227" height="109"><div style="margin-left:30px; margin-top:30px" ><a href="http://www.safaribooksonline.com/search/?q=*" target="_blank" class="style10" style="text-decoration:none"  >
      
      <p><img src="images/big3.png" alt="E-Library" width="100" /></p>
      <p>E-Library</p></a></div></td>
    <td width="266"><div style="margin-left:30px; margin-top:30px" > <a class="style10" href="qual.html?cmd=initexternalapp&urlname=openmeetings" style="text-decoration:none" ><p><img src="images/page4_img1.png" alt="webcast" width="100" /></p>WebCast</a></div></td>
    <td width="228"> <div style="margin-left:30px; margin-top:30px" ><a class="style10"href="login.html?cmd=initcheckList" style="text-decoration:none" ><p><img src="images//page4_img1.png" alt="academic authenticity" width="100"  /></p>Academic Authenticity</a></div></td>
  </tr>
  <tr>
    <td><div style="margin-left:30px; margin-top:30px" ><a class="style10" href="qual.html?cmd=initexternalapp&urlname=LMS" style="text-decoration:none" ><p><img src="images/library.png" alt="library" width="100" /></p>Library</a></div></td>
    <td><div style="margin-left:30px; margin-top:30px"><a class="style10" href="qual.html?cmd=initexternalapp&urlname=https://webwhiteboard.com/board/8kfuv2fp" style="text-decoration:none" ><p><img src="images/big2.png" alt="white board" width="100"/></p>White Board</a> </div></td>
    <td><div style="margin-left:30px; margin-top:30px" ><a class="style10" href="login.html?cmd=inittroubleTicket" style="text-decoration:none" ><p><img src="images/ticket.png" alt="trouble ticket" /></p>Trouble Ticket</a></div> 
	</td>
  </tr>
</table>
</div></div>	</div>
 <!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
      
  </footer>
</body>
</html>

