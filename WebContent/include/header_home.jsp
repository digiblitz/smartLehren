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
	 <script src="js/fontsize.js"></script>
    
     <script src="js/jquery.leanModal.min.js"></script>
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


$(function(){
  $('#demoform').submit(function(e){
    return true;
  });
  
  $('#modaldemo').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});



//------------------------DOSPACE--------------------------------------------------------------------------
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}
//-------------------function for character validation in Names------------------

	
function myFunction() {
	
	
    var x = document.getElementById("top");
	//alert('hi');
    if (x.style.color == "black" && x.style.backgroundColor == "white") {
		//alert(x.style.color);
        x.style.color = "yellow";
		x.style.backgroundColor = "black";

    } else {
        x.style.color = "black";
		x.style.backgroundColor = "white";
		
    }
}

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

function onValidateDemo()
{
	if(document.demoform.firstname.value==""){
		alert("Name cannot be empty");
		document.demoform.firstname.focus();
		return false;
	}
	if(Dospace(document.demoform.firstname.value)||((document.demoform.firstname.value.indexOf(' '))==0))
   { alert("Enter valid Name");
     document.demoform.firstname.focus();
   return false; }
   
   
 if(document.demoform.emailid.value==""){
		alert("Email cannot be empty");
		document.demoform.emailid.focus();
		return false;
	}
	if(Dospace(document.demoform.emailid.value)||((document.demoform.emailid.value.indexOf(' '))==0))
   { alert("Enter valid Email");
     document.demoform.emailid.focus();
   return false; }
   
  
 return true;
 
}

 
</script> 
		 
	<style type="text/css">
	
	
	.button {
    background-color: #e59859; /* Green */
    border: none;
    color: white;
    padding: 4px 5px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 0px 2px;
    cursor: pointer;
    }

	.button2 {background-color: #779f59;} /* Green */
	.button3 {background-color: #b70000;} /* Red */ 
	
	
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
		 <header>
		 
		 <div>
	<!--==============================header=================================-->
		 <div class="container_12">
		 <div class="grid_12">
		  <input type="hidden" id="clickcount" value="0">
			
			
		 
		 
		  <div class="logoo" style="margin-top:20px;width:80%;" >
		  <a href="map.html?cmd=inithome"><img src="images/smartLehrenlogo.png" style="float:left;" alt="Smartlehren" width="400" height="90"></a>
		 <div class="links" style="float:right; padding:0px 60px;">
	
	  <input type="submit" value="A-" class="button" id="btn-decrease"  style="font-family:'Times New Roman', Times, serif; ">
	  <input type="submit" value="A" class="button button2" id="btn-orig"  style="font-family:'Times New Roman', Times, serif; ">
	  <input type="submit" value="A+" class="button button3" id="btn-increase"  style="font-family:'Times New Roman', Times, serif; ">
	  <img src="images/color_contrast.png" style="width:30px; height:30px"></img>
	 
	
	   </div>	  
			 
				
	  </div>
	 

  <div class="h_address1" >   
 <h2 
 style="padding-top: 0px;margin-top:43px;font-size: 38px; font-family:'Times New Roman', Times, serif;text-transform: uppercase;line-height:50px;">
 A Software Platform </br>to build & Run a </br>"Smart University"</h2>
 
 <!-- div  class="avatar" ><img  src="jsp\LavlitaChatApp\images\lavlita.png"><a href="./ViewChatBox.html" style="color:#b70000!important;padding-top:10px;font-weight:bold;" >Chat with Lavlita.AI</a></div> -->
 </div>
	   <div class="clear"></div> 
<div style="margin-top: -94px;">	   
	 <div class="links" style="float:left; ">
 <a href="map.html?cmd=initgetstart" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Get Started</a>
 <!--<a href="#demomodal" id="modaldemo" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Demo Request</a>-->
 <a href="demoRequest.jsp" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Demo Request</a>
 <a href="sales.jsp" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Sales</a>
 </div>
 
	<div class="links">
<a target="_blank" href="https://digiblitz.com/community/" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Community</a>
<a target="_blank" href="https://www.digiblitz.com/support/?cat=2" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Help</a>
<a href="#loginmodal" id="modaltrigger" style="text-decoration: none; font-family:'Times New Roman', Times, serif; line-height:20px;">log in</a></div>
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
				
	
	</div>
	
	
	</div></div>
  
	  <div id="loginmodal" style="display:none;" >
   <%if(status != null){%>
     <div align="center" style="font-family:'Times New Roman', Times, serif; color:#FF0000;"><%=status %></div><%}%>
   <div align="center" style="font-size:28px; margin-bottom:20px; color:#7c8291; font-family:'Times New Roman', Times, serif;">User Login</div>
  
    <form id="loginform" name="loginform" method="post" action="./login.html" onSubmit="return onValidate()" >
	<input type="hidden" name="LoginProcess"  value="Process">
	 
      <label for="username" style="font-family:'Times New Roman', Times, serif;">Username:</label>
      <input type="text" name="username" id="username" class="txtfield" tabindex="1" style="font-family:'Times New Roman', Times, serif;">
      
      <label for="password" style="font-family:'Times New Roman', Times, serif;">Password:</label>
      <input type="password" name="password" id="password" class="txtfield" tabindex="2" style="font-family:'Times New Roman', Times, serif;">
      
      <div class="center"> 
	  <span>
	  <img src="images/log.jpg" alt="login" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="submit"  value="Log In" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"></span>
     &nbsp;&nbsp;&nbsp; <span>
	  <img src="images/Cancel.png" alt="cancel" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="button"  value="Cancel" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="location.href='login.html?cmd=initok'"></span></div>
					 <br>
<div class="usersignup" style="font-family:'Times New Roman', Times, serif;"><a href="login.html?cmd=initregister">New User SignUp</a>
<a href="login.html?cmd=initforgetpassword" style="margin-left:28px;">Forgot your password?</a>
</div>
    </form>
  </div>
	  
	  <div id="demomodal" style="display:none;" >
    <div align="center" style="font-size:28px; margin-bottom:20px; color:#7c8291; font-family:'Times New Roman', Times, serif;">Demo Request Form</div>
  
    <form id="demoform" name="demoform" method="post" action="./login.html" onSubmit="return onValidateDemo()" style="width:300px;">
	<input type="hidden" name="cmd"  value="demorequest">
	 
      <label for="username" style="font-family:'Times New Roman', Times, serif;">Name:</label>
      <input type="text" name="firstname" id="firstname" class="txtfield" tabindex="1" style="font-family:'Times New Roman', Times, serif;">
      
      <label for="password" style="font-family:'Times New Roman', Times, serif;">E_Mail:</label>
      <input type="text" name="emailid" id="emailid" class="txtfield" tabindex="2" style="font-family:'Times New Roman', Times, serif;">
	  
	   <label for="password" style="font-family:'Times New Roman', Times, serif;">Phone:</label>
      <input type="text" name="phone" id="phone" class="txtfield" tabindex="2" style="font-family:'Times New Roman', Times, serif;">
      
      <div class="center"> 
	  <span>
	  <img src="images/log.jpg" alt="login" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="submit"  value="Submit" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"></span>
     &nbsp;&nbsp;&nbsp; <span>
	  <img src="images/Cancel.png" alt="cancel" width="20px" height="20px" style="cursor:pointer"/>	  
	  <input type="button"  value="Cancel" tabindex="3"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="location.href='login.html?cmd=initok'"></span></div>
					 <br>

    </form>
  </div>
	  
	 
	</div></div></div>
	</header>
	
	</body>
	</html>
