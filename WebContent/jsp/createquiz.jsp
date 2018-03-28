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
 
	<script type="text/javascript">
function initload(){

 document.getElementById('forot').style.display = "none";
 document.getElementById('fordt').style.display = "none";

  }
  
  function disp(val){
  var selValue = val;		 
   			
  			 if(selValue == "descriptive") {
	  document.getElementById('fordt').style.display = "block"; 
	  document.getElementById('forot').style.display = "none";
  }else{
	  document.getElementById('fordt').style.display = "none";
	  document.getElementById('forot').style.display = "block";   
  }
  }
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
	 <body class="page1" id="top" onLoad="initload();" >
 <headere><div>
 
<%String userid=(String)session.getAttribute("user_id"); %>



<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
       
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Test</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<div align="center"> 
         <form align="center" action="./trainer.html"  method="post" id="quiz" name="quiz">
<input type="hidden" name="TrainerProcess"  value="QuizProcess">

<table width="440" align="center" style="margin-left:250px; margin-top:20px">
<tr>  
	<td height="40" ><label class="lab">Question Type:<label></td>
	
	<label class="lab"><td width="329">Descriptive Type
	 <input type="radio" name="questiontype" id="questiontype" value="descriptive" 
	 onClick="document.location.href='./trainer.html?cmd=descriptive'" />	 
	  Objective Type
	<input type="radio" name="questiontype" id="questiontype" value="objective" 
	onClick="document.location.href='./trainer.html?cmd=objective'" />			
			</td></label></tr></table>
			
			
<table width="550" align="center" style="margin-left:250px; margin-top:20px">			
<tbody id="fordt">
<tr>
<td width="142"  height="40"  ><label class="lab">Course Name:</label></td>
	 								  <td width="331" align="left">
	 				<label class="lab"> <select name="coursecode" id="coursecode" style="width:250px; height:20px;" >
								 		<option value="">Select Course</option>
								 			<% 
								 				
								 			ArrayList cmcourselist1 =(ArrayList)request.getAttribute("cmcourselist");
											
											if(cmcourselist1!=null && cmcourselist1.size()!=0){
											
											Iterator itr = cmcourselist1.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String course_code = sr[0]; 
											 String course_name = sr[1];
											  
														
														if(course_name!=null)
														{
															%>
															<option value="<%=course_code%>"><%=course_name %></option>
															<% 
														 }
													}
												}
											%>
											 
		 		  </select><label></td></tr>
<tr ><td height="40" >
<label class="lab">Subject Name:</label></td>
<td >
<label class="lab"><input  type="text" name="quizname" style="width:250px; height:20px;"></label></td></tr>
<tr >
<td height="40"  ><label class="lab">Questions:</label></td>
<td align="left"><label class="lab"><textarea NAME="question" ROWS=2 COLS=50 ></textarea></label></td></tr>

			
</tbody>			

<tbody id="forot">
<tr>
<td  height="40" width="142" ><label class="lab">Course Name:</label></td>
	 								  <td width="331" align="left">
	 							<label class="lab">	  <select name="coursecode" id="coursecode" style="width:250px; height:20px;" >
								 		<option value="">Select Course</option>
								 			<% 
								 				
								 			ArrayList cmcourselist =(ArrayList)request.getAttribute("cmcourselist");
											
											if(cmcourselist!=null && cmcourselist.size()!=0){
											
											Iterator itr = cmcourselist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
										 String course_code = sr[0]; 
											 String course_name = sr[1];
											  
														
														if(course_name!=null)
														{
															%>
															<option value="<%=course_code%>"><%=course_name %></option>
															<% 
														 }
													}
												}
											%>
											 
		 		  </select></label></td></tr>
<tr ><td height="40"  ><label class="lab">Subject Name:</label></td>

<td align="left"><input  type="text" name="quizname" style="width:250px; height:20px;"></td></tr>
<tr ><td height="40"  align="left"><label class="lab">Questions:</label></td>
<td align="left"><label class="lab"><textarea NAME="question" ROWS=34 COLS=50 ></textarea></label></td></tr>

<tr ><label class="lab"><td height="40" >A:</td>
<td align="left"><input type="text" name="a" style="width:250px; height:20px;">
<input type="radio" name="digi" value="a" ></td></label></tr>

<tr ><label class="lab">
<td height="40" >B:</td><td align="left">
<input  type="text" name="b" style="width:250px; height:20px;">
<input type="radio" name="digi" value="b" ></td></label></tr>

<tr ><label class="lab"><td height="40" >C:</td>
<td align="left"><input  type="text" name="c" style="width:250px; height:20px;">
<input type="radio" name="digi" value="c" ></td></label></tr>

<tr ><label class="lab"><td height="40" >D:</td><td align="left">
<input type="text" name="d" style="width:250px; height:20px;">
<input type="radio" name="digi" value="d" ></label></tr>


</tbody></table><table>

<tr ><td width="142"></td><td ><label class="lab"><img src="images/next.jpg"  alt="next" width="20" height="20" style="cursor:pointer"/><input  type="submit" name="Quiz" value="Next" onClick="return(onValidate());"  style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></label>
<label class="lab"><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label></td></tr>

</table>

</form>	
	</div>  </div> </div> 	
     <br><br>  
     
  </div>   
</div>
<div>&nbsp;</div>
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
if(document.quiz.coursecode.value==""){
		alert("Course name cannot be empty");
		document.quiz.coursecode.focus();
		return false;
	}
	if(document.quiz.quizname.value==""){
		alert("Quizname cannot be empty");
		document.quiz.quizname.focus();
		return false;
	}
	if(Dospace(document.quiz.quizname.value)||((document.quiz.quizname.value.indexOf(' '))==0))
	   { alert("Enter valid Quizname");
	   document.quiz.quizname.focus();
	   return false; }
	
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

