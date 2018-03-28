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
document.getElementById("signfailure").submit();

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


#applycoupon label.error {
  padding-left: 0px; 
  color: red;
}

#form label.error {
  padding-left: 0px; 
  color: red;
}

 .label{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}


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
     </head>

     <body class="page1" id="top">
     <header><div>
<!--==============================header=================================-->
     <div class="container_12">
        <div class="grid_12">
      
     <div class=" " style="margin-top:60px;" >
     
         <a href="map.html?cmd=inithome"><img src="images/smartLehrenlogo.png" alt="smartLehren" width="400" height="90"></a>      
         
            <div class="clear"></div>
            
  </div>
   <div class="h_address" style="float:left;" >      
    <address style="font-family:'Times New Roman', Times, serif; font-size:17px; line-height:30px;">
      13241 WOODLAND PARK ROAD, <br>
      SUITE 110, HERNDON,<br>
       VIRGINIA 20171, USA<br>
	   <i class="fa fa-envelope mail"></i>: <a href="mailto:info@digiblitz.com">sales@smartlehren.com</a><br>
       <!-- img class="phone" src="images/phone_icon.png">: 703-956-2530 -->
    </address>
  </div>   
  <div class="clear"></div>    
 
<div class="links">
<a target="_blank" href="https://digiblitz.com/community/" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Community</a><a target="_blank" href="https://www.digiblitz.com/support/?cat=2" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Help</a><a href="#loginmodal" id="modaltrigger" style="text-decoration:none; font-family:'Times New Roman', Times, serif; line-height:20px;">log in</a></div>
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
	  <img src="images/log.jpg" alt="login" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="submit"  value="Log In" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"></span>
     &nbsp;&nbsp;&nbsp; <span>
	  <img src="images/Cancel.png" alt="cancel" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="button"  value="Cancel" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="location.href='login.html?cmd=initok'"></span></div>
					 <br>
<div class="usersignup" style="font-family:'Times New Roman', Times, serif;">
<a href="login.html?cmd=initregister">New User SignUp</a>
<a href="login.html?cmd=initforgetpassword" style="margin-left:28px;">Forgot your password?</a>
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
<%String firstname=(String)request.getAttribute("firstname"); %>
<%String lastname=(String)request.getAttribute("lastname"); %>
<%String e_mail=(String)request.getAttribute("e_mail"); %>
<%String companyname=(String)request.getAttribute("companyname"); %>
<%String cmid=(String)request.getAttribute("cmid"); %>
<%String subscription_id=(String)request.getAttribute("subscription_id"); %>
<%String subscription_type=(String)request.getAttribute("subscription_type"); %>
<%String order_id=(String)request.getAttribute("order_id"); %>
<%String customerid=(String)request.getAttribute("customerid"); %>
<%String plantype=(String)request.getAttribute("plantype"); %>
<%String reason=(String)request.getAttribute("reason"); %>
<%System.out.println("signupdetails---->"+plantype); System.out.println("signupdetails---->"+reason); %>



<div class="content">
   <div class="container_12 ">
       <div class="grid_12">
	   
	   
	   
	   <div style="text-align:center; font-weight:bold; font-size:24px; color:#b70000;">Sorry, your registration has failed.</div>
         
		 <form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/7feb15e5af47943b0b02a8269d85c3c7" class="infusion-form" style="display:none;" id="signfailure" method="POST" name="Credit card Details validation
