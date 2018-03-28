<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
     
     
    </head>
    
     <script type="text/javascript">  
  
function dothat() {  
   var div = document.getElementById('fileuploads');  
    var field = div.getElementsByTagName('input')[0];  
      
    div.appendChild(document.createElement("br"));  
    div.appendChild(field.cloneNode(false));  
}
</script>
	 <body class="page1" id="top">
 <headere><div>
  
<%String userid=(String)request.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=userid%>">


<div><%@ include file = "../../include/header.jsp" %></div>


</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">File Upload</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

   <div align="center">
   
   <FORM ENCTYPE="multipart/form-data" ACTION="student.html?cmd=uploaddocument&user_id=<%=userid%>" METHOD=POST name="uploadfile">
	    <table>
<tr><td>
      
 
 <div id="fileuploads" align="left" style="color:#000000; font-size:18px; margin-left:100px; margin-bottom:20px">  
     
   Upload Documents:     <input type="file" name="fileField" id="fileField"  multiple="muliple" required/>  
        </div></td></tr>
		<tr align="center"><td>
        <input type="button" name="addmore" id="addmore" value="Add More" onClick="dothat();" /> 
            <input type="submit"/>
       
 </td></tr>
 
            </table>
			 </form>
			 </div></div></div>
			</div></div></div>
     
    
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


function onValidate()
{
	if(document.uploadfile.file.value==""){
		alert("File name cannot be empty");
		document.uploadfile.file.focus();
		return false;
	}
	
	return true;
}
</script>
</html>

