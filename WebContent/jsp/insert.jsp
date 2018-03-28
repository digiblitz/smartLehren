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
   
	 <link rel="stylesheet" href="css/gender.css">
  
       <script  src="js/ts_picker.js"></script>
        <script src="js/cscombo_new.js" type="text/javascript" ></script>
        <script src="js/datetimepicker_css.js"></script>
         <script src="js/lib/jquery.js"></script>	
        <script src="jquery-1.11.3.min.js"></script>         
       
	<script src="js/dist/jquery.validate.js"></script>	
    <script src="js/lib/jquery.maskedinput.js"></script>
  
  
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

	<script>
	$(document).ready(function() {
		
		$("#countrycode").mask("+9?99");		
		$("#mobileno").mask("999-999-9999");
		
		$("#form").validate({
			 			 
			rules: {
				firstname: "required",
				lastname: "required",
				username: {
					required: true,
					minlength: 2
				},
				password: {
					required: true,
					minlength: 6
				},
				email: {
					required: true,
					email:true					
				},
				date:{					
			            required: true, 
			            date: true 			   				
				},
				mobileno:{
					required:true
					},				
				country:{
						required: true,						
				},
				state:{
						required: true
					},								
				city:{
					required:true
				},
				pincode:{
					required:true,
					number:true
				},
				rolename:{
					required:true
				},
				staff:{
					required:true
				}			
			},
			messages: {
				firstname: "Enter your firstname",
				lastname: "Enter your lastname",
				username: {
					required: "Enter a username",
					minlength: jQuery.validator.format("Enter at least {0} characters")
				},
				password: {
					required: "Provide a password",
					minlength: jQuery.validator.format("Enter at least {0} characters")
				},				
				email: "Please enter a valid email address",				
				date:"Please select date",
				mobileno:"Please enter valid Mobile No",
				country:"Please select country",
				state:"Please select state",				
				city: "Please enter city name",
				pincode:"Please enter valid pincode",
				rolename:"Please Select rolename",
				staff:"Please Select Designation"
			},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());
				else
					error.appendTo(element.parent());
			}
			
			
		});

		
		$("#flip1").click(function(){  
			$("#panel").show();   
		});    
		$("#flip2").click(function(){ 
			$("#panel").hide();  
		});
		
		$("#staff").change(function(){  
			var st =  $("#staff").val();
			if(st=="Teaching"){
			$("#program").show();
			$("#subprogram").show();
			}else{
			$("#program").hide();
			$("#subprogram").hide();
			}
		}); 
		
	});	
	
	</script> 
	
<style>    

#panel {  
    padding: 80px;  
    display: none;  
}  
</style>  
    
</head>
	 <body class="page1" id="top" >
	
 <%@ include file = "../../include/header.jsp" %>
  <%@ include file = "../../include/Hmenu.jsp" %>
<!--==============================Content=================================-->
<div class="content" s>
  <div class="container_12 ">
  <div>&nbsp;</div>
<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  
-webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
 
 <div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Create Employee</div>

