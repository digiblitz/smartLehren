<!-- amalesh 23-02-16 -->
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
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
     
      <script src="js/cscombo_new.js" type="text/javascript" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 
  
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
     <script src="js/datetimepicker_css.js"></script>
	 
    
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
  	
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}


table.attendancestatus table{
	border:1px solid black;
	align:center;
	height:25px;
}

table.attendancestatus tr{

	height:25px;
}

table.attendancestatus th{
	border:1px solid black;
	align:center;
	height:25px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.attendancestatus td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:25px;
	font-family:"Times New Roman", Times, serif;
	
}	</style>
	
	  </head>
	 <body class="page1" id="top">
	
 <headere><div>

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; width:100%;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Attendance Status</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

      <table width="1000" >
            
<FORM id="form" name="insert" ACTION="report.html?cmd=admissionreports" METHOD=POST name="uploadfile">

<tr><td>
<table width="550" border="0" align="center" style="margin-left:250px; margin-top:20px" >
 		   

<tr  align="center" ><td colspan="2">
<img src="images/submit.jpg"  alt="submit" width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Click here for Report" style=" background-color: transparent; border:none; cursor:pointer;   height:20px; font-family:'Times New Roman', Times, serif; font-size:18px;">
&nbsp;
<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  height:20px; font-family:'Times New Roman', Times, serif; font-size:18px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>
</table></td></tr>
   </FORM></table>
   
   
 </div>   </div>   
   
  <div>&nbsp;</div>
 </div></div>
 
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

