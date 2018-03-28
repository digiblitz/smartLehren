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
.td{ background-color: #EEEEEE; vertical-align:middle; margin-left:12px; vertical-align:middle;
}
.ts{ background-color: #ffffff; vertical-align:middle; vertical-align:middle;
}
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
     <header><div>
<!--==============================header=================================-->
     <div class="container_12">
        <div class="grid_12">
      <table><tr><td>  
     <div class=" " style="margin-top:60px;" >
     
        <a href="http://dbuniversity.smartlehren.com"><img src="images/smartLehrenlogo.png" alt="smartLehren" width="470" height="80"></a>      
           
            <div class="clear"></div>
            
  </div></td><td>
  <div class="h_address">
    <div class="h_phone">
      Call us:
      <span>+1-571-297-2288</span>
	  digiblitz Technologies
    </div>
    <address>
      20130 LakeView Center Plaza, <br>
      Suite 400, Ashburn,<br>
       VA 20147, USA<br>
	   E-mail:<a href="#">info@digiblitz.com</a>
    </address>
  </div></td></tr></table>
  <div class="clear"></div>    
 

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
  <div class="tabs">
             <div class="tabs">
             <div class="div-nav  ">
                <ul class="nav">
                      <li><a href="login.html?cmd=initaboutus"><span></span><strong></strong>About us  <br>&nbsp;</a></li>
                      <li><a href="login.html?cmd=initcertification"><span></span><strong></strong>Certification <br>&nbsp;</a></li>
                      <li><a href="login.html?cmd=initcp"><span></span><strong></strong>Certification  <br>Program</a></li>
                      <li><a href="login.html?cmd=inithelppage"><span></span><strong></strong>Help <br>&nbsp;</a></li>
                 </ul>
                 <div class="clear"></div>
             </div>
        
</div>


</div></div></div></div>
</header>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="grid_12">
       
      <div class="clear"></div>  
      <div id='cssmenu'>
<ul>
   
   <li><a href='qual.html?cmd=inithome'><span>Home</span></a></li>
   <li><a href='qual.html?cmd=whysmartlehren'><span>Why smartLehren</span></a></li>
   <li><a href='map.html?cmd=initgetstart'><span>Pricing</span></a></li>
   <li><a href="#loginmodal" id="modaltrigger"><span>Login</span></a></li>
   <li><a href='login.html?cmd=onlineedition'><span>Register</span></a></li>
   </ul></div>
      <div class="clear"></div>
     
   <div style="height:60px;color:#000000; font-size:24px; margin-top:20px;" align="center">Best in Breed Education Management platform for all your training needs</div>  
    <div class="clear"></div>
     
   <div style="color:#000066; font-size:16px;">
   <table width="100%" style=" border-color:#999999; border-style: solid; ">
   <tr class="tr"><td width="41%" class="td">Bundle Type</td>
   <td width="15%" class="td">#Included</td>
   <td width="16%" class="td">Criteria</td>
   <td width="14%" class="td">Cost per Bundle</td>
   <td width="14%" class="td">Usage Frequence</td>
   </tr>
   <tr class="tr"><td class="td">User: Faculty,Student,Corporate,Developer</td><td class="td">2</td><td class="td"></td><td class="td">150</td><td class="td">per month</td></tr>
   <tr class="tr"><td class="ts">Course</td><td class="ts">5</td><td class="ts"></td><td class="ts">30</td><td class="ts">per month</td></tr>
   <tr class="tr"><td class="td">Cloud Storage</td><td class="td">100</td><td class="td">GB</td><td class="td">100</td><td class="td">per year</td></tr>
   <tr class="tr"><td class="ts">Cloud ERP</td><td class="ts">50</td><td class="ts">Forms/Sreens</td><td class="ts">80</td><td class="ts">per month</td></tr>
   <tr class="tr"><td class="td">Process</td><td class="td">20</td><td class="td"></td><td class="td">90</td><td class="td">per month</td></tr>
   <tr class="tr"><td class="ts">Business Services</td><td class="ts"></td><td class="ts"></td><td class="ts">90</td><td class="ts">per month</td></tr>
   <tr class="tr"><td class="td">Cloud Asset/Artifact Management & Governance</td><td class="td"></td><td class="td"></td><td class="td">90</td><td class="td">per month</td></tr>
   <tr class="tr"><td class="ts">Cloud Based Business Inteligence & Analyst</td><td class="ts">1</td><td class="ts">BI Developer</td><td class="ts">200 call for pricing</td><td class="ts">per month</td></tr>
   <tr class="tr"><td class="td">Cloud Based Business Inteligence & Analyst Application integration</td><td class="td">5</td><td class="td">BI Consumer</td><td class="td">200 call for pricing</td><td class="td">per month</td></tr>
   </table></div>  
   <div class="clear"></div>
     
   <div  style="color:#000000; font-size:17px; margin-top:20px;" >You could purchase any of the bundles based on your requirements while you use any of our services </div>  
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

