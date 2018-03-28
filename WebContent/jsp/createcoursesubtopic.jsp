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
       <script  src="js/ts_picker.js"></script>
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
    
	

function postData(postProcess){
//alert(postProcess);

if(postProcess=="selProg"){
if(document.frmaddmaterial.selProg.value!=""){
	prog=document.frmaddmaterial.selProg.value;
	document.frmaddmaterial.method="post";
	document.frmaddmaterial.action="trainer.html?cmd=initaddcoursematerials&prog="+prog;
	document.frmaddmaterial.submit();
	
	
	}
	
	}

}

/*function courseData(){
	var semValue = document.frmMapPrograms.selSemester.value;
	var progId = document.frmMapPrograms.selProg.value;
	var subProgId = document.frmMapPrograms.selSubProg.value;
	var grdCateg = document.frmMapPrograms.grdCateg.value;
	
	document.frmMapPrograms.method="post";
	document.frmMapPrograms.action="./map.html?cmd=selSem&sem="+semValue"&progId="+progId"&subProgId="+subProgId"&grdCateg="+grdCateg;
	document.frmMapPrograms.submit();
}*/

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

	
     </head>
	 <body class="page1" id="top">
	 <%
	String programId = (String) request.getAttribute("progId");
	if(programId==null){
		programId = "";
	}
	
	

%>
	
 <headere><div>
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"> Create Course SubTopic</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
    <div align="center">  
    
    <%
	String status=(String)request.getAttribute("status");

	 if(status!=null){
	 %>
	 <span colspan="2" style="color:red; font-size:12pt;"><%=status%></span><%} %> 
	 
<table style="font-family:'Times New Roman', Times, serif;">
<form name="frmaddmaterial" id="frmaddmaterial" action="trainer.html" method="post">
<input type="hidden" name="TrainerProcess"  value="AddCourseSubTopic">


<br><br>		
				<tr>
<td height="40" align="left"  class="textBold">Course Code:</td><td>&nbsp;&nbsp;</td>
	 								  <td >
									  <select name="courseCode" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px"  id="courseCode" >Select Course Code
									  <option  value="">Select CourseCode</option>
	 				
					<%ArrayList assigncourse1 =(ArrayList)request.getAttribute("coursecode");
									
									if(assigncourse1!=null && assigncourse1.size()!=0){
									
									Iterator itr = assigncourse1.iterator();
									 while (itr.hasNext()) {
									 String sr1[] = (String[]) itr.next();
									 //String sub_id = sr[0];
									 String course_code= sr1[0]; 
				                     String course_name = sr1[1]; 
											   
											
											%> 
					<option value="<%=course_code%>"><%=course_name%></option><%}} %></select>
								 		</td></tr>		
				<tr>
<td height="40" align="left"  class="textBold">Course Topic:</td><td>&nbsp;&nbsp;</td>
	 								  <td>
									  <select name="topicname" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px"  id="topicname" >
									  <option  value="">Select Course Topic</option>
	 				
					<%ArrayList topiclist =(ArrayList)request.getAttribute("topiclist");
									
									if(topiclist!=null && topiclist.size()!=0){
									
									Iterator itr = topiclist.iterator();
									 while (itr.hasNext()) {
									 String sr1[] = (String[]) itr.next();
									 //String sub_id = sr[0];
									 String topic_id= sr1[0]; 
									  String course_code = sr1[1]; 
									  String topic_name = sr1[2]; 	
											   
											
											%> 
					<option value="<%=topic_id%>"><%=topic_name%></option><%}} %></select>
								 		</td></tr>		
				
				
				<tr><td height="40" >Subtopic Name:</td><td>&nbsp;&nbsp;</td><td><input type="text" name="subtopicname" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"></td></tr>
				<tr><td height="40" >Url_link:</td><td>&nbsp;&nbsp;</td><td><input type="text" name="urllink" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"></td></tr>
				
											<tr >

	 								  <td align="center" colspan="3">
	 	<label><img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/><input type="submit" name="Map" value="Create" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >
								 		&nbsp;<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label></td>
								 		<!--   <td align="center">
	 	<input type="submit" name="FileUpload" value="FileUpload" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >
								 		</td>-->
								 		</tr>
								 			
	

</form>	   

</table>				
</div>
     <br><br>  
    </div>    </div>  
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
if(document.frmaddmaterial.courseCode.value==""){
		alert("courseCode/courseName cannot be empty");
		document.frmaddmaterial.courseCode.focus();
		return false;
	}
	
	
	if(document.frmaddmaterial.topicname.value==""){
		alert("Topicname cannot be empty");
		document.frmaddmaterial.topicname.focus();
		return false;
	}
	
	if(document.frmaddmaterial.subtopicname.value==""){
		alert("Subtopic Name cannot be empty");
		document.frmaddmaterial.subtopicname.focus();
		return false;
	}
	
	if(Dospace(document.frmaddmaterial.subtopicname.value)||((document.frmaddmaterial.subtopicname.value.indexOf(' '))==0))
	   { alert("Enter valid subtopic Name ");
	   document.frmaddmaterial.subtopicname.focus();
	   return false; }
	if(document.frmaddmaterial.urllink.value==""){
		alert("URL link cannot be empty");
		document.frmaddmaterial.urllink.focus();
		return false;
	}
	
	if(Dospace(document.frmaddmaterial.urllink.value)||((document.frmaddmaterial.urllink.value.indexOf(' '))==0))
	   { alert("Enter valid urllink");
	   document.frmaddmaterial.urllink.focus();
	   return false; }
	return true;
}
</script>
</html>

