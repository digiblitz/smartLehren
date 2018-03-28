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
           });  
           var menux = $('.menu li a.parent');  
           $( '<div class="more"><img src="btn-hamburger.png" alt=""></div>' ).insertBefore(menux);  
           $('.more').click(function(){  
                $(this).parent('li').toggleClass('open');  
           });  
           $('.menu-btn').click(function(){  
              $('nav').toggleClass('menu-open');  
          });  
       });  
    

        function myFunction(w,x,y,z) {
        	var assign_id = w;
            var assign_name=x; var course_code=y; var course_name=z;
            
            if (confirm("Are you sure want to delete") == true) {
            	window.location="trainer.html?cmd=initdeleteassignment&assign_id="+assign_id+"assign_name="+assign_name+"&course_code="+course_code+"&course_name="+course_name; 
            } else {
            	//window.location="login.html?cmd=inituserlist"; 
            }
            
        }
		
        function myFunctionRe(w,x,y,z) {
        	var assign_id = w;
            var assign_name=x; var course_code=y; var course_name=z;
            
            if (confirm("Are you sure want to delete") == true) {
            	window.location="trainer.html?cmd=initdeleteReassignment&assign_id="+assign_id+"assign_name="+assign_name+"&course_code="+course_code+"&course_name="+course_name; 
            } else {
            	//window.location="login.html?cmd=inituserlist"; 
            }
            
        }
        
		function myFunction1(x,y,z) {
            var exam_name=x; var course_code=y; var allow_date=z;
            if (confirm("Are you sure want to delete") == true) {
   window.location="trainer.html?cmd=initdeleteexam&exam_name="+exam_name+"&course_code="+course_code+"&allow_date="+allow_date; 
            } else {
            	//window.location="login.html?cmd=inituserlist"; 
            }
            
        }
		
		function myFunctionTest(x,y,z) {
             var test_id=x;
			 var course_code=z; 
			 var quiz_name=y;
            if (confirm("Are you sure want to delete") == true) {
   window.location="trainer.html?cmd=initdeleteTest&test_id="+test_id+"&course_code="+course_code+"&quiz_name="+quiz_name; 
            } else {
            	//window.location="login.html?cmd=inituserlist"; 
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
     </head>
	 <style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
	 <body class="page1" id="top">
 
 <%String course_name=(String)request.getAttribute("course_name"); %>
  <%String course_code=(String)request.getAttribute("course_code"); %>
<%String user_id=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=course_name%>">
<input type="hidden" name="course_code"  value="<%=course_code%>">
<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

	 
	  <table  width="800"><tr><td>
	 
	  <div style="font-size:28px; color:#000000; margin-bottom:20px; font-family:'Times New Roman', Times, serif;"><img src="images/folder.png" width="25">&nbsp;Assignment</div>
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
<div  style="margin-bottom:20px"><img src="images/Assignment.jpg" alt="assignment" width="20" height="20" style="cursor:pointer"/>&nbsp;<a href="trainer.html?cmd=initshowassign&assign_id=<%=assign_id%>&assign_name=<%=assign_name%>&course_code=<%=course_code%>&course_name=<%=course_name %>&user_id=<%=user_id%>" style="text-decoration: none; font-family:'Times New Roman', Times, serif;"><%=assign_name%>-Assignment <%=i%></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><a href="#" onClick="myFunction('<%=assign_id%>','<%=assign_name%>','<%=course_code%>','<%=course_name%>')"><img src="images/delete.jpg" alt="delete" width="20" height="20" style="float:right; margin-right:250px; cursor:pointer;"/></a></label>
</div>
<%i++;}
} else{ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">No Assignment</div>
<%}%>

<div style="font-size:28px; color:#000000; margin-bottom:20px; font-family:'Times New Roman', Times, serif;"><img src="images/folder.png" width="25">&nbsp;Re-Assignment</div>

      <%
