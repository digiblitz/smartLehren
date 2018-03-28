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
<title>smartLehran</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">
     
     
       
	   <script src="js/datetimepicker_css.js"></script>
    
     
     <script type="text/javascript">
function initload(){

 document.getElementById('forug').style.display = "none";
 document.getElementById('forpg').style.display = "none";

  }
  
  function disp(){
  var selValue = null;		 
   			 var e = document.getElementById("grad");//get the combobox
    		 selValue = e.options[e.selectedIndex].value; //get selected value
		//alert(selValue);
  			 if(selValue == "UG") {
	  document.getElementById('forug').style.display = "block"; 
	  document.getElementById('forpg').style.display = "none";
  }else{
	  document.getElementById('forug').style.display = "none";
	  document.getElementById('forpg').style.display = "block";   
  }
  }
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
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
     </head>
      <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
	 <body class="page1" id="top" onLoad="initload();">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<%@ include file = "../../include/header.jsp" %>
 <%@ include file = "../../include/Hmenu.jsp" %>

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Batch</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
<div align="center">
<table >
<tr><td>
     <form align="center" action="./login.html" method="post" name="Batch">
<input type="hidden" name="LoginProcess"  value="Batch">

<table>
<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td style="height:30; " align="center" colspan="2"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>
<br><br>
<tr ><td height="40" align="left" >Graduation:</td><td>&nbsp;&nbsp;&nbsp;</td>
<td  >
<select name="grad" id="grad"  style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" onChange="disp()" >

  <option value="none">Select One</option>
      <option value="UG">UG</option>
      <option value="PG">PG</option>
      
        </select>
    </td></tr>
	<tr ><td height="40" align="left">Batch:</td><td>&nbsp;&nbsp;&nbsp;</td>
<td >
  <input style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" type="text" name="batch" id="batch">

    </td></tr>
	
	<table>
	<tbody id="forug">	

<tr><td><table >
 <% 
 
     for( int i=1; i<=8; i++) {%>
	<tr >
	<td height="40" >Semester <%=i%>:</td>
	<input type="hidden" name="semester<%=i %>" id="semester<%=i %>"  value="<%=i%>">
	<td>&nbsp;&nbsp;&nbsp;</td>
	
	<td height="40"   align="left"  class="textBold">Start Date:
	  <input type="text" name="startdate_<%=i%>"  style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" id="startdate_<%=i%>" >
	 <img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('startdate_<%=i%>')" /></td>
	  
	  <td>&nbsp;&nbsp;&nbsp;</td><td height="40"  align="left"  class="textBold">End Date:
	    
		<input type="text" name="enddate_<%=i%>"  id="enddate_<%=i%>" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" >
		
		<img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('enddate_<%=i%>')" /></td></tr>
	
	
	
	<%} %>
	
	
</table></td></tr>
</tbody></table>

<table>
<tbody id="forpg">	
<tr><td><table width="700">
    <% 
     for( int i=1; i<=4; i++) {%>
	<tr >
	<td height="40" width="156">Semester <%=i%>:</td>
<input type="hidden" name="semester<%=i %>" id="semester<%=i %>" value="<%=i%>">

	<td height="40" width="276" align="left"  class="textBold">Start Date:
	  <input type="text" name="pgstartdate_<%=i%>"  id="pgstartdate_<%=i%>" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" >
      
	  <img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('pgstartdate_<%=i%>')" /></td>
  
	  <td height="40"  width="291" align="left"  class="textBold">End Date: 
	    <input type="text" name="pgenddate_<%=i%>" id="pgenddate_<%=i%>" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" >
        
		<img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('pgenddate_<%=i%>')" /></td></tr>
	
	
	
	<%} %>
	
	
</table></td></tr>
</tbody></table>
		<tr align="center" ><td colspan="2">
		<img src="images/save.jpg" alt="save" width="20" height="20">
		<input  type="submit" name="Insert" value="Save"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  
			width:50px; height:20px;" onClick="return(onValidate());">
			
		&nbsp;<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>
		<input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  
			width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
		</td></tr>
</table>

</form></td></tr>
	</table></div>	 </div>  </div> 				
     
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
	if(document.Batch.grad.value==""){
		alert("Graduation cannot be empty");
		document.Batch.grad.focus();
		return false;
	}
	
	if(document.Batch.batch.value==""){
		alert("Batch cannot be empty");
		document.Batch.batch.focus();
		return false;
	}
	
	if(Dospace(document.Batch.batch.value)||((document.Batch.batch.value.indexOf(' '))==0))
	   { alert("Enter valid Rolename");
	   document.Batch.batch.focus();
	   return false; }
	 for(  i=1; i<=8; i++){
	if(document.Batch.startdate_[i].value==""){
		alert("Startdate cannot be empty");
		document.Batch.startdate_[i].focus();
		return false;
	}
	
	if(Dospace(document.Batch.startdate_[i].value)||((document.Batch.startdate_[i].value.indexOf(' '))==0))
	   { alert("Enter valid Startdate");
	   document.Batch.startdate_[i].focus();
	   return false; }  
	
	if(document.Batch.enddate_[i].value==""){
		alert("Enddate cannot be empty");
		document.Batch.enddate_[i].focus();
		return false;
	}
	
	if(Dospace(document.Batch.enddate_[i].value)||((document.Batch.enddate_[i].value.indexOf(' '))==0))
	   { alert("Enter valid Enddate");
	   document.Batch.enddate_[i].focus();
	   return false; }  
	 }
	 for(  i=1; i<=4; i++){
	if(document.Batch.pgstartdate_[i].value==""){
		alert("Startdate cannot be empty");
		document.Batch.pgstartdate_[i].focus();
		return false;
	}
	
	if(Dospace(document.Batch.pgstartdate_[i].value)||((document.Batch.pgstartdate_[i].value.indexOf(' '))==0))
	   { alert("Enter valid Startdate");
	   document.Batch.pgstartdate_[i].focus();
	   return false; }  
	
	if(document.Batch.pgenddate_[i].value==""){
		alert("Enddate cannot be empty");
		document.Batch.pgenddate_[i].focus();
		return false;
	}
	
	if(Dospace(document.Batch.pgenddate_[i].value)||((document.Batch.pgenddate_[i].value.indexOf(' '))==0))
	   { alert("Enter valid Enddate");
	   document.Batch.pgenddate_[i].focus();
	   return false; }  
	 }
return true;
}
</script>
</html>

