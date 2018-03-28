<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>smartLehren</title>
     <meta name = "format-detection" content = "telephone=no" />
        <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />  
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">
     
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
     <script src="js/script.js"></script>   

  <script type="text/javascript">
$(document).ready(function () {
    $("#submitButton").click(function () {
        var $form1 = $("#form1");
        $.post($form1.attr("action"), $form1.serialize(), function () {
            alert('Form 1 submitted');
        });

        $('form[name="Class Schedule"]').each(function () {
            var $form = $(this);
            $.post($form.attr("action"), $form.serialize(), function () {
                alert('Form 2 submitted');
            });
        })
    });
});
</script>	
  
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	
	}
	</style>
     </head>
	 <body class="page1" id="top" >
	
 <headere><div>

<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>

<%String name = (String)request.getAttribute("name");
String status = (String)request.getAttribute("status");%>

<!--==============================Content=================================-->
<div class="content">
  <div class="container_12">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Status</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

				 <div style="font-family:'Times New Roman', Times, serif; font-size:25px; color:#b70000;" align="center">
  <%=name %> <%=status %></div>
 			 		    
  </div>   
</div>
</div></div>
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

</html>

