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
<body>


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
      <%
      String HeatMapData = (String)session.getAttribute("HeatMapData");%>
	 <form>
	 
	 
	 <%if(HeatMapData != null){
	%><img src="data:image/jpeg;base64,<%=HeatMapData%>" width="500" height="500" >
<%}else{ %>
<img src="images/HeatMap.png" alt="heatmap">
<%} %>&nbsp;&nbsp; 



</form>
</div>
</div>
</body>
</html>
