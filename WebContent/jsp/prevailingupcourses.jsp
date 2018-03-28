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
	
     <link rel="stylesheet" href="css/gender.css">
	 
     <script src="js/datetimepicker_css.js"></script>
      

    
    <script src="js/lib/jquery.js"></script>
	<script src="js/dist/jquery.validate.js"></script>	
          
		  <script type="text/javascript">
	function showVal(programid){ 
   		 var programid = programid;
		window.location.assign('enroll.html?cmd=getsubprogramlist&programid='+programid);			
       }
	</script>
          
          <style>	
	.lab{
	font-family:"Times New Roman", Times, serif;
	font-size:15px;
	text-align: left;
}

.title{
	font-family:"Times New Roman", Times, serif;
	font-size:35px;
	text-align: left;
	color:#9400D3;
}

	</style>
          
     </head>
	 <body class="page1" id="top">
 <headere><div>
  
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>


<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Program Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
 <div class="title">Program Name</div>
 <br><br>
 			<% ArrayList programlist = (ArrayList)request.getAttribute("programlist");
 					
 			
 				if(programlist != null){
 					
 					Iterator itr = programlist.iterator();
 					while(itr.hasNext()){
 						String strarr[] = (String[])itr.next();
 						String programid = strarr[0];
 						String programname = strarr[1]; 						
 			%>
 						
 			<div class="lab"><a href="#" onClick="showVal('<%=programid%>');"><%=programname %></a></div><br><br>		
 			
 		<%}}
 			%> 	

 <br><br>
 
 <div class="title">SubProgram Name</div>
 <br><br>
 			<% ArrayList subprogramlist = (ArrayList)request.getAttribute("subprogramlist");
 					
 			
 				if(subprogramlist != null){
 					
 					Iterator itr = subprogramlist.iterator();
 					while(itr.hasNext()){
 						String strarr[] = (String[])itr.next();
 						String subprogramid = strarr[0];
 						String subprogramname = strarr[1]; 						
 			%>
 			<input type="hidden" id="subprogramname" value="<%=subprogramname %>">
 			<div class="lab"><a href="#"  id="subprogramname"><%=subprogramname %></a></div><br><br>		
 			
 		<%}}
 			%> 	
 
 
 
 
    </div>  </div>  </div></div>

 <!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>

</html>
