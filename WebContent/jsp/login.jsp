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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  
 
     <title>Home</title>
   <meta charset="utf-8">
<link href="css/core-ie.css" type="text/css" rel="stylesheet" /> 

 
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

 <body >
 <table align="center">
 <tr> <td colspan="3">

<img src="images/smartlogo.png" alt="smartlehren" />
</td></tr><tr><td colspan="3">

<tr><td colspan="3"><div>&nbsp;</div></td></tr>

<tr> <td colspan="3" align="center"><img src="images/TNOU_Logo.jpg" alt="TamilNadu Open University"/>

</td></tr>


      <form align="center" action="./login.html" method="post">
<input type="hidden" name="LoginProcess"  value="Process">
<tr><td>
<div align="center">
 <br><br>
  <table width="1009" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td align="center"><table width="364" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2" align="center" valign="middle"><strong>User Login Page</strong> </td>
          </tr>
        <tr>
          <td colspan="2" align="center" valign="middle">Login here using your username and password </td>
          </tr>
          <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
           <tr>
          <td colspan="2" align="center" valign="middle" style="color:red;"> <%=status%></td>
          </tr><%} %>
        <tr>
          <td width="121" align="right" valign="middle">Username</td>
          <td width="237" align="left" valign="middle">
            <input type="text" name="username" /></td>
        </tr>
        <tr>
          <td align="right" valign="middle">Password</td>
          <td valign="middle"><input type="password" name="password" />&nbsp;&nbsp;
            <input type="submit" name="Submit" value="Login" /></td>
        </tr>
        <tr>
          <td colspan="2" align="center" valign="middle">
     
            <label>
              <input type="checkbox" name="checkbox" value="checkbox" />
              Remember username</label>
          
          </td>
          </tr>
        <tr>
          <td colspan="2" align="center" valign="middle"><a href="login.html?cmd=initforgetpassword">Forgotten your username or password?</a> </td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="200" valign="top"><p>&nbsp;</p>
        <p style="color:#660000"><strong>Welcome to e-TNOU Learning Console !</strong></p>
        <p style="text-align:justify;">
          
          
          The Tamil Nadu Open University was established by an Act (No.27 of 2002) of the Legislative Assembly of the Government of Tamil Nadu to benefit those who have been deprived of and/or denied the access to higher education especially destitute, physically challenged, working men and women, economically weaker sections of the society, and those who discontinued education for various reasons, etc. In the main, it aims to reach the hitherto unreached.
          
        </p>
        <p style="text-align:justify;">The University offers many Programmes in various disciplines. Given the geographical extent, population and actual need of Tamil Nadu, the setting up of Tamil Nadu Open University by the Government of Tamil Nadu is the right step. We appreciate the Government of Tamil Nadu for having taken this bold and knowledgeable step. This step of the Government of Tamil Nadu shall prove a boon for women, physically challenged, rural poor and marganalised sections of the society and we are committed to support it academically as well as financially. In a short period of six months, Tamil Nadu Open University has done a remarkable work.
          
         </p>
        <p style="color:#660000"><strong>Happy Learning !</strong></p></td>
    </tr>
  </table></div></td></tr>
</div>

</form>
<tr><td  colspan="3" align="center"><div class="footerTextOne"><img src="images/orglogo.png" alt="you are not logged in" /></div>
	<div>You are not logged in </div>
	
</td></tr>
</td></tr>
 </table>   

</body>
</html>
