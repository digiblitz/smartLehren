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
    

	 function showVal(role_id,role_name)
     { 
		 var roleid = role_id;	
	    var cname = role_name;		
	   
	    document.getElementById('roleid').value = roleid; 
	    document.getElementById('rolename').value = cname;
    }
	 </script>
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


<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Role</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
	
	<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
	
     <form align="center" action="./login.html" method="post" name="role">
<input type="hidden" name="LoginProcess"  value="role">
<input type="hidden" name="roleid" id="roleid" value="">

<table width="800" >
<tr><td>
					  
<tr  >
  <td height="40" width="287" align="right"> 
  
  <div style=" margin-top:20px">Role Name:</div></td>
  
  <td width="501" height="40" align="left">
  
  <div style=" margin-top:20px"><input  type="text" name="rolename"  id="rolename" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;"> <label style=" color:#FF0000">*</label></div></td></tr>
  
<tr ><td colspan="2" align="center" height="40">
<img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/><input type="submit" name="create" value="Create" onClick="return(onValidate());" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >

<img src="images/delete.jpg" alt="delete" width="20" height="20" style="cursor:pointer"/><input  type="submit" name="delete" value="Delete" onClick="return(ondelete());" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" >

<img src="images/update.jpg"alt="update" width="20" height="20" style="cursor:pointer"/><input class="ppp"  type="submit" name="Update" value="Update" onClick="return(onValidate());" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></td></tr>
</table></form></div></div>
<div style="color:#FF0000; margin-bottom:10px; font-family:'Times New Roman', Times, serif;">Note:If you want Delete or Update,You can Select from the List of Roles</div></td></tr>

<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">List of Role</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
<table width="800" >

		 							
		 							<%ArrayList rolelist =(ArrayList)request.getAttribute("rolelist");
									
									if(rolelist!=null && rolelist.size()!=0){
									
									Iterator itr = rolelist.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String role_id = sr[0]; 
									 String role_name = sr[1]; 
											   
											
											%> 
											
											<tr>
											
											<td  colspan="5" ><div  style="margin-bottom:10px; " >
	<label class="lab"><a href="#" onClick="showVal('<%=role_id%>','<%=role_name%>');"><%=role_name%></a></label></div></td>		
										   	
											</tr> 
										
											<%
											}
											}else{%>
											
											<tr>
											<td colspan="2" align="center" height="40">
											<label class="lab">No records found</label>
											</td>
											
											</tr>
										<%}%>
			</table>

  </div>   
     
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
	if(document.role.rolename.value==""){
		alert("Role name cannot be empty");
		document.role.rolename.focus();
		return false;
	}
	
	if(Dospace(document.role.rolename.value)||((document.role.rolename.value.indexOf(' '))==0))
	   { alert("Enter valid Role name");
	   document.role.rolename.focus();
	   return false; }
	
	
	return true;
}
function ondelete()
{
	if(document.role.rolename.value==""){
		alert("select Role name from role list");
		document.role.rolename.focus();
		return false;
	}
	
	
	return true;
}
</script>
</html>

