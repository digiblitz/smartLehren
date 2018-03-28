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
	     
	 <script>
	 $(function(){
  $('#loginform').submit(function(e){
    return true;
  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});

	 </script>
     
	 
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
  text-decoration: none;
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

#btn:hover{
	background-color: #696969;
}

#add{
	color: #696969;
}
.lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:20px;
	text-align: left;
	background-color:#FFFFFF;
	color:#000000;
	line-height:25px;
}

.text1{
	font-family:"Times New Roman", Times, serif;
}
</style>

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
   <div class="h_address" style="float:left;">      
    <address style="font-family:'Times New Roman', Times, serif; font-size:17px; line-height:30px;">
      13241 WOODLAND PARK ROAD, <br>
      SUITE 110, HERNDON,<br>
       VIRGINIA 20171, USA<br>
	   <i class="fa fa-envelope mail"></i>: <a href="mailto:info@digiblitz.com">sales@smartlehren.com</a><br>
      <!--  <img class="phone" src="images/phone_icon.png">: 703-956-2530-->
      <!-- div class="avatar" ><img  src="jsp\LavlitaChatApp\images\lavlita.png"><a href="./ViewChatBox.html" style="padding:10px 0px;">Chat with Lavlita.AI</a></div>-->
    </address>
  </div>   
  <div class="clear"></div>    
 
<div class="links">
<a target="_blank" href="https://digiblitz.com/community/" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Community</a><a target="_blank" href="https://www.digiblitz.com/support/?cat=2" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Help</a><a href="#loginmodal" id="modaltrigger" style="text-decoration: none; font-family:'Times New Roman', Times, serif; line-height:20px;">log in</a></div>
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
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
<div class="lab">
<div>&nbsp;</div>
<div style="text-align:center; font-size:30px; font-family:'Times New Roman', Times, serif; line-height:20px; text-decoration:underline;">PRIVACY POLICY</div>
<br>

<div class="text1">1. Declaration on Data Protection  </div>
<p align="justify">
digiBlitz appreciates your visit to our website and thank you for your interest in our company, 
our products and our services. Protection of your privacy and personal data is an important matter for us. 
In order to guarantee you a high level of transparency and security, our declaration on data protection as set
forth below will inform you as to the nature, scope and purpose of any collection, use and processing of information
 and data recorded by us.  In this respect, please keep in mind that this declaration on data protection refers only
 to the publicly accessible websites with the following Internet addresses/URLs of digiBlitz's Product sites: 
 <br><br>
 
(I) https://www.digiblitzonline.com:18443/smartlehren <br><br>

(II) https://www.digiblitzonline.com:8643/guildKraft <br><br>

(III) https://www.digiblitzonline.com:8843/menschforce <br><br>

(IV) https://www.digiblitzonline.com:8843/KlugWerks <br><br>

Our website also makes reference to third parties. As a rule, these are identified by stating the relevant Internet address or the company/product logo. digiBlitz has no influence whatsoever on the contents and design of sites of other providers and therefore cannot extend the warranties under this declaration on data protection to such sites. Nor does the fact that we refer to such sites mean that we adopt their contents as our own.</p>   

<div class="text1">2. Cookies</div>
<p align="justify">Our websites use so-called session cookies. These cookies deposit data for purposes of technical regulation in your browser's memory. However, they do not contain any personal data and are deleted after your browser is closed.  We do deposit cookies on your computer, which are not deleted after conclusion of the session. These make it possible to recognize your computer when the forums are next visited. Such cookies make it possible for us to adapt the website to your interests. 
<br><br>For U.S.-based visitors, we may also use cookies to present banners to you across the Internet based on your interest. With your consent, we store your password so that you do not have to re-enter it each time. 
Moreover, it is possible for you to set your browser such that cookies are rejected or you are informed prior to storage thereof.  Flash-Cookies or Local Shared Objects (LSO) will not be used by digiBlitz. Also Session Storage or DOM Storage will not be used.</p> 

<div class="text1">3. Communication-related and Use-related Data</div>
<p align="justify">Generally speaking, you may visit digiBlitz Partnership's website without us finding out who you are. Only for statistical and internal system-related purposes do we record the access time, the quantity of data transferred, the pages of ours that you visited, the page from which you accessed our website and the browser that you use (log files), in addition to you IP address. 
<br><br>To the extent that such information might enable conclusions in relation to personal data, these are naturally subject to the relevant statutory data protection provisions. The data is not personalized. The data is deleted following statistical evaluation.</p>
 
<div class="text1">4. Collection of Personal Data </div>
<p align="justify">In order to be able to utilize the offers made on our website, in particular, downloads, online forums, online applications, individual enquiries, registrations for our courses or registrations for other services, it is necessary that we obtain personal data from you. The personal data entails individual statements concerning personal and material relations pertaining to you, such as your name, your address or your e-mail address. 
<br><br>Such information is collected by us only if you provide it voluntarily and show us in this way that you agree to the use and processing thereof. In this respect, it goes without saying for us that such data is necessarily only collected where it is absolutely mandatory for implementation of the relevant offers. Where we request additional data, this occurs solely for purposes of, for example, facilitating communication with you or improving our service.</p>