- Failure Scenario" onSubmit="var form = document.forms[0];
var resolution = document.createElement('input');
resolution.setAttribute('id', 'screenResolution');
resolution.setAttribute('type', 'hidden');
resolution.setAttribute('name', 'screenResolution');
var resolutionString = screen.width + 'x' + screen.height;
resolution.setAttribute('value', resolutionString);
form.appendChild(resolution);
var pluginString = '';
if (window.ActiveXObject) {
    var activeXNames = {'AcroPDF.PDF':'Adobe Reader',
        'ShockwaveFlash.ShockwaveFlash':'Flash',
        'QuickTime.QuickTime':'Quick Time',
        'SWCtl':'Shockwave',
        'WMPLayer.OCX':'Windows Media Player',
        'AgControl.AgControl':'Silverlight'};
    var plugin = null;
    for (var activeKey in activeXNames) {
        try {
            plugin = null;
            plugin = new ActiveXObject(activeKey);
        } catch (e) {
            // do nothing, the plugin is not installed
        }
        pluginString += activeXNames[activeKey] + ',';
    }
    var realPlayerNames = ['rmockx.RealPlayer G2 Control',
        'rmocx.RealPlayer G2 Control.1',
        'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
        'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
        'RealPlayer'];
    for (var index = 0; index &lt; realPlayerName.length; index++) {
        try {
            plugin = new ActiveXObject(realPlayerNames[index]);
        } catch (e) {
            continue;
        }
        if (plugin) {
            break;
        }
    }
    if (plugin) {
        pluginString += 'RealPlayer,';
    }
} else {
    for (var i = 0; i &lt; navigator.plugins.length; i++) {
        pluginString += navigator.plugins[i].name + ',';
    }
}
pluginString = pluginString.substring(0, pluginString.lastIndexOf(','));
var plugins = document.createElement('input');
plugins.setAttribute('id', 'pluginList');
plugins.setAttribute('type', 'hidden');
plugins.setAttribute('name', 'pluginList');
plugins.setAttribute('value', pluginString);
form.appendChild(plugins);
var java = navigator.javaEnabled();
var javaEnabled = document.createElement('input');
javaEnabled.setAttribute('id', 'javaEnabled');
javaEnabled.setAttribute('type', 'hidden');
javaEnabled.setAttribute('name', 'javaEnabled');
javaEnabled.setAttribute('value', java);
form.appendChild(javaEnabled);">
<input name="inf_form_xid" type="hidden" value="7feb15e5af47943b0b02a8269d85c3c7" /><input name="inf_form_name" type="hidden" value="Credit card Details validation
- Failure Scenario" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
<div class="default beta-base beta-font-b" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div class="text" id="webformErrors" name="errorContent">
</div>
<div>
<div class="text">
<div class="text" contentid="paragraph">
<div>
<div style="text-align: center;">
<span style="color: #000080; font-size: 12pt;">Welcome to smartLehren.</span>
</div>
<div style="text-align: center;">
<span style="color: #000000;">we wish you happy days ahead with our product.</span>
</div>
</div>
</div>
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_FirstName">First Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="<%=firstname%>"/>
</td>
</tr><tr>
<td class="infusion-field-label-container">
<label for="inf_field_LastName">Last Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_LastName" name="inf_field_LastName" type="text" value="<%=lastname%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=e_mail%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Company">Institution Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="Not Applicable"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_CustomerID0">Customer ID</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_CustomerID0" name="inf_custom_CustomerID0" type="text" value="<%=customerid%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_Subscriptiontype">Subscription Type</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_Subscriptiontype" name="inf_custom_Subscriptiontype" type="text" value="<%=subscription_type%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_PaymentPlan">Payment Plan</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_PaymentPlan" name="inf_custom_PaymentPlan" type="text" value="<%=plantype%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_Comments">validation failure reason *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<textarea cols="24" id="inf_custom_Comments" name="inf_custom_Comments" rows="5"><%=reason%></textarea>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:15px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button style="background-color:#F5F5F5; color:#000000; font-size:15px; font-family:Helvetica; border-color:#000000; border-style:Solid; border-width:1px; -moz-border-radius:3px;border-radius:3px;" type="submit" value="Ok. Proceed">Ok. Proceed</button>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</form>
	
	</div></div></div>
<footer>  
    
       <%@ include file = "../../include/footer.jsp" %>
      
  </footer>
</body>
</html>
