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
    <link rel="stylesheet" href="css/styleforprice.css">
    
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
     <script src="js/popup_view.js"></script>	
	<script>
		function tab(ele)
		{
			$(".pricing").removeClass("active");
			$("#"+ele).addClass("active")
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
@media screen and (min-width: 180px) {
    body {
        
    }
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
<!--==============================Header=================================-->
<div><%@ include file = "../../include/header_out.jsp" %></div>	
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12">
       <div class="" style="color:#334960;">
         
<section class="container">

<!-- <div id="beta" style="text-align:left;font-family: Verdana, Arial, Helvetica, sans-serif; font-size:20px; font-weight:bold; margin-left:-10px; padding:10px; margin-bottom:25px;  color:#158d8e;">

<a id="btn_21" href="javascript:void(0);" style="font-family:'Times New Roman', Times, serif;">BETA</a></div>
-->
<div class="pricing_table_wdg">
		<ul class="pricing" id="one" onMouseOver="tab('one')">
			<li style="background:#01bf9d;">Basic</li>
			<li>$99/<br><span style="font-size:12px;">per month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_1" style="background:none; border:none; padding:0; margin:0;">
			Student and Course Manangement</a></li>
			<li><a id="btn_2" style="background:none; border:none; padding:0; margin:0;">
			Functional and Process Management</a></li>
			<li><a id="btn_3" style="background:none; border:none; padding:0; margin:0;">
			Business Intelligence and Analytics</a></li>
			<li><a id="btn_4" style="background:none; border:none; padding:0; margin:0;">
			Business Architecture Management</a></li>
			<li><a id="btn_5" style="background:none; border:none; padding:0; margin:0;">
			Product Training and Support</a></li>
			
			<li style="border:none">
			<a style="width:35%; float:left; margin:10px;background:#01bf9d;" 
			href="map.html?cmd=inittryregister&type=trynow&plantype=basic&amount=99" class="buy_now">Try Now</a>
			
			<a style="width:35%; float:left; margin:10px;" 
			href="map.html?cmd=inittryregister&type=buynow&plantype=basic&amount=99&onetimecost=999" class="buy_now">Buy Now</a>
			</li>
			
			<!--<li><a href="" class="buy_now">Buy Now</a></li>-->
		</ul>
		
		<ul  class="pricing active" id="two" onMouseOver="tab('two')">
			<li style="background:coral;">Silver</li>
			<li>$299/<br><span style="font-size:12px;">per month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$1999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_6" style="background:none; border:none; padding:0; margin:0;">
			Student and Course Manangement</a></li>
			<li><a id="btn_7" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a id="btn_8" style="background:none; border:none; padding:0; margin:0;">
			Business Intelligence and Analytics</a></li>
			<li><a id="btn_9" style="background:none; border:none; padding:0; margin:0;">
			Business Architecture Management</a></li>
			<li><a id="btn_10" style="background:none; border:none; padding:0; margin:0;">
			Product Training and Support</a></li>
			<li style="border:none"><a style="width:50%; float:left; margin:10px 50px;" 
			href="map.html?cmd=inittryregister&type=buynow&plantype=silver&amount=299&onetimecost=1999" class="buy_now">Buy Now</a></li>
		</ul>
		
		<ul  class="pricing" id="three" onMouseOver="tab('three')">
			<li style="background:goldenrod;">Gold</li>
			<li>$1249/<br><span style="font-size:12px;">per month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$4999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_11" style="background:none; border:none; padding:0; margin:0;">
			Student and Course Manangement</a></li>
			<li><a id="btn_12" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a id="btn_13" style="background:none; border:none; padding:0; margin:0;">
			Business Intelligence and Analytics</a></li>
			<li><a id="btn_14" style="background:none; border:none; padding:0; margin:0;">
			Business Architecture Management</a></li>
			<li><a id="btn_15" style="background:none; border:none; padding:0; margin:0;">
			Product Training and Support</a></li>
			<li style="border:none"><a style="width:50%; float:left; margin:10px 50px;" 
			href="map.html?cmd=inittryregister&type=buynow&plantype=gold&amount=1429&onetimecost=4999" class="buy_now">Buy Now</a></li>
		</ul>
		
		<ul  class="pricing" id="four" onMouseOver="tab('four')">
			<li style="background:palevioletred;">Platinum</li>
			<li>$4999/<br><span style="font-size:12px;">per month</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff;">One Time Setup Cost<br><span style="font-size:13px;">$14999</span></li>
			<!--<li>Perfect for those getting started with our app.</li>-->
			<li>Features</li>
			<li><a id="btn_16" style="background:none; border:none; padding:0; margin:0;">
			Student and Course Manangement</a></li>
			<li><a id="btn_17" style="background:none; border:none; padding:0; margin:0;">Functional and Process Management</a></li>
			<li><a id="btn_18" style="background:none; border:none; padding:0; margin:0;">
			Business Intelligence and Analytics</a></li>
			<li><a id="btn_19" style="background:none; border:none; padding:0; margin:0;">
			Business Architecture Management</a></li>
			<li><a id="btn_20" style="background:none; border:none; padding:0; margin:0;">
			Product Training and Support</a></li>
			<li style="border:none"><a style="width:50%; float:left; margin:10px 50px;" 
			href="map.html?cmd=inittryregister&type=buynow&plantype=platinum&amount=4999&onetimecost=14999" class="buy_now">Buy Now</a></li>
		</ul>
		
		<ul  class="pricing" id="five" onMouseOver="tab('five')">
			<li style="background:#334960;">Enterprise</li>
			<li>&nbsp;<br><span style="font-size:12px;">&nbsp;</span></li>
			<li style="background:#000; padding:5px 7px; color:#fff; vertical-align:middle; height:36px;"><span style="vertical-align:middle; margin-top:20px;">Call For Pricing</span></li>
		
			
		<!--	<li>$120</li>
			<li>Perfect for those getting started with our app.</li>
			<li>15 Projects</li>
			<li>5GB Storage</li>
			<li>Unlimited Users</li>
			<li>No Time Tracking</li>
			<li>Enchaned Security</li>
			<li></li>-->
			<!--<li><a style="width:30%; float:left; margin:10px;background:#334960;" href="" class="buy_now">Try</a><a style="width:30%; float:left; margin:10px;" href="" class="buy_now">Buy</a></li>-->
		</ul>
		
	 <!-- <ul  class="pricing" id="six" onMouseOver="tab('six')">				
			<li style="border:none; background-color:#FFFFFF;">
       <a style="width:100px; float:left; margin:10px 25px;" target="_blank"
       href="http://74.208.110.192:8480/yes-shop/category/smartLehren" class="buy_now">Puchase more bundles</a></li>
	
		</ul> -->
</div>

<div style="width:100%; float:left; margin: 80px 0 0 0; font-size:25px; font-family:'Times New Roman', Times, serif;">
Click<a target="_blank"
       href="https://www.digiblitzonline2.com:8443/yes-shop/category/smartLehren" class="buy_now"> <span style="text-decoration: underline;">here</span> </a>to Purchase More Bundles
</div>
			
<div style="clear:both;"></div>
<div style="text-align:left; font-family:'Times New Roman', Times, serif; font-size:24px; font-weight:bold; padding:30px;  margin-left:-30px;">Note: Basic package starts with 30 days free trial</div>


	 <div id="popup_1" class="pop_up popup_hide">
        <h1>Student and Course Manangement</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User Bundle </h5>
                <div class="head">
                <p>Faculty User <span>1</span></p>
                <p>Student User <span>25</span></p>                
                <p>Corporate User <span>1</span></p>
                <p>Business Head User <span>1</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>IT/Business Engineering User Bundle </h5>
                <div class="head">
                <p>Business Architect user <span>-</span></p>
				<p>Business / Process Analyst <span>1</span></p>
                <p>Systems Architect Login <span>-</span></p>
				<p>Systems Developer Login <span>1</span></p>
                <p>Systems Admin Login <span>1</span></p>
				<p>Systems Tester  Login <span>1</span></p>             
                
                </div>
            </div>
             <div class="member1">
                <h5>Course Bundle </h5>
               <div class="head">
                <p>Text, html, video and pdf courses <span>2</span></p>
                <p>Interactive & multimedia courses <span>1</span></p>
                <p>"Reference Material & other documents<br>
					(video, infographics, presentation)"<span>100</span></p>             
             </div>
            </div>
			
			
             <div class="member1">
                <h5> Virtual Class Room Bundle </h5>
                <div class="head">
               <p>Web Cast & White Board Session <span>1</span></p>
                <p>Sharing & Collaboration Users <span>25</span></p>
                <p>No. of Sessions Recording Allowed <span>10</span></p> 
              
                </div>
            </div>
			
             <div class="member1">
                <h5>Test & Assignment Bundle </h5>
                <div class="head" style="height:115px;">
                <p>Interactive Assignment / Lab <span>1</span></p>
                <p>Descriptive Assignment / Lab <span>5</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>5</span></p>       
                <p>No. of Elaborative / Descriptive Tests <span>1</span></p> 
                </div>
            </div>
             <div class="member1">
                <h5>Storage Bundle</h5>
               <div class="head" style="height:115px;">
                <p>Storage Space<span>50 GB</span></p>
               
                </div>
            </div>
            
            <div class="member1">
                <h5>Student Bundle per Student per Exam</h5>
                <div class="head" style="height:115px;">             
                <p>No. of Multiple Choice / Objective Exams <span>5</span></p>       
                <p>No. of Elaborative / Descriptive Exams <span>1</span></p> 
                </div>
            </div>
            
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_2" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP Bundle</h5>
                <div class="head">
                <p>No. of Modules <span>1</span></p>
                <p>No. of Forms <span>10</span></p>
                <p>No. of Screens <span>40</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>2</span></p>
                <p>No. of Consumer Services <span>6</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>1</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>2</span></p>
                <p>No. of Multi-Instance Process <span>1</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>1</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
	<div id="popup_3" class="pop_up popup_hide">
        <h1>Business Intelligence and Analytics Bundle</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>-</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>1</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_4" class="pop_up popup_hide">
        <h1>Business Architecture Management </h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management <br>Bundle</h5>
                <div class="head">
                <p>No. of un-governed Assets/Artifacts <span>100</span></p>
                <p>No. of Governed Assets/Artifacts <span>-</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No. of BA LifeCycle Design Allowed <span>-</span></p>
                <p>No. of Business Mapping Allowed <span>-</span></p>
                <p>No. of Business of Process Units aligned <span>-</span></p>
                <p>No. of Business Reference Architecture <span>-</span></p>
                <p>No. of Blue Prints <span>-</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No. of EA frameworks <span>-</span></p>
                <p>No. of EA LifeCycle Design Allowed <span>-</span></p>
                <p>No. of Technical Reference Architecture <span>-</span></p>
                <p>No. of Business Processes Alignment <span>-</span></p>
                <p>No. of Business Services Alignment <span>-</span></p>
                <p>No. of Web/technical Services Alignment <span>-</span></p>
                <p>No. of Application component Alignment <span>-</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_5" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support and Training Bundle</h5>
                <div class="head">
				<p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support- Telephone, Chat, Remote Login & WebEx <span>-</span></p>
                <p>Training & Technical Support -Onsite <span>-</span></p>                                              </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support
</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support <span>-</span></p>
                <p>BET Support -Onsite <span>-</span></p>                
				
                </div>
            </div>  

             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>-</p>                
				
                </div>
            </div>            

             <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>-</p>                
				
                </div>
            </div>            			
           
        </div>
         </div>
        <div class="pop_up_close"></div>
        		
<div style="clear:both;"></div>

       
    </div>
    
    <!--Product Training and Support.-->	
	
	<!--Student course management-->
	
	


		<div id="popup_6" class="pop_up popup_hide">
        <h1>Student and Course Manangement</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User Bundle </h5>
                <div class="head">
                <p>Faculty User <span>1</span></p>
                <p>Student User <span>75</span></p>                
                <p>Corporate User <span>2</span></p>
                <p>Business Head User <span>3</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>IT/Business Engineering User Bundle </h5>
                <div class="head">
                <p>Business Architect user <span>1</span></p>
				<p>Business / Process Analyst <span>2</span></p>
                <p>Systems Architect Login <span>1</span></p>
				<p>Systems Developer Login <span>2</span></p>
                <p>Systems Admin Login <span>1</span></p>
				<p>Systems Tester  Login <span>1</span></p>             
                
                </div>
            </div>
             <div class="member1">
                <h5>Course Bundle </h5>
               <div class="head">
                <p>Text, html, video and pdf courses <span>10</span></p>
                <p>Interactive & multimedia courses <span>5</span></p>
                <p>"Reference Material & other documents<br>
					(video, infographics, presentation)"<span>100</span></p>             
             </div>
            </div>
			
			
             <div class="member1">
                <h5> Virtual Class Room Bundle </h5>
                <div class="head">
               <p>Web Cast & White Board Session <span>5</span></p>
                <p>Sharing & Collaboration Users <span>75</span></p>
                <p>No. of Sessions Recording Allowed <span>100</span></p> 
              
                </div>
            </div>
			
             <div class="member1">
                <h5>Test & Assignment Bundle </h5>
                <div class="head" style="height:115px;">
                <p>Interactive Assignment / Lab <span>5</span></p>
                <p>Descriptive Assignment / Lab <span>25</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>25</span></p>       
                <p>No. of Elaborative / Descriptive Tests <span>5</span></p> 
                </div>
            </div>
             <div class="member1">
                <h5>Storage Bundle</h5>
               <div class="head" style="height:115px;">
                <p>Storage Space<span>One Storage Bundle Included</span></p>
               
                </div>
            </div>
            
            <div class="member1">
                <h5>Student Bundle per Student per Exam</h5>
                <div class="head" style="height:115px;">             
                <p>No. of Multiple Choice / Objective Exams <span>5</span></p>       
                <p>No. of Elaborative / Descriptive Exams <span>1</span></p> 
                </div>
            </div>
            
            
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_7" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP Bundle</h5>
                <div class="head">
                <p>No. of Modules <span>2</span></p>
                <p>No. of Forms <span>50</span></p>
                <p>No. of Screens <span>200</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>30</span></p>
                <p>No. of Consumer Services <span>100</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>2</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>15</span></p>
                <p>No. of Multi-Instance Process <span>5</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>2</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_8" class="pop_up popup_hide">
        <h1>Business Intelligence and Analytics Bundle</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>1</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>5</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
	
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_9" class="pop_up popup_hide">
        <h1>Business Architecture Management </h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management <br>Bundle</h5>
                <div class="head">
                <p>No. of un-governed Assets/Artifacts <span>500</span></p>
                <p>No. of Governed Assets/Artifacts <span>50</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No. of BA LifeCycle Design Allowed <span>1</span></p>
                <p>No. of Business Mapping Allowed <span>4</span></p>
                <p>No. of Business of Process Units aligned <span>1</span></p>
                <p>No. of Business Reference Architecture <span>1</span></p>
                <p>No. of Blue Prints <span>1</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No. of EA frameworks <span>1</span></p>
                <p>No. of EA LifeCycle Design Allowed <span>1</span></p>
                <p>No. of Technical Reference Architecture <span>1</span></p>
                <p>No. of Business Processes Alignment <span>1</span></p>
                <p>No. of Business Services Alignment <span>5</span></p>
                <p>No. of Web/technical Services Alignment <span>20</span></p>
                <p>No. of Application component Alignment <span>100</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_10" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support and Training Bundle</h5>
                <div class="head">
				<p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support- Telephone, Chat, Remote Login & WebEx <span>One Remote Training & Support Bundle Included
</span></p>
                <p>Training & Technical Support -Onsite <span>Call For Pricing</span></p>                                              </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support <span>-</span></p>
                <p>BET Support -Onsite <span>Call For Pricing</span></p>                
				
                </div>
            </div>  

             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>Call For Pricing</p>                
				
                </div>
            </div>            

             <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>Call For Pricing</p>                
				
                </div>
            </div>            			
           
        </div>
         </div>
        <div class="pop_up_close"></div>
        		
<div style="clear:both;"></div>

       
    </div>
	
	<div id="popup_11" class="pop_up popup_hide">
        <h1>Student and Course Manangement</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User Bundle </h5>
                <div class="head">
                <p>Faculty User <span>3</span></p>
                <p>Student User <span>225</span></p>                
                <p>Corporate User <span>6</span></p>
                <p>Business Head User <span>9</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>IT/Business Engineering User Bundle </h5>
                <div class="head">
                <p>Business Architect user <span>3</span></p>
				<p>Business / Process Analyst <span>6</span></p>
                <p>Systems Architect Login <span>3</span></p>
				<p>Systems Developer Login <span>6</span></p>
                <p>Systems Admin Login <span>3</span></p>
				<p>Systems Tester  Login <span>3</span></p>             
                
                </div>
            </div>
             <div class="member1">
                <h5>Course Bundle </h5>
               <div class="head">
                <p>Text, html, video and pdf courses <span>50</span></p>
                <p>Interactive & multimedia courses <span>25</span></p>
                <p>"Reference Material & other documents<br>
					(video, infographics, presentation)"<span>500</span></p>             
             </div>
            </div>
			
			
             <div class="member1">
                <h5> Virtual Class Room Bundle </h5>
                <div class="head">
               <p>Web Cast & White Board Session <span>25</span></p>
                <p>Sharing & Collaboration Users <span>375</span></p>
                <p>No. of Sessions Recording Allowed <span>500</span></p> 
              
                </div>
            </div>
			
             <div class="member1">
                <h5>Test & Assignment Bundle </h5>
                <div class="head" style="height:115px;">
                <p>Interactive Assignment / Lab <span>25</span></p>
                <p>Descriptive Assignment / Lab <span>125</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>125</span></p>       
                <p>No. of Elaborative / Descriptive Tests <span>25</span></p> 
                </div>
            </div>
             <div class="member1">
                <h5>Storage Bundle</h5>
               <div class="head" style="height:115px;">
			   <p>Storage Space<span>Five Storage Bundle Included</span></p>
                              
                </div>
            </div>
            
            <div class="member1">
                <h5>Student Bundle per Student per Exam</h5>
                <div class="head" style="height:115px;">             
                <p>No. of Multiple Choice / Objective Exams <span>5</span></p>       
                <p>No. of Elaborative / Descriptive Exams <span>1</span></p> 
                </div>
            </div>
            
            
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_12" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP Bundle</h5>
                <div class="head">
                <p>No. of Modules <span>6</span></p>
                <p>No. of Forms <span>150</span></p>
                <p>No. of Screens <span>600</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>100</span></p>
                <p>No. of Consumer Services <span>300</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>5</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>50</span></p>
                <p>No. of Multi-Instance Process <span>10</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>2</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_13" class="pop_up popup_hide">
        <h1>Business Intelligence and Analytics Bundle</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>500</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>50</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_14" class="pop_up popup_hide">
        <h1>Business Architecture Management </h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management <br>Bundle</h5>
                <div class="head">
                <p>No. of un-governed Assets/Artifacts <span>500</span></p>
                <p>No. of Governed Assets/Artifacts <span>50</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No. of BA LifeCycle Design Allowed <span>5</span></p>
                <p>No. of Business Mapping Allowed <span>20</span></p>
                <p>No. of Business of Process Units aligned <span>5</span></p>
                <p>No. of Business Reference Architecture <span>3</span></p>
                <p>No. of Blue Prints <span>5</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No. of EA frameworks <span>2</span></p>
                <p>No. of EA LifeCycle Design Allowed <span>5</span></p>
                <p>No. of Technical Reference Architecture <span>5</span></p>
                <p>No. of Business Processes Alignment <span>5</span></p>
                <p>No. of Business Services Alignment <span>25</span></p>
                <p>No. of Web/technical Services Alignment <span>100</span></p>
                <p>No. of Application component Alignment <span>500</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_15" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support and Training Bundle</h5>
                <div class="head">
				<p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support- Telephone, Chat, Remote Login & WebEx
                <span>Three Remote Training & Support Bundle Included</span></p>
                <p>Training & Technical Support -Onsite <span>Call For Pricing</span></p>                                              </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support
</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support <span>-</span></p>
                <p>BET Support -Onsite <span>Call For Pricing</span></p>                
				
                </div>
            </div>  

             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>Call For Pricing</p>                
				
                </div>
            </div>            

             <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>Call For Pricing</p>                
				
                </div>
            </div>            			
           
        </div>
         </div>
        <div class="pop_up_close"></div>
        		
<div style="clear:both;"></div>

       
    </div>
	
	<div id="popup_16" class="pop_up popup_hide">
        <h1>Student and Course Manangement</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>User Bundle </h5>
                <div class="head">
                <p>Faculty User <span>15</span></p>
                <p>Student User <span>1125</span></p>                
                <p>Corporate User <span>30</span></p>
                <p>Business Head User <span>45</span></p>
                </div>
            </div>
             <div class="member1">
                <h5>IT/Business Engineering User Bundle </h5>
                <div class="head">
                <p>Business Architect user <span>15</span></p>
				<p>Business / Process Analyst <span>30</span></p>
                <p>Systems Architect Login <span>15</span></p>
				<p>Systems Developer Login <span>30</span></p>
                <p>Systems Admin Login <span>15</span></p>
				<p>Systems Tester  Login <span>15</span></p>             
                
                </div>
            </div>
             <div class="member1">
                <h5>Course Bundle </h5>
               <div class="head">
                <p>Text, html, video and pdf courses <span>150</span></p>
                <p>Interactive & multimedia courses <span>75</span></p>
                <p>"Reference Material & other documents<br>
					(video, infographics, presentation)"<span>1500</span></p>             
             </div>
            </div>
			
			
             <div class="member1">
                <h5> Virtual Class Room Bundle </h5>
                <div class="head">
               <p>Web Cast & White Board Session <span>75</span></p>
                <p>Sharing & Collaboration Users <span>1125</span></p>
                <p>No. of Sessions Recording Allowed <span>1500</span></p> 
              
                </div>
            </div>
			
             <div class="member1">
                <h5>Test & Assignment Bundle </h5>
                <div class="head" style="height:115px;">
                <p>Interactive Assignment / Lab <span>75</span></p>
                <p>Descriptive Assignment / Lab <span>375</span></p>
                <p>No. of Multiple Choice / Objective Tests <span>375</span></p>       
                <p>No. of Elaborative / Descriptive Tests <span>75</span></p> 
                </div>
            </div>
             <div class="member1">
                <h5>Storage Bundle</h5>
               <div class="head" style="height:115px;">
                <p>Storage Space<span>Fifteen Storage Bundle Included</span></p>
               
                </div>
            </div>
            
            <div class="member1">
                <h5>Student Bundle per Student per Exam</h5>
                <div class="head" style="height:115px;">             
                <p>No. of Multiple Choice / Objective Exams <span>5</span></p>       
                <p>No. of Elaborative / Descriptive Exams <span>1</span></p> 
                </div>
            </div>
            
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
		
	<!--functional process.-->
    
    <div id="popup_17" class="pop_up popup_hide">
        <h1>Functional and Process Management</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>ERP Bundle</h5>
                <div class="head">
                <p>No. of Modules <span>10</span></p>
                <p>No. of Forms <span>250</span></p>
                <p>No. of Screens <span>1000</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Business Services</h5>
                <div class="head">
                <p>No. of Provider Services <span>500</span></p>
                <p>No. of Consumer Services <span>1500</span></p>
                <p>No. of Service LifeCycle Design Allowed <span>25</span></p>
                
                </div>
            </div>
             <div class="member1">
                <h5>Process Automation</h5>
               <div class="head">
                <p>No. of Single Instance Process <span>250</span></p>
                <p>No. of Multi-Instance Process <span>50</span></p>
                <p>No. of Process LifeCycle Design Allowed <span>10</span></p>
               </div>
            </div>
             
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--functional process.-->
    
    
    <!--Business Intelligence.-->
    
    <div id="popup_18" class="pop_up popup_hide">
        <h1>Business Intelligence and Analytics Bundle</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Business Intelligence & Analytics</h5>
                <div class="head">
                <p>No. of Business Intelligence & Analytics Modeler Session <span>2500</span></p>
                <p>No. of Business Intelligence & Analytics Consumer Session <span>250</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Intelligence.-->
    
     <!--Business Architecture Management.-->
    
    <div id="popup_19" class="pop_up popup_hide">
        <h1>Business Architecture Management </h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Asset/ Artifacts management <br>Bundle</h5>
                <div class="head">
                <p>No. of un-governed Assets/Artifacts <span>2500</span></p>
                <p>No. of Governed Assets/Artifacts <span>250</span></p>
                </div>
            </div>
            
             <div class="member1">
                <h5>Business Architecture <br>Modeling Bundle</h5>
                <div class="head">
                <p>No. of BA LifeCycle Design Allowed <span>25</span></p>
                <p>No. of Business Mapping Allowed <span>100</span></p>
                <p>No. of Business of Process Units aligned <span>25</span></p>
                <p>No. of Business Reference Architecture <span>15</span></p>
                <p>No. of Blue Prints <span>25</span></p>
                </div>
            </div>
            
            <div class="member1">
                <h5>Enterprise Architecture <br>Planning Bundle</h5>
                <div class="head">
                <p>No. of EA frameworks <span>10</span></p>
                <p>No. of EA LifeCycle Design Allowed <span>25</span></p>
                <p>No. of Technical Reference Architecture <span>25</span></p>
                <p>No. of Business Processes Alignment <span>25</span></p>
                <p>No. of Business Services Alignment <span>125</span></p>
                <p>No. of Web/technical Services Alignment <span>500</span></p>
                <p>No. of Application component Alignment <span>2500</span></p>
                </div>
            </div>
        </div>
         </div>
        <div class="pop_up_close"></div>
       
    </div>
    
    <!--Business Architecture Management.-->
    
     <!--Product Training and Support.-->
    
    <div id="popup_20" class="pop_up popup_hide">
        <h1>Product Training and Support</h1>
        <div class="align">
        <div class="spacer"></div>
        <div class="membership">
            <div class="member1">
                <h5>Remote Technical Support and Training Bundle</h5>
                <div class="head">
				<p>Technical Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote Training & Technical Support- Telephone, Chat, Remote Login & WebEx 
                <span>
				Seven Remote Training & Support Bundle Included</span></p>
                <p>Training & Technical Support -Onsite <span>Call For Pricing</span></p>                                              </div>
            </div>
             <div class="member1">
                <h5>Business Engineering Technology Support
</h5>
                <div class="head">
                <p>Online Support - Forum, FAQ & Email <span>FREE 24/7</span></p>
                <p>Remote BET Support <span>One Remote BET Support Bundle Included</span></p>
                <p>BET Support -Onsite <span>Call For Pricing</span></p>                
				
                </div>
            </div>  

             <div class="member1">
                <h5>Application Integration(API)</h5>
                <div class="head">
                <p>Call For Pricing</p>                
				
                </div>
            </div>            

             <div class="member1">
                <h5>Database Integration</h5>
                <div class="head">
                <p>Call For Pricing</p>                
				
                </div>
            </div>            			
           
        </div>
         </div>
        <div class="pop_up_close"></div>
        		
<div style="clear:both;"></div>

       
    </div>
	<!--Student course management-->
	
	
	
	 <div id="popup_21" class="pop_up popup_hide">
        <h5 style="font-family:'Times New Roman', Times, serif;">It is an evolution from the previous version in terms of Fixing Bugs, Countering Errors, Improved Ease of Access and User Interface. We have added features that makes the user maximise his productivity to a greater scale.</h5>
        
        <div class="pop_up_close"></div>
        		
<div style="clear:both;"></div>

       
    </div>
	


</section>
 
		<script>
		var popupView = new popup();

		document.querySelector('#btn_1').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_1'));
		});

		document.querySelector('#btn_2').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_2'), function () {
				console.log('show do something');
			});
		});

		document.querySelector('#btn_3').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_3'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_4').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_4'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_5').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_5'), '', function () {
				console.log('CLOSE');
			});
		});
		
		document.querySelector('#btn_6').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_6'));
		});

		document.querySelector('#btn_7').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_7'), function () {
				console.log('show do something');
			});
		});

		document.querySelector('#btn_8').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_8'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_9').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_9'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_10').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_10'), '', function () {
				console.log('CLOSE');
			});
		});
		
		document.querySelector('#btn_11').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_11'));
		});

		document.querySelector('#btn_12').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_12'), function () {
				console.log('show do something');
			});
		});

		document.querySelector('#btn_13').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_13'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_14').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_14'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_15').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_15'), '', function () {
				console.log('CLOSE');
			});
		});
		
		document.querySelector('#btn_16').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_16'));
		});

		document.querySelector('#btn_17').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_17'), function () {
				console.log('show do something');
			});
		});

		document.querySelector('#btn_18').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_18'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_19').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_19'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_20').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_20'), '', function () {
				console.log('CLOSE');
			});
		});
		document.querySelector('#btn_21').addEventListener('click', function () {
			popupView.show(document.querySelector('#popup_21'), '', function () {
				console.log('CLOSE');
			});
		});


		</script>	
		
 	         
    
</div></div></div>

<!--==============================footer=================================-->
 <footer>  
     
       <%@ include file = "../../include/footer.jsp" %>
   
  </footer>
</body>
</html>
