<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
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
        <!--<link href="css/core-ie.css" type="text/css" rel="stylesheet" />-->
		<script>
		function popUp_report(){
val=window.open("MakeChart.html?process=areaDet&Submit=Submit&message=xlsToGraph" ,'AreaSalesGraph',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
              if(val == null) {
                alert("Please Enable Site Popup Allowed");
               }
                
              
    }
		</script>
        
        <style>
		
		.msgHead{
			color:#000000;		
		}
		
		.tblMainHead{
			color:#000000;
		}
		
		.lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
		
		</style>
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
	  
	  
	    <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">



  <div styte="color:000000;">     
<section id="content">

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
     

  <tr>
      <td align="center" valign="middle" class="tableCommonBg">
	  <!--==============================================import content code start here============================================-->
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-color:#000000;border-style:groove;border-width:thin">
                        
                        <tr>
                            
                            <td width="500" class="subDeptTablePad" >
                                <!-- CONTENTS START HERE -->
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formLayout" >
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
                                    <tr>
                                        
                                        <td colspan="2" class="tblDescrp" style="border-bottom:thin; border-bottom-color:#000000; border-bottom-style:groove; border-bottom-width:thin">
                                            <!--<img src="images/usea_logo.jpg" class="imgFloatLeft" /><br />-->
                                            <span class="msgHead" ><strong>Sales  Report</strong></span>
                                            <br />
                                            <br />
                 <strong class="msgHead">Use the section below to select Sales Report Type</strong>
                                            
                                      </td>
                                       
                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer" id="mainTbl">
                                                    
                                                    <tr>
                                                        <td height="25" >
                                                            
                                                          <table width="760" border="0" cellpadding="0" cellspacing="1" id="inboxTbl">
                                                                
                                                                <!--
                                                                                   <tr class="tblMainHead">
                                                                                         <td height="25" colspan="2" class="textCommon">&nbsp;
                                                                                                 <a href="#" class="linkFour">Insert Address</a> |
                                                                                                 <a href="#" class="linkFour">Add Cc</a> | 
                                                                                                 <a href="#" class="linkFour">Add BCc</a>
                                                                                                 
                                                                                         </td>
                                                                                   </tr>
                                                              -->
                 <tr>
                 <td width="81%" height="26" class="tblMainHead">
                    <a href="createSalesGraph.html?type=daily">Daily Sales  Report </a>
                     <div id="statusId"></div>
                   </td> 
                 </tr>   <tr>
                                                                   
                                                               <td height="25" class="tblMainHead">
													<a href="createSalesGraph.html?type=monthly">Monthly Sales Report </a>																
                                                               </td>
                                                                </tr>
                                                               
                                                                
                                                                <tr>
                                                                <td height="25" class="tblMainHead">
												<a href="areaGraph.html?type=area_yearly">Yearly Sales Report - Area Wise</a>

                                                                  </td>
                                                                   
                                                                </tr>
                                                                
                                                                <!-- <tr>
                                                                   
                                                                    <td height="25" class="tblMainHead"><a href="javascript: onclick=popUp_report();"> Yearly Sales Report for all Membership Types  </a>
                                                                    </td>
                                                                </tr> -->
                                                                 <tr>
                                                                   
                                                                    <td height="30" class="tblMainHead">
							<a href="memberGraph.html?cmd=initMemGrp">Yearly Sales Report - Membership Type Wise</a>
                                                                    </td>
                                                                </tr> 
																
																 <tr>
                                                                   
                                                                    <td height="30" class="tblMainHead">
							<a href="report.html?cmd=initHeatmap">HeatMap</a>
                                                                    </td>
                                                                </tr> 
                                                                
                                                                 <!-- <tr>
                                                                   
                                                                    <td height="25" class="tblMainHead"><a href="createGraphByXLS.html">Generate Chart Report Based on SpreadSheet</a>
                                                                    </td>
                                                                </tr>  -->
                                                               
                                                          </table>
                                                        </td>
                                                    </tr>
                                                    
                                                </table>
                                                
                                          
                                            
                                        </td>
                                    </tr>
                              </table>
                                <!-- CONTENTS END HERE -->		
                            </td>
                        </tr>
                    </table>
	  
	  
	  
	  
	  
	  <!--==============================================import content code end here============================================-->
	  
	  
	  </td>
    </tr>
	
		

  </table>
  </section>
  </div></div></div></div></div>
<!--==============================================content end here============================================-->


<!--==============================================footer start here============================================-->
 <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
<!--==============================================footer end here============================================-->

</body>
</html>
