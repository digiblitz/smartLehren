<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>


<!--%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %-->
<!--%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

 <script type="text/javascript">
function initload(){

 document.getElementById('forug').style.display = "none";
 document.getElementById('forpg').style.display = "none";

  }
  
  function disp(){
  
    var selValue = null;		 
   			 var e = frmEditValidation.category.value;//get the combobox
			 // alert(e);
    		 //selValue = e.options[e.checked].value; //get selected value
			
  			 if(e == "UG") {
	   document.getElementById('forug').style.display  = "block"; 
	  document.getElementById('forpg').style.display = "none";
  }else{
	 document.getElementById('forug').style.display = "none";
	  document.getElementById('forpg').style.display = "block";   
  }
  }
</script> 
<script language="javascript" type="text/javascript">
function myValidate(){
	if(document.frmSelEvents.eventType.value==""){
		alert("Select an Event Type");
		document.frmSelEvents.eventType.focus();
		return false;
	}
	
	if(document.frmSelEvents.userType.value==""){
		alert("Select an User Type");
		document.frmSelEvents.userType.focus();
		return false;
	}
		
	if(document.frmSelEvents.selArea.value!="" && document.frmSelEvents.chmpStatus.value==""){		
		alert("Select a Championship Status");
		document.frmSelEvents.chmpStatus.focus();
		return false;			
	}		
	return true;
}
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

<link href="css/core-ie.css" rel="stylesheet" type="text/css" />
</head>
<body  class="page1" id="top" onload="initload()"  >
 <headere><div>
 


<%@ include file = "../../include/header.jsp" %>
 <%@ include file = "../../include/Hmenu.jsp" %>
</div></headere>
<div class="content">
  <div class=" ">
      <div class="">
<h3>Edit Qualification Details</h3>

				<!-- CONTENTS START HERE -->
				
<table width="1200" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin; color:#000000; font-size:16px; margin-left:70px; ">
  


 <tr>

 	<td>
		 <table  width="800" border="0" cellpadding="0" align="center" cellspacing="0" style="margin-left:200px">
		 <form name="frmEditValidation" id="frmEditValidation" action="./qual.html" method="post" >
		  <input type="hidden" name="QualificationProcess" value="editDetails"  />
  		  
		
		 <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="486" style="height:30; " align="center"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>
		
		 <tr >
		 <td height="40" width="486" >Graduation Category</td><td width="314"   ><label style=" color:#FF0000">*</label><input type="radio" name="category" id="category" value="UG"   onclick="disp()" checked="checked"   />UG
		 <input type="radio" name="category" id="category" value="PG" onclick="disp()" checked="checked" />PG<label style=" color:#FF0000"></label></td>
		 </tr>
		 
		  <tbody id="forug">
			<%ArrayList ugqualificationdetails =(ArrayList)request.getAttribute("ugqualificationdetails");
									
									if(ugqualificationdetails!=null && ugqualificationdetails.size()!=0){
									
									Iterator itr = ugqualificationdetails.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 //String map_id = sr[0]; 
									 //String category=sr[1];
									 String age = sr[1]; 
									 String std = sr[2]; 
									 String document=sr[3];
											
									 //System.out.println("DB qualification: " + map_id);
											%>
		  <tr style="margin-top:20px">
		    
			
			<td height="40" width="486"  >Min. Age</td>
			<td><label style=" color:#FF0000">*</label><input type="text" name="age" id="age" style="width:250px; height:20px;"  value="<%=age%>"/><label style=" color:#FF0000"></label></td>	</tr>
			
			<tr><td height="40" width="486"  >Standard</td>
			<td><label style=" color:#FF0000">*</label><label style=" color:#FF0000">*</label><input type="text" name="std" id="std"  style="width:250px; height:20px;" value="<%=std%>"/><label style=" color:#FF0000"></label></td>	</tr>
			<tr><td height="40" width="486"  >Supportive Documents</td>
			<td><label style=" color:#FF0000">*</label><input type="radio" name="document" id="document" value="<%=document%>" />Yes
		 <input type="radio" name="document" id="document" value="<%=document%>" />No<label style=" color:#FF0000"></label></td>	</tr>
			<%}} %>
		  </tbody>
		
		  <tbody id="forpg">
			
		  <tr style="margin-top:20px">
			
			<%ArrayList pgqualificationdetails =(ArrayList)request.getAttribute("pgqualificationdetails");
									
									if(pgqualificationdetails!=null && pgqualificationdetails.size()!=0){
									
									Iterator itr = pgqualificationdetails.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 //String map_id = sr[0]; 
									 //String category=sr[1];
									 //String age = sr[2]; 
									 String std = sr[0]; 
									 String document=sr[1];
											
									 //System.out.println("DB qualification: " + map_id);
											%> 
			
			<tr>
			 
			<td  height="40" width="486" align="left"  class="textBold">UG Program Name</td>
	 								  <td width="314"><label style=" color:#FF0000">*</label>
	 								  <input type="text" name="std" id="std" value="<%=std%>" />
	 								  <label style=" color:#FF0000"></label></td></tr>
			<tr><td height="40" width="486"  >Supportive Documents</td>
			<td><label style=" color:#FF0000">*</label><input type="radio" name="document" id="document" value="<%=document%>" />Yes
		 <input type="radio" name="document" id="document" value="<%=document%>" />
		 No		 <label style=" color:#FF0000"></label></td>	</tr>
			<%}} %>
		  </tbody>
		
			
				   <tr>
					<td colspan="2" align="center">
				<img src="images/update.jpg"  alt="update" width="20" height="20" style="cursor:pointer"/>	<input type="submit" name="Update" id="appButton" value="Update" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onclick="return onValidate();" >
					&nbsp;	<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>	<input type="submit" name="cancel" id="appButton"  onClick="javascript:history.back(-1);" value="Cancel" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" />			</td>
				  </tr>
			  </form>
		  
	  </table>
	</td>
</tr>   
</table>
			<!-- CONTENTS END HERE -->		
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
chosen="";
len = document.frmEditValidation.category.length ;
for(i=0;i<len;i++)
{if(document.frmEditValidation.category[i].checked)
  { chosen= document.frmEditValidation.category[i].value; }
}
if(chosen=="")
{alert("Select the Category");
 
 return false;
}
if(document.frmEditValidation.age.value==""){
		alert("Age cannot be empty");
		document.frmEditValidation.age.focus();
		return false;
	}
	
	if(Dospace(document.frmEditValidation.age.value)||((document.frmEditValidation.age.value.indexOf(' '))==0))
	   { alert("Enter valid Age");
	   document.frmEditValidation.age.focus();
	   return false; }
	if(document.frmEditValidation.std.value==""){
		alert("Standard cannot be empty");
		document.frmEditValidation.std.focus();
		return false;
	}
	
	if(Dospace(document.frmEditValidation.std.value)||((document.frmEditValidation.std.value.indexOf(' '))==0))
	   { alert("Enter valid Standard");
	   document.frmEditValidation.std.focus();
	   return false; }
	
	   
	   
	   
	   
	 
	return true;
}
</script>
</html>
