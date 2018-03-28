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

 <script language="javascript">

//window.onload=call();
 
  function approved(url) {
	  
	  strURL = "./SysMgmt.do?process=approved";
      window.location.href = strURL;
		
	}
 
  function denied(url) {
		
	  strURL = "./SysMgmt.do?process=denied";
      window.location.href = strURL;
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
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
        
    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" ><table width="887" height="100" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
        <tr>
          <td class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <form action="SysMgmt.do" name="artifactlist" id="artifactlist">
                        <td><table  border="1" cellpadding="0" cellspacing="0" width="100%" align="left" >
                            <tr >
                              <td width="61" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Serial Id</strong><div class="divider3"></div></td>
                              <td width="103" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Artifact Name</strong><div class="divider3"></div></td>
                              <td width="134" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Artifact Description</strong><div class="divider3"></div></td>
                              <td width="164" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Date of Request Raised</strong><div class="divider3"></div></td>
                              <td width="122" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Stage Name</strong><div class="divider3"></div></td>
                              <td width="162" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Actions</strong><div class="divider3"></div></td>
                              <td width="121" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Comments</strong><div class="divider3"></div></td>
                            </tr>
                            <%
   Map <String,String[]> artifactlist=(HashMap)request.getAttribute("votinglist");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (artifactlist != null && artifactlist.size() != 0) {  
                                                            
   Iterator iter = artifactlist.entrySet().iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	Map.Entry mEntry = (Map.Entry) iter.next();
                                                                	
                                                                	String [] artiType=(String[])mEntry.getValue();
                                                                	String id1=artiType[0];
                                                                	String id=artiType[1];
                                                                	String name=artiType[2]; 
                                                                	String version=artiType[3];
                                                                	String category=artiType[4];
                                                                	String status=artiType[5];
                                                                	

                                                %>
                            <tr>
                              <td><%=id1%></td>
                              <td><%=id%></td>
                              <td align="left"><%=name%></td>
                              <td align="left"><%=version%></td>
                              <td><%=category%></td>
                              <td><input name="button" type="button" onclick="approved()" value="Approved"/>
                                  <input name="button2" type="button" onclick="denied()" value="Denied"/></td>
                              <td><%=status%></td>
                            </tr>
                            <%
                                                 
                                               
                                                                   
                                                                }
   }
   else{
	   %>
                            <tr>
                              <td colspan="6" align="center"><strong>No DATA </strong></td>
                            </tr>
                            <%
   }
                                                %>
                            <!-- CONTENTS START HERE -->
                        </table></td>
                      </form>
                    </tr>
                </table></td>
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
        
 </footer>

</body>


</html>
