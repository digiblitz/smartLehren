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
	 
	    
    <script type="text/javascript" src="https://ho192.infusionsoft.com/app/webTracking/getTrackingCode?trackingId=b592766f8ddb5fc8d319956c6b7b8ce6"></script>
    
    
    
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

function myFunction(){
	    
	var firstName = $("#inf_field_FirstName").val();
	var email = $("#inf_field_Email").val();
	var phone = $("#inf_field_Phone1").val();
	var company = $("#inf_field_Company").val();
	var description = $("#inf_custom_DescriptionOfNeed").val();
	
	$.get('login.html?cmd=contactUs', {
        	firstName : firstName,
			email : email,
			phone : phone,
			company : company,
			description : description
        }, function(response) {			
        	       
        });	
	
}

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
document.getElementById("contactus").submit();

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
    
    
	 
<style type="text/css">


.center { display: block; text-align: center; }

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

#loginform label { 
	display: block; 
	font-size:14px;
	font-weight: bold; 
	color: #7c8291;
	margin-bottom: 3px;
 }


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

#btn:hover{
	background-color: #696969;
}

#add{
	color: #696969;
}

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
<!--==============================Header=================================-->
<div><%@ include file = "../../include/header_out.jsp" %></div>
<!--==============================Content=================================-->

<%String name=(String)request.getAttribute("namee"); %>
<%String emailid=(String)request.getAttribute("emailidd"); %>
<%String phoneno=(String)request.getAttribute("phonenoo"); %>
<%String company=(String)request.getAttribute("companyy"); %>
<%String message=(String)request.getAttribute("messagee"); %>
<%String digiblitz=(String)request.getAttribute("digiblitz"); %>


<div class="content">
  <div class="container_12 ">
    <div class="grid_6">
      <h3 style="font-family:'Times New Roman', Times, serif;">Find us</h3>
            <div class="map">
            <figure class="">
<!--   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3107.3588922383806!2d-77.30654168511712!3d38.84714105751088!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b64e93db5fdbf5%3A0xd911516b41c73b60!2sdigiBlitz+Technologies+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1446292658737" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>   
 -->                          
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3102.759171003148!2d-77.40540988471282!3d38.952329851309486!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b6479363b7080d%3A0xf0ba0347f9e7a599!2s13241+Woodland+Park+Rd+%23110%2C+Herndon%2C+VA+20171%2C+USA!5e0!3m2!1sen!2sin!4v1463140827940" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe> 
              </figure><address style="font-family:'Times New Roman', Times, serif;">
                            <dl>
                                <dt class="text1" style="font-family:'Times New Roman', Times, serif;">
										13241 WOODLAND PARK ROAD,<br>
										SUITE 110, HERNDON,VIRGINIA 20171, USA                                   								   
                                </dt>
								<span id="add">                                                                
              <!--  <dd><span>E-mail:</span> <a href="mailto:sales@smartlehren.com" class="link-1">sales@smartlehren.com</a></dd> -->
                            </span></dl>
                         </address>
                         
          </div>
    </div>
    <div class="grid_6">
     <style type="text/css">
