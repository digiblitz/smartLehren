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
<script src="js/basic.js" type="text/javascript" ></script>
<script  src="js/ts_picker.js"></script>

 <script language="javascript">
     function callUni(){
    	 var val= Math.random().toString();
         var ch=val.substring(2,val.length);
   document.getElementById("reqId").value=ch;  


	  
}
     function validate()
     {
     	if(document.requestIns.reqId.value==""){
     		alert("Id cannot be empty. Please click on the 'Generate ID' button");
     		document.requestIns.reqId.focus();
     		return false;
     		}
     	else
     
     	return true;
     }
     </script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
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
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
        

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="200" style="border:thin;border-style:groove;">
        <% String artUid=(String)request.getAttribute("artUid");
 String lifecycleId=(String)request.getAttribute("lifecycleId");
 
 String artifactName=(String)request.getAttribute("artifactName");
 String description=(String)request.getAttribute("description");
 
 
 %>
        <tr>
          <td class="tableCommonBg">
		  <table width="630" height="200" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <td height=100%><!-- CONTENTS START HERE -->
                          <div class="cmmnForm">
                            <div class="colspan" >
							<img src="images/services_logo.png" alt="modify request status" width="20px" height="20px" />
							<strong> Request Status :<span class="styleBoldTwo"> Modify Request Status</span> </strong><div class="divider3"></div></div>
                            <form name="requestIns" id="requestIns" method="post" action="SysMgmt.html?process=subRequest" class="formcss" >
                              <input type="hidden" name="method" value="insertrequest"/>
                              <input type="hidden" name="artifactName" id="artifactName" value="<%=artifactName%>"/>
                              <input type="hidden" name="description" id="description" value="<%=description%>"/>
                              <div class="rowHead"><strong>&nbsp;Request Status Information:</strong></div>
                              <table width="630" border="0" cellpadding="0" cellspacing="0">
                                <div class="row">
                                  <tr>
                                    <td width="290" height="28"><span class="label">&nbsp;Request ID:<span class="asterisk">*</span></span></td>
                                    <td width="597"><span class="formX">
                                      <input
												type="text" name="reqId" id="reqId" class="textboxOne" size="20" readonly="readonly"/>
                                      <input name="button" type="button" onclick="callUni(); " value="Generate ID" size="20" class="button-add"/>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="27"><span class="label">&nbsp;Request Title:<span class="asterisk">*</span></span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="reqTitle" class="textboxOne" size="20" value="<%=artifactName%>" readonly="readonly"/>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="25"><span class="label">&nbsp;Date of the WS in :</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="date1" class="textboxOne" size="20" />
                                    <a href="javascript:show_calendar('document.requestIns.date1', document.requestIns.date1.value);">
							   					<img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="17" style="vertical-align:bottom;" border="0" />
							   				</a> </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="25"><span class="label">&nbsp;Date by when approval is required :</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="date2" class="textboxOne" size="20" />
                                    <a href="javascript:show_calendar('document.requestIns.date2', document.requestIns.date2.value);">
							   					<img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="17" style="vertical-align:bottom;" border="0" />
							   				</a></span></td>
                                  </tr>
                                </div>
                                <%
   ArrayList Stagename=(ArrayList)request.getAttribute("Stagename");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (Stagename != null && Stagename.size() != 0) {  
                                                            
   Iterator iter = Stagename.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	String stagename=artiType[0]; 
                                                                	String Stagevalue=artiType[1]; 
                                                                	
                                                                	 %>
                                <div class="row">
                                  <tr>
                                    <td height="26"><span class="label">&nbsp;Stage Name:</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="stagename" value="<%=stagename %>" class="textboxOne" size="20" />
                                      <input
												type="hidden" name="Stagevalue" value="<%=Stagevalue %>" class="textboxOne" size="20" />
                                      <input
												type="hidden" name="artifactId" value="<%=artUid %>" class="textboxOne" size="20" />
                                      <input
												type="hidden" name="lifecycleId" value="<%=lifecycleId %>" class="textboxOne" size="20" />
                                    </span></td>
                                  </tr>
                                </div>
                                <%
                                                                }
   }
                                                %>
                                <div class="row">
                                  <tr>
                                    <td height="25"><span class="label">&nbsp;Current Version:</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="curVersion" class="textboxOne" size="20" />
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="26"><span class="label">&nbsp;Modified Version:</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="modVersion" class="textboxOne" size="20" />
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="28"><span class="label">&nbsp;Request Priority:</span></td>
                                    <td><span class="formX">
                                      <select  id="select" name="reqPriority" class="selectboxOne">
                                        <option value="high">High</option>
                                        <option value="medium">Medium</option>
                                        <option value="low">Low</option>
                                      </select>
                                      &nbsp; </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td><span class="label">&nbsp;Request Description:</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="reqDesc" class="textboxOne" size="20" />
                                    </span></td>
                                  </tr>
                                </div>
                              </table>
                              <div class="row" align="center"> <span class="label">&nbsp;</span> <span class="formX">
                                <label><img src="images/submit-icon.png" alt="" width="20px" height="20px" /><input type="submit" value="Submit" class="button-add" name="method2" onclick="validate();"/></label>
                              </span> </div>
                            </form>
                        </div></td>
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
<script type="text/javascript">


function onValidate()
{
	
	if(document.requestIns.date1.value==""){
		alert("Startdate cannot be empty");
		document.requestIns.date1.focus();
		return false;
	}
	if(document.requestIns.date2.value==""){
		alert("Lastdate cannot be empty");
		document.requestIns.date2.focus();
		return false;
	}
	
	return true;
}
</script>
</body>


</html>
