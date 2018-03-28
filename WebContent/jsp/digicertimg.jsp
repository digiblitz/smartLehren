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
<title>TNOU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Flat Profile Menu Responsive Templates, Iphone Compatible Templates, Smartphone Compatible Templates, Ipad Compatible Templates, Flat Responsive Templates"/>


<script type="js/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script src="js/jquery.js" type="text/javascript"></script>

<link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Exo+2:400,700,100' rel='stylesheet' type='text/css'>




<style type="text/css">




body {
    width: 99%;
    height: 1350px;
    background-image: url('images/bg.jpg');
    background-repeat: no-repeat;
    
    
}

.c_name{
  position: absolute;
  left: 280px;
  top: 795px;
 
  color: black;
  
  font-size: 27px;
  
}
.c_dept{
  position: absolute;
  left: 165px;
  top: 843px;
 
  color: black;
  
  font-size: 27px;
 
}
.c_class{
  position: absolute;
  left: 490px;
  top: 935px;
 
  color: black;
  
  font-size: 27px;
  
}
.c_year{
  position: absolute;
  left: 375px;
  top: 980px;
 
  color: black;
  
   font-size: 27px;
  
}
.enroll{
  position: absolute;
  left: 165px;
  top: 40px;
 
  color: black;
  
   font-size: 27px;
  
}
.sino{
  position: absolute;
  left: 815px;
  top: 1313px;
 
  color: black;
  
   font-size: 27px;
  
}
</style>



</head>
	<body>
    <%String name=(String)request.getAttribute("nam");
    String dep=(String)request.getAttribute("dep");
    String clas=(String)request.getAttribute("cla");
    String yer=(String)request.getAttribute("yer");%>
<!--content-->
 <div class="c_name">
           <%=name %>
        </div>
		<div class="c_dept">
           <%=dep %>
        </div>
		<div class="c_class">
           <%=clas %>
        </div>
		<div class="c_year">
           <%=yer %>
        </div>
		<div class="enroll">
            47268
        </div>
		<div class="sino">
            1000
        </div>
<!--/content-->
<!--copyrights-->


<!--/copyrights-->
	</body>
</html>