ArrayList reassign_name = (ArrayList)request.getAttribute("reassign_name");
int i1=1;
if(reassign_name!=null && reassign_name.size()!=0){

Iterator itr = reassign_name.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String assign_id = sr[0];
 String assign_name = sr[1];
   %>
<div  style="margin-bottom:20px"><img src="images/Assignment.jpg" alt="assignment" width="20" height="20" style="cursor:pointer"/>&nbsp;<a href="trainer.html?cmd=initshowreassign&assign_id=<%=assign_id%>&assign_name=<%=assign_name%>&course_code=<%=course_code%>&course_name=<%=course_name %>&user_id=<%=user_id%>" style="text-decoration: none; font-family:'Times New Roman', Times, serif;"><%=assign_name%>-Assignment <%=i1%></a>
<label><a href="#" onClick="myFunctionRe('<%=assign_id%>','<%=assign_name%>','<%=course_code%>','<%=course_name%>')">
<img src="images/delete.jpg" alt="delete" width="20" height="20" style="cursor:pointer; float:right; margin-right:250px;"/></a></label>
</div>
<%i1++;}
}else{ %>
<div style="font-family:'Times New Roman', Times, serif; margin-bottom:20px" align="left">No Re-Assignment</div>
<%}%>

<div  align="left"></div>
<div style="font-size:28px; color:#000000; margin-bottom:20px; font-family:'Times New Roman', Times, serif;"><img src="images/folder.png" alt="test" width="25">&nbsp;Test</div>
<%
ArrayList quiz_namelis = (ArrayList)request.getAttribute("quiz_name");
if(quiz_namelis!=null && quiz_namelis.size()!=0){
Iterator itr = quiz_namelis.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String test_id = sr[0];
 String quiz_name = sr[1];
 String course_code_test = sr[2];
   %>
<div align="left"  style="margin-bottom:20px"><img src="images/exam.jpg" alt="<%=quiz_name%>" width="20" height="20" style="cursor:pointer"/>&nbsp;<a href="trainer.html?cmd=initshowquiz&test_id=<%=test_id%>&quiz_name=<%=quiz_name%>&course_code=<%=course_code_test %>" style="text-decoration: none; font-family:'Times New Roman', Times, serif;"><%=quiz_name%></a>

<a href="#" onClick="myFunctionTest('<%=test_id%>','<%=quiz_name%>','<%=course_code_test%>')">
<img src="images/delete.jpg" alt="delete" width="20" height="20" style="cursor:pointer; float:right; margin-right:250px;"/></a>

</div>

<%}
}else{ %>
<div align="left"  style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">&nbsp;No Test</div>
<%} %>

<%
ArrayList enrolList3 = (ArrayList)request.getAttribute("coursematerial");
String cm="Course Material";
if(enrolList3!=null && enrolList3.size()!=0){
Iterator itr = enrolList3.iterator();

 

   %><br>
<div style="font-size:28px; color:#000000; margin-bottom:20px"><img src="images/folder.png" alt="<%=cm%>" width="20" height="20" style="cursor:pointer"/>&nbsp;<a href="trainer.html?cmd=initcoursematerial" style="text-decoration: none"><%=cm%></a></div>
<%
} %>

<div style="font-size:28px; color:#000000; margin-bottom:20px; font-family:'Times New Roman', Times, serif;"><img src="images/folder.png" alt="exam" width="25">&nbsp;Exam</div>
<%
ArrayList examdetails = (ArrayList)request.getAttribute("examdetails");
if(examdetails!=null && examdetails.size()!=0){
Iterator itr = examdetails.iterator();
while(itr.hasNext()){
 String[] strarr = (String[]) itr.next();
 String coursecode = strarr[0];
 String exam_name = strarr[1];
 String allow_date = strarr[2];
 String exam_id = strarr[3];
   %>
<div align="left"  style="margin-bottom:20px"><img src="images/exam.jpg" alt="<%=exam_name%>" width="20" height="20" style="cursor:pointer"/>&nbsp;<a href="exam.html?cmd=showexamsubmissiondetails&exam_name=<%=exam_name%>&coursecode=<%=coursecode %>&course_name=<%=course_name %>&allow_date=<%=allow_date %>&exam_id=<%=exam_id%>" style="text-decoration: none; font-family:'Times New Roman', Times, serif;"><%=exam_name%></a>


<a href="#" onClick="myFunction1('<%=exam_name%>','<%=coursecode%>','<%=allow_date%>')">
<img src="images/delete.jpg" alt="" width="20" height="20" style="cursor:pointer; float:right; margin-right:250px;"/></a>

</div>

<%}
}else{ %>
<div align="left"  style="margin-bottom:20px; font-family:'Times New Roman', Times, serif;">&nbsp;No Exams</div>
<%} %>


<div align="center">&nbsp;<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;"  onClick="javascript:history.back(-1);" value="Back" ></label>

</div>
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

