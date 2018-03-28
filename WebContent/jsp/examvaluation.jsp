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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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



.button {
  font-size: 1em;
  padding: 5px;
  color: #333;
  border: 2px solid #06D85F;
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  background: #06D85F;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 100px auto;
  padding: 30px;
  background: #fff;
  border-radius: 5px;
  width: 50%;
  position: relative;
  /*transition: all 5s ease-in-out;*/
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  /*transition: all 200ms;*/
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 50%;
  }
  .popup{
    width: 70%;
  }
}
	</style>
     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
     

 <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"> Exam Submitted List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
<form align="center" action="./trainer.html" method="post">
<input type="hidden" name="TrainerProcess"  value="Process">
<%String exam_name = (String)request.getAttribute("exam_name");
String course_code = (String)request.getAttribute("course_code");
String coursementoruser_id = (String)request.getAttribute("user_id");
String exam_id = (String)request.getAttribute("exam_id");
System.out.println(exam_id);
%>


<table width="100%" >
<tr style="font-weight:bold" >
			<td width="85" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Name</td>						
			<td width="150" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Status</td>
			<td width="150" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Grade</td>
			<td width="120" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Answers</td>			
	    </tr>
		
		<%
ArrayList submissionlist = (ArrayList)request.getAttribute("submissionlist");
System.out.println(" submissionlist "+submissionlist.size());
if(submissionlist!=null && submissionlist.size()!=0){
Iterator itr = submissionlist.iterator();
while(itr.hasNext()){
	
 String sr[] = (String[]) itr.next();
 
 String studentname = sr[0];
 String student_user_id = sr[1]; 
 String status = sr[2];
 String grade = sr[3];
String exam_date = sr[4];
String coursecode = sr[5];
String examname = sr[6];
String course_name = sr[6];
  
   %>

<tr>
		  	<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=studentname%></div></td>
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=status%></div></td>	
			<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a href="trainer.html?cmd=initgivegrade&user_id=<%=student_user_id%>&exam_name=<%=exam_name%>&course_code=<%=course_code%>&exam_id=<%=exam_id%>" style="color:#b70000;">edit</a>&nbsp;&nbsp;<%=grade%></div></td>
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a class="button" href="exam.html?cmd=fullanswersmanualcorrection&student_user_id=<%=student_user_id%>&exam_name=<%=exam_name%>&exam_date=<%=exam_date%>&course_code=<%=course_code%>&user_id=<%=coursementoruser_id%>&studentname=<%=studentname%>&course_name=<%=course_name%>">Answers</a></div></td>			
			</tr>
<%}
} else{
				%>
	  		<tr>
			<td height="19" colspan="6" align="center"><strong><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;">No Records</div></strong></td>
           </tr>
		   <%} %>
</table>
</div></div>
 <div>&nbsp;</div>
      
    <!-- <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"> Exam Not Submitted List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
<table width="100%" >


<tr style="font-weight:bold; " >
			<td width="150" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Name</td>	
			<td width="150" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Status</td>			
	    </tr>
		<%
ArrayList notsubmittedlist = (ArrayList)request.getAttribute("notsubmittedlist");
if(notsubmittedlist!=null && notsubmittedlist.size()!=0){
Iterator itr = notsubmittedlist.iterator();
String status = "Not submitted";
String grade = "Not submitted";
String answer_text = "Not submitted";
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String user_id = sr[0];
 String name = sr[1]; 
  
   %>

<tr  height="50" >
		  	<td  class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=name%></div></td>
			<td  class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=status%></div></td>				
						
			</tr>
			
<%}
} else{
				%>
	  		<tr  style="margin-bottom:20px;">
			<td height="50"  colspan="6" align="center" ><strong><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;">No Records</div></strong></td>
           </tr>
		   <%} %></table>
   

	</form>
					
	 
       
      </div></div> -->
<div align="center"><label><img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div>			 						   
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