<div class="text1">5. Use and Processing of Personal Data</div>
<p align="justify">As a rule, digiBlitz uses and processes the personal data provided for purposes of contractual settlement and processing your enquiries and requests.  Data with personal content is processed and used to a limited extent for customer management and marketing purposes, provided the relevant statutory provisions permit this. Should you no longer agree to such use, you may, of course, object to further use at any time.
<br><br>Moreover, your information provided to us may be combined with data on you that has already been stored by us. Such data combination has, inter alia, the advantage of keeping your customer data collected by us updated at all times, guaranteeing the accuracy of the collected information and being able to optimize our service to you.  We use and process your data outside these parameters only if you have expressly granted your prior consent thereto and only for purposes of which you have been advised. Thus, for example, you may stipulate in an online application whether we may review the application with respect to other positions in our company. Only in this event will we use such data for this purpose.</p>
 
<div class="text1">6. Forwarding of Data </div>
<p align="justify">digiBlitz does business globally. To this extent, in order to better process your matter, it might be necessary to forward your data to local subsidiaries or to local distribution partners, whose registered office might also be located in states outside the EU. However, such transmission takes place only within the group and only for the aforementioned purposes.  Naturally we do not forward your data to other third parties, unless we are obliged to do so by virtue of statutory provisions or judicial order.  In particular, your personal data shall not be sold, leased or exchanged.

<div class="text1">7. E-mail Contact</div>
<p align="justify">Should you provide us with your e-mail address, we will also communicate with you by e-mail. Should you no longer desire such information, it is naturally possible for you at any time to revoke your consent. In this case, please send us a short message to the given postal or e-mail address.</p>

<div class="text1">8. Participation in Forums</div>
<p align="justify">On our "digiBlitz Community" website, we offer you the possibility of participating in online forums. To this end, we require sufficient information in order to be able to clearly identify you so that, where applicable, we can meet our duty to subsequently identify authors of illegal content. Your personal data is not disclosed to other forum participants unless you have consented thereto in your user profile. 
<br><br>Please keep in mind that the texts published by you may be viewed in part by everyone without limitation on the Internet. To this extent, please observe our Terms of Use when registering for our online forums. Technical administration and hosting of the forums is conducted on our behalf and is controlled by us, in part, outside the EU as well.</p>

<div class="text1">9. Data Protection for Minors</div>
<p align="justify">The offers on this website are not directed at children. We therefore assume that we will not become aware of any personal data pertaining to children.</p>

<div class="text1">10. Technical and Organizational Data Protection</div>
<p align="justify">Naturally, digiBlitz takes those technical and organizational measures appropriate given the respective purpose of the data protection in order to protect the information provided by you against abuse and loss. Such data is stored in a secure operating environment that is not accessible to the public. In addition, each of our employees is naturally instructed on data protection and obliged to enter into a confidentiality covenant.</p>
 
<div class="text1">11. E-Mails to digiBlitz</div>
<p align="justify">Because of tax requirements digiBlitz has to archive e mails for ten years in some countries. The e mail system of digiBlitz and other members of the digiBlitz Group are intended to be used only for business purposes.</p>

<div class="text1">12. Modification of the Declaration on Data Protection</div>
<p align="justify">As a result of the ongoing development of the Internet, it will be necessary to adapt this declaration on data protection to changing conditions on an ongoing basis. Timely notice of such modification shall be given on this page.</p>
 
<div class="text1">13. Procedural List</div>
<p align="justify">You may obtain a general overview of the purpose for which and the group of persons on which digiBlitz collects, processes and uses personal data in the public Procedural List shown on this website.</p>
 
<div class="text1">14. Information and Other Rights, Contact</div>
<p align="justify">Upon written request, our data protection officer would be happy to provide you with information as to whether - and if so, which - personal data we store in relation to you. Should your personal data be incorrect, you may have this rectified immediately. Naturally any such information or modification is free of charge.  Moreover, you are entitled to revoke your consent to use of data in the future, in whole or in part. 
<br><br>Should you desire this, we will delete or block your relevant data.  In order to assert such rights, please contact digiBlitz data protection officer. Naturally, you may contact digiBlitz data protection officer directly at any time should you have questions, comments or complaints in connection with this declaration on data protection: digiBlitz Data Protection Officer Saravanan Kailasam</p>

<p align="justify" style="color:#0000CD	">  
digiBlitz Inc.<br>
13241 WOODLAND PARK ROAD,<br>
SUITE 110, HERNDON, VIRGINIA 20171,<br>
USA.
</p>

</div></div></div>
<!--==============================footer=================================-->
 <footer>
       <%@ include file = "../../include/footer.jsp" %>
	 
  </footer>
  
</body>
</html>

