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
     
    <script src="js/lib/jquery.js"></script>
	<script src="js/dist/jquery.validate.js"></script>	
     
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
		  
		  
		  jQuery("#quiz").validate({                      
        rules: {                    
                coursecode:{
					required: true
				},
				quizname:{
					required:true
				},
				question:{
					required: true
				},
				a:{
					required:true
				},
				b:{
					required:true
				},
				c:{
					required:true
				},
				d:{
					required:true
				},
				digi:{
					required: true
				}				
        },
        messages: {
               
			   coursecode: "Please select Course",
			   quizname: "Please provide Quiz name",
			   question: "Please provide question",
			   a:"Please Enter Option ,",
			   b:"Please Enter Option",
			   c:"Please Enter Option",
			   d:"Please Enter Option",
			   digi : "Please Select one Option"			  
            },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent());				
				else
					error.appendTo(element.parent());
			}			
    });
	
	$("#cancel").click(function(){
       url = "login.html?cmd=initmainindex";
      $( location ).attr('href', url);
    });
	
       });  
    

     </script>
 
	 <style>
	 
	 #quiz label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
		font-family:"Times New Roman", Times, serif;
		color: red;
		font-size:17px;
	}
	
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
 
 
 <%String quizname = (String)request.getAttribute("quizname");
   String quizname_id = (String)request.getAttribute("quizname_id");
  String coursecode = (String)request.getAttribute("coursecode");

  %>

<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="quizname"  value="<%=quizname%>">




<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
       
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Test</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<div align="center"> 
         <form align="center" action="./trainer.html" name="quiz" id="quiz" method="post">
<input type="hidden" name="TrainerProcess"  value="Quiz1Process">
<input type="hidden" name="quizname"  value="<%=quizname%>">
<input type="hidden" name="quizname_id"  value="<%=quizname_id%>">
<input type="hidden" name="coursecode"  value="<%=coursecode%>">



<div  style="margin-bottom:20px; color:#FF0000; font-size:20px; font-family:'Times New Roman', Times, serif;"> All fields are mandatory</div>

<table >	
<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	 <tr class="row2" ><td width="86" style="font-family:'Times New Roman', Times, serif; font-size:18pt; color:#000000;"></td>
	 <td width="620" colspan="3" style="color:red; font-family:'Times New Roman', Times, serif;"><%=status%></td></tr><%} %>


<tr ><td height="100"  align="left"><label class="lab"> Questions:</label></td>
<td align="left"><textarea NAME="question" ROWS=5 COLS=50 style="font-family:'Times New Roman', Times, serif;"  ></textarea></td></tr>

<tr ><td height="40" ><label class="lab"> A:</label></td><td align="left">
<input type="text" name="a" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"  >
<input type="radio" name="digi" value="a"  ></td>
</tr>

<tr ><td height="40" ><label class="lab"> B:</label></td><td align="left">
<input  type="text" name="b" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"  >
<input type="radio" name="digi" value="b"  ></td></tr>

<tr ><td height="40" ><label class="lab"> C:</label></td><td align="left">
<input  type="text" name="c" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required >
<input type="radio" name="digi" value="c"  ></td></tr>

<tr ><td height="40" ><label class="lab"> D:</label></td><td align="left">
<input type="text" name="d" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required >
<input type="radio" name="digi" value="d"  ></td></tr>

<tr class="row">
<td colspan="2">
<img src="images/next.jpg" alt="create quiz" width="20" height="20" style="cursor:pointer"/><input  type="submit" name="Quiz" value="Create Quiz" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:75px; height:20px;">

<img src="images/end.jpg" alt="Finish" width="20" height="20" style="cursor:pointer"/><input type="button" name="Quiz" id="cancel" value="Finish"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></td></tr>

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
  
  </footer>
</body>

</html>

