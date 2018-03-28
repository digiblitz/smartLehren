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
     <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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

#top{
background-color:white !important;

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

#demomodal {
    padding: 40px 50px;
  background: #f3f6fa;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
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
@media only screen and (max-width: 500px) {
    body {
       
    }	
	h2{
		 font-size: 1em;
	}
	
	.getstart a{
		font-size: 30px!important;
    top: 0!important;
    padding: 16px 32px!important;
    border-radius: 5px;
    margin: 10px 0;
	}
	.getstart a:hover{ color:#fff!important;}
	.getstart img{ margin-top:10px;}
	
}

 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}

</style>
      
     </head>

     <body class="page1" id="top">
     <%-- <%

   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
   %> --%>
	 <%
	String status=(String)request.getAttribute("status");
	if(status != null){
	 %>
	 
	<script>
    window.onload = function() {
	$('#modaltrigger').click();
     
    }
</script>

<%}%>
 <!--==============================Header=================================-->
<div><%@ include file = "../../include/header_home.jsp" %></div>	
	
<!--==============================Content=================================-->
<div class="content">
		  <div class="container_12">
			<!--   <div class="grid_12">
					<div style=" padding:10px 10px 30px 10px; color:#000; font-size:27px;" align="center">
					Use Coupon Code - 'AUG2016' and try our Product for 3 months free.
					</div> 
			</div> 
			   -->
			 
		   <div class="getstart">
			<img src="images/banner2.png" alt="smartlehren">
			<!--<a href="map.html?cmd=initgetstart" style="position: absolute;
    top: 27%;
    left: 3%;
    background: none no-repeat #e5df35;
    color: #000;
    padding: 15px 22px;
    font-size: 24px;
    font-weight: 600;">Get Started >></a>-->
		   </div>  

			 
		   <div style="color: #fff; line-height:30px;
    font-size: 20px;
    padding: 20px;
    background: #333;
    margin-top: 30px; text-align:center; font-family:'Times New Roman', Times, serif;
	display: inline-block;" >smartLehren is an all in one platform enabling you to wisely handled your university day to day administration and online course delivery. 
		   </div>  
		   <div class="clear"></div>
			
			<div class="container_12"  style="margin-top:30px;">
			<div class="grid_3 management" >
				<div >
					<div align="center">
						<img src="images/7.png" alt="Enrollment & Course Management" height="80">
					</div>
					<h4 >Enrollment & Course Management</h4>
	<h5 >The ad hoc process of managing the student enrollment, linking them with the training fee and lively tracking the course performance are executed with a click of your mouse button.</h5>
				</div>
			</div>
			<div class="grid_3 management" >
				<div >
					<div align="center">
						<img src="images/2.png" alt="Online Training Delivery & Management" height="80">
					</div>
					<h4>Online Training Delivery & Management</h4>
	<h5>Top tools facilitating online program delivery has been deputed to serve you better on all methodologies and platforms. With access live feeds, custom metrics and charts, it makes you organize the delivery process much better.</h5>
				</div>
			</div>
			<div class="grid_3 management">
				<div >
					<div align="center">
						<img src="images/3.png"  alt="Online Evaluation & Certification" height="80">
					</div>
					<h4>Online Evaluation & Certification</h4>
	<h5>Provides you a secured platform to host examinations and is handy to evaluate and derive the metrics. It bears special provisions for courses that demand higher credibility in the conduct and evaluation procedures.</h5>
				</div>
			</div>
			<div class="grid_3 management"  >
				<div>
					<div align="center">
						<img src="images/4.png" alt="Staff & Resourse Management" height="80">
					</div>
					<h4>Staff & Resourse Management</h4>
	<h5>You could be least concerned about improper or underutilization of the resources. Intellectual property, Study Materials, Staffs, Infrastructure, Accounts, Finance, and all most everything that you need to run your business is managed in just one interface.</h5>
				</div>
			</div>
			</div>
			
		  </div>
	 </div>
			</div>
		   </div>
		</div>
		</div>	

<!--==============================footer=================================-->
 <footer>
    
    
       <%@ include file = "../../include/footer.jsp" %>
   
   
  </footer>
  
  
  
</body>

</html>

