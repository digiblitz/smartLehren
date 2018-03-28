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
		  
		  
		  $("#back").bind('beforeunload', function(){
  return 'Are you sure you want to leave?';
});
		  
       });  
	   
	   var formSubmitting = false;
var setFormSubmitting = function() { formSubmitting = true; };

window.onload = function() {
    window.addEventListener("beforeunload", function (e) {
        if (formSubmitting) {
            return undefined;
        }

        var confirmationMessage = 'It looks like you have been editing something. '
                                + 'If you leave before saving, your changes will be lost.';

        (e || window.event).returnValue = confirmationMessage; //Gecko + IE
        return confirmationMessage; //Gecko + Webkit, Safari, Chrome etc.
    });
};
     </script>
 
	 <%
String mins = request.getParameter( "mins" );
if( mins == null ) mins = "2";
  
String secs = request.getParameter( "secs" );
if( secs == null ) secs = "1";
%>
<script>
<!--
var mins = <%=mins%>; // write mins to javascript
var secs = <%=secs%>; // write secs to javascript
function timer()
{
// tic tac
if( --secs == -1 )
{
secs = 59;
--mins;
}
 
// leading zero? formatting
if( secs < 10 ) secs = "0" + secs;             
if( mins < 10 ) mins = "0" + parseInt( mins, 10 );
 
// display
document.test.mins.value = mins; 
document.test.secs.value = secs;
 
// continue?
if( secs == 0 && mins == 0 ) // time over
{
	document.getElementById('test').submit();
}
else // call timer() recursively every 1000 ms == 1 sec
{
window.setTimeout( "timer()", 1000 );
}
}
//-->
</script>    
	
     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Test</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
<%String quiz_name=(String)request.getAttribute("quiz_name"); %>
<%String course_code=(String)request.getAttribute("course_code"); %>


<form onsubmit="setFormSubmitting()" align="center" action="./student.html" method="post" name="test" id="test">
<input type="hidden" name="StudentProcess"  value="showquiz">
<input type="hidden" name="quiz_name"  value="<%=quiz_name%>">
<input type="hidden" name="course_code"  value="<%=course_code%>">

<div style="font-family:'Times New Roman', Times, serif; text-align:right;">Time remaining: <input type="text" name="mins" size="1" style="font-family:'Times New Roman', Times, serif; border:0px solid black;text-align:right">:<input type="text" name="secs" size="1" style="font-family:'Times New Roman', Times, serif; border:0px solid black"></div>
<table>
<div id="testarea">

<%
ArrayList enrolList = (ArrayList)request.getAttribute("question_name");
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
int i=0;
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String q_no = sr[0];
 String question = sr[1];
 String a = sr[2];
 String b = sr[3];
 String c = sr[4];
 String d = sr[5];
 String answer = sr[6];
 
   %>



<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="font-family:'Times New Roman', Times, serif; color:#000000; margin-left:50px; line-height:30px;">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%><br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div>&nbsp;</div><div>&nbsp;</div>

<% 
i++; 

}%>
<input type="hidden" name="upto"  value="<%=i%>">
<% } %>

</div>




<div align="center"><label><img src="images/add.jpg" alt="add" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Submission"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:110px; height:20px;"></label>
&nbsp;<label><img src="images/back.png"alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" id="back" type="button" value="Back" onClick="history.go(-1);"style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div>
</table>

</form>
							
       
      </div>
      </div>
      <div class="clear"></div>  
      
      <div class="clear"></div>
   <div>&nbsp;</div>
  </div></div>   
</div>
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    
  </footer>
  <script>
<!--
timer(); // call timer() after page is loaded
//-->
</script>
</body>
</html>

