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
		  
		  $("#shortans").click(function(){
			
			var shortans = $("#shortanswer").val();
				alert(shortans);
		return false;
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

.answers{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:35px;
	text-align: left;
	margin-top:25px;
	color:#b70000;
	text-decoration: underline;	
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
.answers{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:35px;
	text-align: left;
	margin-top:25px;
	color:#b70000;
	text-decoration: underline;	
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
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Answers</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


<%
String studentname=(String)request.getAttribute("studentname");
String course_name=(String)request.getAttribute("course_name");
String student_user_id=(String)request.getAttribute("student_user_id");
String course_code=(String)request.getAttribute("course_code");
String assign_name=(String)request.getAttribute("assign_name");
String reassign=(String)request.getAttribute("reassign");
System.out.println(reassign);
%>
<div>
<div style="float:right; ">
<div style="color:#b70000; font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;">Student Name: <label style="color:#000;"><%=studentname%></label></div>
<div style="color:#b70000; font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;">Course: <label style="color:#000;"><%=course_name%></label></div>

<div style="color:#33BCFF; font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><a href="trainer.html?cmd=initgivegrade&user_id=<%=student_user_id%>&assign_name=<%=assign_name%>&course_code=<%=course_code %>&reassign=<%=reassign %>" class="edit">Edit Mark</a></div>
</div>

<div>		
<div class="answers" >Answers</div>

<%
String ans = "";
String ques = "";

String anss[] = null;
String quess[] = null;

ArrayList answerdetails = (ArrayList)request.getAttribute("answerdetails");
if(answerdetails!=null && answerdetails.size()!=0){
Iterator itr = answerdetails.iterator();
while(itr.hasNext()){
	String aaa[] = (String[])itr.next();
	ans = ans+"<p>"+aaa[0]+"</p>";
	ques = ques+"<p>"+aaa[1]+"</p>";	
	anss = ans.split("</p>");
	quess = ques.split("</p>");	
}

for(int k=0; k<quess.length; k++){
	
	%>
<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=quess[k]%></div>
<div style="text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=anss[k]%></div>		
	<%
}
 }%>



<div align="center" style="margin-top:25px; "><label><img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div>
   </div> 
	 	 </div>
	 </div>  </div>  
    </div>
   <div>&nbsp;</div>
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











<%-- <div id="" class="overlay">
	<div class="popup">
		
		<a class="close" href="#">&times;</a>
		<div class="content">
		
		<% 
		String strarr[] = shortanswerfull.split("</p>");
		String strarrr[] = tmquestion.split("</p>");
		System.out.println(strarr.length+" "+strarrr.length);
		for(int i=0; i<strarr.length; i++){
			String ans = strarr[i];
			String ques = strarrr[i];
			%>
			<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=ques%></div>
			<div style="text-align:left; margin-top:10px; font-family:'Times New Roman', Times, serif;"><%=ans%></div>
		<%	
		}
		
		%>
			
		</div> 
	</div>
</div>

<div id="" class="overlay">
	<div class="popup">
		
		<a class="close" href="#">&times;</a>
		<div class="content">
			<% 
		String strarr1[] = briefanswerfull.split("</p>");
		String strarrr1[] = smquestion.split("</p>");
		System.out.println(strarr1.length+" "+strarrr1.length);
		for(int i=0; i<strarr1.length; i++){
			String ansbr = strarr1[i];
			String ques1 = strarrr1[i];
			System.out.println(ansbr+" ansbr-====- ques1 "+ques1);
			%>
			<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=ques1%></div>
			<div style="text-align:left; margin-top:10px; font-family:'Times New Roman', Times, serif;"><%=ansbr%></div>
		<%	
		}
		
		%> 
		</div>
	</div>
</div>
<%
	}
}else{
	
		%>
		
		<tr>
<td colspan="7"><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" >No Arrears</div></td>
</tr>	
<%	
}
%>
 --%>
