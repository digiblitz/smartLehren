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
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Test</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<%String quiz_name = (String)request.getAttribute("quiz_name");
String test_id = (String)request.getAttribute("test_id");
String course_code = (String)request.getAttribute("course_code"); %>


<form align="center" action="./trainer.html" >
<input type="hidden" name="TrainerProcess"  value="showquiz">
<input type="hidden" name="quiz_name"  value="<%=quiz_name%>">
<input type="hidden" name="test_id"  value="<%=test_id%>">
<input type="hidden" name="course_code"  value="<%=course_code%>">



<%
ArrayList enrolList = (ArrayList)request.getAttribute("question_name");
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
int i=0;
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String q_no = sr[0];
 String question = sr[1];
 String a = sr[2];
 String b = sr[3];
 String c = sr[4];
 String d = sr[5];
 String answer = sr[6];
 
   %>


<div style="line-height: 25px;">
<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000"><%=i+1%>.<%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%></div>
</div>
<% 
i++; 

}%>
<input type="hidden" name="upto"  value="<%=i%>">
<% } %>

<div>
<div style="margin: 0 0 0 250px; float:left;" ><img src="images/add.jpg" alt="" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Add Question"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:90px; height:20px;">

</div>

<div style="margin: 0 420px 0 0;" ><img src="images/Cancel.png"  alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;"  onClick="javascript:history.back(-1);" value="Cancel" >
</div>
</div>
</form>

					
       
      </div>
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

