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
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
     </head>
	 <body class="page1" id="top">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Map Entity</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
     
    <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
     <form align="center" action="./qual.html" method="post" name="permission">

<input type="hidden" name="QualificationProcess"  value="MappingEPP">

<div align="center">
<table >

	 </tr>
				

<tr>
<td  height="50" align="left"  class="tableLeft">Role Name:</td>
	 								  <td >
	 	  <select name="rolename" id="rolename" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
								 		<option value="">Set role</option>
								 		<jsp:scriptlet> 
								 				
								 			ArrayList rolist =(ArrayList)request.getAttribute("rolist");
											
											if(rolist!=null && rolist.size()!=0){
											
											Iterator itr = rolist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String role_id = sr[0]; 
											 String rolee_name = sr[1];
											  
														
														if(rolee_name!=null)
														{
															</jsp:scriptlet>
								<option value="<%=role_id%>"><%=rolee_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
	 		</select></td></tr>

<tr>
<td  height="50" align="left"   class="tableLeft">Entity Name:</td>
	 								  <td >
	 <select name="entityname" id="entityname" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
								 		<option value="">Set entity</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList enti_list =(ArrayList)request.getAttribute("entitylist");
											
											if(enti_list!=null && enti_list.size()!=0){
											
											Iterator itr = enti_list.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String entity_id = sr[0]; 
											 String entity_name = sr[1];
											 String url_name = sr[2]; 
														
														if(entity_name!=null)
														{
															</jsp:scriptlet>
									<option value="<%=entity_id%>"><%=entity_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
	 		</select></td></tr>
   <tr>
   
   <tr>
<td  height="50" align="left"  class="tableLeft">Privilege Name:</td>
	 								  <td >
	 	<select name="privname" id="privname" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
								 		<option value="">Set privilege</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList privilist =(ArrayList)request.getAttribute("privilist");
											
											if(privilist!=null && privilist.size()!=0){
											
											Iterator itr = privilist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String privilege_id = sr[0]; 
											 String privilege_name = sr[1];
											  
														
														if(privilege_name!=null)
														{
															</jsp:scriptlet>
								<option value="<%=privilege_id%>"><%=privilege_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
	 		</select></td></tr>
   
<td  height="50" align="left" class="tableLeft">Permission Name:</td>
	 								  <td >
	 <select name="permname" id="permname" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
								 		<option value="">Set permission</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList permilist =(ArrayList)request.getAttribute("permilist");
											
											if(permilist!=null && permilist.size()!=0){
											
											Iterator itr = permilist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String permission_id = sr[0]; 
											 String permission_name = sr[1];
											  String url_name = sr[1]; 
														
														if(permission_name!=null)
														{
															</jsp:scriptlet>
								<option value="<%=permission_id%>"><%=permission_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
	 		</select></td></tr>


<tr align="center" ><td colspan="3">

<img src="images/update.jpg" alt="update" width="20" height="20"><input  type="submit" name="Entity" value="Map"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;" onClick="return(onValidate());">

<img src="images/Cancel.png"  alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>

</table></div> </div> </div> 

</form>
						
     
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
	if(document.entity.rolename.value==""){
		alert("Rolename cannot be empty");
		document.entity.rolename.focus();
		return false;
	}
	
	if(Dospace(document.entity.rolename.value)||((document.entity.rolename.value.indexOf(' '))==0))
	   { alert("Enter valid Rolename");
	   document.entity.setrole.focus();
	   return false; }
	if(document.entity.entityname.value==""){
		alert("Entityname cannot be empty");
		document.entity.entityname.focus();
		return false;
	}
	
	if(Dospace(document.entity.entityname.value)||((document.entity.entityname.value.indexOf(' '))==0))
	   { alert("Enter valid entityname");
	   document.entity.entityname.focus();
	   return false; }
	return true;
}
</script>
</html>

