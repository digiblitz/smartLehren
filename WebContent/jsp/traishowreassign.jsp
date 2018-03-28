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
       <%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
      
     

<form align="center" action="./trainer.html" >
<input type="hidden" name="TrainerProcess"  value="addassign">
<%String course_code=(String)request.getAttribute("course_code"); %>
<%String course_name=(String)request.getAttribute("course_name"); %>
<%String assign_name=(String)request.getAttribute("assign_name"); %>
<%String last_date=(String)request.getAttribute("lastdate");%>
<%String allow_date=(String)request.getAttribute("allowdate");%>
<%String days=(String)request.getAttribute("days");%>
<%String current_date=(String)request.getAttribute("currentdate");%>
<input type="hidden" name="course_code"  value="<%=course_code%>">
<input type="hidden" name="assign_name"  value="<%=assign_name%>">
<input type="hidden" name="course_name"  value="<%=course_name%>">

<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


<div style="text-align:left; font-size:18px; font-family:'Times New Roman', Times, serif; color:#000000; font-weight:bold; margin-bottom:10px;"  >Assignment name:<%=assign_name%></div>


<%String question=(String)request.getAttribute("question");


String criteria= "</p>";
String [] strarr = question.split(criteria);
for( int i =0; i<strarr.length; i++)
{%>
 <div align="left" style="font-family:'Times New Roman', Times, serif; font-size: 14px; color:#000000"><%=strarr[i]%></div>
<%} %>
<input type="hidden" name="question"  value="<%=question%>">

<div style="text-align:left; font-size:18px; font-family:'Times New Roman', Times, serif; color:#000000; font-weight:bold" align="left">Submission Status:</div>
<div  >&nbsp</div>
<% 
Date date1 =null;Date date2 =null;Date date3 =null;

DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

date1 = format.parse(allow_date);
date2 = format.parse(current_date);
date3 = format.parse(last_date);

long allow_dat = date1.getTime();
long current_dat = date2.getTime();
long last_dat = date3.getTime();
if(allow_dat<=current_dat && last_dat>=current_dat){%>

<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px">Due Date:&nbsp;<%=last_date%></div>
<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px">Time Remaining:&nbsp;<%=days%></div>
<%}else{ %>
<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px">Due Date:&nbsp;<%=last_date%></div>
<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px">Time Remaining:&nbsp;<font color="#FF0000">Over due<%=days%></font></div>
<%} %>
<div style="font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px"><a href="trainer.html?cmd=initviewreassign&course_code=<%=course_code%>&assign_name=<%=assign_name%>&course_name=<%=course_name%>">View/Grade</a></div>

<div align="center"><label><img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div></td></tr></table>

</div></div></form>	
							
       
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

