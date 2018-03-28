<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
	<%@ page import="java.util.*"  %>
     <title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     
       <link rel="stylesheet" href="css/gender.css">
  
     <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/jquery-ui.css" type="text/css"/>
	<link rel="stylesheet" href="css/ui.theme.css" type="text/css"  />
     
<!--   <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> -->
  
     <script src="js/jquery.js"></script>    
     <script src="js/script.js"></script> 
     <script src="js/superfish.js"></script>
     <script src="js/touchTouch.jquery.js"></script>
     <script src="js/jquery.ui.totop.js"></script>    
     <script src="js/datetimepicker_css.js"></script>
	 
	  <script src="js/cscombo_new.js" type="text/javascript" ></script>
    
     <script src="js/jquery.leanModal.min.js"></script>    
	 <script src="js/dist/jquery.validate.js"></script>
	 <script src="js/dist/additional-methods.js"></script>
     <script src="js/lib/jquery.maskedinput.js"></script>		
	 
	  <script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--	<script type="text/javascript" src="js/jquery.min.js"></script> -->
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
     
	 <!-- <script src="js/citystatecountry.js"></script>	
     <script src="jquery-1.11.3.min.js"></script>   -->
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
    
<script type="text/javascript">



	$(document).ready(function() {
	
	$("#username1").blur(function(){        
var a = $("#username1").val();
var b = a.trim();
$("#username1").val(b);
    });
	
	$("#firstname").blur(function(){        
var a = $("#firstname").val();
var b = a.trim();
$("#firstname").val(b);
    });
	
	$("#lastname").blur(function(){        
var a = $("#lastname").val();
var b = a.trim();
$("#lastname").val(b);
    });
	
	$("#pincode").blur(function(){        
var a = $("#pincode").val();
var b = a.trim();
$("#pincode").val(b);
    });
	
	
	$("#address1").blur(function(){        
var a = $("#address1").val();
var b = a.trim();
$("#address1").val(b);
    });
	
	$("#city").blur(function(){        
var a = $("#city").val();
var b = a.trim();
$("#city").val(b);
    });
		
		$("#countrycode").mask("+9?99");		
		$("#mobileno").mask("999-999-9999");
		
		/* jQuery.validator.addMethod("nombre", function(value, element, param) {
		
		var a = element.id;
		var size = value.length;

		if(value.indexOf(" ") < 0){
		//alert(size);
		}
		
				return value.trim().match(new RegExp("[a-zA-Z0-9. ]+"));					
		
		}); */
		
		/* jQuery.validator.addMethod("noSpace", function(value, element) { 	
			if(value == "[a-zA-Z. ]"){
			alert('hi');
				   return value.indexOf(" ") < 0 && value != ""; 	
				   }
  			}); */
  
  $.validator.addMethod(
    "australianDate",
    function(value, element) {
        // put your own logic here, this is just a (crappy) example
        return value.match(/^\d\d\d\d?\-\d\d?\-\d\d$/);
    },
    "Please enter a date in the format dd/mm/yyyy."
);

		
		 $("#form").validate({
		 
			rules: {
				firstname:{
					required: true
				 },
				lastname: {
					required: true
				},
				username: {
					required: true,
					minlength: 2,
				},
				password: {
					required: true,
					minlength: 6
				},
				password_confirm: {
					required: true,
					equalTo: "#passwordd"
				},
				email: {
					required: true,
					email:true					
				},
				date:{
			         australianDate: true,
				},
				mobileno:{
					required:true
					},
				address1:{
						required:true
				},	
				country:{
						required: true
				},	
				state:{
					required: true	
				},				
				city:{
					required:true
				},
				companyname:{
					required:true
				},
				pincode:{
					required:true,
					number:true
				}			
			},
			messages: {
				firstname: {
					required: "Empty Space are not Allowed",
				},
				lastname: {
					required: "Empty Space are not Allowed",
				},
				username: {
					required: "Empty Space are not Allowed",
					minlength: jQuery.validator.format("Enter at least {0} characters")
				},
				password: {
					required: "Empty Space are not Allowed",
					minlength: jQuery.validator.format("Enter at least {0} characters")
				},
				password_confirm: {
					required: "Empty Space are not Allowed",
					equalTo: "Enter the same password as above"
				},
				email: "Please enter a valid email address",				
				date:{
					australianDate: "Please Select Date",					
				},
				mobileno:"Please enter valid Mobile No",				
				address1:"Empty Space are not allowed",				
				country:"Please select your country",
				state:"Please select your state",
				city: "Please enter city name",
				pincode: {
					required: "Empty Space are not Allowed",
				},
				companyname:"Please enter company name",
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
		
	
		
	});	
	
	$(function(){
  $('#loginform').submit(function(e){
    return true;
  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
	</script> 	
	
	
	
    <style>   
#panel {     
    display: none;  
}  

.avatar img {
    width: 40px;
    height: 50px;
	background-color:#f8f8f8;
    border-radius: 100%;
    -webkit-border-radius: 100%;
    -moz-border-radius: 100%;
    -ms-border-radius: 100%;
   
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
}
<!-- new form starts -->
		.news-box h1 {
    margin: 30px 0;
    color: #3d84e6;
}
		.top-margin {
    margin-top: 20px;
}
		.form-group .form-validation {
        position: absolute;
    top: 20px;
    right: 6px;
}

<!-- new form ends -->
</style>  

</head>

<body class="page1" id="top">

<header>
	 <div>
<!--==============================header=================================-->
     <div class="container_12">
        <div class="grid_12">
      
     <div class=" " style="margin-top:60px;" >
     
         <a href="map.html?cmd=inithome"><img src="images/smartLehrenlogo.png" alt="Your Happy Family" width="400" height="90"></a>      
         
            <div class="clear"></div>
            
  </div>
   <div class="h_address" style="float:left; ">      
    <address style="font-family:'Times New Roman', Times, serif; font-size:17px; line-height:30px;">
      13241 WOODLAND PARK ROAD, <br>
      SUITE 110, HERNDON,<br>
       VIRGINIA 20171, USA<br>
	  <i class="fa fa-envelope mail"></i>: <a href="mailto:sales@digiblitz.com">sales@smartlehren.com</a><br>
       <!-- <img class="phone" src="images/phone_icon.png">: 703-956-2530-->
        <!-- div class="avatar" ><img  src="jsp\LavlitaChatApp\images\lavlita.png"><a href="./ViewChatBox.html" style="padding:10px 0px;">Chat with Lavlita.AI</a></div> -->
    </address>
  </div> 
  <div class="clear"></div>    
 
<div class="links">
<a target="_blank" href="https://digiblitz.com/community/" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Community</a><a target="_blank" href="https://www.digiblitz.com/support/?cat=2" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Help</a><a href="#loginmodal" id="modaltrigger" style="text-decoration: none; font-family:'Times New Roman', Times, serif; line-height:20px;">log in</a>
					</div>
					
   <div id="loginmodal" style="display:none;" >
    <div align="center" style="font-size:28px; margin-bottom:20px; color:#7c8291;">User Login</div>
    
    <form id="loginform" name="loginform" method="post" action="./login.html" onSubmit="return onValidate()" >
	
	<input type="hidden" name="LoginProcess"  value="Process">
	 
      <label for="username" style="font-family:'Times New Roman', Times, serif;">Username:</label>
      <input type="text" name="username" id="username" class="txtfield" tabindex="1" style="font-family:'Times New Roman', Times, serif; width:250px;">
      
      <label for="password" style="font-family:'Times New Roman', Times, serif;">Password:</label>
      <input type="password" name="password" id="password" class="txtfield" tabindex="2" style="font-family:'Times New Roman', Times, serif; width:250px;">
      
      <div class="center"> 
	  <span>
	  <img src="images/log.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="submit"  value="Log In" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"></span>
     &nbsp;&nbsp;&nbsp; <span>
	  <img src="images/Cancel.png" alt="" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="button"  value="Cancel" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="location.href='login.html?cmd=initok'"></span></div>
					 <br>
		 <div class="usersignup" style="font-family:'Times New Roman', Times, serif;"><a href="login.html?cmd=initregister">New User SignUp</a><a href="login.html?cmd=initforgetpassword" style="margin-left:28px;">Forgot your password?</a>
</div>
    </form>
  </div>
  <div class="tabs">
             <div class="tabs">
             <div class="div-nav  ">
                <ul class="nav">
                       <li><a href="map.html?cmd=inithome" style="font-size:25px; font-family:'Times New Roman', Times, serif; line-height:30px;"><span></span><strong></strong>Home  <br>&nbsp;</a></li>
                      <li><a href="qual.html?cmd=whysmartlehren" style="font-size:20px;font-weight:bold; font-family:'Times New Roman', Times, serif; line-height:20px;"><span></span><strong></strong>Why smartLehren? <br>&nbsp;</a></li>
                      <li><a href="map.html?cmd=initgetstart" style="font-size:25px; font-family:'Times New Roman', Times, serif; line-height:30px;"><span></span><strong></strong>Pricing  <br>&nbsp;</a></li>
					  <li><a href="map.html?cmd=initcontactus" style="font-size:25px; font-family:'Times New Roman', Times, serif; line-height:30px;"><span></span><strong></strong>Contact Us <br>&nbsp;</a></li>
					   <li><a href="./ViewChatBox.html" style="font-size:20px;font-weight:bold; font-family:'Times New Roman', Times, serif; line-height:20px;"><span></span><strong></strong>Chat with Lavlita.AI <br>&nbsp;</a></li>
                 </ul>
                 <div class="clear"></div>
             </div>
            


</div>


</div></div></div></div>
</header>

<!-- ============================================== header ends======================================= -->
<!-- ==============================================content======================================= -->

<div class="content">
  <div class="container_12 "> 

<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;"> 
 <div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Registration Form</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
		
  
  <section class="news-box">
        <div class="container contN">
		
		<%String user_id=(String)request.getAttribute("user_id"); %>
    <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	 <span colspan="2" id="coupstatus" style="color:red; text-align:center; font-size:20px;"><%=status%></span><%} %>
	 
		<form id="form" name="insert" action="student.html?cmd=initregistration" method="post" ENCTYPE="multipart/form-data">
						<input type="hidden" name="Insert" value="Register">
						
						
						<div class="row">
						
						<div class="col-md-8">
                                <div class="form-group">
                                    <label>First Name:</label>
					<input id="firstname" name="firstname" type="text" class="form-control" value="" maxlength="50" >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Last Name:</label>
					<input id="lastname" name="lastname" type="text" class="form-control" value="" maxlength="50" >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
														
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Username:</label>
					<input  type="text" id="username1" name="username" class="form-control" value=""  maxlength="50" onBlur="usrStat();" >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Password:</label>
					<input  id="passwordd" name="password" type="password" class="form-control" value="" maxlength="50" >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Confirm Password:</label>
					<input id="password_confirm" name="password_confirm" type="password" class="form-control" value="" maxlength="50" >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							
							
							
							<div class="col-md-10">
                                <div class="form-group">
                                    <label>Are you ready to disclose your gender?</label>
					<input type="radio"  name="yesno" id="flip1">Yes
					<input type="radio"  name="yesno" id="flip2">No
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-10" id="panel" >    
							<div class="form-group">                           
                                    <label>Gender</label>
					<input type="radio" name="gender"  value="male"/>Male
				<input type="radio" name="gender" value="female"/>Female
				<input type="radio" name="gender" value="others"/>Others                                    
                             </div> 
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Date of Birth:</label>
					<input type="text" name="date" id="date" class="form-control" value=""><img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal1('date')" />
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Company Name</label>
										<select  name="company" id="companyname" class="form-control" >
												<option selected="selected" value="">Select One</option>
												<%ArrayList companyname = (ArrayList)request.getAttribute("company_name");
													 System.out.println("company----------->");
													 if(companyname != null && companyname.size()!=0){
															Iterator itr = companyname.iterator();
											 				while(itr.hasNext()){							
															String company = (String)itr.next();
															
													
													%> 
                    <option value="<%=company %>"><%=company %></option>
					
					 <% } }%> 
										</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
								<div>
                                    <label>Mobile No:</label>
									</div>
									<div class="col-md-4" style="padding:0; height: 50px;" >
					<input type="text" name="countrycode" id="countrycode" class="form-control" value="">
					</div>
					<div class="col-md-8" style="padding:0 0 0 15px;" >
					<input type="text" name="mobileno" id="mobileno" class="form-control" value="">
					</div>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
								<div>
                                    <label>Phone No:</label>
									</div>
									<div class="col-md-4" style="padding:0; height: 50px;" >
					<input type="text" name="phoneno" id="countrycode" class="form-control" value="">
					</div>
					<div class="col-md-8" style="padding:0 0 0 15px;" >
					<input type="text" name="phoneno" id="phoneno" class="form-control" value="">
					</div>                                   
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
								<div>
                                    <label>Fax:</label>
									</div>
									<div class="col-md-4" style="padding:0; height: 50px;" >
					<input type="text" name="faxno" id="countrycode" class="form-control" value="">
					</div>
					<div class="col-md-8" style="padding:0 0 0 15px;" >
					<input type="text" name="faxno" id="faxno" class="form-control" value="">
					</div>                                   
                                </div>
                            </div>
							
							
							<div class="col-md-6">
								<div class="form-group">
									<label for="exampleInputFile">Upload photo:</label>
									<input type="file" name="choose" id="choose" accept="image/*" >file size should be 10kb to 40kb																		
								</div>
							</div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Email:</label>
					<input id="email" name="email" type="email" class="form-control" value="">
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Fathername:</label>
					<input id="fathername" name="fathername" type="text" class="form-control" value="">
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Mothername:</label>
					<input id="mothername" name="mothername" type="text" class="form-control" value="">
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Address 1:</label>
					<input id="address1" name="address1" type="text" class="form-control" value="">
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Address 2:</label>
					<input id="address2" name="address2" type="text" class="form-control" value="">
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Country:</label>									
		<select  class="form-control" name="country" onChange="FillState(document.insert.country, document.insert.state, '');">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>State:</label>									
		<select name="state" id="stateId" class="form-control">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>City:</label>
									<input type="text" name="city" id="city" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Zip/Postal Code:</label>
									<input type="text" name="pincode" id="pincode" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							
							 <div class="col-md-8">
                                <label class="linksss">
                <input type="submit" name="Insert" value="Register" class="submit" id="submit">
				</label>
				<label class="linkssss">
                 <input type="button" value="Cancel" name="button" onClick="javascript:history.back(-1);" >
				</label>
                            </div>
							
							
							</div>
						
						</form>
		
		</div>
		</section>
		
						
				</div>
                </div>
			</div></div>

			 <!--==============================footer=================================-->
			 <footer>   
         <%@ include file = "../../include/footer.jsp" %>
      
  </footer>
</body>



 <script type="text/javascript">
			

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
 
 <script type="text/javascript">

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


$(function(){
  $('#loginform').submit(function(e){
    return true;
  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});




//------------------------DOSPACE--------------------------------------------------------------------------
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}
//-------------------function for character validation in Names------------------
function isnotName(str){
stringCheck="!@#$%^&*()_+|<>?/-=~,`0123456789;:][{}"+"\\";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}


function onValidate()
{
	if(document.loginform.username.value==""){
		alert("Username cannot be empty");
		document.loginform.username.focus();
		return false;
	}
	if(Dospace(document.loginform.username.value)||((document.loginform.username.value.indexOf(' '))==0))
   { alert("Enter valid user name");
     document.loginform.username.focus();
   return false; }
   
   
 if(document.loginform.password.value==""){
		alert("Password cannot be empty");
		document.loginform.password.focus();
		return false;
	}
	if(Dospace(document.loginform.password.value)||((document.loginform.password.value.indexOf(' '))==0))
   { alert("Enter valid password");
     document.loginform.password.focus();
   return false; }
   
  
 return true;
 
}

FillCountry(document.insert.country, document.insert.state, 'USA' );
FillState(document.insert.country, document.insert.state, '');

</script>
    	 
<style type="text/css">


.center { display: block; text-align: center; }

.flatbtn {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #f3faef;
  text-decoration: none;
  background-color: #6bb642;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.2em;
  font-weight: bold;
  padding: 12px 22px 12px 22px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);

  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  -moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}
.flatbtn:hover {
  color: #fff;
  background-color: #73c437;
}
.flatbtn:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}

/** custom login button **/
.flatbtn-blu { 
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #edf4f9;
  text-decoration: none;
  background-color: #4f94cf;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.3em;
  font-weight: bold;
  padding: 12px 26px 12px 26px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
}
.flatbtn-blu:hover {
  color: #fff;
  background-color: #519dde;
}
.flatbtn-blu:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}


/** modal window styles **/
#lean_overlay {
    position: fixed;
    z-index:100;
    top: 0px;
    left: 0px;
    height:100%;
    width:100%;
    background: #000;
    display: none;
}


#loginmodal {
text-decoration: none;
  padding: 15px 20px;
  background: #f3f6fa;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
}

#loginform { /* no default styles */ }

#loginform label { display: block; font-size:14px; font-weight: bold; color: #7c8291; margin-bottom: 3px; }


.txtfield { 
  display: block;
  width: 100%;
  padding: 6px 5px;
  margin-bottom: 15px;
  font-family: 'Helvetica Neue', Helvetica, Verdana, sans-serif;
  color: #7988a3;
  font-size: 1.4em;
  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.8);
  background-color: #fff;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#edf3f9), to(#fff));
  background-image: -webkit-linear-gradient(top, #edf3f9, #fff);
  background-image: -moz-linear-gradient(top, #edf3f9, #fff);
  background-image: -ms-linear-gradient(top, #edf3f9, #fff);
  background-image: -o-linear-gradient(top, #edf3f9, #fff);
  background-image: linear-gradient(top, #edf3f9, #fff);
  border: 1px solid;
  border-color: #abbce8 #c3cae0 #b9c8ef;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -webkit-transition: all 0.25s linear;
  -moz-transition: all 0.25s linear;
  transition: all 0.25s linear;
}

.txtfield:focus {
  outline: none;
  color: #525864;
  border-color: #84c0ee;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
}


.usersignup a{
	color: #000000;
	font-size: 12px;
}

.usersignup a:hover{
	text-decoration: underline;
	color: #4db7ff;
}

 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}

</style>
</html>

 
