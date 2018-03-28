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
      <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
	 
	  <link rel="stylesheet" href="css/styles drupal.css">
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
	  <script src="js/scriptdrupal.js"></script>

     <script>

      
 
        $(document).ready(function(){  
           $(".menu li a").each(function() { 

               if ($(this).next().length > 0) { 

                   $(this).addClass("parent");  
               };  
           })  
           var menux = $('.menu li a.parent');  
           $( '<div class="more"><img src="btn-hamburger.png" alt=""></div>' ).insertBefore(menux);  
           $('.more').click(function(){  
                $(this).parent('li').toggleClass('open');  
           });  
           $('.menu-btn').click(function(){  
              $('nav').toggleClass('menu-open');  
          });  
       });  
    

     </script>
 
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
 
  <%@ include file = "../../include/header.jsp" %>
	
	<%@ include file = "../../include/Hmenu.jsp" %>
	<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="grid_12">
	  <h3><img src="images/help.jpg" alt="FAQ" width="30"  height="30"/>FAQ</h3>
	<table align="center" cellpadding="15" cellspacing="15" border="1" width="800" style="overflow:auto; ">

<tr><td>

<div style="overflow:auto; height:600px;">
<div id='cssmenu1'>
<ul>
		 <li class='has-sub'><a href='#'><span>What is the smartLehren?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Smartlehren is an all in one platform enabling you to wisely handled your university day to day administration and online course delivery.</span></a></li>
   </ul>
   </li>
   <br/>
   
   
    <li class='has-sub'><a href='#'><span>How smartLehren benefit the users?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Our product helps you to utilize your Time and Money most imperatively and lead you to the path of success. </span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I believe smartLehren?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>smartLehren product belongs to digiBlitz technologies, which is a highly reputed company for business transformations. For more info see digiBlitz.com</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I start using smartLehren?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>After browsing the pricing page user can use the product by simply clicking try now button. After 30 days of trial users have to subscribe the product according to the plan they need.</span></a></li>
   </ul>
   </li>
   <br/>
   
   
   <li class='has-sub'><a href='#'><span>How to reset my username and password?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>In the entire users dashboard there will be my profile option. By clicking on the edit profile option user can edit their profile and by clicking on the change password, password can be changed. For the change of username user have to send a request mail to the customer support executive. </span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How smartLehren different from other peers?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>We are presenting the distance education as it meant to be. From enrolling into course till the students gets his degree, he doesn’t have to visit the university.</span></a></li>
   </ul>
   </li>
   <br/>
   
   
   <!------------------------------------------Admin FAQ--------------------------------------------------- -->
   
   <li class='has-sub'><a href='#'><span>How do I configure user role with entity?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Admin can configure or map entity to a specified role by selecting the Create role permission from the Manage role privilege. After the creation of role, admin has to map entity, privilege, and permission, by selecting the Map entity permission.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I purchase bundle?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Go to pricing page, in each package you can find different bundles with cost and click buy button in the package to buy the bundle.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>Can I have two or more admin account?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Yes, you can have multiple accounts.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How to assign the roles?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Select Create role permission from Manage role privilege in E-learning entity and fill the field and click create button.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How to create an employee?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Select Create employee permission from Manage user privilege in E-learning entity and fill all the fields and click register button.</span></a></li>
   </ul>
   </li>
   <br/>
   <li class='has-sub'><a href='#'><span>How to reassign the admin account to another person?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>By editing the profile of current admin by selecting Edit profile and changing the password by giving new password one can reassign to another user.</span></a></li>
   </ul>
   </li>
   <br/>
   <li class='has-sub'><a href='#'><span>How do I fix up event in my calendar?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Select Schedule Event permission from Schedule privilege and enter all the fields.</span></a></li>
   </ul>
   </li>
   <br/>
   
   
   <!-- -------------------------------------------Program mentor and course mentor--------------------- -->
   <li class='has-sub'><a href='#'><span>How do I schedule Assignment?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Select Create Assignment permission from Manage Assignment and Test in E-learning entity and fill all the fields to create Assignment.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I conduct online test?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Select Create test permission from Manage Assignment and test in E-learning entity and fill all the fields to create test.</span></a></li>
   </ul>
   </li>
   <br/>
  
   
   <li class='has-sub'><a href='#'><span>How do I upload course material and videos?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Select Add Course Materials permission from Manage Assignment, and Test privilege in E-learning entity. And provide URL link to add Course materials, Recorded classes, pdf books etc.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <!-- -----------------------------------Students--------------------------------------- -->
   
   <li class='has-sub'><a href='#'><span>Can I record my class section and use it for future?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Course mentor will record all the class sessions and can upload the recorded class.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How to know and contact my faulty?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>The list of faculty for the specified student will display besides the course details. And you can use our Chat box to communicate with your faculty.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I attend the online test?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>In study area for the selected course, the Assignment and Test which are assigned by Course mentor will be displayed at the left side of the panel. By selecting the assignment or test you can attend the Assignment and Test.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I track my course progress?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>The entire mapped course will be displayed in the Study area.</span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I browse my course material?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>While selecting the course from Study area the list of material will be displayed under the Study plan.The pdf books, Recorded class will be display at the bottom of the material. 
    </span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I browse my course material?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>While selecting the course from Study area the list of material will be displayed under the Study plan.The pdf books, Recorded class will be display at the bottom of the material. 
    </span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I browse my course material?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>While selecting the course from Study area the list of material will be displayed under the Study plan.The pdf books, Recorded class will be display at the bottom of the material. 
    </span></a></li>
   </ul>
   </li>
   <br/>
   
   <li class='has-sub'><a href='#'><span>How do I browse my course material?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>While selecting the course from Study area the list of material will be displayed under the Study plan.The pdf books, Recorded class will be display at the bottom of the material. 
    </span></a></li>
   </ul>
   </li>
   <br/>
   
   
   <!-- -----------------------------------------------old FAQ starts----------------------------------- -->
   
   

   <li class='has-sub'><a href='#'><span>Can I login to the online library from any computer with my username and password?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>Yes.You can login to the online library from any internet connected computer.However,you can only be logged in to one computer at a time</span></a></li>
   </ul>
   </li>
   <br/>
   <li class='has-sub'><a href='#'><span>Can I download your online tutorials?</span></a>
      <ul>
         <li><a href='#'><span>Annual preminum members, and people who log into lynda.com through their schools or organization,can use our free iPhone,iPad app to watch courses offline-even when there's no internet available</span></a></li>   
      </ul>
   </li>
    <br/>
   <li class='has-sub'><a href='#'><span>Do you offer educational discounts for students and educators?</span></a>
      <ul>
         <li><a href='#'><span>As an educational company,we do out best to make our training accessible students and educators.</span></a></li>
         
      </ul>
   </li>
    <br/>
   <li class='last'><a href='#'><span>How do i provide feedback on training?</span></a>
   <ul>
         <li><a href='#'><span>Please provide any comments and suggesstions on training by using the feedback form.</span></a></li>
      </ul>
   </li>
    <br/>
    <li class='last'><a href='#'><span>How do i obtain a certificate of completion for the course?</span></a>
   <ul>
         <li><a href='#'><span>Certificates of completion are emailed to all attedences at the end of each course.Certificates of completion are not distributed self-paced courses.</span></a></li>
      </ul>
   </li>
    <br/>
  <li class='last'><a href='#'><span>Can I speak with the instructor before the course?</span></a>
   <ul>
         <li><a href='#'><span>Yes.Please contact your account representative to arrange a time to speak with instructor.</span></a></li>
      </ul>
   </li> 
    <br/>
   <li class='last'><a href='#'><span>what time do the courses begin and end?</span></a>
   <ul>
         <li><a href='#'><span>Courses at mathworks training facilities are held from 9:00 am to 5:00 pm.Timing for the training at your own site may differ according to your scheduling needs.</span></a></li>
      </ul>
   </li>
    <br/>
	 <li class='has-sub'><a href='#'><span>How long do I have access to self-paced training?</span></a>
   <ul>
    <li  class='last'><a href='#'><span>You have 90 days of access,beginning when payment is received by Mathworks</span></a></li>
   </ul>
   </li>
   <br/>
   <li class='has-sub'><a href='#'><span>How fast is the pace of the courses?</span></a>
      <ul>
         <li><a href='#'><span>The pace depends on the average ability level of the attendence</span></a></li>   
      </ul>
   </li>
    <br/>
   <li class='has-sub'><a href='#'><span>Can we customize the training?</span></a>
      <ul>
         <li><a href='#'><span>Yes you can customize training at your own site only.</span></a></li>
         
      </ul>
   </li>
    <br/>
    
</ul>

</div></div>
</td></tr></table>
</div></div></div>
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

