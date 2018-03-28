<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
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
          
     <script src="js/script.js"></script> 
     <script src="js/superfish.js"></script>
     <script src="js/touchTouch.jquery.js"></script>
     <script  src="js/ts_picker.js"></script>

    <script src="js/jquery.js"></script>    
     <script src="js/superfish.js"></script>  
     <script src="js/datetimepicker_css.js"></script>  

     
      	<script src="js/dist/jquery.validate.js"></script>	
     
     <script>
 
        $(document).ready(function(){  
		
		
		jQuery("#category").validate({                      
        rules: {    
				coursename:{
					required: true
				}
        },
        messages: {
               
			   coursename:"Please Select Course Name",
        },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next());				
				else
					error.appendTo(element.parent());
			}			
    });
		
		
		
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
    

        function showVal(course_id,course_name)
        { 
   		 var cid = course_id;
   	    var cname = course_name;		
   	   
   	    document.getElementById('courseid').value = cid; 
   	    document.getElementById('coursename').value = cname;
       }
        
     </script>
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
	  
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
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Program</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
      <table width="800" style="font-family:'Times New Roman', Times, serif;">
         
<form align="center" action="./login.html" method="post" name="category" id="category">
<input type="hidden" name="LoginProcess"  value="category">
<input type="hidden" name="courseid" id="courseid" value="">


<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	 <tr height="50"><td style="font-size:12pt;"></td><td colspan="2" style="color:red; font-family:'Times New Roman', Times, serif;"><%=status%></td></tr><%} %>
	 							  
<tr >
  <td height="40" width="396"><div style="margin: 5px 0 0 290px;">Program  Name:</div></td>
  <td height="40" width="392">
  
<input type="text" name="coursename" id="coursename" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" required ><label style=" color:#FF0000">*</label></td></tr>

<tr>
<td colspan="2" align="center" height="40">
<img src="images/create.jpg" alt="create" width="20" height="20" style="cursor:pointer"/>
  <input type="submit" name="create" value="Create"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());" >
  
&nbsp;<img src="images/delete.jpg" alt="delete" width="20" height="20" style="cursor:pointer">
<input   type="submit" name="delete" value="Delete"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(ondelete());" > 

<img src="images/update.jpg"  alt="update" width="20" height="20" style="cursor:pointer"> 
<input   type="submit" name="Update" value="Update" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="return(onValidate());"></td></tr>


</form>

</table>
</div>
</div>



<div style="color:#FF0000; margin-bottom:10px;"><label class="lab">Note:If you want Delete or Update,You can Select from the List of Categories</label></div>
<tr><td height="2"></td></tr>

 <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">List of Program </div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
     
      <table width="800" >


		 							
		 							<%ArrayList courselist1 =(ArrayList)request.getAttribute("courselist");
									
									if(courselist1!=null && courselist1.size()!=0){
									
									Iterator itr = courselist1.iterator();
									 while (itr.hasNext()) {
									 String sr[] = (String[]) itr.next();
									
									 String course_id = sr[0]; 
									 String course_name = sr[1]; 
											   
											
											%> 
											<tr>
											
											<td class="tableRight" colspan="5" >
							<div  style="margin-bottom:10px;" >
			<label class="lab"><a href="#" onClick="showVal('<%=course_id%>','<%=course_name%>');"><%=course_name%></a></label></div></td>		
										   	
											</tr> 
										
											<%
											}
											}else{%>
											
											<tr>
											<td colspan="2" align="center"><label class="lab">
											No records found</label>
											</td>
											
											</tr>
										<%}%>
		

</table>
</div></div>
      
    </div>   
  </div>   

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
	if(document.category.coursename.value==""){
		alert("Catgory name cannot be empty");
		document.category.coursename.focus();
		return false;
	}
	if(Dospace(document.category.coursename.value)||((document.category.coursename.value.indexOf(' '))==0))
	   { alert("Enter valid Categoryname");
	   document.category.coursename.focus();
	   return false; }
	
			
	return true;
}
function ondelete()
{
	if(document.category.coursename.value==""){
		alert("select categoryname from category list");
		document.category.coursename.focus();
		return false;
	}
	
	
	return true;
}
</script>
</html>

