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
     <title>About Us</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico">
     <link rel="shortcut icon" href="images/favicon.ico" />
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
     
         <a href="http://dbuniversity.smartlehren.com"><img src="images/DBU_logo.png" alt="smartlehren" width="470" height="80"></a>      
         
            <div class="clear"></div>
            
  </div></td><td>
  <div class="h_address">
    <div class="h_phone">
      Call us:
      <span>+1-571-297-2288</span>
	  digiblitz university
    </div>
    <address>
      20130 LakeView Center Plaza, <br>
      Suite 400, Ashburn,<br>
       VA 20147, USA<br>
	   E-mail:<a href="#">cert.trng@digiblitzuniversity.com</a>
    </address>
  </div></td></tr></table>
  <div class="clear"></div>    
 
<div class="links"><a href="login.html?cmd=initregister">register</a><a href="#loginmodal" id="modaltrigger">log in</a></div>
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
                      <li><a href="qual.html?cmd=initaboutus"><span></span><strong></strong>About us  <br>&nbsp;</a></li>
                      <li><a href="qual.html?cmd=initcertification"><span></span><strong></strong>Certification <br>&nbsp;</a></li>
                      <li><a href="qual.html?cmd=initcp"><span></span><strong></strong>Certification  <br>Program</a></li>
                      <li><a href="qual.html?cmd=inithelppage"><span></span><strong></strong>Help <br>&nbsp;</a></li>
                 </ul>
                 <div class="clear"></div>
             </div>
            


</div>


</div></div></div></div>
</header>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
       <div class="grid_8">
          <div>&nbsp;</div>
    <div class="text1">Training</div>
	  <p style="color:#000000; text-align:justify;">Our Enterprise Architecture Planning Certification Program provides various career options to our students at various levels including: Strategic Planning, Business Architecture Planning, Information Systems Architecture and Infrastructure Planning.

 </p>
 <p style="color:#000000; text-align:justify;">It is a myth that Enterprise Architecture is for people with Information Technology background or knowhow. The good news is that there are almost an equal numbers of options for individuals who are not from the IT industry.

 </p>
 <p style="color:#000000; text-align:justify;">We have career solutions for both an experienced individual in an industry who would like to make a shift of profile within the industry to an EAP related profile as well as for a fresher seeking a career path.

 </p>
 <p style="color:#000000; text-align:justify;">We offer both training Certification in various aspects of EAP and Business-Technology Landscape Transformation.
The following figure will help you understand the various career options available at various levels of an Enterprise Architecture firm.
  </p>
  
  <img src="images/training.jpg" alt="training" align="middle">
  <p style="color:#000000; text-align:justify;">An Insight into digiBlitz training philosophy, methodology, content development and much more.  </p>
<div class="text1">Learning made easy and accessible</div>
	  <p style="color:#000000; text-align:justify;">Whether your interest lies in obtaining a certificate of training covering the entire concepts of Business Transformation or to undertake individual courses, digiBlitz University provides you various choices to package the trainings as per your professional need. You can also choose the method of training that you are comfortable with - be it live online or face to face or through webcasts.
 </p>
 
  <div class="text1">Content Development</div>
	  <p style="color:#000000; text-align:justify;">The course contents are developed by some of the best industry experts, leaders and practitioners who carry real-time development and implantation experience in relevant subject areas.
 </p>
 
 <div class="text1">Our Philosophy</div>
	  <p style="color:#000000; text-align:justify;">At digiBlitz, we ensure that the students who enroll for the certification programs are well prepared for the job market. We provide the best preparation experience possible for our students to groom their knowledge and skills. Our well designed & extensive training program caters to all interested candidates.
 </p>
 
  <div class="text1">Our Methodology</div>
	  <p style="color:#000000; text-align:justify;"> digiBlitz University training methods are time tested and unique, so as to cover most important aspects of an expert learning program. We at DigiBlitz University take the students through comprehensive learning that gives them Philosophical, theoretical and practical knowledge of Enterprise Architecture, Business Transformation, Business Process management and Software Oriented Architecture. We follow a unique teaching methodology called "the PTP - Framework. Anything that is philosophically, spiritually and socially well understood and architected can be theoretically expressed and designed in one or more ways. Anything thus understood theoretically can be practically implemented in many ways.
 </p>

 

  

    
       </div>
        <div>&nbsp;</div>
  </div>   
</div>
<!--==============================footer=================================-->
 <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer.jsp" %>
      </div>
   
  </footer>
  
</body>
</html>

