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
    <%@ page import="java.util.Date"%>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
     <head>
     <title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/hormenu.css">
    
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
    
     <script src="js/jquery.leanModal.min.js"></script>     
     
     	
<script src="https://ho192.infusionsoft.com/app/webTracking/getTrackingCode?trackingId=b592766f8ddb5fc8d319956c6b7b8ce6" type="text/javascript">
</script>


    
<script type="text/javascript">
<!-- Include JS File Here-->
window.onload = function() {
// Onload event of Javascript
// Initializing timer variable
//document.getElementById("signfailure").style.visibility = 'hidden';
var x = 5;
var y = document.getElementById("timer");
// Display count down for 20s
setInterval(function() {
if (x <= 6 && x >= 1) {
x--;
y.innerHTML = '' + x + '';
if (x == 1) {
x = 6;
}
}
}, 200);
// Form Submitting after 20s
var auto_refresh = setInterval(function() {
submitform();
}, 3333);
// Form submit function
function submitform() {

//alert('Form is submitting.....');



	document.getElementById("signsuccess").submit();


}
// To validate form fields before submission
function validate() {
// Storing Field Values in variables
var name = document.getElementById("name").value;
var email = document.getElementById("email").value;
var contact = document.getElementById("contact").value;
// Regular Expression For Email
var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
// Conditions
if (name != '' && email != '' && contact != '') {
if (email.match(emailReg)) {
if (document.getElementById("male").checked || document.getElementById("female").checked) {
if (contact.length == 10) {
return true;
} else {
alert("The Contact No. must be at least 10 digit long!");
return false;
}
} else {
alert("You must select gender.....!");
return false;
}
} else {
alert("Invalid Email Address...!!!");
return false;
}
} else {
alert("All fields are required.....!");
return false;
}
}
};</script>


	
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
  width: 500px;
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


#signsuccess{
	display:none;
}
</style>

     </head>

     <body class="page1" id="top">
     <header><div>
<!--==============================header=================================-->
     <div class="container_12">
        <div class="grid_12">
      <table><tr><td>  
     <div class=" " style="margin-top:60px;" >
     
        
            <div class="clear"></div>
            
  </div></td><td>
  <div class="h_address">
  
  </div></td></tr></table>
  <div class="clear"></div>    
 
 <h2>&nbsp;</h2>
</div>


</div></div>
</header>
<%String firstname = (String)request.getAttribute("firstname"); %>
<%String lastname = (String)request.getAttribute("lastname"); %>
<%String e_mail = (String)request.getAttribute("e_mail"); %>
<%String companyname = (String)request.getAttribute("companyname"); %>
<%String cmid = (String)request.getAttribute("cmid"); %>
<%String subscription_id = (String)request.getAttribute("subscription_id"); %>
<%String subscription_type = (String)request.getAttribute("subscription_type"); %>
<%String order_id = (String)request.getAttribute("order_id"); %>
<%String customerid = (String)request.getAttribute("customerid"); %>
<%String plantype = (String)request.getAttribute("plantype"); %>
<%String reason = (String)request.getAttribute("reason"); 
String user = (String)request.getAttribute("user");
String pass = (String)request.getAttribute("pass");
String coupon_code = (String)request.getAttribute("coupon_code"); 
System.out.println("================ e_mail===================> "+e_mail);
%>


<input type="hidden" name="couponcode" id="couponcode" value="<%=coupon_code%>">

