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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta charset="utf-8">
    <title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
	 
	  <link rel="stylesheet" href="../../css/styles drupal.css">
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
	  <script src="../../js/scriptdrupal.js"></script>
<script src="//cdn.muut.com/1/moot.min.js"></script>
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
 
     <style>
     
      .moot .m-moot, .m-create .m-input-wrap, .m-preview { background-color: rgb(255, 255, 255) }
         .m-moot.m-collapsed .m-title { font-size: 110% }
         .moot .m-title, .moot textarea.m-input-title { color: rgb(0, 170, 221); font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 125%; letter-spacing: 0px; font-weight: bold }
         .m-sidebar { background-color: rgb(0, 149, 221) }
         #m-mainlinks .m-selected, .m-pagepage .m-nav-forums, .m-userpage .m-nav-online { background-color: rgba(0, 0, 0, 0.54902) }
         .m-reply { padding-bottom: 0.1em }
         .m-body p, .moot textarea { line-height: 1.5em; padding-bottom: 0.1em }
         .moot .m-replies { background-color: rgba(0, 0, 0, 0.0470588) }
         .m-links { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 100%; letter-spacing: 0.5px; font-weight: normal }
         .moot { font-size: 14px; background-color: rgba(0, 0, 0, 0.0196078) }
         .moot .m-sidebar .m-h3, .m-pagetitle, .m-navi a { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 88%; font-weight: bold; letter-spacing: 0.6px }
         .moot .m-header { background-color: rgb(36, 36, 36) }
         .moot .m-face { border-radius: 15% }
         .m-moot, .m-sidebar { border-radius: 6px }
         .moot .m-body, .m-input-body { color: rgb(0, 0, 0); font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 111%; font-weight: normal; letter-spacing: 0.2px }
         .moot button, .m-button { background-color: rgb(0, 170, 221) }
         .m-focused .m-input-wrap, .m-focused.m-replyform textarea { border-radius: rgb(0, 170, 221) 0px 0px 0.2em inset }
         .m-heart.m-has-likes span, .moot .m-button::after, .moot .m-show-help { color: rgb(0, 170, 221) }

    </style>
     </head>
	 <body class="page1" id="top">
  <headere><div>
  

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
 
	<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="grid_12">
  
</div></div></div>
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

