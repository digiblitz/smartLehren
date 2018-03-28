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
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
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
<script src="js/calendar2.js" type="text/javascript"></script>

 <script language="javascript">
    
function callpopup() {

	document.getElementById("pop").style.display = 'block'; 
	document.getElementById("popDoc").style.display = 'none'; 
	
}
function goBack(){
	strURL = "./SysMgmt.html?process=callArtifactBPList";
	window.location.href = strURL;
}

function callpopupDoc() {

	document.getElementById("pop").style.display = 'none'; 
	document.getElementById("popDoc").style.display = 'block'; 
	
}
function validate()
{
	if(document.requestIns.name.value==""){
		alert("Please enter a name");
		document.requestIns.name.focus();
		return false;
		}
	return true;
}

function submit(){
	
	 document.forms["requestIns"].submit();


}
     </script>
</head>

 <body class="page1" id="top">
 <headere><div>
  
<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      <div style=" font-size: 15px; color:black;">

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
      
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	    <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="200" style="border:thin;border-style:groove;">
        <tr>
          <td valign="top" class="tableCommonBg">
		  
		  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <td><!-- CONTENTS START HERE -->
                          <div class="cmmnForm">
                            <div class="colspan" ><img src="images/BPM-icon.jpg" alt="" width="20px" height="20px" /><strong>Business Process:<span class="styleBoldTwo"> Initiate Governance for Business Process</span> </strong><div class="divider3"></div></div>
                            <%
   	String id=(String)request.getParameter("id");
			String Name=(String)request.getParameter("bpName");
			String Version=(String)request.getParameter("bpVersion");
		String govStatus=(String)request.getParameter("govStatus");	

    %>
                            <form name="requestIns" id="requestIns"    method="post" action="SysMgmt.html?process=busineessProceSubmit" class="formcss">
                              <input type="hidden" name="id" value="<%=id%>"/>
                              <input type="hidden" name="gov" value="stopGov"/>
                              <input type="hidden" name="govStatus" value="<%=govStatus%>"/>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td colspan="2" ><div class="rowHead"><strong>&nbsp;Business process:</strong></div></td>
                                </tr>
                                <div class="row">
                                  <tr>
                                    <td width="235" height="26"><span class="label">&nbsp;Name:</span></td>
                                    <td width="652"><span class="formX">
                                      <input
												type="text" name="name" id="name" class="textboxOne" size="20" value ="<%=Name%>" readonly="readonly"/><font color="#FF0000"><span class="asterisk">&nbsp;*</span></font>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="70"><span class="label">&nbsp;Description:</span></td>
                                    <td><span >
                                      <textarea rows="4" cols="22" name="desc"></textarea>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="26"><span class="label">&nbsp;Version:</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="version"  class="textboxOne" size="20" value ="<%=Version%>"  readonly="readonly"/>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="28"><span class="label">&nbsp;Criticality:</span></td>
                                    <td><span class="formX">
                                      <select  id="select" name="criticality" class="selectboxOne">
                                        <option selected="selected" value="">Select One</option>
                                        <option value="high">High</option>
                                        <option value="medium">Medium</option>
                                        <option value="low">Low</option>
                                      </select>
                                      &nbsp; </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="25"><span class="label">&nbsp;Consumable:</span></td>
                                    <td><span class="formX">
                                      <input
												type="checkbox" name="cons" class="textboxOne" size="20" />
                                    </span></td>
                                  </tr>
                                </div>
                                <tr>
                                  <td height="29" colspan="2" align="left" valign="middle"><div class="row"> <span class="label">
                                      &nbsp;<label><img src="images/add-icon-button.jpg" alt="add bpel" width="20px" height="20px" /><input type="button" value="Add BPEL" class="button-add" name="method"  onclick="callpopup()"/></label>
                                    &nbsp;&nbsp;
                                    <label><img src="images/add-icon-button.jpg" alt="add document" width="20px" height="20px" /><input type="button" value="Add Document" class="button-add" name="method"  onclick="callpopupDoc()"/></label>
                                  </span> <span class="formX"> </span> </div>
								 
								  <div id="pop" style="display:none;">
	
 <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px">
  <tr>
    <td width="172" height="27"><span class="label">File Name:</span></td>
    <td><span class="formX"><input
												type="text" name="bpname"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td height="27"><span class="label">Path:</span></td>
    <td><span class="formX"><input
												type="text" name="bppath"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td height="27"><span class="label">Description:</span></td>
    <td><span class="formX"><input
												type="text" name="bpdesc"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td height="27"><span class="label">Criticality:</span></td>
    <td><span class="formX"><select  id="select" name="bpcriticality" class="selectboxOne">
										<option selected="selected" value="">Select One</option>
										  <option value="high">High</option>

										    <option value="medium">Medium</option>
													  <option value="low">Low</option></select>&nbsp;
										 </span></td>
  </tr>
  <tr>
    <td height="27"><span class="label">Version:</span></td>
    <td><span class="formX"><input
												type="text" name="bpversion"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td height="27"><span class="label">Target Namespace:</span></td>
    <td><span class="formX"><input
												type="text" name="bptrname"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td height="27"><span class="label">Location:</span></td>
    <td><span class="formX"><input
												type="text" name="bplocation"  class="textboxOne" size="20" /></span></td>
  </tr>
</table>
</div>
											<div id="popDoc" style="display:none;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:5px">
  <tr>
    <td width="172"  height="27"><span class="label">Document Name:</span></td>
    <td><span class="formX"><input
												type="text" name="docname"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td  height="27"><span class="label">Description:</span></td>
    <td><span class="formX"><input
												type="text" name="docdesc"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td  height="27"><span class="label">From Path:</span></td>
    <td><span class="formX"><input
												type="text" name="docpath"  class="textboxOne" size="20" /></span></td>
  </tr>
  <tr>
    <td  height="27"><span class="label">Location (To Path)</span></td>
    <td><span class="formX"><input
												type="text" name="doclocat"  class="textboxOne" size="20" /></span></td>
  </tr>
</table>										
</div>
								  </td>
                                </tr>
                                <tr>
                                  <td colspan="2" align="center"><div class="row"> <span class="label">&nbsp;</span> <span class="formX">
                                      <label><img src="images/save-icon.png" alt="save" width="20px" height="20px" /><input type="button" value="Save" class="button-add" name="method2" onclick="validate();submit()" /></label>&emsp;
                                      <label><img src="images/cancel-icon-button.png" alt="cancel" width="20px" height="20px" /><input name="button" type="button" class="button-add" onclick="goBack();" value="Cancel" /></label>
                                  </span></div></td>
                                </tr>
                              </table>
                            </form>
                          </div>
                      </td>
                    </tr>
                  </table>
                    <!-- CONTENTS END HERE -->
                </td>
              </tr>
          </table></td>
        </tr>
        
      </table></td>
   

    </tr>
    	<tr><td>&nbsp;</td></tr>

  </table></div></div></div>
<!--=======footer=================================-->
 <footer>			 
			
                   <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
          
 </footer>

</body>


</html>
