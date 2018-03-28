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
<%String quizname = (String)request.getAttribute("quizname");
  String quizname_id = (String)request.getAttribute("quizname_id");%>

<%String userid = (String)session.getAttribute("user_id"); %>
<input type="hidden" name="quizname"  value="<%=quizname%>">
<input type="hidden" name="quizname_id"  value="<%=quizname_id%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>

<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Test</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">


 <form action="./trainer.html" method="post">
 <input type="hidden" name="TrainerProcess"  value="QuizProcessNext">
 
 <input  type="submit" name="Quiz" value="CreateQuiz"   style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:75px; height:20px;">
 </form>


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
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}

function onValidate()
{
	
	if(document.quiz.question.value==""){
		alert("Question cannot be empty");
		document.quiz.question.focus();
		return false;
	}
	if(Dospace(document.quiz.question.value)||((document.quiz.question.value.indexOf(' '))==0))
	   { alert("Enter valid Question");
	   document.quiz.question.focus();
	   return false; }
	if(document.quiz.a.value==""){
		alert("Option A cannot be empty");
		document.quiz.a.focus();
		return false;
	}
	if(Dospace(document.quiz.a.value)||((document.quiz.a.value.indexOf(' '))==0))
	   { alert("Enter valid Option A ");
	   document.quiz.a.focus();
	   return false; }
	if(document.quiz.b.value==""){
		alert("Option B cannot be empty");
		document.quiz.b.focus();
		return false;
	}
	if(Dospace(document.quiz.b.value)||((document.quiz.b.value.indexOf(' '))==0))
	   { alert("Enter valid Option B ");
	   document.quiz.b.focus();
	   return false; }
	if(document.quiz.c.value==""){
		alert("Option C cannot be empty");
		document.quiz.c.focus();
		return false;
	}
	if(Dospace(document.quiz.c.value)||((document.quiz.c.value.indexOf(' '))==0))
	   { alert("Enter valid Option C ");
	   document.quiz.c.focus();
	   return false; }
	if(document.quiz.d.value==""){
		alert("Option D cannot be empty");
		document.quiz.d.focus();
		return false;
	}
	if(Dospace(document.quiz.d.value)||((document.quiz.d.value.indexOf(' '))==0))
	   { alert("Enter valid Option D");
	   document.quiz.d.focus();
	   return false; }
	if(document.quiz.answer.value==""){
		alert("Answer cannot be empty");
		document.quiz.answer.focus();
		return false;
	}
	if(Dospace(document.quiz.answer.value)||((document.quiz.answer.value.indexOf(' '))==0))
	   { alert("Enter valid Answer");
	   document.quiz.answer.focus();
	   return false; }
	return true;
}
</script>

</html>
