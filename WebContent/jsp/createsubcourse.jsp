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

if(postProcess=="couName"){
if(document.course.couName.value!=""){
	prog=document.course.couName.value;
	document.course.method="post";
	document.course.action="map.html?cmd=selectsubcourse&prog="+prog;
	document.course.submit();
	
	}
	
	}

}

    
        function showVal(course_id,course_name)
        { 
   		 var cid = course_id;
   	    var cname = course_name;		
   	   
   	    document.getElementById('courseid').value = cid;
   	    document.getElementById('coursename').value = cname;
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

     </head>
	 <style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
	 <body class="page1" id="top">
	
 <headere><div>
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create SubProgram</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
	
<form align="center" action="./login.html" method="post" name="course" id="course">
<input type="hidden" name="LoginProcess"  value="course">
<input type="hidden" name="courseid" id="courseid" value="">

<div align="center">

<table>
<%	String coursenamee=(String)request.getAttribute("coursenamee");
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	 <tr height="40"><td style="font-size:12pt;"></td><td colspan="3" style="color:red; font-family:'Times New Roman', Times, serif;"><%=status%></td></tr><%} %>
	 		
<tr>
<td style="margin-top:3px;" height="48"  align="rihgt"  class="textBold">Select Program Name:</td>
<td width="5">&nbsp;</td>
					    <td height="48" align="left"><select name="couName" onChange="postData('couName');" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
                        <option value="">Select program</option>
                          <jsp:scriptlet> 
								 				
								 			ArrayList list =(ArrayList)request.getAttribute("list");
											
											if(list!=null && list.size()!=0){
											
											Iterator itr = list.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String course_id = sr[0]; 
											 String course_name = sr[1];
											  
														
														if(course_name!=null && course_name.equals(coursenamee))
														{
															</jsp:scriptlet>									
                        
		<option value="<%=course_name%>" selected="selected"><%=course_name %>
		</option>
                          <jsp:scriptlet>
						  
			
														 }
														else{
															</jsp:scriptlet><label class="lab">
	<option value="<%=course_name%>"><%=course_name %></option></label>
															<jsp:scriptlet>
														}
													}
												}
											</jsp:scriptlet>
            </select><label style=" color:#FF0000">*</label></td>
</tr>
<tr><td style="margin-top:4px;">SubProgram Name:</td><td width="5">&nbsp;</td>
<td align="left"><input type="text" name="coursename"  id="coursename" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;"><label style=" color:#FF0000">*</label></td></tr>
<tr><td>&nbsp;</td></tr>

<tr><td  align="center" colspan="3">
 <img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/>
 <input type="submit" name="create" value="Create" onClick="return(onValidate());"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >
&nbsp;&nbsp;

<img src="images/delete.jpg"alt="delete" width="20" height="20" style="cursor:pointer"/>
<input   type="submit" name="delete" value="Delete" onClick="return(ondelete());"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" > &nbsp;&nbsp;

<img src="images/update.jpg" alt="update" width="20" height="20" style="cursor:pointer"/>
<input   type="submit" name="Update" value="Update" onClick="return(onValidate());"     style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >
</td></tr>
</table>

</div></div></div>

<div style="color:#FF0000; margin-bottom:10px; font-family:'Times New Roman', Times, serif;">Note:If you want Delete or Update,You can Select from the List of SubProgram</div></td>

  <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">List of SubProgram</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      
<table  width="800" >
		 							
		 							<%ArrayList courselist =(ArrayList)request.getAttribute("subcourselist");
									
									if(courselist!=null && courselist.size()!=0){
									
									Iterator itr = courselist.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String course_id = sr[0]; 									
									 String course_name = sr[1]; 
										   
											
											%> 
											<tr   >
											
											<td  colspan="5"  >
			<div  style="margin-bottom:10px;" >
			<label class="lab">	<a href="#" onClick="showVal('<%=course_id%>','<%=course_name%>');"> 
			<%=course_name%></a></label></div></td>		
										   	
											</tr> 
										
											<%
											}
											}else{%>
											
											<tr>
											<td colspan="2" align="center">
											 <label class="lab">Please Select Program Name</label>
											</td>
											
											</tr>
										<%}%>
		 					</table></div></div>

</form>	           

						

     <br><br>  
       
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
<script type="text/javascript">

function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}

function onValidate()
{
	if(document.course.couName.value==""){
		alert("Category name cannot be empty");
		document.course.couName.focus();
		return false;
	}
	
	
	
	if(document.course.coursename.value==""){
		alert("Course name cannot be empty");
		document.course.coursename.focus();
		return false;
	}
	
	if(Dospace(document.course.coursename.value)||((document.course.coursename.value.indexOf(' '))==0))
	   { alert("Enter valid Coursename");
	   document.course.coursename.focus();
	   return false; }
	
	
	return true;
}
function ondelete()
{
	if(document.course.coursename.value==""){
		alert("select Course name from course list");
		document.course.coursename.focus();
		return false;
	}
	
	
	return true;
}
</script>
</html>

