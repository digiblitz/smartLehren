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
    
        function showVal(subject_id,subject_name)
        { 
   		 var cid = subject_id;
   	    var cname = subject_name;		
   	   
   	    document.getElementById('subjectid').value = cid;
   	    document.getElementById('subjectname').value = cname;
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
     </head>
	 <body class="page1" id="top">
	
 <headere><div>
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="">
       <h3>Create Course:</h3>
      <table   border="0">
<tr><td  >

	
<form align="center" action="./login.html" method="post" name="subject">
<input type="hidden" name="LoginProcess"  value="subject">
<input type="hidden" name="subjectid" id="subjectid" value="">

<tr><td>


<table width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin; color:#000000; font-size:16px; "  >
<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	 <tr ><td style="font-size:12pt;"></td><td colspan="2" style="color:red"><%=status%></td></tr><%} %>
	 
<tr>
<td  height="40" width="250" align="left"  class="textBold"> Program Name</td>
	 								  <td width="200">
	 								  <select name="couName" id="couName" style="width:250px; height:20px;" >
								 		<option value="">set category</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList list =(ArrayList)request.getAttribute("list");
											
											if(list!=null && list.size()!=0){
											
											Iterator itr = list.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String course_id = sr[0]; 
											 String course_name = sr[1];
											  
														
														if(course_name!=null)
														{
															</jsp:scriptlet>
															<option value="<%=course_name%>"><%=course_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
								 		<tr>
<td  height="40" width="250" align="left"  class="textBold"> SubProgram Name</td>
	 								  <td width="200">
	 								  <select name="subprogram" id="subprogram" style="width:250px; height:20px;" >
								 		<option value="">set subprogram</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList list1 =(ArrayList)request.getAttribute("courselist");
											
											if(list1!=null && list1.size()!=0){
											
											Iterator itr = list1.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String sub_id = sr[0]; 
											 String course_id = sr[1];
											  String course_name = sr[2];
											  
														
														if(course_name!=null)
														{
															</jsp:scriptlet>
															<option value="<%=course_name%>"><%=course_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
<tr><td  height="40" width="250">Course Name:</td><td><input type="text" name="subjectname"  id="subjectname" style="width:250px; height:20px;"></td></tr>
<tr><td  align="center" colspan="3">
 <label><img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/><input type="submit" name="create" value="Create" onClick="return(onValidate());"  style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></label>
&nbsp;&nbsp;
<label> <img src="images/delete.jpg"alt="delete" width="20" height="20" style="cursor:pointer"/><input   type="submit" name="delete" value="Delete" onClick="return(ondelete());"  style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" > &nbsp;&nbsp;</label>
<label> <img src="images/update.jpg" alt="update" width="20" height="20" style="cursor:pointer"/><input   type="submit" name="Update" value="Update" onClick="return(onValidate());"     style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></label>
</td></tr>

</table>
<div style="color:#FF0000; margin-bottom:10px;">Note:If you want Delete or Update,You can Select from the List of Courses</div></td></tr><tr><td height="80" style="color:#000000; font-size:18px"><br><br>List of Course Name:</td></tr>
<tr><td>
<table  width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin; color:#000000; font-size:16px" >
		 							
		 							<%ArrayList subjectlist =(ArrayList)request.getAttribute("subjectlist");
									
									if(subjectlist!=null && subjectlist.size()!=0){
									
									Iterator itr = subjectlist.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String subject_id = sr[0]; 
									 String pro_id = sr[1];
									 String subpro_id = sr[2]; 
									 String subject_name = sr[3];
										   
											
											%> 
											<tr   >
											
											<td  colspan="5"  ><div  style="margin-bottom:10px;" ><a href="#" onClick="showVal('<%=subject_id%>','<%=subject_name%>');"><%=subject_name%></a></div></td>		
										   	
											</tr> 
										
											<%
											}
											}else{%>
											
											<tr>
											<td colspan="2" align="center">
											No records found
											</td>
											
											</tr>
										<%}%>
		 					</table></td></tr>	<tr><td>

</form>	           

						
</td>
</tr>
</table>
     <br><br>  
    </div>   
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
	if(document.subject.couName.value==""){
		alert("Program name cannot be empty");
		document.subject.couName.focus();
		return false;
	}
	
	
	
	if(document.subject.subprogram.value==""){
		alert("SubProgram name cannot be empty");
		document.subject.subprogram.focus();
		return false;
	}
	
	if(document.subject.subjectname.value==""){
		alert("SubProgram name cannot be empty");
		document.subject.subjectname.focus();
		return false;
	}
	
	if(Dospace(document.subject.subjectname.value)||((document.subject.subjectname.value.indexOf(' '))==0))
	   { alert("Enter valid Coursename");
	   document.subject.subjectname.focus();
	   return false; }
	
	
	return true;
}
function ondelete()
{
	if(document.subject.subjectname.value==""){
		alert("select Course name from course list");
		document.subject.subjectname.focus();
		return false;
	}
	
	
	return true;
}
</script>
</html>

