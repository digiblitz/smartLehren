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

<!--  $(function(){
  $("#header").load("header.jsp"); 

});-->

     <script>

       $(document).ready(function(){
	   
	  
        /*carousel*/
        var owl = $("#owl"); 
            owl.owlCarousel({
            items : 4, //10 items above 1000px browser width
            itemsDesktop : [995,3], //5 items between 1000px and 901px
            itemsDesktopSmall : [767, 2], // betweem 900px and 601px
            itemsTablet: [700, 2], //2 items between 600 and 0
            itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
            navigation : true,
            pagination :  false
            });


         /*Back to Top*/
        $().UItoTop({ easingType: 'easeOutQuart' });
        // Initialize the gallery
        $('.gallery a.gal').touchTouch();
     }); 



     </script>
	 
	  
     <style>
	 
	  label.para{
	font-family:"Times New Roman", Times, sans-serif;
	display: inline-block;
	font-size:20px;
	text-align: left;
	line-height: 30px;
		}
		
	
		
	 </style>

     </head>
	
	 <body class="page1" id="top">
 
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id");%>
<%String dayStatus=(String)session.getAttribute("dayStatus"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">
 
<div><%@ include file = "../../include/header.jsp" %></div>	
      
	
     <headere><div>
<!--==============================header=================================-->
    

</div>
</headere>
<!--==============================Content=================================-->


<%  if(userid != null){ %>


<div class="content" style="color:#000000">
  <div class="container_123">
  <div class="grid_12">
  
   <h4 style=" font-family:'Times New Roman', Times, sans-serif; color: #990000;  font-size: 28px; height:40px">Welcome to smartLehren </h4>
  <div style="text-align:justify; font-size:14px; " ><label class="para">Transform your university into a Smart University by automating day-day adhoc functions and introduce more digital equipments and Internet of Things. Fully Automated Work Flow through our state-of-the-art BPM process template dB BPM. Automated Communications between the stakeholders makes the system completely effective in closing the positions quick. Applications talk/share information while you focus on your core business. Modeler to create custom business process.</label></div>
    
     <div width="" style="margin:auto; margin-left:20px; ">
      
    
 <%
						ArrayList entitylist = (ArrayList)session.getAttribute("entitylist");
						if(entitylist!=null && entitylist.size()!=0){
							Iterator itEntList = entitylist.iterator();
							//String sessHeadEntityId = (String)session.getAttribute("entityId");
							while(itEntList.hasNext()){
								String strRolelist[]= (String[])itEntList.next();
								String enti_id = strRolelist[0];
								String entity_name = strRolelist[1];
								String url_name = strRolelist[2];
								%>
								
		<div class="grid_3 dash hvr-shutter-out-horizontal">
			<a href="<%=url_name%>&entityid=<%=enti_id%>">
								
	<img src="images/<%=entity_name %>.png" alt="<%=entity_name %>" width="50" height="50" style="margin:5px 0 0 5px;">
	<h2 class="heading" style="font-family:'Times New Roman', Times, sans-serif; font-size:20px; font-weight:bold;"><%=entity_name %></h2>							
			</a>
    </div>
  
    <%}
							}else{%>
							
			<div class="grid_3 dash hvr-shutter-out-horizontal">
			<a href="login.html?cmd=initindex&enroll=enrollNow">
			<img src="images/elearning.png" alt="E-Learning" width="50" height="50" style="margin:5px 0 0 20px;">      
				<h2 class="heading" style="font-family:'Times New Roman', Times, sans-serif; font-size:20px; font-weight:bold;">E-Learning</h2>
	 </a> 
    </div> 
	<%}%>
	
		</div>				
   <div>&nbsp;</div>
  </div>   </div>
</div>

<% }else{%>



<% }%>
<!--==============================footer=================================-->
 <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>      
  </footer>
</body>
</html>