<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/d5920e2e0b365af00cecfb7e55f50924" id="signsuccess" class="infusion-form" style="display:none;" method="POST">
    <input name="inf_form_xid" type="hidden" value="d5920e2e0b365af00cecfb7e55f50924" />
    <input name="inf_form_name" type="hidden" value="coupon  code Applied Scenario" />
    <input name="infusionsoft_version" type="hidden" value="1.59.0.51" />
    <div class="infusion-field">
        <label for="inf_field_FirstName">First Name</label>
        <input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="<%=firstname%>"/>
    </div>
    <div class="infusion-field">
        <label for="inf_field_LastName">Last Name</label>
        <input class="infusion-field-input-container" id="inf_field_LastName" name="inf_field_LastName" type="text" value="<%=lastname%>"/>
    </div>
    <div class="infusion-field">
        <label for="inf_field_Username">Username *</label>
        <input class="infusion-field-input-container" id="inf_field_Username" name="inf_field_Username" type="text" value="<%=user%>"/>
    </div>
    <div class="infusion-field">
        <label for="inf_field_Password">Password *</label>
        <input class="infusion-field-input-container" id="inf_field_Password" name="inf_field_Password" type="password" value="<%=pass%>"/>
    </div>
    <div class="infusion-field">
        <label for="inf_field_Email">Email *</label>
        <input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=e_mail%>"/>
    </div>
    <!-- div class="infusion-field">
        <label for="inf_field_Company">Institution Name</label>
        <input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="<%=companyname%>"/>
    </div> -->
    <div class="infusion-field">
        <label for="inf_custom_CustomerID0">Customer ID</label>
        <input class="infusion-field-input-container" id="inf_custom_CustomerID0" name="inf_custom_CustomerID0" type="text" value="<%=customerid%>"/>
    </div>
    <div class="infusion-submit">
        <input type="submit" value="Ok. Proceed" />
    </div>
</form>

<div class="content">
  <div class="container_12 ">
       <div class="grid_12">
          <div>&nbsp;</div>
          
		  


          
	 <div class="text1">Congrats <%=firstname %> !</div>
	  <div style="color:#000000; text-align:justify;  font-weight:bold;">You're ready to start using SmartLehren Online Edition</div>	  
		<div style="color:#000000; text-align:justify; font-weight:bold;">We'll send you a welcome email shortly with some quick tips to get started easily.</div>	  
<div>&nbsp;</div>
<div>&nbsp;</div>
<table><tr><td width="445">		  
<div class="text1" style="color:#333333">Login Details</div>
<div style="color:#000000; text-align:justify;"><%=firstname %></div>
<div style="color:#000000; text-align:justify;"><%=e_mail %></div>

<div>&nbsp;</div>

<div class="text1" style="color:#333333">Company Information</div>
<!-- div style="color:#000000; text-align:justify;">Company Name: <%=companyname %></div>
<div style="color:#000000; text-align:justify;">Company ID: <%=cmid %></div> -->
<div style="color:#000000; text-align:justify;">Customerid: <%=customerid %></div>
<div style="color:#000000; text-align:justify;">Subscription_id: <%=subscription_id %></div>
<div style="color:#000000; text-align:justify;">Order ID: <%=order_id %></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</td><td width="443"><div align="right" >
</div></td></tr></table>

<div id="loginmodal" style="display:none;" >
    
	<input type="hidden" name="cmd"  value="initcompanydetails">
	<input type="hidden" name="email_id"  value="<%=e_mail%>"> 
      <label style="color:#333333; font-size:24px;">Buy now and get 35% off</label>
	    <label>on first year subscription</label>
		  <label>Get SmartLehren for just</label>
      <label style="color:#333333; font-size:24px;">Rs 5000 / year</label>
	  <label>Regular Price Rs 8999</label>
      <input type="button" name="buy"  value="BuyNow">
      <label>Note: unused free trial days will be added to your 12 month subscription</label>
     
      
      <div class="center"> <label><input type="submit"  value="Continue to Trial" tabindex="3"  style="cursor:pointer; width:200px; height:30px; border:thin;  border:groove;"></label>
     </div>
	    	        
    
  </div>


<div class="linkss" align="center"><a href="login.html&cmd=signupdetails">Get start</a></div>
</div></div>

</div>
<footer>   
    <div class="container_12">
      <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
   
  </footer>
</body>
</html>
