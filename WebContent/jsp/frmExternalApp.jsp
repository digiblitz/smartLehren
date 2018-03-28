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
 
	     
     
     </head>
	 <body class="page1" id="top">
 <headere><div>
  
<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="">
  <%String url_name=(String)request.getAttribute("url_name");
  String sessionid=(String)request.getAttribute("sessionid");
  //System.out.println("url_name"+url_name);
  String url_link="";
 // boolean tempname=url_name.contains("USERNAME=:U");
  String urName=(String)session.getAttribute("username");
  String urPassword=(String)session.getAttribute("password");
  
  if(url_name.equals("FM")){
	  //url_link="https://localhost:7443/myportal/control/login?USERNAME="+urName+"&PASSWORD="+urPassword;
	  //http://198.71.58.51:8182/myportal/control/login
	  url_link="https://www.digiblitzonline2.com:8483/myportal/control/login?USERNAME="+urName+"&PASSWORD="+urPassword;
	  //System.out.println("FM url_link"+url_link); 
  }else if(url_name.equals("LMS")){
	  url_link="https://www.digiblitzonline2.com:8643/eidlms/Login.do?loginProcess=normalLogin&textfield="+urName+"&textfield2="+urPassword;
	  //System.out.println("LMS url_link"+url_link); 
  }else if(url_name.equals("openmeetings")){
	  url_link="https://www.digiblitzonline2.com:5443/openmeetings/signin;jsessionid="+sessionid+"?0-1.IBehaviorListener.0-signin-signin-submit&login="+urName+"&pass="+urPassword;
	  //System.out.println("LMS url_link"+url_link); 
  }else if(url_name.equals("dBmodular")){
	  url_link="https://www.digiblitzonline.com:8945/oryx/editor;bpmn2.0?stencilset=/stencilsets/bpmn2.0/bpmn2.0.json";
	  //System.out.println("LMS url_link"+url_link); 
  }else{
	  url_link=(String)request.getAttribute("url_name"); 
	  //System.out.println("url_link"+url_link);
  }
  %>
    
      
    <iframe src="<%=url_link%>" width="100%" height="600"></iframe>
      
  </div>   
</div>
<div>&nbsp;</div>
 <!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}

function onValidate()
{
	if(document.entity.rolename.value==""){
		alert("Rolename cannot be empty");
		document.entity.rolename.focus();
		return false;
	}
	
	if(Dospace(document.entity.rolename.value)||((document.entity.rolename.value.indexOf(' '))==0))
	   { alert("Enter valid Rolename");
	   document.entity.setrole.focus();
	   return false; }
	if(document.entity.entityname.value==""){
		alert("Entityname cannot be empty");
		document.entity.entityname.focus();
		return false;
	}
	
	if(Dospace(document.entity.entityname.value)||((document.entity.entityname.value.indexOf(' '))==0))
	   { alert("Enter valid entityname");
	   document.entity.entityname.focus();
	   return false; }
	return true;
}
</script>
</html>

