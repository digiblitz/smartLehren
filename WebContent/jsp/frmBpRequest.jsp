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
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
 
 
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
	  
	  
	  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="100" style="border:thin;border-style:groove;">
	  <tr><td><br /></td></tr>
        <tr>
          <td valign="top" class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
              <tr>
                <form action="SysMgmt.do"  method="post" name="frmBpReq" id="frmBpReq" onsubmit="return myvalidate();">
                  <input type="hidden" name="process" value="callBPReq"/>
                  <td colspan="8">
				  
				  
				  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout" >
                      <tr class="tableInner">
                        <td height="31" nowrap="nowrap" class="tableLeft">Date Submitted:</td>
                        <td class="tableRight"><input  type="text" name="frmDate" id="frmDate" readonly="readonly" class="textboxOne" value="" size="20" maxlength=		            "20" />
                          <a href="javascript:cal1.popup();"> <img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="      vertical-align:bottom;" border="0" /> </a> </td>
                        <td class="tableLeft" nowrap="nowrap">Type of Request:</td>
                        <td class="tableRight"><select name="req" id="req" class="selectboxOne">
                            <option selected="selected" value="">Select One</option>
                            <option  value="BP">Business Process</option>
                            <option  value="WS">Web Service</option>
                            <option  value="">Artifact</option>
                            <option  value="">others</option>
                          </select>
                        </td>
                      </tr>
                      <tr class="tableInner">
                        <td height="27" nowrap="nowrap" class="tableLeft">Request Id:</td>
                        <td class="tableRight"><input type="text" name="reqId" id="reqId" value="" class="textboxOne" size="20"/></td>
                        <td class="tableLeft" nowrap="nowrap">Request Priority:</td>
                        <td class="tableRight"><select name="reqPri" id="reqPri" class="selectboxOne">
                            <option selected="selected" value="">Select One</option>
                            <option  value="high">High</option>
                            <option  value="medium">Medium</option>
                            <option  value="low">Low</option>
                          </select>
                        </td>
                      </tr>
                      <tr align="center">
                        <td><input name="submit" type="submit" class="grdBtn" value="Search"/><div class="divider3"></div></td>
                      </tr>
                    </table>
					
					<br />
					
                      <table id="dataTable" width="100%" >
                        <tr >
                          <td width="118" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Serial Number</strong><div class="divider3"></div></td>
                          <td width="114" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Request Date</strong><div class="divider3"></div></td>
                          <td width="103" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Request Id</strong><div class="divider3"></div></td>
                          <td width="141" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Request Title</strong><div class="divider3"></div></td>
                          <td width="161" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Request Description</strong><div class="divider3"></div></td>
                          <td width="110" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Priority</strong><div class="divider3"></div></td>
                          <td width="108" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Status</strong><div class="divider3"></div></td>
                        </tr>
                        <%
   ArrayList list=(ArrayList)request.getAttribute("list");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (list != null && list.size() != 0) {  
                                                            
   Iterator iter = list.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                                                                               	
                                                                	String [] artiType=(String[])iter.next();
                                                                	String sno=artiType[0];
                                                                	String date=artiType[1]; 
                                                                	String reqid=artiType[2];
                                                                	String reqtit=artiType[3];
                                                                	String reqdesc=artiType[4];
                                                                	String priority=artiType[5];
                                                                	String status=artiType[6];
                                                                	
                                                                	

                                                %>
                        <tr>
                          <td align="center"><%=sno%></td>
                          <td align="center"><%=date%></td>
                          <td align="center"><%=reqid%></td>
                          <td align="center"><%=reqtit%></td>
                          <td align="center"><%=reqdesc%></td>
                          <td align="center"><%=priority%></td>
                          <td align="center"><%=status%></td>
                        </tr>
                        <%
                                                 
                                               
                                                                   
                                                                }
   }
   else{
	   %>
                        <tr>
                          <td colspan="8" align="center"><strong>No DATA </strong></td>
                        </tr>
                        <%
   }
                                                %>
                    </table></td>
                </form>
              </tr>
            </table>
              <!-- CONTENTS END HERE -->
          </td>
        </tr>
      </table></td>
   

    </tr>
    
  </table></div></div></div>
<!--=======footer=================================-->

 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                         <div class="container_12"><br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
						
                    <!-- FOOTER ENDS HERE -->
               
 </footer>

<script language="javascript">
    var cal1 = new calendar2(document.forms['frmBpReq'].elements['frmDate']);
	 cal1.year_scroll = true;
	 cal1.time_comp = false;

    




</script>

</body>


</html>
