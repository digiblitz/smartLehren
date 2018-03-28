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
 
 
  function callEdit(id,artiUid,lifecycleId,processname,proceDesc,BPversion){
	 
	 if(id!='Pending'){

	 if(confirm('This is a governed Business Process. \n Please raise a request approval for the stage.'))
	 {
	strURL = "./SysMgmt.html?process=callBPMEdit&id="+id+"&artUid="+artiUid+"&lifecycleId="+lifecycleId+"&artifactName="+processname+"&description="+proceDesc+"&version="+BPversion;
		window.location.href = strURL;
	 }
	 else
	 {
		 return;
	 }
	 }
	 else
		 {
		 alert ("This process has a request in pending. Please wait until the current request is processed.");
		 
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
  <table width=100% border="1" cellpadding="0" cellspacing="0" height="350"  class="content_new" align="center">
           
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  
	  
	   
	  
	  
	  <table width="800" height="100" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab" style="border:thin;border-style:groove;">
        
       
        <tr>
          <td height="20"><!-- INFO BAR STARTS HERE -->
             <img src="images/BPM-icon.png" alt="view business process" width="20px" height="20px" /><strong>View Business Process</strong> <div class="divider3"></div>
            <!-- INFO BAR ENDS HERE -->
          </td>
        </tr>
        <%String success=(String)request.getAttribute("success");
  
  if(success!=null&&success.equalsIgnoreCase("success")){%>
        <tr>
          <td height="28"><!-- INFO BAR STARTS HERE -->
              <h3><font color="blue">Request Submitted Successfully to the Systinet.</font></h3><div class="divider3"></div>
            <!-- INFO BAR ENDS HERE -->
          </td>
        </tr>
        <%}%>
        <tr>
          <td valign="top">
		  <table width="100%" height="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
              <tr>
                <td><table  border="1" cellpadding="0" cellspacing="0" width="100%" align="left" >
                  <tr >
                    <td width="29" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>&nbsp;Id</strong><div class="divider3"></div></td>
                    <td width="125" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Name</strong><div class="divider3"></div></td>
                    <td width="58" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Version</strong><div class="divider3"></div></td>
                    <td width="105" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Category</strong><div class="divider3"></div></td>
                    <td width="127" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Production Status</strong><div class="divider3"></div></td>
                    <td width="135" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Governance Status</strong><div class="divider3"></div></td>
                    <td width="72" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Action</strong><div class="divider3"></div></td>
                  </tr>
                  <%
   ArrayList bpmData=(ArrayList)request.getAttribute("bpmData");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (bpmData != null && bpmData.size() != 0) {  
                                                            
   Iterator iter = bpmData.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	String id=artiType[0]; 
                                                                	String processname=artiType[1]; 
                                                                	String BPversion=artiType[2];
                                                                	String status=artiType[3];
                                                                	String artiUid=artiType[4];
                                                                	String lifecycleId=artiType[5];
																	String proceDesc=artiType[6];
                                                                	

                                                %>
                  <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                    <td height="25" valign="middle">&nbsp;<%=id%></td>
                    <td height="25" align="left" valign="middle"><%=processname%></td>
                    <td height="25" align="left" valign="middle"><%=BPversion%></td>
                    <td height="25" valign="middle">business process</td>
                    <td height="25" valign="middle">Active</td>
                    <%if(status.equalsIgnoreCase("Pending")){%>
                    <td height="25" valign="middle">Modify Request <%=status%></td>
                    <%}else{%>
                    <td height="25" valign="middle">Active</td>
                    <%}%>
                    <td width="123" height="25" valign="middle"><a href="#" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#00CCFF;color:#3366FF;" onclick="callEdit('<%=status%>','<%=artiUid%>','<%=lifecycleId%>','<%=processname%>','<%=proceDesc%>','<%=BPversion%>')" ><strong>Move Lifecycle Stage </strong></a> </td>
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
              </tr>
            </table>
              <!-- CONTENTS END HERE -->
          </td>
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
