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

     $(document).ready(function () {
    	    var onload = window.onload;

    	    window.onload = function () {
    	        if (typeof onload == "function") {
    	            onload.apply(this, arguments);
    	        }

    	        var fields = [];
    	        //var inputs = document.getElementsByTagName("input");
    	        var textareas = document.getElementsByTagName("textarea");


    	        for (var i = 0; i < textareas.length; i++) {
    	            fields.push(textareas[i]);
    	        }

    	        for (var i = 0; i < fields.length; i++) {
    	            var field = fields[i];

    	            if (typeof field.onpaste != "function" && !!field.getAttribute("onpaste")) {
    	                field.onpaste = eval("(function () { " + field.getAttribute("onpaste") + " })");
    	            }

    	            if (typeof field.onpaste == "function") {
    	                var oninput = field.oninput;

    	                field.oninput = function () {
    	                    if (typeof oninput == "function") {
    	                        oninput.apply(this, arguments);
    	                    }

    	                    if (typeof this.previousValue == "undefined") {
    	                        this.previousValue = this.value;
    	                    }

    	                    var pasted = (Math.abs(this.previousValue.length - this.value.length) > 1 && this.value != "");

    	                    if (pasted && !this.onpaste.apply(this, arguments)) {
    	                        this.value = this.previousValue;
    	                    }

    	                    this.previousValue = this.value;
    	                };

    	                if (field.addEventListener) {
    	                    field.addEventListener("textarea", field.oninput, false);
    	                } else if (field.attachEvent) {
    	                    field.attachEvent("oninput", field.oninput);
    	                }
    	            }
    	        }
    	    }
    	})(); 
 
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
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
	</style>
     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
    
<form align="center" action="student.html?StudentProcess=subreassignment" method="post" ENCTYPE="multipart/form-data">

<%String status=(String)request.getAttribute("status"); %>
<%String course_name=(String)request.getAttribute("course_name");
String course_code=(String)request.getAttribute("course_code");%>
<%String assign_name=(String)request.getAttribute("assign_name"); %>
<input type="hidden" name="assign_name"  value="<%=assign_name%>">
<input type="hidden" name="course_code"  value="<%=course_code%>">
<input type="hidden" name="course_name"  value="<%=course_name%>">
  
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"><%=course_name%></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


<%	
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>


<div style="text-align:left; font-size:20px; font-weight:bold; color:#000000; font-family:'Times New Roman', Times, serif; margin-bottom:20px;"><%=assign_name%></div> 


<%String question=(String)request.getAttribute("question");
int i ;
String criteria= "</p>";
String [] strarr = question.split(criteria);
int j = 1;
for( i = 0; i<strarr.length; i++)
{
j = j+i;
%>
 <div class=""align="left"  style="color:#000000; font-family:'Times New Roman', Times, serif; "><%=strarr[i]%></div>
 <div align="left">
 <textarea name="answer"+<%=i%> rows=10 cols=60 onpaste="return false;" style="font-family:'Times New Roman', Times, serif;"></textarea>
 </div>
<%
j=1;
} %>

<input type="hidden" name="ansCount" value="<%=i%>">


<!-- <tr height="50"><td>
  <div class=""align="left"  style="color:#000000; font-family:'Times New Roman', Times, serif; font-size:20px; font-weight:bold;">Answers</div>
  </td>
</tr> -->

<!-- <tr height="220"><td><label class="lab">Online Text:</label></td>
 <td><textarea name="answer" rows=10 cols=60 onpaste="return false;" style="font-family:'Times New Roman', Times, serif;"></textarea></td>
</tr> -->

<div align="left" style="margin:50px 0 50px 0;">
<label style="font-family:'Times New Roman', Times, serif;">Upload Assignment Document Here:</label>
  <input type="file" name="file" style="font-family:'Times New Roman', Times, serif;">
</div>

<div>

<img src="images/save.jpg"  alt="save" width="20" height="20" style="cursor:pointer"/><input type="submit" value="Save" style="background-color: transparent; border:none; cursor:pointer; font-family:'Times New Roman', Times, serif; width:50px; height:20px;">
<img src="images/back.png"alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  >

</div>

</div></div>
</form>
	
    
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

