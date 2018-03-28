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
 
	     
      <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">


    <![endif]-->
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="file:///C|/Users/user/Downloads/Artifact_pages/Artifact_pages/js/basic.js" type="text/javascript" ></script>
<script src="file:///C|/Users/user/Downloads/Artifact_pages/Artifact_pages/javascripts/frmArtifactMapList.js" type="text/javascript" ></script>
<script type="text/javascript">
function loadSec(){

	document.getElementById('showLobs').style.display="none";
	document.getElementById('showViews').style.display="none";
	document.getElementById('showGrps').style.display="none";
	document.getElementById('showProDom').style.display="none";

	}
	
</script>
</head>



 <body class="page1" id="top" onload="loadSec();">
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
              <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr>
                  <td colspan="5" class="tblMainHead"> Manage Artifact Mapping:</td>
                </tr>
                <%
	 String errorMsg="";
	 if(request.getAttribute("errorMsg")!=null){
	 
	  errorMsg="Error while Mapping";
	
	
	 
	 %>
                <tr>
                  <td colspan="5" class="tblMainHead"><font color="#FF0000"><%=errorMsg%></font></td>
                </tr>
                <%}%>
                <form name="frmArtifactMap" id="frmArtifactMap" action="file:///C|/Users/user/Downloads/Artifact_pages/Artifact_pages/artifactMapping.html" method="post" onsubmit="return myValidate();" enctype="multipart/form-data" commandName="uploadForm">
                  <input type="hidden" name="artiMapProcess" value="mapArtiDets" />
                  <tr>
                    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr class="tableInner">
                          <td class="tableLeft">View Points:</td>
                          <td class="tableRight"><select name="viewPntId" id="viewPntId" class="selectboxOne" onchange="retrieveURL('lobsList',this);">
                              <option selected="selected" value="">Select One</option>
                              <%
									 ArrayList viewPntList = (ArrayList) request.getAttribute("viewPntList");
          					 if(viewPntList!=null && viewPntList.size()!=0){
							Iterator itvPnt = viewPntList.iterator();
							while(itvPnt.hasNext()){
								String[] sVPnt = (String[])itvPnt.next();
								String viewPntId = sVPnt[0];
								String viewPntName = sVPnt[1];		
								
											

											 %>
                              <option value="<%=viewPntId%>"><%=viewPntName%></option>
                              <%
											 }
										}
									


							%>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showLobs">
                          <td class="tableLeft">LOBs:</td>
                          <td class="tableRight"><select name="lobId" id="lobId" class="selectboxOne" onchange="retrieveURLs('viewGrpList',this);">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showViews">
                          <td class="tableLeft">Views:</td>
                          <td class="tableRight"><select name="viewId" id="viewId" class="selectboxOne">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showGrps">
                          <td class="tableLeft">Groups:</td>
                          <td class="tableRight"><select name="grpId" id="grpId" class="selectboxOne" onchange="retrieveURL('processDomainList',this);">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showProDom">
                          <td class="tableLeft">Domains/Processes:</td>
                          <td class="tableRight"><select name="domProcId" id="domProcId" class="selectboxOne">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner">
                          <td class="tableLeft">Artifacts:</td>
                          <td class="tableRight"><%
									 ArrayList cntList = (ArrayList) request.getAttribute("cntList");
          					 if(cntList!=null && cntList.size()!=0){
							 int j=0;
							Iterator itcnt = cntList.iterator();
							while(itcnt.hasNext()){
								String[] scnt = (String[])itcnt.next();
								String layerCntId = scnt[0];
								String layerCntName = scnt[1];	
								String masterCntId = scnt[2];
								String masterCntName = scnt[3];		
					
											 %>
                              </br>
                            </br>
                              <input type="checkbox" name="artiFact<%=j%>" id="artiFact<%=j%>" value="<%=layerCntId%>" onclick="retrieveURLD('MappingDetExists',this);"/>
                            <%=layerCntName%>
                              <input name="uploads[<%=j%>]" type="file" id="uploads<%=j%>" />
                              <%
											 j++;}
										}
		
							%>
                              <input type="hidden" name="artiCnt" id="artiCnt" value="<%=cntList.size()%>"/>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="5" class="alignCenter"><input name="submit" type="submit" class="gradBtn" value="Map Artifact" align="middle" /></td>
                        </tr>
                    </table></td>
                  </tr>
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
			
                    <!-- FOOTER STARTS HERE -->
                    <div class="container_12"><br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
						
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
