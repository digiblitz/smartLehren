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
	 <body class="page1" id="top">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="">
      
      <h3>Update Enroll:</h3>
       <table width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin;color:#000000; font-size:16px;  ">



<form align="center" action="./login.html" name="enroll" id="enroll"method="post">
<input type="hidden" name="LoginProcess"  value="updateenroll">
<%String username=(String)request.getAttribute("username");%>
<input type="hidden" name="username" value="<%=username%>">
<%
	String estatus=(String)request.getAttribute("estatus");
	 if(estatus!=null){
	 %>
       <tr>
        <td width="84" style="height:30" align="center"><strong><font color="#FF0000"><%=estatus%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>   
            <tr><td height="40" width="160"><table border="0" align="center"  style="color:#000000">
<tr class="row"><td height="40" width="160">Role Name</td><td width="286">
<select class="pp" id="selCateg" style="width:250px; height:20px;"name="setrole">
						<option value="<%=nullCheck((String)request.getAttribute("rolename"))%>"><%=nullCheck((String)request.getAttribute("rolename"))%></option>
						<option value="admin">admin</option>
						<option value="student">student</option>
						<option value="course mentor">course mentor</option>
				</select></td></tr>

<tr class="row"><td height="40" width="160"  align="left"  class="textBold">Category Name:</td><td><select class="pp" name="couName" id="couName" style="width:250px; height:20px;"  >
								 		<option  value="<%=nullCheck((String)request.getAttribute("category"))%>"><%=nullCheck((String)request.getAttribute("category"))%></option>
								 			<jsp:scriptlet> 
								 				
												ArrayList courselist = (ArrayList)request.getAttribute("courselist");
												if(courselist!=null && courselist.size()!=0){
													
													Iterator itr = courselist.iterator();
													 while (itr.hasNext()) {
													 String sr[] = (String[]) itr.next();
													
													 String course_id = sr[0]; 
													 String coursename = sr[1]; 
															   
														
														if(coursename!=null)
														{
															</jsp:scriptlet>
															<option value="<%=coursename%>"><%=coursename%></option>
															<jsp:scriptlet>
														 }
														//System.out.println(course_name);
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
								 		
<tr class="row"><td height="40" width="160" align="left"  class="textBold">Course Name:</td><td><select class="pp" name="subname" id="subcou" style="width:250px; height:20px;" >
								 		<option  value="<%=nullCheck((String)request.getAttribute("subcourse"))%>"><%=nullCheck((String)request.getAttribute("subcourse"))%></option>
								 			<jsp:scriptlet> 
								 				
												ArrayList sublist = (ArrayList)request.getAttribute("sublist");
												if(sublist!=null && sublist.size()!=0){
													
													Iterator itr = sublist.iterator();
													 while (itr.hasNext()) {
													 String s[] = (String[]) itr.next();
													
													 String sub_id = s[0]; 
													 String course_id= s[1]; 
													 String subcourse_name = s[2]; 
															   
														
														if(subcourse_name!=null)
														{
															</jsp:scriptlet>
															<option value="<%=subcourse_name%>"><%=subcourse_name%></option>
															<jsp:scriptlet>
														 }
														
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
<tr class="row"><td height="40" width="160"  align="left"  class="textBold">Start Date:</td><td><input  style="width:250px; height:20px;" type="text" name="startdate" value="<%=nullCheck((String)request.getAttribute("startdate"))%>">
<a href="javascript:show_calendar('document.enroll.startdate', document.enroll.startdate.value);"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a></td><td width=20 style="color:red" align="right">*</td>
</tr>

<tr class="row"><td height="40" width="160" align="left"  class="textBold">End Date:</td><td><input style="width:250px; height:20px;" type="text" name="enddate" value="<%=nullCheck((String)request.getAttribute("enddate"))%>">
<a href="javascript:show_calendar('document.enroll.enddate', document.enroll.enddate.value);"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick up the timestamp"></a></td><td width=20 style="color:red" align="right">*</td>
</tr>

<tr class="row"><td></td><td><label><img src="images/submit.jpg" alt="submit" width="20" height="20" style="cursor:pointer"/><input type="submit" name="appenroll" style="background-color: transparent; border:none; cursor:pointer; width:48px; height:20px;" value="Update" onClick="return(onValidate());"></label></td></tr>

</table></td></tr>

</form>
					
</td>
</tr>
</table>

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


function onValidate()
{
	if(document.enroll.setrole.value==""){
		alert("Role name cannot be empty");
		document.enroll.setrole.focus();
		return false;
	}
	if(document.enroll.couName.value==""){
		alert("Category name cannot be empty");
		document.enroll.couName.focus();
		return false;
	}
	if(document.enroll.subname.value==""){
		alert("Course name cannot be empty");
		document.enroll.subname.focus();
		return false;
	}
	if(document.enroll.startdate.value==""){
		alert("Startdate cannot be empty");
		document.enroll.startdate.focus();
		return false;
	}
	if(document.enroll.enddate.value==""){
		alert("Lastdate cannot be empty");
		document.enroll.enddate.focus();
		return false;
	}
	
	return true;
}
</script>
</html>

