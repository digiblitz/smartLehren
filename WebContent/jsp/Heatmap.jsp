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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

 <script src="js/jquery.js"></script>
	 <script src="js/script.js"></script>     
     <script src="js/datetimepicker_css.js"></script>  
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

 <form action="report.html?cmd=GenerateHeatMap" method="post" class="heatmap" id="heatmap" name="heatmap">

<h2>Heat Map Generation </h2>

    <div>
	&nbsp;
	</div>

	<h2>Select a Year  :   <select name="year">
        <option value="2017">2017
        <option value="2016">2016
        
    </select></h2>
	
	<div>
	&nbsp;
	</div>
	
	<h2>Selec A Month   :   <select name="month">
        <option value="01">Jan
        <option value="02">Feb
		<option value="03">Mar
        <option value="04">Apr
		<option value="05">May
        <option value="06">Jun
		<option value="07">Jul
        <option value="08">Aug
		<option value="09">Sep
        <option value="10">Oct
		<option value="11">Nov
        <option value="12">Dec
        
    </select> </h2>



</br>

<input type="submit" name="Generate" value="Generate" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:40px;" onClick="return(onValidate());">
<div>&nbsp;</div>
<div>&nbsp;</div>
</form>
</div>
</div>
</div>
</div>



</body>
</html>
