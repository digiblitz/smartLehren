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

<%String userid=(String)session.getAttribute("user_id");
String status=(String)request.getAttribute("status");
%>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Grade</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;   font-size: 15px; color:black;">
      
       <table width="800" >
	   <tr><td> 
<form align="center" action="./trainer.html" >
<input type="hidden" name="TrainerProcess"  value="givegrade">

<%String assign_name = (String)request.getAttribute("assign_name");
String exam_name = (String)request.getAttribute("exam_name");
String course_name=(String)request.getAttribute("course_name");
String course_code=(String)request.getAttribute("course_code");
String exam_date=(String)request.getAttribute("exam_date");
String reassign = (String)request.getAttribute("reassign");
String studentname = (String)request.getAttribute("studentname");
String exam_frm_id = (String)request.getAttribute("exam_frm_id");
String revalExam = (String)request.getAttribute("revalExam");%>
<%String user_id = (String)request.getAttribute("user_id"); %>

<input type="hidden" name="course_code"  value="<%=course_code%>">
<input type="hidden" name="exam_date"  value="<%=exam_date%>">
<input type="hidden" name="assign_name"  value="<%=assign_name%>">
<input type="hidden" name="exam_name"  value="<%=exam_name%>">
<input type="hidden" name="reassign"  value="<%=reassign%>">
<input type="hidden" name="user_id"  value="<%=user_id%>">
<input type="hidden" name="exam_frm_id"  value="<%=exam_frm_id%>">


<%if(exam_name != null && revalExam == null){ %>
<tr><td>
<table align="left">
<input type="hidden" name="exam" value="exam">

<%
ArrayList enrolList = (ArrayList)request.getAttribute("ulist");
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String first_name = sr[0];
 String last_name = sr[1];
 String cour_cod = sr[2];
  String cour_name = sr[3];
   %>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Course Name:<span style="margin-left:25px;"><%=cour_name%></span></div>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Name:<span style="margin-left:25px;"><%=first_name%> <%=last_name%></span></div>
<%}
} %>

</table></td></tr>

<tr><td>
<table align="left">
<tr><td height="40" width="200">
<label class="lab">Grade out of 100:</label></td><td height="40" width="250"><input type="text" name="grade" style="width:250px; height:20px; font-family:'Times New Roman', Times, serif;"></td></tr>


</table></td></tr>

<%} %>

<%if(exam_name != null && revalExam != null){ %>
<tr><td>
<table align="left">
<input type="hidden" name="reexam" value="reexam">

<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Course Name:<span style="margin-left:25px;"><%=course_name%></span></div>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Name:<span style="margin-left:25px;"><%=studentname%></span></div>

</table></td></tr>

<tr><td>
<table align="left">
<tr><td height="40" width="200">
<label class="lab">Grade out of 100:</label></td><td height="40" width="250"><input type="text" name="grade" style="width:250px; height:20px; font-family:'Times New Roman', Times, serif;"></td></tr>

<!-- 
<tr ><td colspan="2"><div align="center" style="margin-top:20px;" ><img src="images/save.jpg" alt="" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Save" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:35px; height:20px;"  ></div>
<img src="images/back.png" alt="" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >
</td></tr>
-->
</table></td></tr>

<%} %>



<%if(assign_name != null && exam_name == null && reassign == null){ %>
<tr><td>
<table align="left">
<input type="hidden" name="assignment" value="assignment">
<%
ArrayList enrolList = (ArrayList)request.getAttribute("ulist");
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String first_name = sr[0];
 String last_name = sr[1];
 String cour_name = sr[2];
   %>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Course Name:<%=cour_name%></div>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=first_name%><%=last_name%></div>
<%}
} %>
</table></td></tr>

<tr><td>
<table align="left">
<tr><td height="40" width="200">
<label class="lab">Grade out of 100:</label></td><td height="40" width="250"><input type="text" name="grade" style="width:250px; height:20px; font-family:'Times New Roman', Times, serif;"></td></tr>
<tr><td><label class="lab">Feedback comments:</label></td>
  <td height="40" width="200"><textarea name="comment" rows=5 cols=25 style="width:500px; height:100px; font-family:'Times New Roman', Times, serif;"></textarea></td>
</tr>

<!-- 
<tr ><td colspan="2"><div align="center" style="margin-top:20px;" ><label><img src="images/save.jpg" alt="" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Save" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:35px; height:20px;"  ></label></div></td></tr>
-->
</table></td></tr>

<%} %>



<%if(exam_name == null && reassign != null){ %>
<tr><td>
<table align="left">
<input type="hidden" name="reassignment" value="reassignment">
<%
ArrayList enrolList = (ArrayList)request.getAttribute("ulist");
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String first_name = sr[0];
 String last_name = sr[1];
 String cour_name = sr[2];
   %>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Course Name:<%=cour_name%></div>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=first_name%><%=last_name%></div>
<%}
} %>
</table></td></tr>

<tr><td>
<table align="left">
<tr><td height="40" width="200">
<label class="lab">Grade out of 100:</label></td><td height="40" width="250"><input type="text" name="grade" style="width:250px; height:20px; font-family:'Times New Roman', Times, serif;"></td></tr>
<tr><td><label class="lab">Feedback comments:</label></td>
  <td height="40" width="200"><textarea name="comment" rows=5 cols=25 style="width:500px; height:100px; font-family:'Times New Roman', Times, serif;"></textarea></td>
</tr>

<!-- <tr ><td colspan="2"><div align="center" style="margin-top:20px;" ><label><img src="images/save.jpg" alt="" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Save" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:35px; height:20px;"  ></label></div></td></tr> -->

</table></td></tr>

<%} %>

<%if(status != null){%>
<div class="jp" style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;"><%=status%></div>
<%}%>

<tr ><td colspan="2"><div align="center" style="margin-top:20px;" ><img src="images/save.jpg" alt="save" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Save" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:35px; height:20px;"  >
<img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >
</div></td></tr>

</form></td></tr></table>

<!-- <div align="center"><label><img src="images/back.png" alt="" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div> -->
</div>   </div>   		
     
  </div>   
</div>
<div>&nbsp;</div>
 <!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
     
  </footer>
</body>

</html>

