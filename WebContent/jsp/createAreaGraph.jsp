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
<script>
    
                 function UpdateSelect()
{
select_value = document.generateChartByXLS.view.value;
var id = 'hide_this_row';
var obj = '';
obj = (document.getElementById) ? document.getElementById(id) : ((document.all) ? document.all[id] : ((document.layers) ? document.layers[id] : false));

if(select_value =2)
{
obj.style.display = ( obj.style.display != "none" ) ? "none" : "";//Hide Fields
}
else
{
obj.visibility = "show";//Show Fields
}
}
       function validate(){
                if(document.generateChartByXLS.reportTitle.value=="" || document.generateChartByXLS.reportTitle.value.indexOf(' ')==0){
                    alert("Please enter the Report Title");
                    document.generateChartByXLS.reportTitle.focus();
                    return false;
                }
				 if(document.generateChartByXLS.xlsFile.value=="" || document.generateChartByXLS.xlsFile.value.indexOf(' ')==0){
                    alert("Please upload SpreadSheet");
                    document.generateChartByXLS.xlsFile.focus();
                    return false;
                }

                if(document.generateChartByXLS.projectDescription.value.length==0 || document.generateChartByXLS.projectDescription.value.indexOf(' ')==0){
                    alert("Please enter the Project Description");
                    document.createProject.projectDescription.focus();
                    return false;
                }
                return true;
            }

    function popUp_report(type){
                                   var val =null;
                                   var year =document.getElementById("year").value;
                                   var view=document.getElementById("view").value;
				 var numArr = new Array ();
				j=0;
				var graph=document.getElementsByName("graph");
				
				for (i = 0; i < graph.length; i++)
				{
	                        if(graph[i].checked)
					{
								
								numArr[j]=graph[i].value;
								j++;
								
					}
					          
					               
                          }
                                   if(type=='area_yearly'){
                                       var month = document.getElementById("year").value;
                                       val=  window.open("MakeChart.html?process="+type+"&year="+year+"&Submit=Submit&message=xlsToGraph"+"&view="+view+"&graph="+numArr.join()
                                       ,'AreaSalesGraph',
                                       'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                                       if(val == null) {
                                           alert("Plz Enable Site Popup Allowed");
                                       }
                                   }
                                   else if(type=='area_monthly'){
                                       val=  window.open("MakeChart.html?process="+type+"&year="+year+"&paymentMode="+paymentMode+"&Submit=Submit&message=xlsToGraph"
                                       ,'DailySalesGraph',
                                       'width=1200,height=700,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,copyhistory=yes,resizable=yes')
                                       if(val == null) {
                                           alert("Plz Enable Site Popup Allowed");
                                       }
                                   }
    }

</script>

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

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
      

  <tr>
      <td align="center" valign="middle" class="tableCommonBg">
	  <!--==============================================import content code start here============================================-->
	  
	  
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-color:#000000;border-style:groove;border-width:thin; color:#000000;">
                        
                        <tr>
                            
                            <td class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
                                    <tr >
                                        
                                      <td colspan="2" class="tblDescrp" style="border-bottom:thin;border-bottom-color:#000000; color:#000000; border-bottom-style:groove;border-bottom-width:thin"
                              >
                                            <!--<img src="images/usea_logo.jpg" class="imgFloatLeft" /><br />--> 
                                            
                                          <% if( (request.getParameter("type").equals("area_yearly")) && (request.getParameter("type")!=null) )
                                                { %>
                                                  <b> Area Wise Yearly Sales Report</b> 
                                                   <% }
                                            else{ %>
                                                Area Wise Sales Report Yearly and for the chosen Area
                                           <% } %>
                                            
                                        </td>
                                          
                                        
                                    </tr>
                                    <tr>
                                        <td align="center">
                    <form name="generateChartByXLS" method="post"   onsubmit="return validate();" action="MakeChart.html">
                                                <input type="hidden" name="process" value="area_yearly" />
                                                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer" id="mainTbl">
                                                    
                                                    <tr>
                                                        <td height="25" >
                                                            
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="8" id="inboxTbl">
                                                                
                                                 
                                                                
                                                                <tr>
                                                                    <td colspan="2" class="tblRowHead1">
                                                                        
                                                                        <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" id="tableHead">

                                                             <% if( (request.getParameter("type").equals("area_monthly")) && (request.getParameter("type")!=null) )
                                                { %>                   <input type="hidden" name="process" value="monthly" id="process" />
                                                                <tr>
                                                                    <th width="25%" height="25" class="tableLeft1">Select Area : </th>
                                                                    <td width="83%" class="listCellBg1">
                                                                                            Area Image
                                                                        <div id="statusId"></div> </td>
                                                                </tr>
                                                                <% } %>
                                                                <input type="hidden" name="process" value="yearly" id="process"/>
                                                                  <tr>
                                                                    <td width="25%" height="25" class="tableLeft1">Select Year : </td>
                                                                    <td width="83%" class="listCellBg1">
                                                                                            <select  name="year" id="year">
																	<option value="2006">2006</option>
																	<option value="2007">2007</option>
																	<option value="2008">2008</option>
																	<option value="2009">2009</option>


													</select><span class="asterisk">*</span>
                                                                        <div id="statusId"></div>                                                                    </td>
                                                                </tr>

              <tr>
                             <td class="tableLeft1">Report type :</td><td class="tableRight1"><select name="view" id="view" onChange="UpdateSelect();">
                            <option value='1'>Graphical</option>
                            <option value='2'>Tabular</option></select></td>
                            
                            
                        </tr>
                        <tr id="hide_this_row">
                            <td class="tableLeft1">Graph types :</td>
							 <td class="tableRight1">
                                 <% if(request.getParameter("type").equalsIgnoreCase("area_yearly") )  { %>
                                <input type="checkbox" name="graph"  value="pie" checked>Pie<br>
								 <input type="checkbox" name="graph" value="Linechart">Line<br>
								 <input type="checkbox" name="graph" value="chart">Bar<br>
								 <input type="checkbox" name="graph" value="PyramidChart">Pyramid<br>

<% } else { %>
<input type="checkbox" name="graph" value="pie">Pie1<br>
 
<input type="checkbox" name="graph" value="line">Line<br> 
<input type="checkbox" name="graph" value="PyramidChart">Pyramid<br>
<% } %>
    
        
                             </td>
                            
                            
                        </tr>
                        
                                                                       
                                                                            <tr>
                                                                                <td width="11%" align="center" colspan="2">
                                                                                    
                                                                                 <input type="submit" name="Submit" value="Submit" class="btn text_3 color_3"
                                                                                    onclick="javascript:popUp_report('<%=request.getParameter("type")%>')"></input>                                                                        </td>
                                                                            </tr>
                                                                    </table>                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
                                                    </tr>
                                                </table>
                                                <input type="hidden" name="message" value="xlsToGraph" />
                                                
                                            </form>
                                            
                                      </td>
                                    </tr>
                              </table>
                                <!-- CONTENTS END HERE -->		
                          </td>
                        </tr>
        </table>
	  
	  
	  
	  
	  
	  </td>
    </tr>
	
		<tr><td>&nbsp;</td></tr>

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
    </div>  
  </footer>
<!--==============================================footer end here============================================-->

</body>
</html>
