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
	
     <link rel="stylesheet" href="css/gender.css">
	      <script src="js/jquery.js"></script>
     
	 
	  <script src="js/script.js"></script>   
          <script src="js/touchTouch.jquery.js"></script>
<script src="js/jquery.min.js"></script>
          
          <style>	
#assign label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
}

assign.assign label.error, label.error {
		color: red;
		font-size:17px;
}	
	
.lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
.logo{
    width:120px;
    height:120px;
}

.esign{
    width:180px;
    height:80px;
}

.certificate{
	width: 740px;
	margin-left: 160px; 
	margin-top:50px;
}
</style>


          
          <script>
		$(document).ready(function() {
    $('#profile_image').change( function(e) {
        
        var img = URL.createObjectURL(e.target.files[0]);
        $('.logo').attr('src', img);
    });
});
	</script>
	         
          
     </head>
	 <body class="page1" id="top">
 <headere><div>
  
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>


<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">

   
<div class="certificate">

<table>
<tr><td>
    <img src="" class="logo">
	<input type="file" id="profile_image" name="logo">
	</td>
	
	<td>
<input type="text" name="universityname" placeholder="University Name" style="width:300px; height:50px; font-size:30px; font-family:'Times New Roman', Times, serif;">
<textarea name="universityaddr" placeholder="University Address" style="width:296px; height:75px; font-size:20px; font-family:'Times New Roman', Times, serif;"></textarea>
</td>
</table>    
    <br><br>
<div>
<textarea name="contents" placeholder="Please Enter Your Content" rows="20" cols="50" style="font-size:25px; font-family:'Times New Roman', Times, serif;"></textarea>
</div>	
<br><br>
<div>
 <img src="" class="esign">
 <div>
	<input type="file" id="profile_image" name="e_sign">
	</div>
</div>

</div>

 
	
</div></div>
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


<script>

	$(document).ready(function() {
    $('#profile_image').change( function(e) {
        
        var img = URL.createObjectURL(e.target.files[0]);
        $('.image').attr('src', img);
    });
	
	
	var specialElementHandlers = {
        '#editor': function (element,renderer) {
            return true;
        }
    };
	
 $('#cmd').click(function () {
        var doc = new jsPDF();
        doc.fromHTML($('#target').html(), 15, 15, {
            'width': 170,'elementHandlers': specialElementHandlers
        });
        doc.save('sample-file.pdf');
    });  
	
});

</script>

</html>
