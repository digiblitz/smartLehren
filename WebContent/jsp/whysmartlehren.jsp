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
    padding: 15px 20px;
  background: #f3f6fa;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  text-decoration: none;
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
<!--==============================Header=================================-->
<div><%@ include file = "../../include/header_out.jsp" %></div>	
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
       <div class="grid_12">
        <div class="alignn">
			<div class="align" align="center" style="font-family:'Times New Roman', font-size:20px; Times, serif; line-height:30px;">Transform your university into a Smart University by automating day-day adhoc functions and introduce more digital equipments and Internet of Things.
   			</div>
			 <div style="font-family:'Times New Roman', Times, serif; font-size:16px; line-height:30px; color: #333; padding: 10px 52px; text6-a6l66i6gn: justify;">smartLehren is powered by digiBlitz IOT platform that helps to transform your university into a smart University. This is achieved by introducing smart & automated processes across the business units like marketing, HR, student enrollments, Academics and operational processes. Apart from the business automation, we help in bridging the digital divide between the university and the "Internet of Things" revolution i.e. helping the university in adopting the digital gadgets, making way for "connected-campus", Social Radio/TV, e-learning to smart-learning, more Autonomous program delivery etc.</div>
		</div>  
    	<div class="clear"></div>
  		
		<div class="grid_6">
  		<div id="column">
      		<div class="subnav">
			<div class="back" >
				<h2 style="font-family:'Times New Roman', Times, serif;">SMART & AUTOMATED PROCESS MANAGEMENT</h2>
			</div>
				<ul style="font-size:15px; font-family:'Times New Roman', Times, serif; line-height: 30px;">
				  <li><a>Automation Modeling of processes</a></li>
				  <li><a>Smart Governance Enforcement</a> </li>
					<li><a>Smart Students Portfolio Management</a></li>
					  <li><a>Agile ERP and CRM Integration</a></li>
					 <li><a>"Internet of Things" Lifecycle management and Integration with operational processes across many Business units</a> </li>
					 <li><a>Align your IOT / digitalization practices within the BU or the entire organization</a></li>
					  <li><a>Align IOT assets with business through LifeCycle orchestration</a> </li>
					  <li><a>Get reports at Executive, Business and Operational levels by switching to different view points</a></li>
						  <li><a>Transform your business through Business Architecture lifecycle and Blueprinting</a></li>
					
				</ul>
      		</div>
      
   		 </div>
		 </div>
		 
		 <div class="grid_6">
  		<div id="column">
      		<div class="subnav">
			<div class="back">
				<h2 style="background:#158d8e; font-family:'Times New Roman', Times, serif;">SMART E-LEARNING PLATFORM</h2>
			</div>
				<ul style="font-size:15px; font-family:'Times New Roman', Times, serif;  line-height: 30px;">
				  <li><a>Smart Online learning platform</a></li>
				  <li><a>Smart Social Media Integration</a> </li>
					<li><a>Smart Student Portfolio Management</a></li>
					  <li><a>Smart University Resource/Asset management</a></li>
					 <li><a>Automated Task submission and Scoring</a> </li>
					 <li><a>Automated Enrolment Management</a></li>
					  <li><a>Automated & Smart Test/Exam delivery Management</a> </li>
					  <li><a>Smart E-Learning Materials publishing</a></li>
				      <li><a>Smart Library Items & materials management through unified sensors, cameras and electronic gadgets communications</a></li>
					  <li><a>Smart Inventory Management</a></li>
					
				</ul>
      		</div>
      
   		 </div>
		 </div>
  		
  		<div class="clear"></div>

  		 </div>
        
  </div>   
