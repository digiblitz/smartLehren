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
			<script src="js/dist/jquery.validate.js"></script>
			

     
   <script>
$(document).ready(function() {

$("#schoolname_10").blur(function(){        
var a = $("#schoolname_10").val();
var b = a.trim();
$("#schoolname_10").val(b);
    });
	
	$("#board_10").blur(function(){        
var a = $("#board_10").val();
var b = a.trim();
$("#board_10").val(b);
    });
	
	$("#mark_10").blur(function(){        
var a = $("#mark_10").val();
var b = a.trim();
$("#mark_10").val(b);
    });

$("#yop_10").blur(function(){        
var a = $("#yop_10").val();
var b = a.trim();
$("#yop_10").val(b);
    });
	
	
	$("#schoolname_12").blur(function(){        
var a = $("#schoolname_12").val();
var b = a.trim();
$("#schoolname_12").val(b);
    });
	
	$("#board_12").blur(function(){        
var a = $("#board_12").val();
var b = a.trim();
$("#board_12").val(b);
    });
	
	$("#mark_12").blur(function(){        
var a = $("#mark_12").val();
var b = a.trim();
$("#mark_12").val(b);
    });

$("#yop_12").blur(function(){        
var a = $("#yop_12").val();
var b = a.trim();
$("#yop_12").val(b);
    });
	
	$("#collegename").blur(function(){        
var a = $("#collegename").val();
var b = a.trim();
$("#collegename").val(b);
    });
	
	$("#dept").blur(function(){        
var a = $("#dept").val();
var b = a.trim();
$("#dept").val(b);
    });
	
	$("#ugmark").blur(function(){        
var a = $("#ugmark").val();
var b = a.trim();
$("#ugmark").val(b);
    });

$("#yop").blur(function(){        
var a = $("#yop").val();
var b = a.trim();
$("#yop").val(b);
    });
	
	$("#university").blur(function(){        
var a = $("#university").val();
var b = a.trim();
$("#university").val(b);
    });

$('#programname').change(function(event) {
        var sports = $("select#programname").val();
        $.get('student.html?cmd=initjqueryrequest', {
        	Category : sports
        }, function(response) {

        var select = $('#subname');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
        
$('#category').change(function(event) {
    var sports = $("select#category").val();
    $.get('student.html?cmd=initjquerycategory', {
    	Category : sports
    }, function(response) {

    var select = $('#programname');
    select.find('option').remove();
      $.each(response, function(index, value) {
      $('<option>').val(value).text(value).appendTo(select);
  });
    });
    });	
	
	//add multiple row for file upload
var counter = 1;
jQuery('a.add-author').click(function(event){
    event.preventDefault();
    counter++;

    var newRow = jQuery('<tr><td><input type="file" style="border:none; font-family:Times New Roman, Times, serif; font-size:12px;" name="fileField'+counter+'"/></td><td><a href="javascript:void(0);" style="border:none; font-family:Times New Roman, Times, serif; font-size:12px;" class="remCF">Remove</a></td></tr>');
    jQuery('table.enroll').append(newRow);
	$("#count").val(counter);
});

$(".enroll").on('click','.remCF',function(){
        $(this).parent().parent().remove();
    });
	
	
});
</script> 
<script type="text/javascript">  
  
  var count = 1;
function dothat() {  
   var div = document.getElementById('fileuploads');  
    var field = div.getElementsByTagName('input')[0];  
      
    div.appendChild(document.createElement("br"));  
    div.appendChild(field.cloneNode(false));  
	count++;
	document.getElementById('count').value=count;
	var c1 = document.getElementById('count').value;
}
</script>
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
	</style>
	
     </head>
	 <body class="page1" id="top" onLoad="initload();">
	 <%
	String courseid = (String) request.getAttribute("courseid");
	if(courseid==null){
		courseid = "";
	}%>
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>

<input type="hidden" name="course_name"  value="<%=role_name%>">




<div><%@ include file = "../../include/header.jsp" %></div>
 

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_123">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Request Form</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<table height="650px" width="1097">

  <form  name="enrolrequest" align="center" action="student.html?cmd=enrollrequest" method="post" ENCTYPE="multipart/form-data" id="enrolrequest"  >
  
  <input type="hidden" name="count" id="count" />

 <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="888" align="center" style="height:30; "><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}	
	%>
	
	<tr align="center"><td colspan="2">
	<div  style="margin-bottom:20px; color:#FF0000; font-family:'Times New Roman', Times, serif;"></div>
	</td>
</tr>
  			

<tr><td><table width="478"  border="0" align="left" style="color:#000000; font-size:16px">
<tr ><td height="50">Category:</td>
<td >
<select  id="category"   style="width:250px; height:25px; font-family:'Times New Roman', Times, serif;" name="category"  required >
						<option value="">Select One</option>
						<option value="UG">UG</option>
						<option value="PG">PG</option>
						
			    </select><label style=" color:#FF0000">*</label></td></tr>
				
<tr><td width="141"  height="50"  align="left" class="textBold"  ><label class="lab">Program Name:</label></td>
<td width="250" >
<select class="pp" name="programname" id="programname"  style="width:250px; height:25px; font-family:'Times New Roman', Times, serif;" required >
								 		<option  value="">---Select---</option>
								 			<jsp:scriptlet> 								 				
												ArrayList list = (ArrayList)request.getAttribute("list");
												if(list!=null && list.size()!=0){
													
													Iterator itr = list.iterator();
													 while (itr.hasNext()) {
													 String sr[] = (String[]) itr.next();
													
													 String course_id = sr[0]; 
													 String course_namee = sr[1]; 
													if(courseid.equals(course_id)){
											</jsp:scriptlet>
                      <option value="<%=course_id%>" selected="selected"><%=course_namee%></option>
                      <jsp:scriptlet> 
										 }											 
											 else{
												 </jsp:scriptlet>
                      <option value="<%=course_id%>"><%=course_namee%></option>
                     <jsp:scriptlet> 
											 }
													}
												}
											</jsp:scriptlet>
											 
			 		</select><label style=" color:#FF0000">*</label></td></tr>
								 		
<tr ><td height="40"  align="left"  class="textBold">SubProgram Name:</td>
<td><select  name="subname" id="subname"  style="width:250px; height:25px; font-family:'Times New Roman', Times, serif;" required >
								 		<option  value="">---Select---</option>
								 		
											 
								 		</select><label style=" color:#FF0000">*</label></td></tr>
								 		
								 		
				</table></td></tr>


 <tr><td colspan="3"><div style="font-size:24px; color:#000000; margin-top:10px; margin-bottom:20px">Education Details</div></td></tr>
 
 <tr><td><table  border="0" align="left" style="color:#000000; font-size:16px">
 
 <tr height="20" width="500px"><td width="205"></td>
 <td width="289">School name</td>
 <td width="278" >Board</td>
 <td width="74" >% mark</td>
 <td width="129" >Year of passing</td>
 </tr>
 
 <tr height="20" width="500"><td>SSLC:</td>
 
 <td>
 <input type="text" name="schoolname_10" id="schoolname_10" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;" required >
 <label style=" color:#FF0000">*</label></td>&nbsp;&nbsp;&nbsp;
 
 <td>
 <input type="text" name="board_10" id="board_10" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;" required >
 <label style=" color:#FF0000">*</label></td>&nbsp;&nbsp;&nbsp;
 
 <td>
 <input type="text" name="mark_10" id="mark_10" style="font-family:'Times New Roman', Times, serif; width:30px; height:25px;" required >
 <label style=" color:#FF0000">*</label></td>&nbsp;&nbsp;&nbsp;
 
 <td width="129">
 <input type="text" name="yop_10" id="yop_10" style="font-family:'Times New Roman', Times, serif; width:50px; height:25px;" required >
<label style=" color:#FF0000">*</label></td></tr>

<tr><td>&nbsp; </td><td></td></tr>

<tr height="20"><td></td>
<td>School name</td>
<td>Board</td>
<td>% mark</td>
<td>Year of passing</td></tr>


 <tr height="50"><td>
HSC:</td>
 
 <td>

 <input type="text" name="schoolname_12" id="schoolname_12" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;" required >
 <label style=" color:#FF0000">*</label> </td>
 
 <td>
 <input type="text" name="board_12" id="board_12" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;" required >

 <label style=" color:#FF0000">*</label></td>
 
 <td>
 <input type="text" name="mark_12" id="mark_12" style="font-family:'Times New Roman', Times, serif; width:30px; height:25px;" required  >
 
 <label style=" color:#FF0000">*</label></td>
 
 <td>
 <input type="text" name="yop_12" id="yop_12" style="font-family:'Times New Roman', Times, serif; width:50px; height:25px;" required >
 <label style=" color:#FF0000">*</label></td></tr>


  
<tr height="20"><td></td>
<td>College name</td>
<td>Department</td>
<td>% mark</td>
<td>Year of passing</td></tr>

 <tr height="50"><td>Degree:</td>
 
 <td><input type="text" name="collegename" id="collegename" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;" id="collegename"  >&nbsp;</td>&nbsp;
 
 <td><input type="text" name="dept" id="dept" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;"  id="dept" >&nbsp;</td>&nbsp;
 
 <td>
 <input type="text" name="ugmark" id="ugmark" style="font-family:'Times New Roman', Times, serif; width:30px; height:25px;" id="ugmark"  >
 &nbsp;
 
 </td>&nbsp;
 <td>
 
 <input type="text" name="yop" id="yop" style="font-family:'Times New Roman', Times, serif; width:50px; height:25px;"  >
 </td></tr>
 
<tr><td height="53" >University</td>

<td>
<input type="text" name="university" id="university" style="font-family:'Times New Roman', Times, serif; width:230px; height:25px;"  >
&nbsp;</td></tr>


<tr height="50">
<td>Upload Documents:  
</td>

<!-- <td align="left"> 
 <div id="fileuploads" > 
 <input type="file" name="fileField" id="fileField" style="font-family:'Times New Roman', Times, serif; height:30px;"  multiple="muliple" required/> 
        </div> 
<input type="button" style="font-family:'Times New Roman', Times, serif;" name="addmore" id="addmore" value="Add More" onClick="dothat();" />
</td></tr> -->

<td>
 <table class="enroll" height="68">
<tr height="30"><td> <a href="" class="add-author" style="font-size:12px; font-family:'Times New Roman', Times, serif;">Add Documents</a> </td></tr>
<tr><td height="43">
		 <input type="file" name="fileField0" id="fileField" style="font-size:12px; font-family:'Times New Roman', Times, serif;"  multiple="muliple" required/>
		 </td></tr>
		</table> </td>
         

</table>
</td></tr>

<tr><td height="40" colspan="2" align="center">
<img src="images/create.jpg"  alt="create" width="20" height="20" style="cursor:pointer"><input  type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"   >

<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>
<input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td>
</tr>
</form>
						
</td>
</tr>
</table></div>   </div>   
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
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}
	



function onValidate()
{

	if(document.enrolrequest.schoolname_10.value==""){
		alert("SSLC School name cannot be empty");
		document.enrolrequest.schoolname_10.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.schoolname_10.value)||((document.enrolrequest.schoolname_10.value.indexOf(' '))==0))
	   { alert("Enter valid SSLC School name");
	   document.enrolrequest.schoolname_10.focus();
	   return false; }
	
	if(document.enrolrequest.board_10.value==""){
		alert("SSLC Board name cannot be empty");
		document.enrolrequest.board_10.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.board_10.value)||((document.enrolrequest.board_10.value.indexOf(' '))==0))
	   { alert("Enter valid SSLC Board name");
	   document.enrolrequest.board_10.focus();
	   return false; }
	if(document.enrolrequest.mark_10.value==""){
		alert("SSLC Percentage cannot be empty");
		document.enrolrequest.mark_10.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.mark_10.value)||((document.enrolrequest.mark_10.value.indexOf(' '))==0))
	   { alert("Enter valid SSLC Percentage");
	   document.enrolrequest.mark_10.focus();
	   return false; }
	if(document.enrolrequest.yop_10.value==""){
		alert("SSLC YOP cannot be empty");
		document.enrolrequest.yop_10.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.yop_10.value)||((document.enrolrequest.yop_10.value.indexOf(' '))==0))
	   { alert("Enter valid SSLC YOP");
	   document.enrolrequest.yop_10.focus();
	   return false; }
		
	
	if(document.enrolrequest.schoolname_12.value==""){
		alert("HSC School name cannot be empty");
		document.enrolrequest.schoolname_12.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.schoolname_12.value)||((document.enrolrequest.schoolname_12.value.indexOf(' '))==0))
	   { alert("Enter valid HSC School name");
	   document.enrolrequest.schoolname_12.focus();
	   return false; }
	
	if(document.enrolrequest.board_12.value==""){
		alert("HSC Board name cannot be empty");
		document.enrolrequest.board_12.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.board_12.value)||((document.enrolrequest.board_12.value.indexOf(' '))==0))
	   { alert("Enter valid HSC Board name");
	   document.enrolrequest.board_12.focus();
	   return false; }
	if(document.enrolrequest.mark_12.value==""){
		alert("HSC Percentage cannot be empty");
		document.enrolrequest.mark_12.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.mark_12.value)||((document.enrolrequest.mark_12.value.indexOf(' '))==0))
	   { alert("Enter valid HSC Percentage");
	   document.enrolrequest.mark_10.focus();
	   return false; }
	if(document.enrolrequest.yop_12.value==""){
		alert("HSC YOP cannot be empty");
		document.enrolrequest.yop_12.focus();
		
		return false;
	}
	if(Dospace(document.enrolrequest.yop_12.value)||((document.enrolrequest.yop_12.value.indexOf(' '))==0))
	   { alert("Enter valid HSC YOP");
	   document.enrolrequest.yop_12.focus();
	   return false; }
		
	   
	return true;
}




</script>
</html>

