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
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"> Assignment Submitted List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
<form align="center" action="./trainer.html" method="post">
<input type="hidden" name="TrainerProcess"  value="Process">
<%String assign_name=(String)request.getAttribute("assign_name");
String course_code=(String)request.getAttribute("course_code");
String course_name=(String)request.getAttribute("course_name");
String question=(String)request.getAttribute("question");%>

<table width="100%" >
<tr style="font-weight:bold" >
			<td width="99" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">First Name</td>
			<td width="97" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Last Name</td>
			<td width="165" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Email Id</td>
			<td width="80" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Status</td>
			<td width="130" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Grade</td>
			<td width="120" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Answer</td>
			<td width="100" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Assign_File</td>
	    </tr>
<%
ArrayList enrolList = (ArrayList)request.getAttribute("userlist");
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String user_id = sr[0];
 String first_name = sr[1];
 String last_name = sr[2];
 String email = sr[3];
 String status = sr[4];
 String grade = sr[5];
 String answer_text = sr[6];
 String filelocation = sr[7];
 String filename = sr[8];
 
 String name = first_name+"  "+last_name;
 
   %>
<tr height="50">
		  	<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=first_name%></div></td>
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=last_name%></div></td>	
			<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=email%></div></td>	
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=status%></div></td>	
			<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a href="trainer.html?cmd=initgivegrade&user_id=<%=user_id%>&assign_name=<%=assign_name%>&course_code=<%=course_code %>" class="edit" style="color:#b70000;">edit</a>&nbsp;&nbsp;<%=grade%></div></td>	
			<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a class="button" href="trainer.html?cmd=assignmentanswercorrection&student_user_id=<%=user_id%>&name=<%=name%>&course_name=<%=course_name%>&course_code=<%=course_code%>&assign_name=<%=assign_name%>">Answers</a></div></td>
			<td  class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a href="trainer.html?cmd=initdownloadfile&pathname=<%=filelocation %>" style="color:#0000FF;border-bottom:thin;border-bottom-color:#0000FF;border-bottom-style:groove;"> <%=filename%></a></div></td>
			</tr>
<%}
} else{
				%>
	  		<tr>
			<td height="19" colspan="6" align="center"><strong><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;">No Records.</div></strong></td>
           </tr>
		   <%} %>
</table>
</div></div>
 <div>&nbsp;</div>
      
     <!-- <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"> Assignment Not Submitted List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
 
 
<table width="100%" >
<tr style="font-weight:bold; " >
			<td width="99" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">First Name</td>
			<td width="97" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Last Name</td>
			<td width="165" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Email Id</td>
			<td width="133" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Status</td>
			<td width="98" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Grade</td>
			<td width="100" class="tblRowHeadTwo" style="font-family:'Times New Roman', Times, serif;">Answer</td>
	    </tr>
<%
ArrayList notansuserlist = (ArrayList)request.getAttribute("notansuserlist");
if(notansuserlist!=null && notansuserlist.size()!=0){
Iterator itr = notansuserlist.iterator();
String status = "Not submitted";
String grade = "Not submitted";
String answer_text = "Not submitted";
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String user_id = sr[0];
 String first_name = sr[1];
 String last_name = sr[2];
 String email = sr[3];
 
   %>
<tr  height="50" >
		  	<td  class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=first_name%></div></td>
			<td class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=last_name%></div></td>	
			<td class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=email%></div></td>	
			<td  class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=status%></div></td>	
			<td class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=grade%></div></td>	
			<td  class="alignCenter"><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=answer_text%></div></td>
			
			</tr>
<%}
} else{
				%>
	  		<tr  style="margin-bottom:20px;">
			<td height="19"  colspan="6" align="center" ><strong><div style="margin-top:20px; font-family:'Times New Roman', Times, serif;">No Records</div></strong></td>
           </tr>
		   <%} %></table>
   

	</form>
		
							
       
      </div></div>
	  -->
<div align="center"><label><img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div>			     
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