.beta-base .preheader, .beta-base .header, .beta-base .sidebar, .beta-base .body, .beta-base .footer, #mainContent {
    text-align: left;
}
.beta-base .preheader, .beta-base .header, .beta-base .body, .beta-base .sidebar, .beta-base .leftSidebar, .beta-base .rightSidebar, .beta-base .footer {
    margin: 0;
    padding: 0;
    border: none;
    white-space: normal;
    line-height: normal;
}
.beta-base .title, .beta-base .subtitle, .beta-base .text, .beta-base img {
    margin: 0;
    padding: 0;
    background: none;
    border: none;
    white-space: normal;
    line-height: normal;
}
.beta-base .bodyContainer td.preheader{
    padding: 10px 0;
}
.beta-base .bodyContainer td.header {
    padding: 0;
    height: 30px;
}
.beta-base .bodyContainer td.body, .beta-base .bodyContainer td.footer,
.beta-base .bodyContainer td.sidebar, .beta-base .bodyContainer td.leftSidebar, .beta-base .bodyContainer td.rightSidebar {
    padding: 20px;
}
.beta-base .bodyContainer td.header p, .beta-base .bodyContainer td.preheader p, .beta-base .bodyContainer td.body p,
.beta-base .bodyContainer td.footer p, .beta-base .bodyContainer td.sidebar p,
.beta-base .bodyContainer td.leftSidebar p, .beta-base .bodyContainer td.rightSidebar p {
    margin: 0;
    color: inherit;
}
.beta-base .bodyContainer td.header div.title, .beta-base .bodyContainer td.preheader div.title, .beta-base .bodyContainer td.body div.title,
.beta-base .bodyContainer td.footer div.title, .beta-base .bodyContainer td.sidebar div.title,
.beta-base .bodyContainer td.leftSidebar div.title, .beta-base .bodyContainer td.rightSidebar div.title,
.beta-base .bodyContainer td.header div.subtitle, .beta-base .bodyContainer td.preheader div.subtitle, .beta-base .bodyContainer td.body div.subtitle,
.beta-base .bodyContainer td.footer div.subtitle, .beta-base .bodyContainer td.sidebar div.subtitle,
.beta-base .bodyContainer td.leftSidebar div.subtitle, .beta-base .bodyContainer td.rightSidebar div.subtitle,
.beta-base .bodyContainer td.header div.text, .beta-base .bodyContainer td.preheader div.text, .beta-base .bodyContainer td.body div.text, .beta-base .bodyContainer td.body div.text div,
.beta-base .bodyContainer td.footer div.text, .beta-base .bodyContainer td.sidebar div.text,
.beta-base .bodyContainer td.leftSidebar div.text, .beta-base .bodyContainer td.rightSidebar div.text {
    overflow: auto;
}
.beta-base .optout {
    margin-bottom: 10px;
    margin-top: 10px;
}
div.infusion-captcha {
    width: 220px;
    padding: 10px;
}
div.infusion-captcha input, div.infusion-captcha select, div.infusion-captcha textarea {
    width: 95%;
    display: inline-block;
    vertical-align: middle;
}
table.infusion-field-container td.infusion-field-input-container input[type='text'],
table.infusion-field-container td.infusion-field-input-container input[type='password'],
table.infusion-field-container td.infusion-field-input-container textarea {
    width: 70%; /* must be 98% to make the snippet-menu line up due to border width */
    height:24px;
	margin: 0;
	font-family:'Times New Roman', Times, serif;
}
table.infusion-field-container td.infusion-field-input-container select {
    width: 101%;
    *width: 102%; /* this one for IE */
    margin: 0;
}
table.infusion-field-container td.infusion-field-label-container {
    padding-right: 5px;
	font-family:'Times New Roman', Times, serif;
}
td.header .image-snippet img {
    vertical-align: bottom;
}
#webformErrors {
    color: #990000;
    font-size: 14px;
}
html, body {
    margin: 0;
    padding: 0;
    height: 100%;
}
.infusion-form {
    margin: -15px;
    height: 100%;
}
.infusion-option {
    display: block;
    text-align: left;
	
}
</style>
<style type="text/css">
.beta-font-a h1, .beta-font-a h2, .beta-font-a h3, .beta-font-a h4, .beta-font-a h5, .beta-font-a h6 {
    font-family: Georgia, "Times New Roman", Times, serif;
}
.beta-font-a h1 {font-size: 24px;}
.beta-font-a h2 {font-size: 20px;}
.beta-font-a h3 {font-size: 14px;}
.beta-font-a h4 {font-size: 12px;}
.beta-font-a h5 {font-size: 10px;}
.beta-font-a h6 {font-size: 8px;}
.beta-font-a address {font-style: italic;}
.beta-font-a pre {font-family: Courier New, monospace;}
.beta-font-a .title, .beta-font-a .title p {
    font-weight:bold;
    font-size: 20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.beta-font-a .subtitle, .beta-font-a .subtitle p {
    font-size:14px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.beta-font-a .text, .beta-font-a .text p {
    font-size: 12px;
    font-family: arial,sans-serif;
}
.beta-font-a .preheader .text, .beta-font-a .preheader .text p {
    font-size: 11px;
    font-family: arial,sans-serif;
}
.beta-font-a .footer .text, .beta-font-a .footer .text p {
    font-size: 10px;
    font-family: verdana,sans-serif;
}
.beta-font-a .footer a {
    font-size: 11px;
    font-family: arial,sans-serif;
}
.beta-font-a .sidebar .title, .beta-font-a .leftSidebar .title, .beta-font-a .rightSidebar .title {
    font-size: 15px;
    font-weight: bold;
    font-family: arial,sans-serif;
}
.beta-font-a .sidebar .subtitle, .beta-font-a .leftSidebar .subtitle, .beta-font-a .rightSidebar .subtitle {
    font-size: 12px;
    font-family: arial,sans-serif;
}
.infusion-field-label-container {
    color: #000000;
    font-size: 14px;
    font-family: arial,sans-serif;
}
.infusion-field-input-container {
    font-size: 12px;
}
.infusion-option label {
    color: #000000;
    font-size: 14px;
    font-family: arial,sans-serif;
}
.block-item-2_heading strong span{ color:#333!important;}
</style>
<style type="text/css">
.custom-29 .background{
background-color:#333333;
;
}
.custom-29 .title{
color:#ffffff;
;
}
.custom-29 .subtitle{
color:#666666;
;
}
.custom-29 .text{
color:#ffffff;
;
}
.custom-29 a{
color:#a9a9a9;
;
}
.custom-29 .background .preheader .text{
color:#d4d4d4;
;
}
.custom-29 .background .preheader a{
color:#d4d4d4;
;
}
.custom-29 .header{
background-color:#d5d5d5;
;
}
.custom-29 .header .title{
color:#000000;
;
}
.custom-29 .header .subtitle{
color:#000000;
;
}
.custom-29 .header .text{
color:#000000;
;
}
.custom-29 .header .a{
color:#157DB8;
;
}
.custom-29 .hero{
background-color:#025C8D;
;
}
.custom-29 .hero .title{
color:#FFFFFF;
;
}
.custom-29 .hero .subtitle{
color:#FFFFFF;
;
}
.custom-29 .hero .text{
color:#FFFFFF;
;
}
.custom-29 .hero .a{
color:#157DB8;
;
}
.custom-29 .quote{
background-color:#013B5A;
;
}
.custom-29 .quote:after{
border-color:#013B5A transparent transparent transparent;
;
}
.custom-29 .quote .title{
color:#FFFFFF;
;
}
.custom-29 .quote .subtitle{
color:#FFFFFF;
;
}
.custom-29 .quote .text{
color:#FFFFFF;
;
}
.custom-29 .quote .a{
color:#157DB8;
;
}
.custom-29 .body{
background-color:#fff;
;
}
.custom-29 .body .title{
color:#ffffff;
;
}
.custom-29 .body .subtitle{
color:#ffffff;
;
}
.custom-29 .body .text{
color:#ffffff;
;
}
.custom-29 .body .a{
color:#157DB8;
;
}
.custom-29 .sidebar{
background-color:#ffffff;
;
}
.custom-29 .sidebar .title{
color:#ffffff;
;
}
.custom-29 .sidebar .subtitle{
color:#ffffff;
;
}
.custom-29 .sidebar .text{
color:#ffffff;
;
}
.custom-29 .sidebar .a{
color:#157DB8;
;
}
.custom-29 .leftSidebar{
background-color:#ffffff;
;
}
.custom-29 .leftSidebar .title{
color:#ffffff;
;
}
.custom-29 .leftSidebar .subtitle{
color:#ffffff;
;
}
.custom-29 .rightSidebar{
background-color:#ffffff;
;
}
.custom-29 .rightSidebar .title{
color:#ffffff;
;
}
.custom-29 .rightSidebar .subtitle{
color:#ffffff;
;
}
.custom-29 .footer{
background-color:#d5d5d5;
;
}
.custom-29 .footer .text{
color:#ffffff;
;
}
.custom-29 .footer .title{
color:#ffffff;
;
}
.custom-29 .footer a{
color:#a9a9a9;
;
}
.custom-29 .footer .subtitle{
color:#ffffff;
;
}
.custom-29 .infusion-field-label-container{
font-size:14px;
;
}
.custom-29 .infusion-field-label-container{
font-family:Arial;
;
}
.custom-29 .infusion-field-label-container{
color:#333;
}
.custom-29 .infusion-field-input{
font-size:14px;
;
}
.custom-29 .infusion-option label{
font-size:14px;
;
}
.custom-29 .infusion-option label{
font-family:Arial;
;
}
.custom-29 .infusion-option label{
color:#333;
;
}
.custom-29 .webFormBodyContainer{
border-width:0px;
;
}
.custom-29 .webFormBodyContainer{
border-style:Solid;
;
}
.custom-29 .webFormBodyContainer{
border-color:#ffffff;
;
}
.btnn{width:116px; height:30px; background-color:#779f59; cursor:pointer; color:#252525; font-size:14px; font-family:Helvetica; border-color:#272727; border-style:Solid; border-width:1px; -moz-border-radius:3px;border-radius:3px;}
.btnn:hover{
	background:#b70000;
	color:white;
	border:none;
}
</style>
<style type="text/css">
.infusion-field-label-container {
text-align:Left;
}
.infusion-field-label-container {
vertical-align:Middle;
}
.infusion-field-input-container {
width:300px;
}
.bodyContainer {
width:500px;
height:600px;
}
</style>
<script src="https://ho192.infusionsoft.com/app/webTracking/getTrackingCode?trackingId=b592766f8ddb5fc8d319956c6b7b8ce6&b=1.50.0.37" type="text/javascript">
</script>
<div class="text" id="webformErrors" name="errorContent">
</div>
<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/bfc8b67f81c8c3d48f37b9bfd8a38916" class="infusion-form" method="POST" name="Contact us form" onSubmit="var form = document.forms[0];
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
    for (var index = 0; index &lt; realPlayerNames.length; index++) {
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
<input name="inf_form_xid" type="hidden" value="bfc8b67f81c8c3d48f37b9bfd8a38916" /><input name="inf_form_name" type="hidden" value="Contact us form" /><input name="infusionsoft_version" type="hidden" value="1.50.0.37" />
<div class="custom-29 beta-base beta-font-a" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div>
<div class="text">
<div class="text" contentid="paragraph">
<div>
<h2 class="block-item-2_heading wow fadeInUp">
<span style="color: #ffffff;"><strong><span style="font-size: 12pt; font-family:'Times New Roman', Times, serif;">CONTACT US FOR DEMO & FREE CONSULTATION</span></strong></span>
</h2>
</div>
</div>
</div>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_FirstName">Name *</label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" required/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<input style="width:210px; height:25px;" class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="email" required/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Phone1">Phone *</label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<input class="infusion-field-input-container" id="inf_field_Phone1" name="inf_field_Phone1" type="text" pattern="^\d{10}$" required/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Company">Company *</label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" required/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_DescriptionOfNeed">Brief description of your requirement *</label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<input class="infusion-field-input-container" id="inf_custom_DescriptionOfNeed" name="inf_custom_DescriptionOfNeed" type="text" required/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_option_Ineedaconsultationformybusiness"></label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<span class="infusion-option"><input id="inf_option_Ineedaconsultationformybusiness" name="inf_option_Ineedaconsultationformybusiness" style="margin-right:3px;" type="checkbox" value="1105" /><label for="inf_option_Ineedaconsultationformybusiness" style="font-family:'Times New Roman', Times, serif;">I need a consultation for my business</label></span>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_option_IneedafreeDemo"></label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<span class="infusion-option"><input id="inf_option_IneedafreeDemo" name="inf_option_IneedafreeDemo" style="margin-right:3px;" type="checkbox" value="1107" /><label for="inf_option_IneedafreeDemo" style="font-family:'Times New Roman', Times, serif;">I need a free Demo</label></span>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:10px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_option_Iwouldliketoattendyourwebinar"></label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<span class="infusion-option"><input id="inf_option_Iwouldliketoattendyourwebinar" name="inf_option_Iwouldliketoattendyourwebinar" style="margin-right:3px;" type="checkbox" value="1109" /><label for="inf_option_Iwouldliketoattendyourwebinar" style="font-family:'Times New Roman', Times, serif;">I would like to attend your webinar</label></span>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:10px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_option_Addmetoyourmailinglist"></label>
</td>
<td class="infusion-field-input-container" style="width:300px;">
<span class="infusion-option"><input id="inf_option_Addmetoyourmailinglist" name="inf_option_Addmetoyourmailinglist" style="margin-right:3px;" type="checkbox" value="1111" /><label for="inf_option_Addmetoyourmailinglist" style="font-family:'Times New Roman', Times, serif;">Add me to your mailing list</label></span>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:20px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button class="btnn" type="submit" value="Submit" onClick="myFunction()" >Submit</button>
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
    </div>
  </div>   
</div>

<!--==============================footer=================================-->
 <footer>     
       <%@ include file = "../../include/footer.jsp" %>
	
  </footer>
  
</body>
</html>

