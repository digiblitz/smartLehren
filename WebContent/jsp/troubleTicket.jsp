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
<title>Trouble Ticket</title>
<style type="text/css">
<!--
.style2 {color: #0099CC; font-size:20px}
.style7 {
	color: #000099;
	font-size: 24px;
}
.style8 {font-size: 20px}
.style9 {color: #FFFFFF}
-->
</style>
<script type="text/javascript"> 
function show_alert() 
{ 
alert("your mail has been sent...!"); 
} 

//------------------------DOSPACE--------------------------------------------------------------------------
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}
//-------------------function for character validation in Names------------------
function isnotName(str){
stringCheck="!@#$%^&*()_+|<>?/=~,`0123456789;:][{}"+"\\";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}


function onValidate()
{
	if(document.TT.name.value==""){
		alert("Name cannot be empty");
		document.TT.name.focus();
		return false;
	}
	if(Dospace(document.TT.name.value)||((document.TT.name.value.indexOf(' '))==0))
   { alert("Enter valid name");
     document.TT.name.focus();
   return false; }
   
   if(isnotName(document.TT.name.value))
 {alert("Enter a valid  name");
  document.TT.name.focus();
 return false;}
 
 if(document.TT.subject.value==""){
		alert("Subject cannot be empty");
		document.TT.subject.focus();
		return false;
	}
	if(Dospace(document.TT.subject.value)||((document.TT.subject.value.indexOf(' '))==0))
   { alert("Enter valid subject");
     document.TT.subject.focus();
   return false; }
   
   if(isnotName(document.TT.subject.value))
 {alert("Enter a valid  subject");
  document.TT.subject.focus();
 return false;}
 
 if(document.TT.email.value=="")
 {alert("EmailId cannot be empty");
  document.TT.email.focus();
 return false;}
 
if(document.TT.email.value.indexOf(" ")==0)
 {alert("Enter a Valid EmailId");
  document.TT.email.focus();
 return false;}

 if(!(document.TT.email.value== ""))
 { strmail=document.TT.email.value;
 firstat = strmail.indexOf("@");
 lastat = strmail.lastIndexOf("@");
 strmain=strmail.substring(0,firstat);
 strsub=strmail.substring(firstat,document.TT.email.value.length);
 if(strmail.length>120)
 {alert("Email is out of range");
  document.TT.email.focus();
 return false;}
 if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf(' ')!=-1 )
 {alert("Enter valid Email ");
  document.TT.email.focus();
 return false;}
 if(isnotSpecial(strmain) || isnotSpecial(strsub))
 {alert("Enter valid Email ");
  document.TT.email.focus();
 return false;}
 k=0;
 strlen=strsub.length;
 for(i=0;i<strlen-1;i++)
 { if(strsub.charAt(i)=='.')
 {k=k+1;}}
 if(k>3)
 {alert("Enter valid EmailId");
  document.TT.email.focus();
 return false;}
 if(firstat==-1 || lastat==-1)
 {alert("Enter valid EmailId" );
  document.TT.email.focus();
 return false;}
 if(Number(strmain))
 {alert("Enter valid EmailId");
  document.TT.email.focus();
  return false;}
 if(firstat != lastat )
 {alert("Enter valid EmailId");
  document.TT.email.focus();
 return false;}
 firstdot=strmail.indexOf(".",firstat);
 lastdot=strmail.lastIndexOf(".");
 if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1)
 {alert("Enter valid EmailId");
  document.TT.email.focus();
  return false;}
}

 if(document.TT.mobile.value==""){
		alert("Mobile Number cannot be empty");
		document.TT.mobile.focus();
		return false;
	}
 if(Dospace(document.TT.mobile.value)||((document.TT.mobile.value.indexOf(' '))==0))
   { alert("Enter valid mobile number");
     document.TT.mobile.focus();
   return false; }
   
   if(document.TT.description.value==""){
		alert("Description cannot be empty");
		document.TT.description.focus();
		return false;
	}
 if(Dospace(document.TT.description.value)||((document.TT.description.value.indexOf(' '))==0))
   { alert("Enter valid description");
     document.TT.description.focus();
   return false; }
   
   if(document.TT.file.value==""){
		alert("File cannot be empty");
		document.TT.file.focus();
		return false;
	}
 
   
 return true;
 }
</script>
</head>
<body class="page1" id="top">
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">


<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>

<div class="content">
  <div class="container_12 ">
  
  <div>&nbsp;</div>
  <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family:'Times New Roman', Times, serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Trouble Ticket</div>
<div class="pps" style="font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
  
<table width="980" style="color:#000000; font-size:16px; ">
	<tr><td width="968" height="601">
	<form align="center" action="./login.html" name="TT" method="post" id="TT">
	<input type="hidden" name="LoginProcess"  value="drupalprocess">


<div align="left">If you're having trouble with your home page or news feed ,you've come to the right place. </div>
<div align="left">Please use this form to tell us about the issue you're experiencing.</div>
<br>

<table width="843" align="center">

	<tr>
		<td height="54" width="253" >Name:  </td>
		<td height="54" width="317" align="left"><input type="text" name="name" id="name" style="width:150px; height:20px;"/></td>
	</tr>
	<tr>
		<td height="53" width="253">Subject:  </td>
		<td height="53" width="317" align="left"><input type="text" name="subject" id="subject" style="width:150px; height:20px;" /></td>
	</tr>
	<tr>
		<td height="57" width="253">Email:  </td>
		<td height="57" width="317" align="left"><input type="text" name="email" id="email" style="width:150px; height:20px;"/></td>
	</tr>
	<tr>
		<td height="55" width="253" >Mobile No: </td>
		<td height="55" width="317" align="left"><input type="text" name="mobile" id="mobile" style="width:150px; height:20px;" /></td>
	</tr>
	<tr>
		<td height="117" width="253"  >Description: </td>
		<td height="117" width="317" align="left">
		  <textarea rows="4" cols="50" name="description" id="description"></textarea>		
		 </td>
	</tr>
	<tr>
		<td height="62" width="253" >Category: </td>
		<td height="62" width="317" align="left"><select name="category" id="category" style="width:150px; height:20px;" >
								 		<option value="">Select Category</option>
										<option value="">smartLehren</option>
										<option value="">Klugwerks</option>
										<option value="">menschForce</option>
										<option value="">azureHealth</option>
										<option value="">guildkraft</option>
				</select> </td>
				<td height="62" width="55" > Priority: </td>
		<td height="62" width="198"><select name="priority " id="priority " style="width:150px; height:20px;" >
								 		<option value="">Select Priority </option>
										<option value="">Low</option>
										<option value="">High</option>
										<option value="">Normal</option>
										
				</select> </td>
	</tr>
	<tr>
		
	</tr>
	<tr>
		<td height="67" width="253" >Screenshot Attachment:</td>
		<td height="67" width="317" align="left"><img src="images/attachment.png" alt="attachment" width="25" height="19">
		  <input value="Attachment" type="file"  name="file" id="file"/></td>
	</tr>
	
	
</table>
<div>Thanks for taking time to submit the report. While we don't reply to every report, we might contact you if we need more details.</div>
<br>
<div align="center"><label><img src="images/submit.jpg" alt="submit" width="20" height="20" style="cursor:pointer"/></label><input type="button" value="Submit"  onClick="return onValidate();" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"/>
&nbsp;<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label></div>

</form></td></tr></table>

</div>
</div>  <div>&nbsp;</div>
</div></div>

<footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>
</html>
