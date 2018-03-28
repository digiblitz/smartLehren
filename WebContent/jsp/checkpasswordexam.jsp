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
 
<%String course_name=(String)request.getAttribute("course_name"); %>
<%String course_code=(String)request.getAttribute("course_code"); %>
<%String user_id=(String)request.getAttribute("user_id"); %>
<%String exam_name=(String)request.getAttribute("exam_name"); %>
<%String allow_date=(String)request.getAttribute("allow_date");
String examdate=(String)request.getAttribute("examdate");
String exam_id=(String)request.getAttribute("exam_id");%>

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
	 
	  <table width="718"> 
	 <tr><td >
	
<form align="center" action="exam.html?cmd=initshowexamdetails" method="post" >
<input type="hidden" name="course_name"  value="<%=course_name%>">
<input type="hidden" name="course_code"  value="<%=course_code%>">
<input type="hidden" name="user_id"  value="<%=user_id%>">
<input type="hidden" name="exam_name"  value="<%=exam_name%>">
<input type="hidden" name="allow_date"  value="<%=allow_date%>">
<input type="hidden" name="examdate"  value="<%=examdate%>">
<input type="hidden" name="exam_id"  value="<%=exam_id%>">

               <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
                <tr height="40"> <td colspan="2"><strong><font color="#FF0000" style="font-family:'Times New Roman', Times, serif;"><%=status%></font></strong></td>  <%
	}
	
	%>
                </tr>
				<tr align="center"><td colspan="2"><div  style="font-family:'Times New Roman', Times, serif; margin-bottom:20px; color:#FF0000">*All Fields are required.</div></td>
</tr>            
				
                <tr>
                  <td height="40" width="294" valign="middle" class="tableLeft" align="right">
				  Exam Code:</td>
                  <td width="412" align="center" valign="middle" class="tableRight">
	<input type="text"  style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" name="examcode" id="examcode"/>
                   </td>
                </tr>
                <tr>
                
                  <td height="40" width="294"valign="middle" class="tableLeft" align="right">
                  Exam Password:</td>
                  <td valign="middle" class="tableRight" align="center">
                  <input type="password"  style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"name="exampassword" id="exampassword"/>
                 </td>
                </tr>
                
				<tr>
                  <td height="40" width="294"valign="middle" class="tableLeft">&nbsp;</td>
                  <td valign="middle" class="tableRight"><img src="images/change.jpg"  width="20" height="20"  alt="" style="cursor:pointer"/><input name="submit" type="submit"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:55px; height:20px;" value="Submit" onClick="return(onValidate());">
                    &nbsp;
                    <img src="images/Cancel.png"  width="20" height="20"><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
                
</form>	
						
</td>
</tr>
</table>
		
      </div> 
      </div>
     
      <
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

