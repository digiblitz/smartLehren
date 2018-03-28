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
 
<%String course_name=(String)request.getAttribute("course_name"); %>
<%String course_code=(String)request.getAttribute("course_code"); %>
<%String user_id=(String)session.getAttribute("user_id");
String newTime=(String)request.getAttribute("newTime");
String afterendtime=(String)request.getAttribute("afterendtime");
String examsubmitted=(String)request.getAttribute("examsubmitted");
String examSubmission=(String)request.getAttribute("examSubmission");
%>

<input type="hidden" name="course_name"  value="<%=course_name%>">

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
	  <table  width="800" ><tr><td>
      <div style="font-size:28px; font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px"><img src="images/folder.png" alt="assignment" width="25">&nbsp;Assignment</div>
  <%
ArrayList enrolList = (ArrayList)request.getAttribute("assign_name");
int i=1;
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String assign_id = sr[0];
 String assign_name = sr[1];
   %>
   <div  style=" margin-bottom:20px; font-size:15px; font-family:'Times New Roman', Times, serif;" align="left"><img src="images/Assignment.jpg" alt="assignment" width="25">&nbsp;<a href="student.html?cmd=initshowassign&assign_id=<%=assign_id%>&assign_name=<%=assign_name%>&course_name=<%=course_name%>&course_code=<%=course_code%>&user_id=<%=user_id%>" style="text-decoration: none"><%=assign_name%> Assignment <%=i%></a></div>
   
<%i++;}
} else{ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">No Assignment</div>
<%}%>

<div style="font-size:28px; font-family:'Times New Roman', Times, serif; color:#000000; margin-bottom:20px"><img src="images/folder.png"alt="re-assignment"width="25">&nbsp;Re-Assignment</div>	 
  <%
ArrayList particularlist = (ArrayList)request.getAttribute("particularlist");
if(particularlist!=null && particularlist.size()!=0){
	
	int i1 = 1;
Iterator itr = particularlist.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String assign_id = sr[0];
 String assign_name = sr[1];
 String coursecode = sr[2];
   %>
   <div  style=" margin-bottom:20px; font-size:15px; font-family:'Times New Roman', Times, serif;" align="left"><img src="images/Assignment.jpg" alt="assignment" width="25">&nbsp;<a href="student.html?cmd=initreassign&assign_id=<%=assign_id%>&assign_name=<%=assign_name%>&course_name=<%=course_name%>&course_code=<%=coursecode%>&user_id=<%=user_id%>" style="text-decoration: none"><%=assign_name%> Re-Assignment <%=i1%></a></div>
   
<%i1++;}
} else{ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">No Re-Assignment</div>
<%}%>

<div class="ap" align="left"></div>
 <div style="font-size:28px; font-family:'Times New Roman', Times, serif; color:#000000;  margin-bottom:20px"><img src="images/folder.png" alt="test" width="25">&nbsp;Test</div>

<%
ArrayList quiz_nameli = (ArrayList)request.getAttribute("quiz_name");
 i=1;
if(quiz_nameli!=null && quiz_nameli.size()!=0){
Iterator itr = quiz_nameli.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String test_id = sr[0];
  String quiz_name = sr[1];
   String course_code_test = sr[2];
   %>
<div style="margin-bottom:20px; font-size:15px; font-family:'Times New Roman', Times, serif;" align="left"><img src="images/exam.jpg" alt="<%=quiz_name%> Quiz <%=i%>" width="25">&nbsp;<a href="student.html?cmd=initshowquiz&test_id=<%=test_id%>&quiz_name=<%=quiz_name%>&course_code=<%=course_code_test%>" style="text-decoration: none"><%=quiz_name%> Quiz <%=i%></a></div>
<%i++;}
}else{ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">No Tests</div>
<%} %>
 <div>&nbsp;</div>
<%
ArrayList enrolList9 = (ArrayList)request.getAttribute("coursematerial");
String cm="Course Material";
if(enrolList9!=null && enrolList9.size()!=0){


   %>
<div style="font-size:28px; color:#000000"><img src="images/folder.png" alt="<%=cm%>" width="25"><a href="student.html?cmd=initcoursematerial" style="text-decoration: none"><%=cm%></a></div>
<%
} %>


 <div style="font-size:28px; font-family:'Times New Roman', Times, serif; color:#000000;  margin-bottom:20px"><img src="images/folder.png" alt="exam" width="25">&nbsp;Exam</div>
<%
ArrayList examlist = (ArrayList)request.getAttribute("examlist");
 
if(examlist!=null && examlist.size()!=0){
Iterator itr = examlist.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String examid = sr[0];
 String coursecode = sr[1];
 String exam_name = sr[2];
 String allow_date = sr[3];
   %>
<div style="margin-bottom:20px; font-size:15px; font-family:'Times New Roman', Times, serif;" align="left"><img src="images/exam.jpg" alt="<%=exam_name%>" width="25">&nbsp;<a href="exam.html?cmd=initcheckpassword&examid=<%=examid%>&exam_name=<%=exam_name%>&course_code=<%=coursecode%>&course_name=<%=course_name %>&allow_date=<%=allow_date %>" style="text-decoration: none"><%=exam_name%></a></div>


<%}
}else if(newTime != null && afterendtime == null){ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">You have Exam on <%=newTime%></div>
<%} 
else if(afterendtime != null){ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">Your Exam has been Expired at <%=afterendtime %></div>
<%}
else if(examSubmission != null){ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">You have Submitted the Exam</div>
<%}
else{%>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">No Exams</div>
<%} %>

<div align="center">&nbsp;<label><img src="images/Cancel.png" alt="cancel"  width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Back" ></label></div>
</td></tr></table>
		
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
  </footer>
</body>
</html>


