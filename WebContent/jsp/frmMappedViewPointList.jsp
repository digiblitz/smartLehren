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
<script language="javascript">
function callMapList(viewPointId) 
{
	
	strURL = "./artifactMapping.html?artiMapProcess=searchMappedGroup&viewPoint="+viewPointId;
	window.location.href = strURL;
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
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
                <tr style="border-bottom-style:groove;border-bottom-width:thin">
                  <td colspan="4" class="tblMainHead"> <strong>View Point: <span class="styleBoldTwo">Search Mapped Groups List </span></strong></td>
                </tr>
                <tr>
                  <td colspan="2" class="tblDescrp" align="justify"><font size="-1"><strong> Please choose the any one of the view point in order to view the mapped group list</strong></font></td>
                </tr>
                <form name="frmSearchMappedViewPoint" action="artifactMapping.html"  method="post" onsubmit="return myValidate();">
                  <input type="hidden" name="artiMapProcess" value="searchMappedGroup">
                  <tbody id="showSearchCrite">
                    <tr>
                      <td colspan="4"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                          <%String viewPointId = (String)request.getAttribute("viewPointId");
				
				 %>
                          <tbody id="memShow" class="tableInner">
                            <tr class="tableInner">
                              <td class="tableLeft"><strong>View Point:</strong></td>
                              <td class="tableRight"><select name="viewPoint" id="viewPoint" class="selectboxOne" onchange="callMapList(this.value);">
                                  <option selected="selected" value="">Select One</option>
                                  <%
									 ArrayList viewList = (ArrayList) request.getAttribute("viewList");
          					 if(viewList!=null && viewList.size()!=0){
							Iterator it = viewList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								String viewId = s[0];
								String viewName = s[1];		
								
											

											
											if (viewId.equals(viewPointId)){
													System.out.println(" View Name : "+viewName);

											 %>
                                  <option value="<%=viewId%>" selected="selected"><%=viewName%></option>
                                  <%
											 }
								 
					           else{
					           %>
                                  <option  value="<%=viewId%>" ><%=viewName%></option>
                                  <%
					           }
											 
											 }
										}
									


							%>
                              </select></td>
                            </tr>
                          </tbody>
                          <tr>
                            <td colspan="5" align="center" class="alignCenter">
                              <label><img src="images/search-icon-button.png" alt="search" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Search" align="middle" /></label>                            </td>
                          </tr>
                      </table></td>
                    </tr>
                  </tbody>
                </form>
                <form action="artifactMapping.html" name="frmMappedViewPoint">
                  <input type="hidden" name="artiMapProcess" value="">
                  <table border="0" cellpadding="0" align="center" cellspacing="1" class="formLayout">
                    <tr>
                      <td width="103" class="tblRowHeadTwo">View Point</td>
                      <td width="94" class="tblRowHeadTwo">LOB</td>
                      <td width="94" class="tblRowHeadTwo">Views</td>
                      <td width="94" class="tblRowHeadTwo">Groups</td>
                      <td width="103" class="tblRowHeadTwo">Process/Domain</td>
                    </tr>
                    <%ArrayList userMapPointList = (ArrayList)request.getAttribute("userMapPointList");
           									 if(userMapPointList!=null && userMapPointList.size()!=0){
           							Iterator ituserMapPoint = userMapPointList.iterator();
           							while(ituserMapPoint.hasNext()){
           								String[] viewPointUser = (String[])ituserMapPoint.next();
           								String viewPoint = viewPointUser[0];
           								String lob = viewPointUser[1];
           								String view = viewPointUser[2];
           								String group = viewPointUser[3];
           								String processdDom = viewPointUser[4];
           		if(lob!=null && view!=null && group !=null && processdDom !=null){						
		   %>
                    <tr>
                      <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=viewPoint%></td>
                      <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=lob%></td>
                      <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=view%></td>
                      <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=group%></td>
                      <td  height="26" bgcolor="#E3E1D2" class="alignCenter"><%=processdDom%></td>
                    </tr>
                    <%}}
           							}else{ %>
                    <tr>
                      <td height="26" colspan="5" bgcolor="#E3E1D2" class="alignCenter"><strong>No Records were Found !</strong></td>
                      <%} %>
                    </tr>
                  </table>
                </form>
          </table></td>
        </tr>
        <!-- Based on id -->
        <tr>
          <td></td>
        </tr>
        <!--end of the file-->
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