</div>
		
		
		<div class="content" style="min-height:auto; margin-bottom:50px; padding:20px 0;">
			
		  <div class="container_12 ">
		  	<h2 style="color:#333; font-size:25px; margin-bottom:60px; font-family:'Times New Roman', Times, serif;">WHAT IS BEST ABOUT SMARTLEHREN?</h2>
			   <div class="grid_12">
			   		<div id="introblocks" class="hoc"> 
						<!-- ################################################################################################ -->
						<ul class="nospace" style="font-family:'Times New Roman', Times, serif;">
						  <li >
							<article><i class="clg clg-planet-earth5"></i>
							  <h4 class="heading underline center"><a style="font-family:'Times New Roman', Times, serif;">E_Learning</a></h4>
							  <h6 style="font-family:'Times New Roman', Times, serif;"style="font-family:'Times New Roman', Times, serif;">Training tools</h6>
							  <p>Deliver the training through live webinars. Use Audio & Video files, Presentations, PDFs, Text documents, Spread sheets and Infographics as course materials.</p>
							  <div class="bor"></div>
							   <h6 style="font-family:'Times New Roman', Times, serif;">Assessment methodologies </h6>
							  <p>You could prepare and conduct evaluations in the form of Objective, Descriptive, Multiple choice type questions and assignments.</p>
							   <div class="bor"></div>
							  
							  
							  <h6 style="font-family:'Times New Roman', Times, serif;">Course Administration</h6>
							  <p>Validate applications, Collect Documents, Enroll students, Assign faculties, Schedule classes & Exams and Monitor Course progress. All in just one Dashboard. </p>
							   <div class="bor"></div>
							  
							  <h6 style="font-family:'Times New Roman', Times, serif;">Key tools</h6>
							  <p>Have access to the most essential tools for LMS: White Board, Web sessions and video streaming, Library, Discussion forum, Text chatting and Plagiarism checker.</p>
							   <div class="bor"></div>
							  
							</article>
						  </li>
						  <li>
							<article><i class="clg clg-monument26"></i>
							  <h4 class="heading underline center"><a style="font-family:'Times New Roman', Times, serif;">Administration</a></h4>
							  <h6 style="font-family:'Times New Roman', Times, serif;">Complete University governance </h6>
							  <p>Intellectual property, Study Materials, Staffs, Infrastructure, Accounts, Finance, and all most everything that you need to run your business is managed in just one interface.</p>
							   <div class="bor"></div>
							  
							   <h6 style="font-family:'Times New Roman', Times, serif;">From Enrolment to Certification</h6>
							  <p>The ad hoc process of managing the student enrollment, linking them with the training fee and lively tracking their performance are executed with a click of your mouse button.</p>
							   <div class="bor"></div>
							  
							   <h6 style="font-family:'Times New Roman', Times, serif;">User specific dashboards</h6>
							  <p>Manage, control and evaluate activities through defined set of roles, responsibilities and rights for specific users. </p>
							   <div class="bor"></div>
							  
							   <h6 style="font-family:'Times New Roman', Times, serif;">Key metrics </h6>
							  <p>With access to live feeds, custom metrics and charts, it makes you organize the business functionality process much better.</p>
							   <div class="bor"></div>
							  
							</article>
						  </li>
						  <li>
							<article><i class="clg clg-microscopes2"></i>
							 <h4 class="heading underline center"><a style="font-family:'Times New Roman', Times, serif;">ERP</a></h4>
							  <h6 style="font-family:'Times New Roman', Times, serif;">Cloud ERP </h6>
							  <p>Be less concerned about the IT assets and infrastructure. Just hop into our Cloud based ERP platform and enjoy seamless integration throughout all business modules.</p>
							   <div class="bor"></div>
							  
							  <h6 style="font-family:'Times New Roman', Times, serif;">Cloud Asset management </h6>
							  <p>Your growth invariability leads to the increase of digital assets; managing it on the cloud would benefit you on both time and money. In case of Education, its a bit serious need.</p>
							   <div class="bor"></div>
							  
							  <h6 style="font-family:'Times New Roman', Times, serif;">E-commerce </h6>
							  <p>You could integrate E-Commerce and Payment gateways of your convenience to facilitate course selling, student enrolment, fee collection, etc. </p>
							   <div class="bor"></div>
							  
							  <h6 style="font-family:'Times New Roman', Times, serif;">Cloud Storage </h6>
							  <p>Upload & SHARE course materials, Store Student information, and Administration documents in a secure cloud storage space. </p>
							   <div class="bor"></div>
							  
							</article>
						  </li>
						  <li>
							<article><i class="clg clg-university23"></i>
							 <h4 class="heading underline center"><a style="font-family:'Times New Roman', Times, serif;">Utility Support</a></h4>
							  <h6 style="font-family:'Times New Roman', Times, serif;">24 X 7 Assistance</h6>
							  <p>Get round the clock instant support. Reach us through e-mail, phone or just text to the dedicated account assistant. Get clarified through remote assistance as well.</p>
							   <div class="bor"></div>
							  
							   <h6 style="font-family:'Times New Roman', Times, serif;">Business Automation Assistance </h6>
							  <p>Not an expert in designing process follow and modelling? Never mind. We equip you with on demand Business Automation assistance. </p>
							   <div class="bor"></div>
							  
							  
							   <h6 style="font-family:'Times New Roman', Times, serif;">Access to custom URL </h6>
							  <p>You could incorporate your brand Logo and Name in the user interface and could also opt for a custom URL to boost your brand.</p>
							   <div class="bor"></div>
							  
							  <h6 style="font-family:'Times New Roman', Times, serif;">Expand your Utility </h6>
							  <p>There is a lot more you could do with smartLehren. Checkout the required utility bundle and maximise your productivity.</p>
							   <div class="bor"></div>
							   
							   
							</article>
						  </li>
						</ul>
						<!-- ################################################################################################ -->
    <div class="clear"></div>
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

