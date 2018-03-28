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
  width: 300px;
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
.tr{background-color: #ffffff;  border-color:#ffffff; height:40px; 
}
.td{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset;
}
.ts{ background-color: #ffffff; vertical-align:middle; border:thin; border-color:#999999; border-style: inset;
}
.ta{background-color: #ffffff; vertical-align:middle; color:#CC0000; font-weight:bold; font-size:18px;
}
.te{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset; text-align:center; font-weight:bold;
}
.tc{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset; font-weight:bold;
}
.s1{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset; text-align:center; font-weight:bold;
}
.s2{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset; font-weight:bold;
}
.t1{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset; text-align:center; font-weight:bold;
}
.t2{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; border:thin; border-color:#999999; border-style: inset; font-weight:bold;
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
  </td></tr></table>
  <div class="clear"></div>    
  <h2>&nbsp;</h2>

   <div id="loginmodal" style="display:none;" >
    <div align="center" style="font-size:28px; margin-bottom:20px;">User Login</div>
    <form id="loginform" name="loginform" method="post" action="./login.html" onSubmit="return onValidate()" >
	<input type="hidden" name="LoginProcess"  value="Process">
	 
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" class="txtfield" tabindex="1">
      
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" class="txtfield" tabindex="2">
      
      <div class="center"> <label><img src="images/log.jpg" alt="login" width="20px" height="20px" style="cursor:pointer"/><input type="submit"  value="Log In" tabindex="3"  style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"></label>
      <label><img src="images/Cancel.png" alt="cancel" width="20px" height="20px" style="cursor:pointer"/><input type="button"  value="Cancel" tabindex="3"  style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onClick="location.href='login.html?cmd=initok'"></label></div>
	    <label>
              <input type="checkbox" name="checkbox" value="checkbox" />
              Remember username</label>
			  <label><a href="login.html?cmd=initforgetpassword">Forget your password?</a></label>
    </form>
  </div>
  </div></div></div>
</header>
<!--==============================Content=================================-->
<div class="content"><div style="background-color: #333333;">
<div class="container_12" >
<div id='cssmenu'>
<ul>
   
    <li><a href='qual.html?cmd=inithome'><span>Home</span></a></li>
   <li><a href='qual.html?cmd=whysmartlehren'><span>Why smartLehren</span></a></li>
   <li><a href='map.html?cmd=initgetstart'><span>Pricing</span></a></li>
   <li><a href="#loginmodal" id="modaltrigger"><span>Login</span></a></li>
   <li><a href='login.html?cmd=onlineedition'><span>Register</span></a></li>
   </ul></div>
      <div class="clear"></div>
     </div></div>
  <div class="container_12 ">
      <div class="">
       
      <div class="clear"></div>  
      
      <div class="clear"></div>
     
   <div style="color:#000000; font-size:24px; padding:30px; background-color:#EEEEEE; " align="center">Best in Breed Education Management platform for all your training needs</div>  
    <div class="clear"></div>
     
   <div style="color:#000066; font-size:16px;">
   <div  style=" background-color: #003399; color:#FFFFFF; vertical-align:middle; font-weight:bold; text-align:center; padding:10px;">SmartLehren (SAAS)</div>
   <table style="border:thin; border-color:#999999; border-style: inset;"   width="100%">
   
   <tr><td width="26%" class="t2">Subscription Model
   </td>
   <td width="15%" class="t2">Self Service Model</td>
   <td width="16%" class="t2">Self Service & Fully Automated Model</td>
   <td colspan="3" class="t2">Self Service, Fully Automated Model & Managed Services Model</td>
  
   </tr>
   <tr style="background-color:#FFFF66;"><td class="td">Subscription Type
   </td><td class="td" style="color:#FF0000;">Basic</td><td class="td" style="color:#FF0000;">Silver</td><td width="14%" class="td" style="color:#FF0000;">Gold</td>
   <td width="13%" class="td" style="color:#FF0000;">Platinum</td>
   <td width="16%" class="td" style="color:#FF0000;">Enterprise</td>
   </tr>
   <tr class="tr"><td class="t2">Subscription Price</td><td class="t2">$99 per month</td><td class="t2">$299 per month</td><td  class="t2">$1249 per month</td><td class="t2">$4999 per month</td><td rowspan="74" class="t1" valign="middle">Call for Pricing from our systems integration partners </td></tr>
     <tr class="tr" style=" background-color: #003399; color:#ffffff; vertical-align:middle; font-weight:bold; text-align:center;"><td colspan="5">Student & Course Management</td></tr>
	<tr class="tr"><td class="ta" colspan="5">Users</td></tr>
   <tr class="tr"><td class="tc">Student User</td><td class="te">5</td><td rowspan="3" valign="middle" class="tc">One Business User Bundle Included<span class="tooltip">User Bundle: $150/month<br>Faculty User:1 <br>Student User: 75</span></td><td  class="tc" rowspan="3">Three Business User Bundle Included</td><td class="tc" rowspan="3">Fifteen Business User Bundle Included</td></tr>
   <tr class="tr"><td class="tc">Corporate User</td><td class="te">1</td></tr>
   <tr class="tr"><td class="tc">Business Head User</td><td class="te">2</td></tr>
  
   <tr class="tr" ><td class="ta" colspan="5">IT/Business Engineering Users</td></tr>
   
  
   <tr class="tr"><td class="tc">Business Architect user</td><td class="te">-</td><td class="tc"  rowspan="6" valign="middle">One IT User Bundle Included</td><td class="tc" rowspan="6" valign="middle">Three IT User Bundle Included</td><td class="tc" rowspan="6" valign="middle">Fifteen IT User Bundle Included</td></tr>
   <tr class="tr"><td class="tc">Business / Process Analyst</td><td class="te">1</td></tr>
   <tr class="tr"><td class="tc">Systems Architect Login</td><td class="te">1</td></tr>
   <tr class="tr"><td class="tc">Systems Developer Login</td><td class="te">1</td></tr>
   <tr class="tr"><td class="tc">Systems Admin Login</td><td class="te">1</td></tr>
   <tr class="tr"><td class="tc">Systems Tester  Login</td><td class="te">1</td></tr>
   
   
   
   
   <tr class="tr"><td class="ta" colspan="5">E-Learning Courses</td></tr>
   <tr class="tr"><td class="tc">Text, html, video and pdf courses</td><td class="te">2</td><td class="tc"  rowspan="3" valign="middle">One Course Bundle Included</td><td class="tc" rowspan="3" valign="middle">Three Course Bundle Included</td><td class="tc" rowspan="3" valign="middle">Fifteen Course Bundle Included</td></tr>
   <tr class="tr"><td class="tc">Interactive & multimedia courses</td><td class="te">1</td></tr>
   <tr class="tr"><td class="tc">"Reference Material & other documents(video, infographics, presentation)"</td><td class="te">100</td></tr>
   
   <tr class="tr"><td class="ta" colspan="5">Virtual Classes</td></tr>
   <tr class="tr"><td class="tc">Web Cast & White Board Session</td><td class="te">1</td><td class="tc"  rowspan="3" valign="middle">One Virtual Class Room Bundle Included</td><td class="tc" rowspan="3" valign="middle">Three Virtual Class Room Bundle Included</td><td class="tc" rowspan="3" valign="middle">Fifteen Virtual Class Room Bundle Included</td></tr>
   <tr class="tr"><td class="tc">Sharing & Collaboration Users</td><td class="te">25</td></tr>
   <tr class="tr"><td class="tc">No of Sessions Recording Allowed</td><td class="te">100</td></tr>
  
    <tr class="tr"><td class="ta" colspan="5">Test, Assignment & Lab</td></tr>
   <tr class="tr"><td class="tc">Interactive Assignment / Lab</td><td class="te">1</td><td class="tc"  rowspan="4" valign="middle">One Virtual Class Room Bundle Included</td><td class="tc" rowspan="4" valign="middle">Three Virtual Class Room Bundle Included</td><td class="tc" rowspan="4" valign="middle">Fifteen Virtual Class Room Bundle Included</td></tr>
   <tr class="tr"><td class="tc">Descriptive Assignment / Lab</td><td class="te">5</td></tr>
   <tr class="tr"><td class="tc">No of Multiple Choice / Objective Tests</td><td class="te">5</td></tr>
   <tr class="tr"><td class="tc">No of Elaborative / Descriptive Tests</td><td class="te">1</td></tr>
   
   <tr class="tr"><td class="ta" colspan="5">Storage</td></tr>
   <tr class="tr"><td class="tc">&nbsp;</td><td class="te">50GB</td><td class="tc">One Storage Bundle Included</td><td class="tc">Three Storage Bundle Included</td><td class="tc">Fifteen Storage Bundle Included</td></tr>
    
	
	
	
	 <tr class="tr" style=" background-color: #003399; color:#ffffff; vertical-align:middle; font-weight:bold; text-align:center;"><td colspan="5">Business & Process Management</td></tr>
   <tr class="tr"><td class="ta" colspan="5">ERP</td></tr>
   <tr class="tr"><td class="s2">No. of Modules</td><td class="s1">1</td><td class="s2"  rowspan="3" valign="middle">One ERP Bundle Included</td><td class="s2" rowspan="3" valign="middle">Three ERP Bundle Included</td><td class="s2" rowspan="3" valign="middle">Fifteen ERP Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No. of Forms</td><td class="s1">10</td></tr>
   <tr class="tr"><td class="s2">No. of Screens</td> <td class="s1">40</td></tr>
   
   <tr class="tr"><td class="ta" colspan="5">Business Services</td></tr>
   <tr class="tr"><td class="s2">No. of Provider Services</td><td class="s1">2</td><td class="s1">30</td><td class="s2" rowspan="3" valign="middle">One Business Services Bundle Included</td><td class="s2" rowspan="3" valign="middle">Five Business Services Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No. of Consumer Services</td><td class="s1">6</td><td class="s1">100</td></tr>
   <tr class="tr"><td class="s2">No of Service Life Cycle Design Allowed</td><td class="s1">1</td><td class="s1">2</td></tr>
    
   <tr class="tr"><td class="ta" colspan="5">Process Automation</td></tr>
   <tr class="tr"><td class="s2">No of Single Instance Process</td><td class="s1">2</td><td class="s1">15</td><td class="s2" rowspan="3" valign="middle">One Business Services Bundle Included</td><td class="s2" rowspan="3" valign="middle">Five Business Services Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No of Multi-Instance Process</td><td class="s1">1</td><td class="s1">5</td></tr>
   <tr class="tr"><td class="s2">No of Process Life Cycle Design Allowed</td> <td class="s1">1</td><td class="s1">2</td></tr>
   
   
    <tr class="tr"><td class="ta" colspan="5">Asset/ Artifacts management & Governance</td></tr>
   <tr class="tr"><td class="s2">No of un-governed Assets/Artifacts</td><td class="s1">100</td><td class="s1">500</td><td class="s2" rowspan="2" valign="middle">One Asset/ Artifacts management Bundle Included</td><td class="s2" rowspan="2" valign="middle">Five Asset/ Artifacts management Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No of Governed Assets/Artifacts</td><td class="s1">-</td><td class="s1">50</td></tr>
   
    <tr class="tr"><td class="ta" colspan="5">Business intelligence & Analytics</td></tr>
   <tr class="tr"><td class="s2">No of Business Intelligence & Analytics Modeller Session</td><td class="s1">-</td><td class="s1">1</td><td class="s2" rowspan="2" valign="middle">One BI/ BA management Bundle Included</td><td class="s1" rowspan="2" valign="middle">Five BI/ BA management Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No of Business Intelligence & Analytics Consumer Session</td><td class="s1">1</td><td class="s1">5</td></tr>
  
  
  <tr class="tr"><td class="ta" colspan="5">Business Architecture Modeling Bundle</td></tr>
   <tr class="tr"><td class="s2">No of BA LifeCycle Design Allowed</td><td class="s1">-</td><td class="s1">1</td><td class="s2" rowspan="5" valign="middle">Business Architecture Modeling Bundle Included</td><td class="s2" rowspan="5" valign="middle">Five Business Architecture Modeling Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No of Business Mapping Allowed</td> <td class="s1">-</td><td class="s1">4</td></tr>
   <tr class="tr"><td class="s2">No. of Business of Process Units aligned</td> <td class="s1">-</td><td class="s1">1</td></tr>
   <tr class="tr"><td class="s2">No. of Business Reference Architecture</td><td class="s1">-</td><td class="s1">1</td></tr>
   <tr class="tr"><td class="s2">No of Blue Prints</td> <td class="s1">-</td><td class="s1">1</td></tr>
   
   <tr class="tr"><td class="ta" colspan="5">Enterprise Architecture Planning Bundle</td></tr>
   <tr class="tr"><td class="s2">No of EA frameworks</td><td class="s1">-</td><td class="s1">1</td><td class="s2" rowspan="7" valign="middle">One Enterprise Architecture Planning Bundle Included</td><td class="s2" rowspan="7" valign="middle">Five Enterprise Architecture Planning Bundle Included</td></tr>
   <tr class="tr"><td class="s2">No of EA LifeCycle Design Allowed</td><td class="s1">-</td><td class="s1">1</td></tr>
   <tr class="tr"><td class="s2">No. of Technical Reference Architecture </td><td class="s1">-</td><td class="s1">1</td></tr>
   <tr class="tr"><td class="s2">No of Business Processes  Alignment</td><td class="s1">-</td><td class="s1">1</td></tr>
   <tr class="tr"><td class="s2">No of  Business Services Alignment</td> <td class="s1">-</td><td class="s1">5</td></tr>
   <tr class="tr"><td class="s2">No of  Web/technical Services Alignment</td> <td class="s1">-</td><td class="s1">20</td></tr>
   <tr class="tr"><td class="s2">No of  Application component Alignment </td><td class="s1">-</td><td class="s1">100</td></tr>
   
   
   
   
   
    <tr class="tr" style=" background-color: #003399; color:#ffffff; vertical-align:middle; font-weight:bold; text-align:center;"><td colspan="5">Product Training & Support</td></tr>
   
   <tr class="tr"><td class="ta" colspan="5">Remote Technical Support & Training</td></tr>
   <tr class="tr"><td class="t2">Technical Support - Forum, FAQ & Email</td><td class="t1">FREE 24/7</td><td class="t1">FREE 24/7</td><td class="t1">FREE 24/7</td><td class="t1">FREE 24/7</td></tr>
   <tr class="tr"><td class="t2">Remote Training & Technical Support- Telephone, Chat, Remote Login & WebEx</td><td class="t1">-</td><td class="t2">One Remote Training & Support Bundle Included</td><td class="t2">Three Remote Training & Support Bundle Included</td><td class="t2">Seven Remote Training & Support Bundle Included</td></tr>
   <tr class="tr"><td class="t2">Training & Technical Support -Onsite</td> <td class="t1">-</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td></tr>
   
   <tr class="tr"><td class="ta" colspan="5">Business Engineering Technology Support</td></tr>
   <tr class="tr"><td class="t2">Online Support - Forum, FAQ & Email</td><td class="t1">-</td><td class="t1">FREE 24/7</td><td class="t1">FREE 24/7</td><td class="t1">FREE 24/7</td></tr>
   <tr class="tr"><td class="t2">Remote BET Support</td><td class="t1">-</td><td class="t1">-</td><td class="t1">-</td><td class="t1">-</td></tr>
   <tr class="tr"><td class="t2">BET Support -Onsite</td> <td class="t1">-</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td></tr>
   
   <tr class="tr" ><td class="ta" colspan="5">Application Integration(API)</td></tr>
   <tr class="tr"><td class="t2"></td><td class="t1">-</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td></tr>
   
   <tr class="tr" ><td class="ta" colspan="5">Database Integration</td></tr>
   <tr class="tr"><td class="t2"></td><td class="t1">-</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td><td class="t1">Call for Pricing</td></tr>
   
  
  
  
   <tr><td class="h"><a href="map.html?cmd=initbundles"><div style="background-color:#006600; color:#FFFFFF; text-align:center; padding:10px;">What are the Bundles?</div></a></td><td><a href="login.html?cmd=onlineedition"><div style="background-color:#006600; color:#FFFFFF; text-align:center; padding:10px;">Try Now</div></a></td><td><a href="login.html?cmd=onlineedition"><div style="background-color:#006600; color:#FFFFFF; text-align:center; padding:10px;">Try Now</div></a></td><td><a href="login.html?cmd=onlineedition"><div style="background-color:#006600; color:#FFFFFF; text-align:center; padding:10px;">Try Now</div></a></td><td><a href="login.html?cmd=onlineedition"><div style="background-color:#006600; color:#FFFFFF; text-align:center; padding:10px;">Try Now</div></a></td><td><a href="#"><div style="background-color:#006600; color:#FFFFFF; text-align:center; padding:10px;">Talk to me Now</div></a></td></tr>
   </table></div>  
   <div class="clear"></div>
     
   
      <div>&nbsp;</div> <div>&nbsp;</div>
    
        <div>&nbsp;</div> <div>&nbsp;</div>
        </div>
      </div>
  </div>   

<!--==============================footer=================================-->
 <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
   
  </footer>
  
</body>
</html>

