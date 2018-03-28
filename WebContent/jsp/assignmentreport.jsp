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
<meta charset="utf-8">

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
		  
		  
		  
		    jQuery("#assign").validate({                      
        rules: {                    
                coursecode:{
					required: true
				},
				assignname:{
					required:true
				}				
        },
        messages: {
               
			   coursecode: "Please select Course",
			   assignname: "Please provide Assignment name"	  
            },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent());				
				else
					error.appendTo(element.parent());
			}			
    });
		  
       });  
    

     </script>
	 
	 
  <script type="text/javascript">
  function postData(postProcess){
	//alert(postProcess);

	if(postProcess=="coursecode"){
	if(document.assign.coursecode.value!=""){
		prog=document.assign.coursecode.value;
		document.assign.method="post";
		document.assign.action="map.html?cmd=initassignmentreport&coursecode="+prog;
		document.assign.submit();
		
		}
		
		}

	}
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
  



<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>

<%String coursecode = (String)request.getAttribute("course_code");
String assign_nam = (String)request.getAttribute("assignname");%>

<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12 ">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Assignment Report</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  
      <table   width="1000" > 
	 <tr><td >
	
 
	
         <form align="center" action="./trainer.html" method="post" id="assign" name="assign">
		 <input type="hidden" name="TrainerProcess"  value="AssignReportProcess">


<table width="414" style="margin-left:250px; margin-top:20px">
<tr>
<td  height="41" width="115" ><label class="lab">Course Name:</label></td>
	 								  <td width="287">
	 						  <select name="coursecode" id="coursecode" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" onChange="postData('coursecode');" required >
								 		<option value="">Select Course</option>
								 			<% 
								 				
								 			ArrayList cmcourselist =(ArrayList)request.getAttribute("cmcourselist");
											
											if(cmcourselist!=null && cmcourselist.size()!=0){
											
											Iterator itr = cmcourselist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String course_code = sr[0]; 
											 String course_name = sr[1];
											  
														
														if(coursecode != null && coursecode.equals(course_code))
														{
															%>
															<option value="<%=course_code%>" selected ><%=course_name %></option>
															<% 
														 }else{
															 %>
															<option value="<%=course_code%>" ><%=course_name %></option>	 
															 
														 <%}
													}
												}
											%>
											 
		 		  </select></td></tr>
		 		  
<tr>
<td  height="40" width="115"><label class="lab">Assignment Name:</label></td>
	 								  <td width="287">
	 				<select name="assignname" id="assignname" style="font-family:'Times New Roman', Times, serif; width:250px; height:20px;" required >
								 		<option value="">Select Assignment</option>
								 			<% 
								 				
								 			ArrayList assign_name =(ArrayList)request.getAttribute("assign_name");
											
											if(assign_name!=null && assign_name.size()!=0){
											
											Iterator itr = assign_name.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String assignid = sr[0];
											 String assignname = sr[1]; 
											 String course_code = sr[2];
											  
														
														if(assign_nam!=null && assign_nam.equals(assignname))
														{
															%>
															<option value="<%=assignname%>" selected ><%=assignname %></option>
															<% 
														 }else{
															 %>
															<option value="<%=assignname%>" ><%=assignname %></option> 
															 <%
														 }
													}
												}
											%>
											 
		 		  </select></td></tr>	

<tr class="row2"><td colspan="2" align="center">
<img src="images/create.jpg" alt="submit" width="20" height="20" style="cursor:pointer"/>
 <input type="submit" name="Assign" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());">

<img src="images/Cancel.png"  alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);"style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></td></tr>
</table>


</form></td></tr></table>
<div>&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div>

 <table width="100%" align="center" >
            <tr  style="font-family:'Times New Roman', Times, serif; font-size:18px; height:20px; font-weight:bold">
			<td width="150"  height="50" >Register No</td>
			<td width="150"  height="50" >First Name</td>
			<td width="150"  height="50" >Last Name</td>
			<td width="210"  height="50" >Email Id</td>
			<td width="200"  height="50" >Assignment Name</td>
			<td width="50"  height="50" >Grade</td>
			
		   </tr>

			<%
				
				
				ArrayList assignreportlist = (ArrayList)request.getAttribute("assignreportlist");
				
				
				
					if(assignreportlist!=null && assignreportlist.size()!=0){
					Iterator itr = assignreportlist.iterator();
					while(itr.hasNext()){
					 String sr[] = (String[]) itr.next();
					 String regno = sr[0];
					 String firstname = sr[1];
					 String lastname = sr[2]; 
					 String email = sr[3]; 
					 String assignname = sr[4]; 
					 String grade = sr[5]; 
						
						
			%>
			
		  <tr style="font-family:'Times New Roman', Times, serif;">
		  <td  height="50" ><%=regno%></td>
			<td  height="50" ><%=firstname%></td>
			<td  height="50" ><%=lastname%></td>	
			<td  height="50" ><%=email%></td>	
			<td  height="50" ><%=assignname%></td>
			<td  height="50" ><%=grade%></td>
						
			
		   </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19"colspan="5" align="center"><strong style="font-family:'Times New Roman', Times, serif;">No Records</strong></td>
           </tr>
		   <%} %></table>




</div>  </div>  
     <br><br>  
     
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

</html>

