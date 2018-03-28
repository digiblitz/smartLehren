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
    <title>Help</title>
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
     
           <a href="http://dbuniversity.smartlehren.com"><img src="images/DBU_logo.png" alt="" width="470" height="80"></a>      
          
     
              
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
      <h3 class="head1">Placing An Order</h3>
  
      
      <div class="text1">How do I enroll for digiBlitz training program?</div>
	  <div class="text1" style="color:#333333"><a href="#">Online</a></div>
      <p style="color:#333333; text-align:justify;">1. Visit our site at training.digiblitz.com to browse through the Live Online program to check out the courses offered by us. You can also download our learning path from anywhere from our site which is designed to help you make your choices easier and faster. The training brochure and schedule is available to download through all the web pages on our site.</p>
      <p style="color:#333333; text-align:justify;">2. The Course Categories option helps you to narrow down your choice based on the mode of delivery of the training.</p>
      <p style="color:#333333; text-align:justify;">3. A add to cart option is provided beneath each course. Once you add a course to the shopping cart, you will be redirected to register for training, if you are a new user.</p>
      <p style="color:#333333; text-align:justify;">4. Follow the on-screen instructions to complete your registration and order.</p>
      <p style="color:#333333; text-align:justify;">5. Post successful registration, an email notification will be sent with your order and account details.</p>
      <p style="color:#333333; text-align:justify;">6. You will also be required to read and acknowledge the training policies (details will be in the notification email) through fax or through post.</p>
      <p style="color:#333333; text-align:justify;">7. You will also receive an email notification if we cancel your reservation due to lack of payment.</p>
      <p style="color:#333333; text-align:justify;">8. These notifications serve as your receipt, so please print and save them for your records. If you do not receive email confirmation of your order within 24 hours, please e-mail us at cert.trng@digiblitzuniversity.com</p>
	  
	  <div class="text1" style="color:#333333"><a href="#">Why Register?</a></div>
	  <p style="color:#333333; text-align:justify;">Registering with digiBlitz University’s training program will eventually allow you to enroll into our learning management system. As a registered user you can create, manage and maintain your individual profiles, track your history of courses, track your performances, status of your training, order history, in-progress certifications, submit assignments and take assessments.</p>
      
	  
	  <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
	  <div class="text1">Paying for An Order</div>
	  <div class="text1" style="color:#333333"><a href="#">How do I make the payment for an order?</a></div>
	  <p style="color:#333333">You can use any of the below methods:</p>
	  <div class="text1">By Credit Card</div>
      <p style="color:#333333">digiBlitz currently accepts VISA, MasterCard, American Express and Discover.</p>
      <p style="color:#333333"> When you're registering online, be prepared to:</p>
      
	  <p style="color:#333333; text-align:justify;">1. Indicate the card type: VISA, Master Card, American Express or Discover.</p>
      <p style="color:#333333; text-align:justify;">2. Provide the cardholder's name as indicated on the card. For the transaction to be successful, the name and address you provide online must match the name and billing address on file for the credit card.</p>
      <p style="color:#333333; text-align:justify;">3. Provide the credit card number and expiration date.</p>
	  
	  
	  <div class="text1">By PayPal (If you already have a PayPal account)</div>
	  <p style="color:#333333; text-align:justify;">Use PayPal to check out quickly and securely. Look for the PayPal button at checkout.</p>
	  <div class="text1" style="color:#0000FF"><a href="#">How do I pay with PayPal?</a></div>
	  <p style="color:#333333">Here's how to shop online using PayPal:</p>
	  <p style="color:#333333; text-align:justify;">a. When you're ready to check out, choose the PayPal button.</p>
	  <p style="color:#333333; text-align:justify;"> b. Log in entering your email address and password and we'll process the payment without sharing any of your financial details.</p>
	  
	  <div class="text1" style="color:#0000FF"><a href="#">How secure is paying through PayPal?</a></div>
	  <p style="color:#333333; text-align:justify;">When you pay with PayPal, your financial information isn't shared with retailers. It is securely protected to minimize fraud and help safeguard your identity.</p>
	  
	   <div class="text1" style="color:#0000FF"><a href="#">Does it cost to pay with PayPal?</a></div>
	  <p style="color:#333333; text-align:justify;">It's free to sign up for a PayPal account. PayPal does not charge any fees when you pay for goods and services within the US using your account.</p>
	  <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
	  <div class="text1">Rescheduling or Cancelling a Registration</div>
	  <div class="text1" style="color:#333333"><a href="#">How can I re-schedule or cancel a course?</a></div>
	  <p style="color:#333333; text-align:justify;">1. In the event that the webinar/Live online Training/Seminar is postponed due to natural disaster or other cause beyond digiBlitzâ€™s control, we will make every effort to reschedule. Any registration payments made will automatically be applied to the rescheduled event. If you choose not to attend the rescheduled program, digiBlitz will provide a full refund upon written request from the registrant.</p>
	  <p style="color:#333333; text-align:justify;"> 2. We require a minimum of 8 to run a Live online training course, and the course may be cancelled by digiBlitz if the minimum number of attendees is not met.</p>
	  <p style="color:#333333; text-align:justify;"> 3. We require minimum of 50 attendees to run the onsite workshop/seminar, and the workshop/seminar may be cancelled by digiBlitz if the minimum number of attendees is not met.	    </p>
	  <p style="color:#333333; text-align:justify;">4. We allow a maximum of 100 attendees on the first come first served basis for seminar/workshop. Your order is therefore only valid when confirmed.	    </p>
	  <p style="color:#333333; text-align:justify;">5. We allow a maximum of 25 attendees on the first come first served basis for webinar/live online training. Your order is therefore only valid when confirmed.</p>
	  
	   <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
	  <div class="text1">My Learning Account</div>
	  <div class="text1" style="color:#333333"><a href="#">How do I get my learning account?</a></div>
      <p style="color:#333333; text-align:justify;">Once you have enrolled into our training program successfully, your details are shared with our training administrator who in turn will create a training account exclusively for you to create, manage and maintain your individual profile in our learning management system for the entire duration of your course completion.</p>
	  
	  <div class="text1" style="color:#333333"><a href="#">How do I update my personal information?</a></div>
      <p style="color:#333333; text-align:justify;">1. Choose your profile through the training website to log into the system with your account information.</p>
      <p style="color:#333333; text-align:justify;"> 2. Click View Profile in the left navigation bar an update the necessary information.</p>
      <p style="color:#333333; text-align:justify;"> Note: The private contact information you enter and update here will help us maintain your account and contact you with any relevant news and information. The information we gather from you will not be used outside of digiBlitz without your permission.</p>
	  
      <div class="text1" style="color:#333333"><a href="#">How do I change my password?</a></div>
      <p style="color:#333333; text-align:justify;">1. Choose your profile through the training website to log into the system with your account information.</p>
      <p style="color:#333333; text-align:justify;"> 2. Click View Profile in the left navigation bar.</p>
      <p style="color:#333333"> 3. Click change my password.</p>
      <p style="color:#333333"> 4. Click Save.</p>
	  
	   <div class="text1" style="color:#333333"><a href="#">How do I recover my password, if I forget?</a></div>
      <p style="color:#333333; text-align:justify;">1. Choose your profile through the training website to log into the system with your account information.</p>
      <p style="color:#333333"> 2. Once in the login page, please click on the link </p>
      <p style="color:#333333">3. Enter User Name and click go.</p>
      <p style="color:#333333"> 4. Your new password is sent to you via email.</p>
      <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
	  <div class="text1">Getting prepared for the Instructor- Led training</div>
	  <div class="text1" style="color:#333333"><a href="#">What are the pre-requisites to begin the class?</a></div>
      <p style="color:#333333; text-align:justify;">All the required learning materials will be provided during the online session unless anything specified otherwise.</p>
	  
	   <div class="text1" style="color:#333333"><a href="#">What preparation is needed before I start my class?</a></div>
      <p style="color:#333333; text-align:justify;">Preparation for training events is always helpful, but it is not required. If there are pre-requisite course requirements indicated in the course description, then those do apply and should be completed in advance of the class. Students are responsible for ensuring they have the proper prerequisite knowledge and skills before attending a course. All prerequisites are listed in the individual course descriptions.</p>
	  
	  <div class="text1" style="color:#333333"><a href="#">Can I also buy the course materials outside of digiBlitz?</a></div>
      <p style="color:#333333; text-align:justify;">No. All the learning materials are copyrighted to digiBlitz except for TOGAF which can be obtained from the open group website. You must enroll into the training program to have full access to our training materials.</p>
      <p style="color:#333333; text-align:justify;">There will be one set of training materials provided to you when your registration is confirmed and another set of materials will be sent to you as a conclusion of the training.</p>
      <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
     <div class="text1">Training Certification</div>
	  <div class="text1" style="color:#333333"><a href="#">What is Certificate of Training?</a></div>
	  <p style="color:#333333; text-align:justify;">See the digiBlitz University’s Certificate of training menu on the training website to understand our certificate of training program.</p>
	  
	  <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
	   <div class="text1">Training Infrastructure</div>
	  <div class="text1" style="color:#333333"><a href="#">How do I login to the training session?</a></div>
	  <p style="color:#333333; text-align:justify;">At digiBlitz University, to make your training sessions comfortable and easily accessible, we use Cisco WebEx Meeting center to deliver our training sessions. For every session, a meeting invite will be sent in advance with the login details. All you need is an internet connection to access and login either through a phone or a computer to start your session. You can chat with the other participant, ask questions, share your screens and listen to the session whenever you want to as they are recorded.</p>
	  <div>&nbsp;</div>
	  <div>&nbsp;</div>
	  
	   <div class="text1">Refund policy</div>
	  <div class="text1" style="color:#333333"><a href="#">Our Refund Policy / Satisfaction Guarantee </a></div>
	  <p style="color:#333333; text-align:justify;">At digiBlitz University, we strongly believe that the Live Training, Class Room Training, books, study programs, seminars and other materials that we provide are the best to available, and believe that if you use these materials/sessions as directed you will significantly change your life for the better. </p>
	 <p style="color:#333333; text-align:justify;">Liability for payment of fees arises at the time of booking. Where a cancellation in writing is made 10 (ten) days or more prior to the start of the program a refund or credit note will be issued for 100% of the course fee. Cancellations received less than 10 (ten) business days but before 2 (two) days prior to training start date will result in loss of 50% of training fees. After this time, liability for the full amount remains. No refunds will be given if cancelled within 2 (two) days of start date but digiBlitz University will accept substitute registrants. Payment is due in full at the time of registration. If you have any questions, please contact cert.trng@digiblitzuniversity.com  </p>
	 <p style="color:#333333; text-align:justify;">At digiBlitz University, we believe in providing best of the breed training to the best satisfaction of the students. So, we give opportunity for the students to walk away with up to 50% of the fee refunded if they are not satisfied.   </p>
	 <p style="color:#333333; text-align:justify; font-size:bold;">But with three conditions:  </p>
	 <p style="color:#333333; text-align:justify;">1. The student should have attended/completed all the sessions of the program and given detailed feedback for all the modules.</p>
	 <p style="color:#333333; text-align:justify;">2. Should have submitted all the assignment provided by the trainer for all the modules within 48 (forty eight) hours of completion. </p>
	 <p style="color:#333333; text-align:justify;">3. Should have attended up to 30% of the Class Room training.  </p>
	 <p style="color:#333333; text-align:justify;">The actual percentage of refund will be decided based on the internal assessment done on the feedback form and assignment. </p>
	 
	  <a href="#" style="color:#0000FF;border-bottom-color:#0000FF;border-bottom-style:groove;border-bottom-width:thin">https://support.webex.com/MyAccountWeb/systemRequirement.do?root=Tools&parent=System .</a>
    
   
   <div>&nbsp;</div>
    
    </div>
    
  </div>   
</div>
<!--==============================footer=================================-->
 <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
  
   
</body>
</html>
 
