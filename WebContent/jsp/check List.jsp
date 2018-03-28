<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
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
<title>Check List</title>
</head>
<style type="text/css">
<!--
.style2 {color: #0099CC; font-size:20px}
.style7 {
	color: #000099;
	font-size: 24px;
}
.style8 {font-size: 20px}
.style9 {color: #FFFFFF}
-->
.lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:17px;
	text-align: left;
	margin-left: 10px;
}

</style>
 <body class="page1" id="top">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>

<div class="content">
  <div class="container_12 ">
  <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family:'Times New Roman', Times, serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Check List</div>
<div class="pps" style="font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
	
	<table width="1100" border="0" >
		<tr height="40">
			<td><input type="checkbox" value="1" /> Do you have 1-inch margins throughout the paper (left, right, top, bottom)?</td>
		</tr>		
		
		<tr height="40">
			<td>
		<input type="checkbox" value="2" />Did you use Times New Roman in a 12-point font size?></td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="3" />Did you double-space the paper? </td>		
		</tr>
		
		<tr height="60">			
			<td><input type="checkbox" value="4" />Did you list the papers title, your name, your school affiliation, your course number and course name, <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and the date on the title page? This is centered and double-spaced about 1/3 of the way down the page.</td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="5" />Does your title page contain a running head and the page number 1? Example of the running head on the title page</td>		
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="6" />Running head: ABBREVIATED TITLE OF YOUR PAPER</td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="7" />The font of the running head is Times New Roman, font-size 12.</td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="8" />Do you have a running head and page numbers for the rest of your paper?</td>
		</tr>
		
		<tr height="60">			
			<td><input type="checkbox" value="9" />The running head for this is different than the running head on the title page. Do not use Running head with a colon.<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Example of the running head for the rest of the paper</td>
		</tr>
		
		<tr height="40">	
			<td><input type="checkbox" value="10" />ABBREVIATED TITLE OF YOUR PAPER</td>
		</tr>
		
		<tr height="60">			
		<td><input type="checkbox" value="11" />Do you need to include an abstract? (i.e., you will need an abstract if your paper is longer than 3 pages,<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is not an informal writing, and includes citations).</td>			
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="12" />If yes, do you have the word Abstract centered at the top of the page?</td>
		</tr>
		
		<tr height="40">
			<td><input type="checkbox" value="13" />Is your abstract a concise summary of your paper that is no more than � page (approximately 120 to 250 words) in length?</td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="14" />Is your abstract aligned to the left of the page with no indentations?</td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="15" />Have you included keywords?</td>
		</tr>
		
		<tr height="40">			
			<td><input type="checkbox" value="16" />At the beginning of the main body of your paper, do you have the title centered at the top of the page?</td>
		</tr>
		
		<tr align="center"><td>&nbsp;<img src="images/Cancel.png"  alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></td></tr>
	</table>
	</div></div>
	</div></div>
	
	
	<footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>     
  </footer>
</body>
</html>
