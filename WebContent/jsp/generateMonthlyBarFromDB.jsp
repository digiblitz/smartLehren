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
       <script  src="js/ts_picker.js"></script>
     <script src="js/TMForm.js"></script> 
<script src="js/basic.js" type="text/javascript" ></script>
 <script src="js/calendar2.js" type="text/javascript"></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body class="page1" id="top">

<!--==============================================header start here============================================-->
<headere><div>
  
<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================================header end here============================================-->


<!--==============================================content start here============================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
<div styte="color:000000;">       
<section id="content">

  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
      

	  <!--==============================================import content code start here============================================-->
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-color:#000000;border-style:groove;border-width:thin">
            
            
            <tr>
                <td class="tableCommonBg">
                    
              <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
                         <tr>
                            <td height="64" width="500" style="border-bottom:thin;border-bottom-color:#000000;border-bottom-style:groove;border-bottom-width:thin">
                              <h2 style="line-height:66px;" align="center">Monthly Sales Report</h2>
                            </td>
                        </tr>
                         <tr>
                            
                            <td width="500" class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
								<% String graphNew=(String)request.getAttribute("graphsCount");
								           String graph[]=graphNew.split(",");
										   int arrayLen=graph.length;
										   if(arrayLen==4) {
								 %>
                                 <table width="90%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
                                    <tr>
                                        
                                        <td rowspan="2" class="tblDescrp">
									<img src="images/chart.png"  alt="chart image" width="500" height="400" border="2"  ></img>
        
										</td>
									</tr>
									<tr>
									<td rowspan="2" class="tblDescrp">
									<img src="images/PyramidChart.png" alt="pyramid chart" width="500" height="400"  border="2" ></img>
									
									</td>
									</tr>
							  </table>
									<table width="90%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
									<tr>
									<td rowspan="2" class="tblDescrp">
									<img src="images/Linechart.png" alt="line chart" width="500" height="400" border="2"  ></img>
									</td>
									</tr>
									<tr>
									<td rowspan="2" class="tblDescrp">
									<img src="images/pie.png" alt="pie chart" width="500" height="400" border="2"   ></img>
									</td>
									</tr>
									
								</table>
								<% } else if(arrayLen==2) { %>
								 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
								   <% for(int i=0;i<arrayLen;i++) { %>
                                    <tr>
                                        
                                        <td rowspan="2" class="tblDescrp">
									<img src="images/<%=graph[i]%>.png" alt="<%=graph[i]%>" width="500" height="400" border="2"  ></img>
        
										</td>
									</tr>
									<% } %> 
									
							  </table>
									<% } else if(arrayLen==3) { %>
									<table width="100%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
								   <% for(int i=0;i<arrayLen;i++) { 
									   if(i<=1) { %>
                                    <tr>
                                        
                                        <td rowspan="2" class="tblDescrp">
									<img src="images/<%=graph[i]%>.png" alt="<%=graph[i]%>" width="500" height="400" border="2"  ></img>
        
										</td>
									</tr>
									<% }  else { %>
							  </table>
				      <tr>
                                        
                                        <td rowspan="2" class="tblDescrp">
									<img src="images/<%=graph[i]%>.png" alt="<%=graph[i]%>" width="500" height="400" border="2"  ></img>
        
										</td>
					  </tr>
									<% } } %>
				  </table>
									<% } else if(arrayLen==1) { %>
										<table width="100%" border="0" cellpadding="0" cellspacing="0" class="formLayout" align="center">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
                                    <tr>

                                        <td rowspan="2" class="tblDescrp">
									<img src="images/<%=graph[0]%>.png" width="500" alt="<%=graph[i]%>" height="400" border="2"  ></img>

										</td>
									</tr>
					
									

				  </table>
									<% } %>
						
			  </td>
					</tr>
					<tr>
                <td>
                 <center>  
                   <input type="submit" value="close" name="close" onclick="window.close('DailySalesGraph');return false;" class="btn text_3 color_3" />
				   </center>
                </td>
            </tr>
					</table>
	  
	  
	  
	  
	  
	  <!--==============================================import content code end here============================================-->
	  
	  
	  </td>
    </tr>
	
		

  </table>
  </section>
  </div></div></div>
<!--==============================================content end here============================================-->

<!--==============================================footer start here============================================-->
 <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div> 
  </footer>
<!--==============================================footer end here============================================-->

</body>
</html>