<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
		
  <%String user_id=(String)request.getAttribute("user_id"); %>
           <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
  
		
   <form class="form1" id="form" name="insert" action="./login.html" method="post" >
						<input type="hidden" name="LoginProcess" value="createemployee">
                       
                     
       <table border="0"  width="750" style="margin-left:200px; margin-top:5px; margin-bottom:5px">
       
       							
		<tr height="50" width="122">
			<td>
				Username:
			</td>
			<td>
				<input id="username" name="username" type="text" style="font-family:'Times New Roman', Times, serif;" maxlength="50" onBlur="usrStat();"><em>*</em>
			</td>
			<td width="150" class="status"></td>
		</tr>
        
        <tr height="50" width="122">
			<td>
				Password:
			</td>
			<td>
				<input id="password" name="password" type="password" style="font-family:'Times New Roman', Times, serif;" maxlength="50" ><em>*</em>
			</td>
			<td class="status"></td>
		</tr>

                     
		<tr height="50" width="122">
			<td>
				First Name:
			</td>
			<td>
				<input id="firstname" name="firstname" type="text" style="font-family:'Times New Roman', Times, serif;" maxlength="100" value="" ><em>*</em>
			</td>			
		</tr>
                            
      
                       
		<tr height="50" width="122">
			<td>
				Last Name:
			</td>
			<td>
	<input id="lastname" name="lastname" type="text" maxlength="100" style="font-family:'Times New Roman', Times, serif;" value=""><em>*</em>
			</td>			
		</tr>
                
				 			
				<tr height="50" width="122"><td>
				Are you ready to disclose your gender?:</td>
				<td><input type="radio"  name="yesno" id="flip1">Yes 
				<input type="radio"  name="yesno" id="flip2">No</td>
				 </tr>
							
							<tr id="panel" height="50" width="122">
				<td>Gender:</td>
				<td><input type="radio" name="gender"  value="male"/>Male
				<input type="radio" name="gender" value="female"/>Female
				<input type="radio" name="gender" value="others"/>Others</td></tr>
				
				<br><br>
                         
		       
                       
					  <tr height="50" width="122"><td>
				Email:</td>
				<td><input id="email" name="email" style="font-family:'Times New Roman', Times, serif;" type="email"><em>*</em>
			</td></tr>
			
					   
                <tr height="50" width="122">
    <td   height="50" width="224">Date of Birth:</td>
    <td width="473">
  <input  type="text" name="date" id="date" value="" >&nbsp
  <img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="font-family:'Times New Roman', Times, serif; vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal1('date')" /><em>*</em>

  </td>  
  </tr>
  
					   
           
  
  		<tr height="50" width="122">
  			<td>
  				Mobile No:
 			 </td>			
			<td>
               <input  type="text" name="mobileno1" id="countrycode" style="font-family:'Times New Roman', Times, serif; width:30px">
			   <input  type="text" name="mobileno" id="mobileno" style="font-family:'Times New Roman', Times, serif; width:130px"><em>*</em>
            </td>             
			</tr>
			
			
			
		<tr height="50" width="122"><td>
				Fathername:</td>
				<td><input id="fathername" name="fathername" style="font-family:'Times New Roman', Times, serif;" type="text"></td></tr>
			
			<tr height="50" width="122"><td>
				Mothername:</td>
				<td><input id="mothername" name="mothername" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			
		<tr height="50" width="122"><td>
				Address1:</td>
				<td><input id="address1" name="address1" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			
			<tr height="50" width="122"><td>
				Address2:</td>
				<td><input id="address2" name="address2" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			
			<!-- <tr height="50" width="122"><td>
				<label for="address2">Floor No:</label></td>
				<td><input id="address2" name="address2" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="address2">Street Address:</label></td>
				<td><input id="address2" name="address2" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="address2">Lane:</label></td>
				<td><input id="address2" name="address2" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			
			<tr height="50" width="122"><td>
				<label for="address2">Area:</label></td>
				<td><input id="address2" name="address2" style="font-family:'Times New Roman', Times, serif;" type="text">
			</td></tr>
			-->
			
			<tr height="50" width="122"><td>
				City:</td>
				<td><input id="city" name="city" style="font-family:'Times New Roman', Times, serif;" type="text"><em>*</em>
			</td></tr>
			
			<tr height="50" width="122"><td>
				Country:</td>
				<td>
 <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');" style="font-family:'Times New Roman', Times, serif; width:172px; height:22px;">  
					<option value="">Select Country</option>
					<option value="india">India</option>
					<option value="usa">USA</option>
					<option value="uk">UK</option></select><em>*</em>
			</td></tr>
			
			
		<tr height="50" width="122"><td>
		State:</td>
				<td><select name="state" id="state" style="font-family:'Times New Roman', Times, serif; height:22px;">	
				 <option value="">Select State</option>
				<option value="TamilNadu">TamilNadu</option>
				<option value="Kerala">Kerala</option>
				<option value="Delhi">Delhi</option></select><em>*</em></td>
              
			</tr>
			
		<tr height="50" width="122"><td>Zip/Postal Code:</td>
				<td><input  type="text" name="pincode" id="pincode" style="font-family:'Times New Roman', Times, serif;" ><em>*</em> 
			</tr>
			
			<tr height="50" width="122"><td>
			Role Name:</td>
	 								  <td>
	  <select name="rolename" id="rolename" style="font-family:'Times New Roman', Times, serif; width:172px; height:22px;"  >
								 		<option value="">set role</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList rolist =(ArrayList)request.getAttribute("rolelist");
											
											if(rolist!=null && rolist.size()!=0){
											
											Iterator itr = rolist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String role_id = sr[0]; 
											 String rolee_name = sr[1];
											  
														
														if(rolee_name!=null)
														{
															</jsp:scriptlet>
															<option value="<%=rolee_name%>"><%=rolee_name %></option>
															<jsp:scriptlet>
														 }
													}
												}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
  
