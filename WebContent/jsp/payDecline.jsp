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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>smartLehren</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">

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


<style>



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
  width: 262px;
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


.details{
font-weight:bold;
color:#000;
float:left;
font-size:18px;
line-height:30px;
}

.value{
color:#158d8e;;
font-size:14px;
line-height:30px;
}

</style>


</head>

<body class="page1" id="top">
<header>

<div>
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
	   E-mail:<a href="mailto:sales@smartlehren.com">sales@smartlehren.com</a>
    </address>
  </div>   
  <div class="clear"></div>    
 
<div class="links">
<a target="_blank" href="https://digiblitz.com/community/" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Community</a><a target="_blank" href="https://www.digiblitz.com/support/?cat=2" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Help</a><a href="#loginmodal" id="modaltrigger" style="font-family:'Times New Roman', Times, serif; line-height:20px;">log in</a></div>
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
<%String e_mail=(String)request.getAttribute("emailId"); %>
<%String companyname=(String)request.getAttribute("companyname"); %>
<%String cmid=(String)request.getAttribute("cmid"); %>
<%String subscription_id=(String)request.getAttribute("subscription_id"); %>
<%String subscription_type=(String)request.getAttribute("subscription_type"); %>
<%String order_id=(String)request.getAttribute("order_id"); %>
<%String customerid=(String)request.getAttribute("customerid"); %>
<%String plantype=(String)request.getAttribute("plantype"); %>
<%String reason="Your credit card is invalid and no sufficient balance in your account"; %>
<%System.out.println("signupdetails---->"+plantype); System.out.println("signupdetails---->"+reason); %>
<%String msg=(String)request.getAttribute("msg"); %>
<%String lngMsg=(String)request.getAttribute("lngMsg");
String failmsg="Invalid Transaction, Please Try Again";
%>

<!--  form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/3dcf0ee078a3001fed28b6a55280df99" class="infusion-form" id="signfailure" style="display:none;" method="POST" name="Payment failure" onsubmit="var form = document.forms[0];
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
<input name="inf_form_xid" type="hidden" value="3dcf0ee078a3001fed28b6a55280df99" /><input name="inf_form_name" type="hidden" value="Payment failure" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
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
</tr>
<tr>
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
<input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="<%=companyname%>"/>
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
<%if(lngMsg != null){ %>
<td class="infusion-field-input-container" style="width:200px;">
<textarea cols="24" id="inf_custom_Comments" name="inf_custom_Comments" rows="5"><%=lngMsg%></textarea>
</td>
<%}else{ %>
<td class="infusion-field-input-container" style="width:200px;">
<textarea cols="24" id="inf_custom_Comments" name="inf_custom_Comments" rows="5"><%=failmsg%></textarea>
</td>
<%} %>
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
</form>-->

<div class="content">

  <div class="container_12 ">
    <%if(lngMsg != null){ %>
<div class="details" style="padding:30px 20px;font-size:1.8em;align:center;">Sorry! Your Payment is Declined <%=lngMsg %></div>
<%}else{ %>
<div class="details" style="padding:30px 20px;font-size:1.8em;align:center;">Sorry! Your Payment is Declined <%=failmsg %></div>
<%} %>   	   		
    
          
</div></div>

<footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer.jsp" %>
      </div>
      
  </footer>


</body>
</html>
