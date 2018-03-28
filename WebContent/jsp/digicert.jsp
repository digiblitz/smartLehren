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
<title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">
    
   <link rel="stylesheet" href="css/verstyles.css">
   <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="js/verscript.js"></script>
   <link rel="stylesheet" href="css/tabstyle.css" type="text/css" media="screen">  
     
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	<script type="text/javascript" src="js/progressbar.js"></script>
	<link rel="stylesheet" type="text/css" href="css/progressbar.css">
	
	
	
	
  <style>
 #ram , #sham {
   width:100%;
  }
  #tabs {
  overflow: hidden;
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
  font-size:10px;
}

#tabs li {
  float: left;
  margin: 0 .5em 0 0;
}

#tabs a {
  position: relative;
  background: #ddd;
  background-image: linear-gradient(to bottom, #fff, #ddd);  
  padding: .7em 3.5em;
  float: left;
  text-decoration: none;
  color: #444;
  text-shadow: 0 1px 0 rgba(255,255,255,.8);
  border-radius: 5px 0 0 0;
  box-shadow: 0 2px 2px rgba(0,0,0,.4);
}

#tabs a:hover,
#tabs a:hover::after,
#tabs a:focus,
#tabs a:focus::after {
  background: #fff;
}

#tabs a:focus {
  outline: 0;
}

#tabs a::after {
  content:'';
  position:absolute;
  z-index: 1;
  top: 0;
  right: -.5em;  
  bottom: 0;
  width: 1em;
  background: #ddd;
  background-image: linear-gradient(to bottom, #fff, #ddd);  
  box-shadow: 2px 2px 2px rgba(0,0,0,.4);
  transform: skew(10deg);
  border-radius: 0 5px 0 0;  
}

#tabs #current a,
#tabs #current a::after {
  background: #fff;
  z-index: 3;
}

#contents {
  background: #fff;
  padding: 2em;
  height: 220px;
  position: relative;
  z-index: 2; 
  border-radius: 0 5px 5px 5px;
  box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
}
#table-scroll {
    overflow:scroll;
	overflow: auto;
    height: 710px;     
   position:relative;
}
#Course {

  border: medium none;
  border-radius: 2px;
  font-family: arial,sans-serif;
  font-size: 13px;
  height: 28px;
  margin: 0;
  outline: medium none;
   padding: 6px;
  width: 200px;
}

#progressBar{
		width: 292px;
		height: 17px;
	}
	#innerppp{
		width: 200px;
		height: 17px;		
	}
  </style>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
</head>
 <body>
 

<div><%@ include file = "../../include/header.jsp" %></div>
 <div><%@ include file = "../../include/Hmenu.jsp" %></div>   

<%String url=(String)request.getAttribute("url"); %>
<div class="content">
  <div class="container_123">
      <div>&nbsp;</div>
	  

<input type="hidden" name="cmd"  value="mapAll">
<table width="100%" >
    
   <tr>
   <td width=100% align="center">
   
  	 <table width=100% border="0" align="center" >
   			 
			<tr>
		
			<td width=20% style="background-color:  #f6f6f6; "  valign="top" id="toggle" style=" margin-left:10;">
			<!-- LEFT MENU STARTS HERE -->
			<div >
<form action="digi.html?cmd=mainprocess" method="post">
<input type="text" name="number">
<input type="submit" name="sub"></form>
 
					</div>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			
			<td width="80%" valign="top" style="background-color:  #6f6f6; " id="sham" style="width=100%">
			
			
			<div width="100%" >
			
			<iframe src="<%=url %>" style="height:600px; width:1000px"></iframe>
			
			</div>	
			
		</td>		
	    </tr>
	  </table></td></tr>
 
</table>
</div></div></div>
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
     
  </footer> 

</body>
</html>
