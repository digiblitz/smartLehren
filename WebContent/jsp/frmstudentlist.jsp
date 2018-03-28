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
      <%@ page import="com.util.userDB" %>
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
 
	     
      <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">


    <![endif]-->
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}
	</style>
     </head>
	 <body class="page1" id="top">
 <headere><div>
  

 
 <%userDB db1 = userDB.getInstance(); %>
<%@ include file = "../../include/header.jsp" %>
<%@ include file = "../../include/Hmenu.jsp" %>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  
	 -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; 
	 width:1100px;">
	 
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">
 Student List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; 
color:black;">
	 
         <form id="form" name="insert" align="center" action="./login.html" method="post">
 
<input type="hidden" name="LoginProcess"  value="insert">

    <table width="1100" >
            <tr  style="font-family:'Times New Roman', Times, serif; font-size:18px; height:20px; font-weight:bold;   color:#000000; ">
			
			<td width="122"  height="50" >First Name</td>
			<td width="122"  height="50" >Last Name</td>
			<td width="171"  height="50" >Email Id</td>			
			<td width="104"  height="50" >Category</td>
			<td width="107"  height="50" >Batch</td>
			<td width="108"  height="50" >Program Name</td>
			<td width="132"  height="50" >Sub Program Name</td>
			<td width="102"  height="50" >Semester</td>
			<td width="102"  height="50" >Assign Course</td>
		   </tr>

			<%
				
				
				ArrayList studentlist1 = (ArrayList)request.getAttribute("studentlist");
				System.out.println("studentlist1 "+studentlist1.size());
					if(studentlist1!=null && studentlist1.size()!=0){
					Iterator itr = studentlist1.iterator();
					while(itr.hasNext()){
					 String sr[] = (String[]) itr.next();
					 String user_id = sr[0];
					 String first_name = sr[1]; 
					 String last_name = sr[2]; 
					 String email = sr[3]; 		
					  String category = sr[4]; 
					   String batch = sr[5]; 	
					   String pro_id = sr[6]; 
						 String subpro_id = sr[7]; 
					 String program = sr[8]; 
					 String subprogram = sr[9]; 										   	
					 String semester=db1.getsemester(batch);	
					 System.out.println("last name: from studentlist"+last_name);
						
			%>
			
		  <tr style="font-family:'Times New Roman', Times, serif; font-size:17px;">
		  <td  width="92"  height="50" ><%=first_name%></td>
			<td  width="102"  height="50"><%=last_name%></td>
			
			<td width="161"  height="50" ><%=email%></td>	
			<td  width="74"  height="50" ><%=category%></td>	
			<td  width="87"  height="50" ><%=batch%></td>
			
			<td  width="88"  height="50" ><%=program%></td>	
			<td width="122"  height="50" ><%=subprogram%></td>	
			<td  width="92"  height="50" ><%=semester%></td>
							
			<td width="92"  height="50" ><a href="login.html?cmd=initassignstudentcourse&user_id=<%=user_id%>&category=<%=category%>&batch=<%=batch%>&semester=<%=semester%>&pro_id=<%=pro_id%>&subpro_id=<%=subpro_id%>&firstname=<%=first_name%>&lastname=<%=last_name%>"><img src="images/approve.png"  alt="approve" width="20" height="20" style="cursor:pointer"/></a></td>
			
	    </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19" colspan="8" width="500" align="right"><strong><label class="lab">No user to enroll</label></strong></td>
           </tr>
		   <%} %></table>
		   

</form></div></div>
</div></div>
     
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12">
       <%@ include file = "../../include/footer-in.jsp" %>      
    </div>  
  </footer>
</body>
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}
	

</script>
</html>

