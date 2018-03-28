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
<script src="js/frmMeeEduActRecap.js" type="text/javascript" ></script>
<script src="js/frmrRoleMEditValidate.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>
<script>
    function cancelEditArtifact(mainArtiId)
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./artifactMapping.html?artiMapProcess=artifactList&mapId="+mainArtiId;
	window.location.href = strURL;
        }
       else
	{
		return;
	}
    }
	function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.subArtifact.value = "";
		}

		
	}
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
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
          
    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width="100%" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                <tr>
                  <td colspan="2"  class="tblMainHead"> Maintain Artifact: <span  class="styleBoldTwo">Edit </span></td>
                </tr>
                <tr>
                  <td colspan="2" class="tblDescrp"> You can <strong>Edit/Update</strong> the <span class="tblMainHead">Artifact</span><strong> </strong>created by you as given below. </td>
                </tr>
                <tr>
                  <td><%
							

							String subArtifact = (String)request.getAttribute("subArtifact");
							String mainArtifactName = (String)request.getAttribute("mainArtifactName");
							String mainArtiId = (String)request.getAttribute("mainArtiId");
							String artifactId = (String)request.getAttribute("artifactId");
							System.out.print("subArtifact:" + subArtifact);
							System.out.print("mainArtifactName:" + mainArtifactName);
							
						%>
                      <form name="frmRoleMgtRoleEdit" id="frmRoleMgtRoleEdit" method="post" action="artifactMapping.html" onsubmit="return formValidate(this);">
                        <input type="hidden" name="artiMapProcess"	value="editArtifact"/>
                        <input type="hidden" name="artifactId" value="<%=artifactId%>"/>
                        <input type="hidden" name="mainArtiId" value="<%=mainArtiId%>"/>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                          <tr>
                            <td  colspan="2" class="tblDescrp"> Fields marked with an asterisk (<span class="asterisk">*</span>) are required. </td>
                          </tr>
                          <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
							//String subArtifact=(String)request.getAttribute("subArtifact");
						  %>
                          <tr>
                            <td class="styleError" colspan="2"><strong>Sub Artifact already exist</strong></td>
                          </tr>
                          <%
							  
						  }
				         %>
                          <tr>
                            <td class="tableLeft">Main Artifact :</td>
                            <td class="tableRight"><input name="mainArtifact" id="mainArtifact" type="text" class="readOnly" value="<%=mainArtifactName%>" size="25" maxlength = "100" readonly="true"/>                            </td>
                          </tr>
                          <tr>
                            <td class="tableLeft">Sub Artifact :</td>
                            <td class="tableRight"><input name="subArtifact" id="subArtifact" type="text" class="textboxOne" value="<%=subArtifact%>" size="25" maxlength = "100"/>
                                <span class="asterisk">*</span></td>
                          </tr>
                          <tr>
                            <td colspan="2" style="text-align:center" height="25"><input name="submit" type="submit" class="gradBtn" value="Update" />
                              &nbsp;
                              <input name="button" type="button" class="gradBtn" value="Clear" onclick = "clearField(this.form)"/>
                              &nbsp;
                              <input name="button" type="button" class="gradBtn" value="Cancel" onclick ="cancelEditArtifact('<%=mainArtiId%>')"/></td>
                          </tr>
                        </table>
                      </form></td>
                </tr>
              </table>
          <!-- CONTENTS END HERE -->          </td>
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
    </div>  
 </footer>
</body>
</html>