<tbody id="forpm">	


<tr height="50" width="122"><td>
		Designation:</td>
				<td><select name="staff" id="staff" style="font-family:'Times New Roman', Times, serif; height:22px;">	
				 <option value="">Select Designation</option>
				<option value="Teaching">Teaching Staff</option>
				<option value="NonTeaching">Non-Teaching Staff</option></select><em>*</em></td>
             
			</tr>
			

<tr height="50" width="122" id="program" style="display:none;"><td>
			Program Name:</td>
	 								  <td >
	 								  <select name="program" id="program" style="font-family:'Times New Roman', Times, serif; width:172px; height:22px;" >
								 		<option value="">set program</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList list = (ArrayList)request.getAttribute("list");
											if(list!=null && list.size()!=0){
												
												Iterator itr = list.iterator();
												 while (itr.hasNext()) {
												 String sr[] = (String[]) itr.next();
												
												 String course_id = sr[0]; 
												 String course_namee = sr[1]; 
														   
													
													if(course_namee!=null)
													{
														</jsp:scriptlet>
														<option value="<%=course_namee%>"><%=course_namee%></option>
														<jsp:scriptlet>
													 }
													//System.out.println(course_name);
												}
											}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
  
<tr height="50" width="122" id="subprogram" style="display:none;"><td>
			Subprogam Name:</td>

	 								  <td>
	 								  <select name="subprogram" id="subprogram" style="font-family:'Times New Roman', Times, serif; width:172px; height:22px;" >
								 		<option value="">set subprogam</option>
								 			<jsp:scriptlet> 
								 				
								 			ArrayList courselist = (ArrayList)request.getAttribute("sublist");
											if(courselist!=null && courselist.size()!=0){
												
												Iterator itr = courselist.iterator();
												 while (itr.hasNext()) {
												 String s[] = (String[]) itr.next();
												
												 String sub_id = s[0]; 
												 String course_id= s[1]; 
												 String subcourse_name = s[2]; 
														   
													
													if(subcourse_name!=null)
													{
														</jsp:scriptlet>
														<option value="<%=subcourse_name%>"><%=subcourse_name%></option>
														<jsp:scriptlet>
													 }
													
												}
											}
											</jsp:scriptlet>
											 
								 		</select></td></tr>
            
		
        	<tr height="50" width="122">
            
            <td align="right"><span class="linksss">
			<input type="submit" name="Insert" value="Register" class="submit" style="font-family:'Times New Roman', Times, serif;" id="submit">
            </span></td>
			<td align="left"><span class="linkssss">
            <input  type="button" value="Cancel" name="button" style="font-family:'Times New Roman', Times, serif;" onClick="javascript:history.back(-1);" ></span>				
		</td>
        </tr>
                            
						
									
						</table>
					</form>
				</div>
                </div>
			</div></div>
		  
		 

 <!--==============================footer=================================-->
 <footer>   
    <div class="container_12"><br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>
<script type="text/javascript">

function yesnoCheck() {
    if (document.getElementById('yesCheck').checked) {
        document.getElementById('ifYes').style.visibility = 'visible';
    }
    else document.getElementById('ifYes').style.visibility = 'hidden';

}

FillCountry(document.insert.country, document.insert.state, 'India' );
FillState(document.insert.country, document.insert.state, '');


//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.insert.username.value!="" && document.insert.username.value.indexOf(' ')!=0)
	{

   var chsUserName=document.insert.username.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "qual.html?cmd=checkusrnam&chsUserName="+chsUserName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText != "false")
		{
			alert("User Name already Exists Choose Another !");
			document.insert.username.value="";
			document.insert.username.focus();
		}
		      
    } 

</script>
</html>

