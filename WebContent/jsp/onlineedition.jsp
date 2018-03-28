<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
 <!DOCTYPE html>
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
		 
	 <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/jquery-ui.css" type="text/css"/>
	<link rel="stylesheet" href="css/ui.theme.css" type="text/css"  />
     
	 <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
  
       <script src="js/jquery.js"></script>
	   <script src="js/dist/jquery.validate.js"></script>
       <script src="js/lib/jquery.maskedinput.js"></script>
	   <script src="js/jquery.leanModal.min.js"></script>
	   <script src="js/cscombo_new.js" type="text/javascript" ></script>
	

	 <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
    
<script type="text/javascript">
	$(document).ready(function() {
	
	$("#firstname").blur(function(){        
var a = $("#firstname").val();
var b = a.trim();
$("#firstname").val(b);
    });
	
	$("#lastname").blur(function(){        
var a = $("#lastname").val();
var b = a.trim();
$("#lastname").val(b);
    });
	
	$("#companyname").blur(function(){        
var a = $("#companyname").val();
var b = a.trim();
$("#companyname").val(b);
    });
	
	$("#cardno").blur(function(){        
var a = $("#cardno").val();
var b = a.trim();
$("#cardno").val(b);
    });

	
	$("#name").blur(function(){        
var a = $("#name").val();
var b = a.trim();
$("#name").val(b);
    });
	
	$("#city").blur(function(){        
var a = $("#city").val();
var b = a.trim();
$("#city").val(b);
    });
	
	$("#coupon_code").blur(function(){        
var a = $("#coupon_code").val();
var b = a.trim();
$("#coupon_code").val(b);
    });
	
		
		$("#mobileno").mask("999-999-9999");
		
		
		   $("#applycoupon").validate({
		   		
				rules:{
					coupon_code: {
						required: true
						},
				},messages:{
						coupon_code:"Please Enter your Coupon Code"							
				},
				errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}
				
		   });
		   
		   
		   $("#form").validate({
			   
			   ignore: ":disabled",
			   
				rules:{
					firstname: {
						required: true
						},
					lastname: {
						required: true
					},
					email: {
						required: true,
						email:true	
					},
					mobileno: {
						required:true
					},
					companyname: {
						required: true	
					},
					country: {
						required: true
					},
					state: {
						required: true	
					},
					city: {
						required: true	
					},
					cardtype: {
						required: true	
					},
					cardno: {
						required: true,
						number: true	
					},
					expiryyear: {
						required: true,
						date: true	
					},
					expirymonth:{
						required: true,
					},
					cvvno: {
						required: true,
						number: true,
						maxlength: 3	
					},
					name:{
						required: true
					},
					
					 accept: {
						 required: true
					 }
				},
				groups:{
					somegroup:"expirymonth expiryyear"
				},
				messages:{
					
					firstname:"Please Enter first name",
					lastname:"Please Enter last name",
					email: {
						required: "Please Enter your e-mail",
						email: "Please Enter valid e-mail"
						},
					mobileno: "Please Enter valid mobile no",
					companyname: "Please Enter your company name",
					country: "Please select your country name",
					state: "Please select your state name",
					city: "Please Enter your city name",
					cardtype: "Please select card type",
					cardno: "Please Enter valid card no",
					expiryyear: "Please Select valid year",
					expirymonth: "Please Select valid Month",
					cvvno: {
						required: "Please Enter valid number",
						maxlength: "Please Enter valid 3 Digit CVV Number"
					},
					name: "Please Enter your card name",
					accept:"Please read the complete Terms and Conditions"
					},
					
					errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}
		
			   
		});
		
		$('#basic').click(function(event) {
			var amount=null;
		  var subtype = null;
		  var feePrice = null;
		  
		  if($('#basic').val()=="basic"){
		  var a = 99;
          amount=99;
		  var totalamount = null;
		  
		  subtype = $("input[name=subscriptiontype]:checked").val();
		  if(subtype=="monthly"){
		
		feePrice = a*1;
		 totalamount=feePrice+0;
		  } else if(subtype=="quarterly"){
		  	 // alert("Silver quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
	totalamount=feePrice+0;
		  }
		  else if(subtype=="annual"){
		 // alert("Silver annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  totalamount=feePrice+0;
		  }
        }
		$("#total_amount").val(totalamount);
		$("#fee").val(feePrice);
		 $("#amo").val(amount);
		 $("#setup0").show();
			 $("#setup1").hide();
			  $("#setup2").hide();
			  $("#setup3").hide();
		
		});
		
$('#silver').click(function(event) {
			var amount=null;
		  var subtype = null;
		  var feePrice = null;
		  
		  if($('#silver').val()=="silver"){
		  var a = 299;
          amount=299;
var totalamount = null;
		  
    subtype = $("input[name=subscriptiontype]:checked").val();
   // alert(subtype);

		  if(subtype=="monthly"){
		 // alert("Silver monthly");
		 feePrice = a*1;
		 totalamount=feePrice+999;
		  } else if(subtype=="quarterly"){
		  	 // alert("Silver quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		  totalamount=feePrice+999;
	
		  }
		  else if(subtype=="annual"){
		 // alert("Silver annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  totalamount=feePrice+999;
		  }
        }
		$("#total_amount").val(totalamount);
		$("#fee").val(feePrice);
		 $("#amo").val(amount);
		$("#setup1").show();
			  $("#setup2").hide();
			  $("#setup3").hide();
			  $("#setup0").hide();
			  $("#setup4").show();
		});

$('#gold').click(function(event) {
			var amount=null;
		  var subtype = null;
		  var feePrice = null;
		  
		  if($('#gold').val()=="gold"){
		  var a = 1249;
          amount= 1249;
var totalamount = null;

		 subtype = $("input[name=subscriptiontype]:checked").val();
		  if(subtype=="monthly"){
		//  alert("Silver monthly");
		 feePrice = a*1;
		 totalamount=feePrice+3999;
		  } else if(subtype=="quarterly"){
		  	  //alert("Silver quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		  totalamount=feePrice+3999;
	
		  }
		  else if(subtype=="annual"){
		 // alert("Silver annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  totalamount=feePrice+3999;
		  }
        }
		$("#total_amount").val(totalamount);
		$("#fee").val(feePrice);
		 $("#amo").val(amount);
		  $("#setup2").show();
			  $("#setup1").hide();
			  $("#setup3").hide();
			  $("#setup0").hide();
			  $("#setup4").show();
		
		});

$('#platinum').click(function(event) {
			var amount=null;
		  var subtype = null;
		  var feePrice = null;
		  
		  if($('#platinum').val()=="platinum"){
		  var a = 4999;
          amount=4999;
var totalamount = null;
		 subtype = $("input[name=subscriptiontype]:checked").val();
		  if(subtype=="monthly"){
		  //alert("platinum monthly");
		 feePrice = a*1;
		 totalamount=feePrice+14999;
		  } else if(subtype=="quarterly"){
		  	  //alert("platinum quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		  totalamount=feePrice+14999;
	
		  }
		  else if(subtype=="annual"){
		  //alert("platinum annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  totalamount=feePrice+14999;
		  }
        }
		$("#total_amount").val(totalamount);
		$("#fee").val(feePrice);
		 $("#amo").val(amount);
		   $("#setup3").show();			  
			  $("#setup2").hide();
			  $("#setup1").hide();
			  $("#setup0").hide();
			  $("#setup4").show();
		
		});		
		
	$('#plan').click(function(event) {
	 if($('#plan').val()=="monthly"){
var a = parseInt($('#amo').val());
    var amount=a*1;
	
	var setupamount = parseInt($('#setup_cost').val());
	
	var totalamount = null;
	
	if ($("#basic").is(":checked")) {
		totalamount = amount+0;
	}
	else if($("#silver").is(":checked")){
		totalamount = amount+999;
	}
	else if($("#gold").is(":checked")){
		totalamount = amount+3999;
	}
	else if($("#platinum").is(":checked")){
		totalamount = amount+14999;
	}
		
	$("#total_amount").val(totalamount);
	$("#dp1").show();
	$("#dp2").hide();
	$("#dp3").hide();
	$("#setup4").show();
}   
    $("#fee").val(amount);
});

$('#plan1').click(function(event) {
  
 if($('#plan1').val()=="quarterly"){
var a = parseInt($('#amo').val());
    var n=a*3;
    var m=n*10/100;
	var amount=n-m;
	
		
	var totalamount = null;
	
	if ($("#basic").is(":checked")) {
		totalamount = amount+0;
	}
	else if($("#silver").is(":checked")){
		totalamount = amount+999;
	}
	else if($("#gold").is(":checked")){
		totalamount = amount+3999;
	}
	else if($("#platinum").is(":checked")){
		totalamount = amount+14999;
	}
		
	$("#total_amount").val(totalamount);
	
$("#dp1").hide();
$("#dp2").show();
$("#dp3").hide();
$("#setup4").show();
}   
    $("#fee").val(amount);
});



$('#plan2').click(function(event) {
  
 if($('#plan2').val()=="annual"){
var a = parseInt($('#amo').val());
var n=a*12;
var m=n*25/100;
	var amount=n-m;
	
	var totalamount = null;
	
	if ($("#basic").is(":checked")) {
		totalamount = amount+0;
	}
	else if($("#silver").is(":checked")){
		totalamount = amount+999;
	}
	else if($("#gold").is(":checked")){
		totalamount = amount+3999;
	}
	else if($("#platinum").is(":checked")){
		totalamount = amount+14999;
	}
		
	$("#total_amount").val(totalamount);
	$("#dp1").hide();
	$("#dp2").hide();
	$("#dp3").show();
	$("#setup4").show();
}   
    $("#fee").val(amount);
});

$('#coupon').click(function(event) {
    var sports = $("#couponcode").val();
	var spo = $("#total_amount").val();
	var txt_wrong = "Invalid Coupon Code!";
	
	$.get('exam.html?cmd=couponname', {
    	prog : sports,
		cost : spo
    }, function(response) {
    	if(response != null && response !="" && response != "null"){
    		 $("#total_amount").val(response);
			 
    	     
    	}else{
			
			$("#total_amount").val(spo);
			alert(txt_wrong);  
    	}       
    });
    });
     
	 	
	$('#couponY').click(function() {	
			$("#form").hide();
			$("#applycoupon").show('slow');			
			$("#ensurecoupon").hide();
			$("#coupstatus").hide();			
	});
	
	$('#couponN').click(function() {	
			$("#form").show('slow');
			$("#applycoupon").hide();
			$("#ensurecoupon").hide();
			$("#coupstatus").hide();
	});
	
	
	$('#cancelcoupon').click(function() {	
			$("#form").hide();
			$("#applycoupon").hide();
			$("#ensurecoupon").show('slow');
			$("#coupstatus").hide();
	});
	 
	


	
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

function OnScrollDiv (div) {
			//alert("you must read condition fully");
           // info.innerHTML = "Horizontal: " + div.scrollLeft
             //            + "px<br/>Vertical: " + div.scrollTop + "px";
				//document.getElementById("info").disabled= true;
				 //document.getElementById("info").innerHTML="you must read condition fully";
				  //document.getElementById("info").innerHTML = "x";
        //document.getElementById("info").innerHTML = "scroll fully";
		//document.form.check.disabled="false";
		    if(div.scrollTop >= 3600){
			        var x = document.getElementById ("check").disabled = false ;
			}
		}
		//document.getElementById("checkbox").addEventListener("click", enable);

					 

	</script> 	
	
<style type="text/css">

#applycoupon label.error {
  padding-left: 0px; 
  color: red;
}

#form label.error {
  padding-left: 0px; 
  color: red;
}

 .label{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
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


<!-- new form starts -->
		.news-box h1 {
    margin: 30px 0;
    color: #3d84e6;
}
		.top-margin {
    margin-top: 20px;
}
		.form-group .form-validation {
        position: absolute;
    top: 20px;
    right: 6px;
}

<!-- new form ends -->

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
   <div class="h_address" style="float:left;" >      
    <address style="font-family:'Times New Roman', Times, serif; font-size:17px; line-height:30px;">
      13241 WOODLAND PARK ROAD, <br>
      SUITE 110, HERNDON,<br>
       VIRGINIA 20171, USA<br>
	   <i class="fa fa-envelope mail"></i>: <a href="mailto:info@digiblitz.com">sales@smartlehren.com</a><br>
       <!-- img class="phone" src="images/phone_icon.png">: 703-956-2530 -->
    </address>
  </div>   
  <div class="clear"></div>    
 
<div class="links">
<a target="_blank" href="https://digiblitz.com/community/" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Community</a><a target="_blank" href="https://www.digiblitz.com/support/?cat=2" style="font-family:'Times New Roman', Times, serif; line-height:20px;">Help</a><a href="#loginmodal" id="modaltrigger" style="text-decoration:none; font-family:'Times New Roman', Times, serif; line-height:20px;">log in</a></div>
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
<%
    String user_id = (String)request.getAttribute("user_id");   
	String amount = (String)request.getAttribute("amount");
	String type = (String)request.getAttribute("type");   	
	String plantype = (String)request.getAttribute("plantype");  
 	String onetimecost = (String)request.getAttribute("onetimecost");
 	String totamount = null; 	
 	String coupon_acc = (String)request.getAttribute("coupon_acc");
	String coupstatus = (String)request.getAttribute("coupstatus");
	String coupon_code = (String)request.getAttribute("coupon_code");
	%>    
	
	<div class="content" style="padding:30px 0;">
  <div class="container">
 
 <div class="pp" style="  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">SignUp Form</div>
<div class="pps" style="font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
 <section class="news-box">
        <div class="container contN">
        	
        
            
                   
                    	<%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>	 
	 <div class="links">
	 <strong style="float:left; "><font color="#FF0000"><%=status%></font></strong>
<a href="map.html?cmd=initgetstart" style="font-family:'Times New Roman', Times, serif; line-height:20px; margin-bottom:25px;">SignUp Again</a></div>
	  	 
	 <%
	}else{	
	%>
					
 <% if(type != null && type.equals("trynow") && coupon_acc == null){%>
 
  <form id="ensurecoupon" >
   
   <div class="row">
							<div class="col-md-10">
								<div class="form-group">
									<label for="exampleInputFile">Do you have a Coupon code?</label>
									 <input type="radio" name="couponY" id="couponY" value="" >Yes
   <input type="radio" name="couponY" id="couponN" value="" >No
									<span id="fileuploaderror" style="color:red"></span>
									
								</div>
							</div>
							 <div class="col-md-8">
                              <label class="linkssss">                                   
									 <input  type="button" value="Back" name="button" onclick="window.location.href='map.html?cmd=initgetstart'" >
                                </label>
                            </div>
							</div>
  
      
   </form>
 <% }%>
					
					<% if(coupstatus != null){%>
 <form action="./customer.html" method="post" id="applycoupon">
 <script>
 $(document).ready(function() {
 		$("#ensurecoupon").hide();		
 });
 </script>
 <% }else{%>
 <form action="./customer.html" method="post" id="applycoupon"  style="display:none; ">
  <%}
	 if(coupstatus!=null){
	 %>
	 <span colspan="2" id="coupstatus" style="color:red; text-align:center; font-size:20px;"><%=coupstatus%></span><%} %>	 
				<input type="hidden" name="CustomerProcess" value="coupon_check">
				<input type="hidden" name="amount" value="<%=amount%>">
 
 					<div class="row">
														
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Enter Coupon Code:</label>
									<input  type="text" name="coupon_code" id="coupon_code" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							 <div class="col-md-8">
                                <label class="linksss">                                   
					<input  type="submit" name="coupon" value="Continue" class="submit" id="submit" >
								</label>
								<label class="linkssss">                                   
									 <input  type="button" value="Back" id="cancelcoupon" name="button" >
                                </label>
                            </div>
							
							</div>
  
 </form>	
						
				 <% if(type != null && type.equals("trynow") && coupon_acc == null){
				 System.out.println("check 3 ");
				 %>
 
 <form id="form" name="insert" action="map.html?cmd=signup" style="display:none;" method="post" >
 
	<input type="hidden" name="plantype" value="basic">
	<input type="hidden" name="subscriptiontype" value="trial">	
	<input type="hidden" name="setup_cost" value="0">
	
	<input type="hidden" name="amount" id="amo" value="<%=amount%>">
   <input type="hidden" name="type" id="type" value="<%=type%>">
    <input type="hidden" name="coupon_code" id="coupon_code" value="<%=coupon_code%>">
	
	<input type="hidden" name="forTryNowPay" id="forTryNowPay" value="forTryNowPay">
   
   						<div class="row">
														
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>First Name:</label>
									<input  type="text" name="firstname" id="firstname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Last Name:</label>
									<input  type="text" name="lastname" id="lastname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
													
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Email:</label>
									<input  type="text" name="email" id="email" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Mobile No:</label>
									<input  type="text" name="mobileno" id="mobileno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Institution Name:</label>
									<input  type="text" name="companyname" id="companyname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Address:</label>
									<input  type="text" name="street" id="street" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Country:</label>									
		<select name="country" class="form-control" onChange="FillState(document.insert.country, document.insert.state, '');">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>State:</label>									
		<select name="state" class="form-control">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>City:</label>
									<input  type="text" name="city" id="city" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Zip:</label>
									<input  type="text" name="zip" id="zip" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8" id="setup4">
                                <div class="form-group">
                                    <label>Total Amount:</label>
	<input  type="text" name="total_amount" id="total_amount" class="form-control" value="<%=amount%>"  readonly>
                                 
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label style="margin-top:17px;">Card Type:</label>
					<input type="radio" name="cardtype" id="cardtype" value="visa" style="margin-top:20px;" />
  <img src="images/visa.png" alt="visa card" style="height:45px; width:60px; margin:0 0 15px 0; ">
 
 <input type="radio" name="cardtype" id="cardtype" value="mastercard" />
  <img src="images/master.png" alt="master" style="height:55px; width:75px;">
 
 <input type="radio" name="cardtype" id="cardtype" value="amex" /> 
 <img src="images/american.png" alt="american" style="height:55px; width:75px;" >    
 <span style="color:Red;">*</span>                               
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Card Number:</label>
									<input  type="text" id="cardno" name="cardno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Expiration Date:</label>
			<select name="expirymonth" id="expirymonth" class="form-control" >
  <option value="">Month</option>
  <option value="1">January</option>
  <option value="2">February</option>
  <option value="3">March</option>
  <option value="4">April</option>
  <option value="5">May</option>
  <option value="6">June</option>
  <option value="7">July</option>
  <option value="8">August</option>
  <option value="9">september</option>
  <option value="10">October</option>
  <option value="11">November</option>
 <option value="12">December</option>
  </select>
  <select name="expiryyear" id="expiryyear" class="form-control" >
  <option value="">Year</option>
    
  <option value="2016">2016</option>
  <option value="2017">2017</option>
  <option value="2018">2018</option>
  <option value="2019">2019</option>
  <option value="2020">2020</option>
  <option value="2021">2021</option>
  <option value="2022">2022</option>
  <option value="2023">2023</option>
  <option value="2024">2024</option>
  <option value="2025">2025</option>
  <option value="2026">2026</option>
  <option value="2027">2027</option>
  <option value="2028">2028</option>
  <option value="2029">2029</option>
  <option value="2030">2030</option>
  <option value="2031">2031</option>
  <option value="2032">2032</option>
  <option value="2033">2033</option>
  <option value="2034">2034</option>
  <option value="2035">2035</option>
  <option value="2036">2036</option>
  <option value="2037">2037</option>
  <option value="2038">2038</option>
  <option value="2039">2039</option>
  <option value="2040">2040</option>
  <option value="2041">2041</option>
  <option value="2042">2042</option>
  </select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>CVV:</label>
									<input  type="password" id="cvvno" name="cvvno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Cardholder Name:</label>
									<input  type="text" id="name" name="name" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div style="float:right;">
                                    <a href="https://www.paypal.com/us/verified/pal=paypal%40digiblitz%2ecom" target="_blank"><img src="https://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal" style="width:70px; height:70px;" ></A>

<a href="#" onClick="window.open('https://www.sitelock.com/verify.php?site=digiblitz.com','SiteLock','width=600,height=500,left=160,top=170');">
   <img alt="SiteLock" title="SiteLock" src="//shield.sitelock.com/shield/digiblitz.com" width="80px" height="40px">
                       </a>
<span id="siteseal">
                         <script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=rVTd0BptwwbkRS7ErqCst96o4A8qZWtbwmohz2yg6czXseVnRsCmqb4IHzw4">
                         </script>

                       </span>

                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">

								 <label>Declaration:</label>
								  <label style="color:red; font-weight:normal;">Please read the complete Terms and Conditions to agree.</label>
   
 <div style="font-family:'Times New Roman', Times, serif; font-size:15px; overflow:scroll; overflow-x:hidden; padding:10px; overflow-y:scroll; height:220px; width:150%; border:1px solid;" onscroll="OnScrollDiv (this)">
<center><strong> RETURN, REFUND AND EXCHANGE POLICY</strong></center></br>

<p align="justify">Please read the following policies carefully before using any of digiBlitz's 
products or platform(s). The return policy is provided in addition to any legal return rights 
that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 15 
days from the day of purchasing the product(s) or platform(s). digiBlitz Inc has rights to refuse 
any return or exchange if it fails to meet the norms.</p>

<p align="left"><strong>1.	TERMS OF USE AND RESALE</strong>

<p align="justify">&nbsp;THOUGH DIGIBLITZ INC. ALLOWS YOU TO ACCESS VARIOUS RESOURCES THROUGH 
ITS ONLINE (CLOUD) OR ENTERPRISE PRODUCT(S) & PLATFORM(S), WEBSITE, DB STORE, AND OTHER SELLABLE 
GOODS THAT MAY OR MAY NOT BE AVAILABLE FOR PURCHASE, OR DOWNLOAD, INFORMATION OF SOFTWARE, INCLUDING 
THE  SOFTWARE AND TOOLS (COLLECTIVELY "SERVICES") ARE SUBJECT TO THESE TERMS OF USE AND SALE 
("TERMS OF USE AND RESALE" OR "CONTRACT").</br></br>

&nbsp;&nbsp;By using digiBlitz's and its Products Website, Purchasing/ downloading products and
 services from the digiBlitz's website,  its Products website, dB store or through any authorized 
 reseller, you accept and agree to TERMS OF USE AND RESALE, DIGIBLITZ PRIVACY STATEMENT, 
 and APPLICABLE TERMS AND CONDITIONS, policies or disclaimers found in the digiBlitz Inc. 
 or referenced herein and accessible through the related hyperlinks. We allow you to read 
 the digiBlitz Inc. Policies carefully. <br/></p></p>
 
<p align="left"><strong>2.	TERMS RELATING TO YOUR USE OF THE DB STORE</strong><br/>

<p align="justify">&nbsp;2.1.	PERSONAL AND COMMERCIAL USE LIMITATION<br/>

&nbsp;&nbsp;Unless otherwise specified, the Products, Components Of dB store and Services are 
only for your personal and commercial use. You may not profitably distribute, circulate, license,
 or trade any information or services obtained from the Websites, Products, components of dB store
 and their respective Services.<br/></br>
 
&nbsp;2.2.	NOTICE SPECIFIC TO DOCUMENTS AVAILABLE ON THE EBSITE OR SERVICES<br/>

&nbsp;&nbsp;Permission to use Documents and information (such as white papers, press releases,
 datasheets, Product literatures, Manuals of any kind and FAQs) from the Websites, Products, components of dB store and their respective Services is allowed for your personal and commercial use.<br/>
&nbsp;&nbsp;Use of such records from digiBlitz Inc. or Services is for informational and profitably 
or personal use only and will not be copied or posted on any network computer or make public in any 
media, unless permitted by freedom from a responsibility under applicable copyright
laws. You could however with prior permission from digiBlitz Inc., could use the information provided,
 the following Copyright notice: © 2016 digiBlitz Inc., All rights reserved. appears in all copies and 
 that both the copyright notice and this permission notice appear.<br/></br>
&nbsp;&nbsp;Website: Any digiBlitz Inc. owned, operated, licensed or controlled website. Elements of
 digiBlitz Inc. websites, including the Website, are protected by trademark, unfair competition, and 
 other laws and may not be copied or imitated in whole or in part. No logo, graphic, sound or image 
 from any digiBlitz Inc. website, including the Website, may be copied, retransmitted or made available unless expressly permitted by digiBlitz Inc. or applicable law.<br/>
&nbsp;&nbsp;The documents and related graphics published on any digiBlitz Inc. owned, operated, 
licensed or controlled website and dB Store or Services could include technical inaccuracies or
typographical errors. Changes may be periodically added to the information without prior notice. 
digiBlitz Inc. and/or its respective suppliers may make improvements and/or changes in the product(s)
 and/or the platform(s) and/or dB store described herein at any time.<br/><br/>
 
2.3.MEMBER ACCOUNT, PASSWORD, AND SECURITY<br/>

&nbsp;&nbsp;If you want to open any account in any dB products, information should be complete,
 accurate, and current as required by the applicable registration form. Username and password may or 
 may not be generated by digiBlitz Inc. depending upon the case. However, you are responsible for 
 keeping your account information and password confidential and be responsible for all activity that 
 occurs under your account. You agree to notify digiBlitz Inc. without delay of any unauthorized use
 of your account or any other breach of security.<br/><br/>
 
2.4.NO UNLAWFUL OR PROHIBITED USE<br/>
&nbsp;&nbsp;As a condition of your use of the Services, you pledge to us that you will not use the
 Services for any purpose that is against the law or disallowed by these terms, conditions, & notices.
 You may not use our product(s), platform(s) or component(s) of dB store which would cause damage, 
 disable or crash any server, or the network(s) connected to any digiBlitz server, or interfere with 
 any other party's use and enjoyment of any Services. You may not try to gain unauthorized access to
 any Services, computer systems or networks connected to any digiBlitz's Server or to any of the Server.
 You may not use the services in a way that violate rights of third parties, carelessly harming a 
 person or entity, including digiBlitz. digiBlitz has right to make any information public.<br/><br/>
 
2.5.MATERIALS PROVIDED TO digiBlitz Inc. PRODUCTS OR POST ON THE WEBSITE BY YOU<br/>
&nbsp;&nbsp;digiBlitz Inc does not claim ownership of the materials you provide to digiBlitz Inc.
 (including feedback, ratings, and suggestions) or post, upload, input or submit to any Product or
 its connected  services for review by the users, or by the members of any public or private area of
 people (each a "Submission" and collectively "Submissions").<br/>&nbsp;&nbsp;However, digiBlitz Inc. 
 shall be permitted to use your Submission, including your name, for the purpose for which it was 
 submitted. No compensation will be paid for you Submission. digiBlitz Inc.  has rights to remove any
 Submission at any time in its own discretion.<br/><br/>
 
2.6.THIRD-PARTY LINKS IN OUR WEBSITE<br/>
&nbsp;&nbsp;The dB store or any product(s) or platform(s) may include links to third-party websites
 that allow you leave the digiBlitz Inc. Website. 
The digiBlitz Inc is not responsible for any internal link or contents of third party website. 
These linked sites are not under the control of digiBlitz Inc. digiBlitz Inc. is providing these 
links only for your convenience. Your use of the third-party website may be subject to that third
 party’s terms and conditions.</p></p><br/><br/>
 
<p align="left"><strong>3.	Terms Relating to the Resale of Products to You</strong>

&nbsp;<p align="justify">3.1.USERS<br/>
&nbsp;&nbsp;You must not be a reseller. Only the end users are allowed to buy our product.<br/><br/>

&nbsp;3.2.INFORMATION ABOUT BILLING AND ACCOUNT INFORMATION<br/>

&nbsp;&nbsp;The information provided to digiBlitz Inc. by you for all purchases should be accurate
 current and complete and .You agree to update your account and other information immediately, 
 including your email address and credit card numbers and expiration dates, so that we can complete 
 your transactions and contact you as needed.</br><br/>
 
&nbsp;3.3.PRODUCT AVAILABILITY AND QUANTITY AND ORDER LIMITS<br/>
&nbsp;&nbsp;Pricing page of our product can be changed at any time without notice. 
digiBlitz Inc. may limit on the number that may be purchased per account, per person, per order, 
 per credit card, or per CPU and core. We have rights to refuse or reject any order at any time, 
 refunding you any money you have paid for the order, for reasons which include, but are not limited
 to, you have follow the conditions specified at the time of the order, otherwise your payment cannot
 be processed. In case if we are unable to supply our product, we will contact you and we will make 
 an alternative. If you do not choose to purchase the alternative product, we will cancel your order.
 If the product has some error, we reserve the right to correct the error and charge you the correct 
 price. In that case will offer you the option of purchasing the product and also for cancelling the
 order. Credits or refunds will be made to the same method of payment and account used to place the
 order.<br/><br/>
 
3.4.SOFTWARE PURCHASES AND LICENSE TERMS<br/>
&nbsp;&nbsp;Any software made available to download or purchase from the website or dB store is the 
copyrighted work of digiBlitz Inc. When you purchase software, you are actually purchasing a license 
to use the software rather than purchasing the software itself. Software licenses purchased form any
 of digiBlitz's owned or controlled website or from an authorized reseller are subject to the license 
 agreement that accompanies the software (the "License Agreement"). You will be required to agree to
 the terms and conditions of the License Agreement when you install the software.<br/><br/>
 
&nbsp;&nbsp;Any reproduction or redistribution of software or merchandise not in accordance with 
the relevant License Agreement and applicable law is expressly prohibited and may result in severe 
civil and criminal penalties. Violators risk being prosecuted to the maximum extent possible.<br/><br/>

3.5.Refund<br/>
&nbsp;&nbsp;Refunds will be made in the same method as above. For refund the intimation should 
be given to digiBlitz Inc.  by customer and it will be processed with 15 days.<br/><br/></p></p>

<p style="font-size:16px;"><center><strong>Terms and Condition</strong></center>

<p align="justify"><strong>1.	Payment and pricing:</strong><br/>
&nbsp;&nbsp;Pricing of all products are stated in digiBlitz's relevant product or platform websites.
 Pricing page of our product(s) and platform(s) can be changed at any time without notice. digiBlitz 
 Inc. may limit on the number that may be purchased per order, per account, per credit card, per
 person or per CPU. Pricing shown in the website will include all tax and charges of the product.
 <br/><br/>
 
<strong>2.	AUTO RENEWAL OF THE PRODUCTS</strong><br/>
&nbsp;&nbsp;All products of digiBlitz Inc.  will be renewed automatically at the end of each month
 on a prorate basis or depending up on the date of purchase (depending upon individual cases). 
 We will also inform you about the renewal through email before the subscription of the product.
 Once we informed you about the auto renewal, we will charge automatically for the product. 
 The intimation will be given before one week from the renewal to digiBlitz Inc. by the customer. 
 We will provide you with instruction on cancelling the product service or for suspending the product.
 However, no intimation will be given to you for subscription renewal of any dB store components. 
 You must cancel the services before the renewal date to avoid being billed for the renewal.
 <br/><br/>
 
<strong>3.	Return, Refund and Exchange</strong><br/>
&nbsp;&nbsp;The return policy is provided in addition to any legal return rights that you may have
 under law. digiBlitz Inc. will accept returns, refunds and exchanges within 30 day after purchasing 
 of product. We have rights to refuse any refund, return or exchange if it fails to meet our norm.
 For Return, Refund and Exchange the intimation should be given before one week from the renewal to
 digiBlitz Inc. by the customer and it will be processed within 30 days. We may occasionally extend 
 the 15-day return period during holiday or other periods. If a longer return period was advertised 
 through a promotional campaign on the Website when you made your purchase, that applies within the 
 clause mentioned in the promotional campaign.<br/><br/>
 
<strong>4.	Trial-period</strong><br/>
&nbsp;&nbsp;If you are taking part in any trial-period, you must cancel the service before the end of 
the trial period to avoid incurring new charges unless we notify you otherwise. Your trial 
subscription will be automatically upgraded to basic pack at the end of this free subscription
period. This implies that your credit card will be charged for the basic pack. However, you could 
unsubscribe the product any time before the trial expiry through the Master account management link
 that is accessible when you login into the product.<br/><br/>

<strong>5.	Customer support</strong><br/>
&nbsp;&nbsp;Please visit our Knowledge base site for Customer support and Assistance relating to 
the product.<br/><br/>

<strong>6.	CHANGING TERMS</strong><br/>
&nbsp;&nbsp;digiBlitz Inc. may change the Terms of Return, Refund and Exchange at any time and
 without notice to you. The Terms of Return, Refund and Exchange in force at the time you place 
 your order will govern your purchase and serve as the purchase contract between us. Before your 
 next purchase, digiBlitz Inc. may change their policies. We advise you to visit the digiBlitz Inc. 
 website, to review the current terms and condition, Refund and Return policy each time. <br/><br/>
 
<strong>7.	PROTECTION OF INDIVIDUAL INFORMATION</strong><br/>
&nbsp;&nbsp;Your privacy is important to us. We may use certain information for the purpose of your
 product according to your need. <br/><br/>
 
<strong>8.	LIMITATION OF LIABILITY</strong><br/>

&nbsp;&nbsp;In this section of Contract, digiBlitz Inc. is found liable to you for any loss or 
damage that arises out of or is in any way connected with your use of the dB Store, the Services, 
or any product or service offered, you agree that your exclusive remedy is to recover from digiBlitz 
Inc.  or any affiliates, and vendors direct damages up to (1) an amount equal to the price or fee for 
one month of any service or subscription or (2) US $100 if there was no service, subscription or 
similar fee.<br/><br/>

&nbsp;&nbsp;YOU AGREE THAT YOU CAN'T RECOVER ANY OTHER DAMAGES OR LOSSES, INCLUDING, WITHOUT 
LIMITATION, CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, INCIDENTAL, OR CONCERNING PUNISHMENT. 
THESE LIMITATIONS AND EXCLUSIONS APPLY EVEN IF YOU INCUR DAMAGES AND EVEN IF WE KNEW OR SHOULD HAVE
 KNOWN ABOUT THE POSSIBILITY OF THE DAMAGES. THESE LIMITATIONS AND EXCLUSIONS APPLY TO ANYTHING
 RELATED TO THE WEBSITE OWNED AND CONTROLLED BY DIGIBLITZ INC., ITS PRODUCT (S), PLATFORM(S) OR ANY
 COMPONENTS OF DB STORE, OR SERVICE OFFERED<br/><br/>

<strong>9.	Interpreting the Contract</strong><br/>
&nbsp;&nbsp;All parts of this Contract apply to the maximum extent permitted by the relevant law of 
the United States.<br/><br/></p></p>

</div>
                                </div>
                            </div>	
							
							<div class="col-md-8">
                                <div class="form-group">                                    
	<input  type="checkbox" name="accept" disabled="disabled" id="check" /> I agree to the user License agreement and privacy policy.
	<input type="hidden" name="accept"> 
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							 <div class="col-md-8">
                                <label class="linksss">
                <input type="submit" name="Insert" value="Sign Up" class="submit" id="submit">
				</label>
				<label class="linkssss">
                 <input  type="button" value="Cancel" name="button" onClick="javascript:history.back(-1);" >
				</label>
                            </div>
							
							</div>
							</form>
 
  <% } else if(type != null && type.equals("trynow") && coupon_acc != null){
  System.out.println("check 2 ");
  
 if(coupstatus != null){ %>
 <div colspan="2" style="line-height:30px; font-weight:bold; color:#158d8e; text-align:center; margin:55px 0 30px 0; font-size:24px;" ><%=coupstatus%></div>
 <div colspan="2" style="color:red; text-align:center; margin:25px 0 50px 0; font-size:20px;" >Please provide the following details.</div>
   <% }%>
   
   <script>
   $(document).ready(function() {
 		$("#applycoupon").hide();		
 });
   </script>
    <form id="form" name="insert" action="map.html?cmd=signup" method="post" >
	
	
   <input type="hidden" name="amount" id="amo" value="<%=amount%>">
   <input type="hidden" name="type" id="type" value="<%=type%>">
    <input type="hidden" name="coupon_code" id="coupon_code" value="<%=coupon_code%>">
   
   <input type="hidden" name="plantype" value="basic">
	<input type="hidden" name="subscriptiontype" value="trial">	
	<input type="hidden" name="setup_cost" value="0">
		
   <input type="hidden" name="type" id="type" value="<%=type%>">
    <input type="hidden" name="coupon_code" id="coupon_code" value="<%=coupon_code%>">
	
	<input type="hidden" name="forTryNowPay" id="forTryNowPay" value="forTryNowPay">
   
   						<div class="row">
														
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>First Name:</label>
									<input  type="text" name="firstname" id="firstname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Last Name:</label>
									<input  type="text" name="lastname" id="lastname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
													
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Email:</label>
									<input  type="text" name="email" id="email" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Mobile No:</label>
									<input  type="text" name="mobileno" id="mobileno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Institution Name:</label>
									<input  type="text" name="companyname" id="companyname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Address:</label>
									<input  type="text" name="street" id="street" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Country:</label>									
		<select name="country" class="form-control" onChange="FillState(document.insert.country, document.insert.state, '');">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>State:</label>									
		<select name="state" class="form-control">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>City:</label>
									<input  type="text" name="city" id="city" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Zip:</label>
									<input  type="text" name="zip" id="zip" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							 
							<div class="col-md-8" id="setup4">
                                <div class="form-group">
                                    <label>Total Amount:</label>
	<input  type="text" name="total_amount" id="total_amount" class="form-control" value="<%=amount%>"  readonly>
                                    <span style="width:200px; height:30px;">(Subscription Cost+Setup Cost) </span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label style="margin-top:17px;">Card Type:</label>
					<input type="radio" name="cardtype" id="cardtype" value="visa" style="margin-top:20px;" />
  <img src="images/visa.png" alt="visa" style="height:45px; width:60px; margin:0 0 15px 0; ">
 
 <input type="radio" name="cardtype" id="cardtype" value="mastercard" />
  <img src="images/master.png" alt="master" style="height:55px; width:75px;">
 
 <input type="radio" name="cardtype" id="cardtype" value="amex" /> 
 <img src="images/american.png" alt="american" style="height:55px; width:75px;" >    
 <span style="color:Red;">*</span>                               
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Card Number:</label>
									<input  type="text" id="cardno" name="cardno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Expiration Date:</label>
			<select name="expirymonth" id="expirymonth" class="form-control" >
  <option value="">Month</option>
  <option value="1">January</option>
  <option value="2">February</option>
  <option value="3">March</option>
  <option value="4">April</option>
  <option value="5">May</option>
  <option value="6">June</option>
  <option value="7">July</option>
  <option value="8">August</option>
  <option value="9">september</option>
  <option value="10">October</option>
  <option value="11">November</option>
 <option value="12">December</option>
  </select>
  <select name="expiryyear" id="expiryyear" class="form-control" >
  <option value="">Year</option>
    
  <option value="2016">2016</option>
  <option value="2017">2017</option>
  <option value="2018">2018</option>
  <option value="2019">2019</option>
  <option value="2020">2020</option>
  <option value="2021">2021</option>
  <option value="2022">2022</option>
  <option value="2023">2023</option>
  <option value="2024">2024</option>
  <option value="2025">2025</option>
  <option value="2026">2026</option>
  <option value="2027">2027</option>
  <option value="2028">2028</option>
  <option value="2029">2029</option>
  <option value="2030">2030</option>
  <option value="2031">2031</option>
  <option value="2032">2032</option>
  <option value="2033">2033</option>
  <option value="2034">2034</option>
  <option value="2035">2035</option>
  <option value="2036">2036</option>
  <option value="2037">2037</option>
  <option value="2038">2038</option>
  <option value="2039">2039</option>
  <option value="2040">2040</option>
  <option value="2041">2041</option>
  <option value="2042">2042</option>
  </select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>CVV:</label>
									<input  type="password" id="cvvno" name="cvvno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Cardholder Name:</label>
									<input  type="text" id="name" name="name" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div style="float:right;">
                                    <a href="https://www.paypal.com/us/verified/pal=paypal%40digiblitz%2ecom" target="_blank"><img src="https://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal" style="width:70px; height:70px;" ></A>

<a href="#" onClick="window.open('https://www.sitelock.com/verify.php?site=digiblitz.com','SiteLock','width=600,height=500,left=160,top=170');">
   <img alt="SiteLock" title="SiteLock" src="//shield.sitelock.com/shield/digiblitz.com" width="80px" height="40px">
                       </a>
<span id="siteseal">
                         <script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=rVTd0BptwwbkRS7ErqCst96o4A8qZWtbwmohz2yg6czXseVnRsCmqb4IHzw4">
                         </script>

                       </span>

                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">

								 <label>Declaration:</label>
								  <label style="color:red; font-weight:normal;">Please read the complete Terms and Conditions to agree.</label>
   
 <div style="font-family:'Times New Roman', Times, serif; font-size:15px; overflow:scroll; overflow-x:hidden; padding:10px; overflow-y:scroll; height:220px; width:150%; border:1px solid;" onscroll="OnScrollDiv (this)">
<center><strong> RETURN, REFUND AND EXCHANGE POLICY</strong></center></br>

<p align="justify">Please read the following policies carefully before using any of digiBlitz's 
products or platform(s). The return policy is provided in addition to any legal return rights 
that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 15 
days from the day of purchasing the product(s) or platform(s). digiBlitz Inc has rights to refuse 
any return or exchange if it fails to meet the norms.</p>

<p align="left"><strong>1.	TERMS OF USE AND RESALE</strong>

<p align="justify">&nbsp;THOUGH DIGIBLITZ INC. ALLOWS YOU TO ACCESS VARIOUS RESOURCES THROUGH 
ITS ONLINE (CLOUD) OR ENTERPRISE PRODUCT(S) & PLATFORM(S), WEBSITE, DB STORE, AND OTHER SELLABLE 
GOODS THAT MAY OR MAY NOT BE AVAILABLE FOR PURCHASE, OR DOWNLOAD, INFORMATION OF SOFTWARE, INCLUDING 
THE  SOFTWARE AND TOOLS (COLLECTIVELY "SERVICES") ARE SUBJECT TO THESE TERMS OF USE AND SALE 
("TERMS OF USE AND RESALE" OR "CONTRACT").</br></br>

&nbsp;&nbsp;By using digiBlitz's and its Products Website, Purchasing/ downloading products and
 services from the digiBlitz's website,  its Products website, dB store or through any authorized 
 reseller, you accept and agree to TERMS OF USE AND RESALE, DIGIBLITZ PRIVACY STATEMENT, 
 and APPLICABLE TERMS AND CONDITIONS, policies or disclaimers found in the digiBlitz Inc. 
 or referenced herein and accessible through the related hyperlinks. We allow you to read 
 the digiBlitz Inc. Policies carefully. <br/></p></p>
 
<p align="left"><strong>2.	TERMS RELATING TO YOUR USE OF THE DB STORE</strong><br/>

<p align="justify">&nbsp;2.1.	PERSONAL AND COMMERCIAL USE LIMITATION<br/>

&nbsp;&nbsp;Unless otherwise specified, the Products, Components Of dB store and Services are 
only for your personal and commercial use. You may not profitably distribute, circulate, license,
 or trade any information or services obtained from the Websites, Products, components of dB store
 and their respective Services.<br/></br>
 
&nbsp;2.2.	NOTICE SPECIFIC TO DOCUMENTS AVAILABLE ON THE EBSITE OR SERVICES<br/>

&nbsp;&nbsp;Permission to use Documents and information (such as white papers, press releases,
 datasheets, Product literatures, Manuals of any kind and FAQs) from the Websites, Products, components of dB store and their respective Services is allowed for your personal and commercial use.<br/>
&nbsp;&nbsp;Use of such records from digiBlitz Inc. or Services is for informational and profitably 
or personal use only and will not be copied or posted on any network computer or make public in any 
media, unless permitted by freedom from a responsibility under applicable copyright
laws. You could however with prior permission from digiBlitz Inc., could use the information provided,
 the following Copyright notice: © 2016 digiBlitz Inc., All rights reserved. appears in all copies and 
 that both the copyright notice and this permission notice appear.<br/></br>
&nbsp;&nbsp;Website: Any digiBlitz Inc. owned, operated, licensed or controlled website. Elements of
 digiBlitz Inc. websites, including the Website, are protected by trademark, unfair competition, and 
 other laws and may not be copied or imitated in whole or in part. No logo, graphic, sound or image 
 from any digiBlitz Inc. website, including the Website, may be copied, retransmitted or made available unless expressly permitted by digiBlitz Inc. or applicable law.<br/>
&nbsp;&nbsp;The documents and related graphics published on any digiBlitz Inc. owned, operated, 
licensed or controlled website and dB Store or Services could include technical inaccuracies or
typographical errors. Changes may be periodically added to the information without prior notice. 
digiBlitz Inc. and/or its respective suppliers may make improvements and/or changes in the product(s)
 and/or the platform(s) and/or dB store described herein at any time.<br/><br/>
 
2.3.MEMBER ACCOUNT, PASSWORD, AND SECURITY<br/>

&nbsp;&nbsp;If you want to open any account in any dB products, information should be complete,
 accurate, and current as required by the applicable registration form. Username and password may or 
 may not be generated by digiBlitz Inc. depending upon the case. However, you are responsible for 
 keeping your account information and password confidential and be responsible for all activity that 
 occurs under your account. You agree to notify digiBlitz Inc. without delay of any unauthorized use
 of your account or any other breach of security.<br/><br/>
 
2.4.NO UNLAWFUL OR PROHIBITED USE<br/>
&nbsp;&nbsp;As a condition of your use of the Services, you pledge to us that you will not use the
 Services for any purpose that is against the law or disallowed by these terms, conditions, & notices.
 You may not use our product(s), platform(s) or component(s) of dB store which would cause damage, 
 disable or crash any server, or the network(s) connected to any digiBlitz server, or interfere with 
 any other party's use and enjoyment of any Services. You may not try to gain unauthorized access to
 any Services, computer systems or networks connected to any digiBlitz's Server or to any of the Server.
 You may not use the services in a way that violate rights of third parties, carelessly harming a 
 person or entity, including digiBlitz. digiBlitz has right to make any information public.<br/><br/>
 
2.5.MATERIALS PROVIDED TO digiBlitz Inc. PRODUCTS OR POST ON THE WEBSITE BY YOU<br/>
&nbsp;&nbsp;digiBlitz Inc does not claim ownership of the materials you provide to digiBlitz Inc.
 (including feedback, ratings, and suggestions) or post, upload, input or submit to any Product or
 its connected  services for review by the users, or by the members of any public or private area of
 people (each a "Submission" and collectively "Submissions").<br/>&nbsp;&nbsp;However, digiBlitz Inc. 
 shall be permitted to use your Submission, including your name, for the purpose for which it was 
 submitted. No compensation will be paid for you Submission. digiBlitz Inc.  has rights to remove any
 Submission at any time in its own discretion.<br/><br/>
 
2.6.THIRD-PARTY LINKS IN OUR WEBSITE<br/>
&nbsp;&nbsp;The dB store or any product(s) or platform(s) may include links to third-party websites
 that allow you leave the digiBlitz Inc. Website. 
The digiBlitz Inc is not responsible for any internal link or contents of third party website. 
These linked sites are not under the control of digiBlitz Inc. digiBlitz Inc. is providing these 
links only for your convenience. Your use of the third-party website may be subject to that third
 party’s terms and conditions.</p></p><br/><br/>
 
<p align="left"><strong>3.	Terms Relating to the Resale of Products to You</strong>

&nbsp;<p align="justify">3.1.USERS<br/>
&nbsp;&nbsp;You must not be a reseller. Only the end users are allowed to buy our product.<br/><br/>

&nbsp;3.2.INFORMATION ABOUT BILLING AND ACCOUNT INFORMATION<br/>

&nbsp;&nbsp;The information provided to digiBlitz Inc. by you for all purchases should be accurate
 current and complete and .You agree to update your account and other information immediately, 
 including your email address and credit card numbers and expiration dates, so that we can complete 
 your transactions and contact you as needed.</br><br/>
 
&nbsp;3.3.PRODUCT AVAILABILITY AND QUANTITY AND ORDER LIMITS<br/>
&nbsp;&nbsp;Pricing page of our product can be changed at any time without notice. 
digiBlitz Inc. may limit on the number that may be purchased per account, per person, per order, 
 per credit card, or per CPU and core. We have rights to refuse or reject any order at any time, 
 refunding you any money you have paid for the order, for reasons which include, but are not limited
 to, you have follow the conditions specified at the time of the order, otherwise your payment cannot
 be processed. In case if we are unable to supply our product, we will contact you and we will make 
 an alternative. If you do not choose to purchase the alternative product, we will cancel your order.
 If the product has some error, we reserve the right to correct the error and charge you the correct 
 price. In that case will offer you the option of purchasing the product and also for cancelling the
 order. Credits or refunds will be made to the same method of payment and account used to place the
 order.<br/><br/>
 
3.4.SOFTWARE PURCHASES AND LICENSE TERMS<br/>
&nbsp;&nbsp;Any software made available to download or purchase from the website or dB store is the 
copyrighted work of digiBlitz Inc. When you purchase software, you are actually purchasing a license 
to use the software rather than purchasing the software itself. Software licenses purchased form any
 of digiBlitz's owned or controlled website or from an authorized reseller are subject to the license 
 agreement that accompanies the software (the "License Agreement"). You will be required to agree to
 the terms and conditions of the License Agreement when you install the software.<br/><br/>
 
&nbsp;&nbsp;Any reproduction or redistribution of software or merchandise not in accordance with 
the relevant License Agreement and applicable law is expressly prohibited and may result in severe 
civil and criminal penalties. Violators risk being prosecuted to the maximum extent possible.<br/><br/>

3.5.Refund<br/>
&nbsp;&nbsp;Refunds will be made in the same method as above. For refund the intimation should 
be given to digiBlitz Inc.  by customer and it will be processed with 15 days.<br/><br/></p></p>

<p style="font-size:16px;"><center><strong>Terms and Condition</strong></center>

<p align="justify"><strong>1.	Payment and pricing:</strong><br/>
&nbsp;&nbsp;Pricing of all products are stated in digiBlitz's relevant product or platform websites.
 Pricing page of our product(s) and platform(s) can be changed at any time without notice. digiBlitz 
 Inc. may limit on the number that may be purchased per order, per account, per credit card, per
 person or per CPU. Pricing shown in the website will include all tax and charges of the product.
 <br/><br/>
 
<strong>2.	AUTO RENEWAL OF THE PRODUCTS</strong><br/>
&nbsp;&nbsp;All products of digiBlitz Inc.  will be renewed automatically at the end of each month
 on a prorate basis or depending up on the date of purchase (depending upon individual cases). 
 We will also inform you about the renewal through email before the subscription of the product.
 Once we informed you about the auto renewal, we will charge automatically for the product. 
 The intimation will be given before one week from the renewal to digiBlitz Inc. by the customer. 
 We will provide you with instruction on cancelling the product service or for suspending the product.
 However, no intimation will be given to you for subscription renewal of any dB store components. 
 You must cancel the services before the renewal date to avoid being billed for the renewal.
 <br/><br/>
 
<strong>3.	Return, Refund and Exchange</strong><br/>
&nbsp;&nbsp;The return policy is provided in addition to any legal return rights that you may have
 under law. digiBlitz Inc. will accept returns, refunds and exchanges within 30 day after purchasing 
 of product. We have rights to refuse any refund, return or exchange if it fails to meet our norm.
 For Return, Refund and Exchange the intimation should be given before one week from the renewal to
 digiBlitz Inc. by the customer and it will be processed within 30 days. We may occasionally extend 
 the 15-day return period during holiday or other periods. If a longer return period was advertised 
 through a promotional campaign on the Website when you made your purchase, that applies within the 
 clause mentioned in the promotional campaign.<br/><br/>
 
<strong>4.	Trial-period</strong><br/>
&nbsp;&nbsp;If you are taking part in any trial-period, you must cancel the service before the end of 
the trial period to avoid incurring new charges unless we notify you otherwise. Your trial 
subscription will be automatically upgraded to basic pack at the end of this free subscription
period. This implies that your credit card will be charged for the basic pack. However, you could 
unsubscribe the product any time before the trial expiry through the Master account management link
 that is accessible when you login into the product.<br/><br/>

<strong>5.	Customer support</strong><br/>
&nbsp;&nbsp;Please visit our Knowledge base site for Customer support and Assistance relating to 
the product.<br/><br/>

<strong>6.	CHANGING TERMS</strong><br/>
&nbsp;&nbsp;digiBlitz Inc. may change the Terms of Return, Refund and Exchange at any time and
 without notice to you. The Terms of Return, Refund and Exchange in force at the time you place 
 your order will govern your purchase and serve as the purchase contract between us. Before your 
 next purchase, digiBlitz Inc. may change their policies. We advise you to visit the digiBlitz Inc. 
 website, to review the current terms and condition, Refund and Return policy each time. <br/><br/>
 
<strong>7.	PROTECTION OF INDIVIDUAL INFORMATION</strong><br/>
&nbsp;&nbsp;Your privacy is important to us. We may use certain information for the purpose of your
 product according to your need. <br/><br/>
 
<strong>8.	LIMITATION OF LIABILITY</strong><br/>

&nbsp;&nbsp;In this section of Contract, digiBlitz Inc. is found liable to you for any loss or 
damage that arises out of or is in any way connected with your use of the dB Store, the Services, 
or any product or service offered, you agree that your exclusive remedy is to recover from digiBlitz 
Inc.  or any affiliates, and vendors direct damages up to (1) an amount equal to the price or fee for 
one month of any service or subscription or (2) US $100 if there was no service, subscription or 
similar fee.<br/><br/>

&nbsp;&nbsp;YOU AGREE THAT YOU CAN'T RECOVER ANY OTHER DAMAGES OR LOSSES, INCLUDING, WITHOUT 
LIMITATION, CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, INCIDENTAL, OR CONCERNING PUNISHMENT. 
THESE LIMITATIONS AND EXCLUSIONS APPLY EVEN IF YOU INCUR DAMAGES AND EVEN IF WE KNEW OR SHOULD HAVE
 KNOWN ABOUT THE POSSIBILITY OF THE DAMAGES. THESE LIMITATIONS AND EXCLUSIONS APPLY TO ANYTHING
 RELATED TO THE WEBSITE OWNED AND CONTROLLED BY DIGIBLITZ INC., ITS PRODUCT (S), PLATFORM(S) OR ANY
 COMPONENTS OF DB STORE, OR SERVICE OFFERED<br/><br/>

<strong>9.	Interpreting the Contract</strong><br/>
&nbsp;&nbsp;All parts of this Contract apply to the maximum extent permitted by the relevant law of 
the United States.<br/><br/></p></p>

</div>
                                </div>
                            </div>	
							
							<div class="col-md-8">
                                <div class="form-group">                                    
	<input  type="checkbox" name="accept" disabled="disabled" id="check" /> I agree to the user License agreement and privacy policy.
	<input type="hidden" name="accept"> 
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							 <div class="col-md-8">
                                <label class="linksss">
                <input type="submit" name="Insert" value="Sign Up" class="submit" id="submit">
				</label>
				<label class="linkssss">
                 <input  type="button" value="Cancel" name="button" onClick="javascript:history.back(-1);" >
				</label>
                            </div>
							
							</div>
							</form>

							<% }else{%>
   
    <form id="form" name="insert" action="map.html?cmd=signup" method="post" >
	
	
	
   <input type="hidden" name="amount" id="amo" value="<%=amount%>">
   <input type="hidden" name="type" id="type" value="<%=type%>">
    <input type="hidden" name="coupon_code" id="coupon_code" value="<%=coupon_code%>">
                       		
										
        				<div class="row">
						
						
														
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>First Name:</label>
									<input  type="text" name="firstname" id="firstname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Last Name:</label>
									<input  type="text" name="lastname" id="lastname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
														
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Email:</label>
									<input  type="text" name="email" id="email" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Mobile No:</label>
									<input  type="text" name="mobileno" id="mobileno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Institution Name:</label>
									<input  type="text" name="companyname" id="companyname" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Address:</label>
									<input  type="text" name="street" id="street" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Country:</label>									
		<select name="country" class="form-control" onChange="FillState(document.insert.country, document.insert.state, '');">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>State:</label>									
		<select name="state" class="form-control">			
					</select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>City:</label>
									<input  type="text" name="city" id="city" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Zip:</label>
									<input  type="text" name="zip" id="zip" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
															
		 <% if(type.equalsIgnoreCase("buynow")){ %>
		 
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Package Type:</label>
									
					<% if(plantype.equalsIgnoreCase("basic")){ %>
		<input type="radio" name="plantype" id="basic" value="basic"  checked="checked"/> 
    Basic
    <input type="radio" name="plantype" id="silver" value="silver" /> 
   Silver
    <input type="radio" name="plantype" id="gold" value="gold" />
   Gold
    <input type="radio" name="plantype" id="platinum" value="platinum" />
    Platinum
					 <% } else if(plantype.equalsIgnoreCase("silver")){%>
					  <input type="radio" name="plantype" id="basic" value="basic"  /> 
    Basic
    <input type="radio" name="plantype" id="silver" value="silver" checked="checked"/> 
    Silver
    <input type="radio" name="plantype" id="gold" value="gold" />
    Gold
    <input type="radio" name="plantype" id="platinum" value="platinum" />
    Platinum
					  <% } else if(plantype.equalsIgnoreCase("gold")){%>
					   <input type="radio" name="plantype" id="basic" value="basic"  /> 
   Basic
    <input type="radio" name="plantype" id="silver" value="silver" /> 
    Silver
    <input type="radio" name="plantype" id="gold" value="gold" checked="checked"/>
    Gold
    <input type="radio" name="plantype" id="platinum" value="platinum" />
   Platinum
					   <% } else if(plantype.equalsIgnoreCase("platinum")){%>
					   <input type="radio" name="plantype" id="basic" value="basic"  /> 
    Basic
    <input type="radio" name="plantype" id="silver" value="silver" /> 
    Silver
    <input type="radio" name="plantype" id="gold" value="gold" />
   Gold
    <input type="radio" name="plantype" id="platinum" value="platinum" checked="checked"/>
					   <% }%>			  
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Payment Plan:</label>
				<input type="radio" name="subscriptiontype" id="plan" value="monthly"  /> 
   Monthly
    <input type="radio" name="subscriptiontype" id="plan1" value="quarterly" checked="checked"/> 
   Quarterly(Save 10%)
    <input type="radio" name="subscriptiontype" id="plan2" value="annual" />
    Annual(Save 25%)
                                    
                                </div>
                            </div>
							
	<% if(amount != null){
	  int ap = Integer.parseInt(amount);
	  int cp = Integer.parseInt(onetimecost);
	  int n=ap*3;
	  int m=n*10/100;
	  int am=n-m;
	  int aaa=(n-m)+cp;
	  amount=Integer.toString(am);
	  totamount=Integer.toString(aaa);	  
  %>
  
							  <div class="col-md-8">
                                <div class="form-group">
                                    <label>Amount to be Charged:</label>
									<input  type="text" name="fee" id="fee" class="form-control" value="<%=amount%>"  >
                                    <span class="form-validation" style="color:Red;">*</span>
									
									<span id="dp1" style="display:none;">Total for a Month</span>  
  									<span id="dp2" style="display:none;">Total for 3 Months</span>
									<span id="dp3" style="display:none;">Total for 12 Months</span>
                                </div>
                            </div>
  <% }else{%>
  						<div class="col-md-8">
                                <div class="form-group">
                                    <label>Amount to be Charged:</label>
									<input  type="text" name="fee" id="fee" class="form-control" value="<%=amount%>"  >
                                    <span class="form-validation" style="color:Red;">*</span>
									
									<span id="dp1" style="display:none;">Total for a Month</span>  
  									<span id="dp2" style="display:none;">Total for 3 Months</span>
									<span id="dp3" style="display:none;">Total for 12 Months</span>
                                </div>
                            </div>
  
  <% }%>
  
  							<div class="col-md-8" id="setup0" style="display:none;" >
                                <div class="form-group">
                                    <label>One Time Setup Cost:</label>
									<input  type="hidden" name="setup_cost" id="setup_cost" class="form-control" value="0"  >
                                    <span style="width:200px; height:30px;">Basic(0) </span>
                                </div>
                            </div>
							
							<div class="col-md-8" id="setup1" style="display:none;">
                                <div class="form-group">
                                    <label>One Time Setup Cost:</label>
									<input  type="hidden" name="setup_cost" id="setup_cost" class="form-control" value="999"  >
                                    <span style="width:200px; height:30px;">Silver(999) </span>
                                </div>
                            </div>
							
							<div class="col-md-8" id="setup2" style="display:none;">
                                <div class="form-group">
                                    <label>One Time Setup Cost:</label>
									<input  type="hidden" name="setup_cost" id="setup_cost" class="form-control" value="3999"  >
                                    <span style="width:200px; height:30px;">Gold(3999) </span>
                                </div>
                            </div>
							
							<div class="col-md-8" id="setup3" style="display:none;">
                                <div class="form-group">
                                    <label>One Time Setup Cost:</label>
									<input  type="hidden" name="setup_cost" id="setup_cost" class="form-control" value="14999"  >
                                    <span style="width:200px; height:30px;">Platinum(14999) </span>
                                </div>
                            </div>
							
							
							<div class="col-md-8" id="setup4">
                                <div class="form-group">
                                    <label>Use Coupon Code:</label>
					<input  type="text" name="couponcode" id="couponcode" class="form-control"  ><input type="button" name="coupon" id="coupon" value="Apply">
                                    <span style="width:200px; height:30px;">(Use Coupon Code if you have) </span>
									
                                </div>
								
                            </div>
							
							
							<div class="col-md-8" id="setup4">
                                <div class="form-group">
                                    <label>Total Amount:</label>
					<input  type="text" name="total_amount" id="total_amount" class="form-control" value="<%=totamount%>"  readonly>
                                    <span style="width:200px; height:30px;">(Subscription Cost+Setup Cost) </span>
                                </div>
                            </div>
										 			
							<% }else{%>
							<div class="col-md-8" id="setup4">
                                <div class="form-group">
                                    <label>Note: We will not Charge any amount from you for Trial Period</label>					
                                </div>
                            </div>
														
							<% }%>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label style="margin-top:17px;">Card Type:</label>
					<input type="radio" name="cardtype" id="cardtype" value="visa" style="margin-top:20px;" />
  <img src="images/visa.png" alt="visa" style="height:45px; width:60px; margin:0 0 15px 0; ">
 
 <input type="radio" name="cardtype" id="cardtype" value="mastercard" />
  <img src="images/master.png" alt="master" style="height:55px; width:75px;">
 
 <input type="radio" name="cardtype" id="cardtype" value="amex" /> 
 <img src="images/american.png" alt="american" style="height:55px; width:75px;" >    
 <span style="color:Red;">*</span>                               
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Card Number:</label>
									<input  type="text" id="cardno" name="cardno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Expiration Date:</label>
			<select name="expirymonth" id="expirymonth" class="form-control" >
  <option value="">Month</option>
  <option value="1">January</option>
  <option value="2">February</option>
  <option value="3">March</option>
  <option value="4">April</option>
  <option value="5">May</option>
  <option value="6">June</option>
  <option value="7">July</option>
  <option value="8">August</option>
  <option value="9">september</option>
  <option value="10">October</option>
  <option value="11">November</option>
 <option value="12">December</option>
  </select>
  <select name="expiryyear" id="expiryyear" class="form-control" >
  <option value="">Year</option>
    
  <option value="2016">2016</option>
  <option value="2017">2017</option>
  <option value="2018">2018</option>
  <option value="2019">2019</option>
  <option value="2020">2020</option>
  <option value="2021">2021</option>
  <option value="2022">2022</option>
  <option value="2023">2023</option>
  <option value="2024">2024</option>
  <option value="2025">2025</option>
  <option value="2026">2026</option>
  <option value="2027">2027</option>
  <option value="2028">2028</option>
  <option value="2029">2029</option>
  <option value="2030">2030</option>
  <option value="2031">2031</option>
  <option value="2032">2032</option>
  <option value="2033">2033</option>
  <option value="2034">2034</option>
  <option value="2035">2035</option>
  <option value="2036">2036</option>
  <option value="2037">2037</option>
  <option value="2038">2038</option>
  <option value="2039">2039</option>
  <option value="2040">2040</option>
  <option value="2041">2041</option>
  <option value="2042">2042</option>
  </select>
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>CVV:</label>
									<input  type="password" id="cvvno" name="cvvno" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div class="form-group">
                                    <label>Cardholder Name:</label>
									<input  type="text" id="name" name="name" class="form-control" value=""  >
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							<div class="col-md-8">
                                <div style="float:right;">
                                    <a href="https://www.paypal.com/us/verified/pal=paypal%40digiblitz%2ecom" target="_blank"><img src="https://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal" style="width:70px; height:70px;" ></A>

<a href="#" onClick="window.open('https://www.sitelock.com/verify.php?site=digiblitz.com','SiteLock','width=600,height=500,left=160,top=170');">
   <img alt="SiteLock" title="SiteLock" src="//shield.sitelock.com/shield/digiblitz.com" width="80px" height="40px">
                       </a>
<span id="siteseal">
                         <script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=rVTd0BptwwbkRS7ErqCst96o4A8qZWtbwmohz2yg6czXseVnRsCmqb4IHzw4">
                         </script>

                       </span>

                                </div>
                            </div>
										
						<div class="col-md-8">
                                <div class="form-group">

								 <label>Declaration:</label>
								  <label style="color:red; font-weight:normal;">Please read the complete Terms and Conditions to agree.</label>
   
 <div style="font-family:'Times New Roman', Times, serif; font-size:15px; overflow:scroll; overflow-x:hidden; padding:10px; overflow-y:scroll; height:220px; width:150%; border:1px solid;" onscroll="OnScrollDiv (this)">
<center><strong> RETURN, REFUND AND EXCHANGE POLICY</strong></center></br>

<p align="justify">Please read the following policies carefully before using any of digiBlitz's 
products or platform(s). The return policy is provided in addition to any legal return rights 
that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 15 
days from the day of purchasing the product(s) or platform(s). digiBlitz Inc has rights to refuse 
any return or exchange if it fails to meet the norms.</p>

<p align="left"><strong>1.	TERMS OF USE AND RESALE</strong>

<p align="justify">&nbsp;THOUGH DIGIBLITZ INC. ALLOWS YOU TO ACCESS VARIOUS RESOURCES THROUGH 
ITS ONLINE (CLOUD) OR ENTERPRISE PRODUCT(S) & PLATFORM(S), WEBSITE, DB STORE, AND OTHER SELLABLE 
GOODS THAT MAY OR MAY NOT BE AVAILABLE FOR PURCHASE, OR DOWNLOAD, INFORMATION OF SOFTWARE, INCLUDING 
THE  SOFTWARE AND TOOLS (COLLECTIVELY "SERVICES") ARE SUBJECT TO THESE TERMS OF USE AND SALE 
("TERMS OF USE AND RESALE" OR "CONTRACT").</br></br>

&nbsp;&nbsp;By using digiBlitz's and its Products Website, Purchasing/ downloading products and
 services from the digiBlitz's website,  its Products website, dB store or through any authorized 
 reseller, you accept and agree to TERMS OF USE AND RESALE, DIGIBLITZ PRIVACY STATEMENT, 
 and APPLICABLE TERMS AND CONDITIONS, policies or disclaimers found in the digiBlitz Inc. 
 or referenced herein and accessible through the related hyperlinks. We allow you to read 
 the digiBlitz Inc. Policies carefully. <br/></p></p>
 
<p align="left"><strong>2.	TERMS RELATING TO YOUR USE OF THE DB STORE</strong><br/>

<p align="justify">&nbsp;2.1.	PERSONAL AND COMMERCIAL USE LIMITATION<br/>

&nbsp;&nbsp;Unless otherwise specified, the Products, Components Of dB store and Services are 
only for your personal and commercial use. You may not profitably distribute, circulate, license,
 or trade any information or services obtained from the Websites, Products, components of dB store
 and their respective Services.<br/></br>
 
&nbsp;2.2.	NOTICE SPECIFIC TO DOCUMENTS AVAILABLE ON THE EBSITE OR SERVICES<br/>

&nbsp;&nbsp;Permission to use Documents and information (such as white papers, press releases,
 datasheets, Product literatures, Manuals of any kind and FAQs) from the Websites, Products, components of dB store and their respective Services is allowed for your personal and commercial use.<br/>
&nbsp;&nbsp;Use of such records from digiBlitz Inc. or Services is for informational and profitably 
or personal use only and will not be copied or posted on any network computer or make public in any 
media, unless permitted by freedom from a responsibility under applicable copyright
laws. You could however with prior permission from digiBlitz Inc., could use the information provided,
 the following Copyright notice: © 2016 digiBlitz Inc., All rights reserved. appears in all copies and 
 that both the copyright notice and this permission notice appear.<br/></br>
&nbsp;&nbsp;Website: Any digiBlitz Inc. owned, operated, licensed or controlled website. Elements of
 digiBlitz Inc. websites, including the Website, are protected by trademark, unfair competition, and 
 other laws and may not be copied or imitated in whole or in part. No logo, graphic, sound or image 
 from any digiBlitz Inc. website, including the Website, may be copied, retransmitted or made available unless expressly permitted by digiBlitz Inc. or applicable law.<br/>
&nbsp;&nbsp;The documents and related graphics published on any digiBlitz Inc. owned, operated, 
licensed or controlled website and dB Store or Services could include technical inaccuracies or
typographical errors. Changes may be periodically added to the information without prior notice. 
digiBlitz Inc. and/or its respective suppliers may make improvements and/or changes in the product(s)
 and/or the platform(s) and/or dB store described herein at any time.<br/><br/>
 
2.3.MEMBER ACCOUNT, PASSWORD, AND SECURITY<br/>

&nbsp;&nbsp;If you want to open any account in any dB products, information should be complete,
 accurate, and current as required by the applicable registration form. Username and password may or 
 may not be generated by digiBlitz Inc. depending upon the case. However, you are responsible for 
 keeping your account information and password confidential and be responsible for all activity that 
 occurs under your account. You agree to notify digiBlitz Inc. without delay of any unauthorized use
 of your account or any other breach of security.<br/><br/>
 
2.4.NO UNLAWFUL OR PROHIBITED USE<br/>
&nbsp;&nbsp;As a condition of your use of the Services, you pledge to us that you will not use the
 Services for any purpose that is against the law or disallowed by these terms, conditions, & notices.
 You may not use our product(s), platform(s) or component(s) of dB store which would cause damage, 
 disable or crash any server, or the network(s) connected to any digiBlitz server, or interfere with 
 any other party's use and enjoyment of any Services. You may not try to gain unauthorized access to
 any Services, computer systems or networks connected to any digiBlitz's Server or to any of the Server.
 You may not use the services in a way that violate rights of third parties, carelessly harming a 
 person or entity, including digiBlitz. digiBlitz has right to make any information public.<br/><br/>
 
2.5.MATERIALS PROVIDED TO digiBlitz Inc. PRODUCTS OR POST ON THE WEBSITE BY YOU<br/>
&nbsp;&nbsp;digiBlitz Inc does not claim ownership of the materials you provide to digiBlitz Inc.
 (including feedback, ratings, and suggestions) or post, upload, input or submit to any Product or
 its connected  services for review by the users, or by the members of any public or private area of
 people (each a "Submission" and collectively "Submissions").<br/>&nbsp;&nbsp;However, digiBlitz Inc. 
 shall be permitted to use your Submission, including your name, for the purpose for which it was 
 submitted. No compensation will be paid for you Submission. digiBlitz Inc.  has rights to remove any
 Submission at any time in its own discretion.<br/><br/>
 
2.6.THIRD-PARTY LINKS IN OUR WEBSITE<br/>
&nbsp;&nbsp;The dB store or any product(s) or platform(s) may include links to third-party websites
 that allow you leave the digiBlitz Inc. Website. 
The digiBlitz Inc is not responsible for any internal link or contents of third party website. 
These linked sites are not under the control of digiBlitz Inc. digiBlitz Inc. is providing these 
links only for your convenience. Your use of the third-party website may be subject to that third
 party’s terms and conditions.</p></p><br/><br/>
 
<p align="left"><strong>3.	Terms Relating to the Resale of Products to You</strong>

&nbsp;<p align="justify">3.1.USERS<br/>
&nbsp;&nbsp;You must not be a reseller. Only the end users are allowed to buy our product.<br/><br/>

&nbsp;3.2.INFORMATION ABOUT BILLING AND ACCOUNT INFORMATION<br/>

&nbsp;&nbsp;The information provided to digiBlitz Inc. by you for all purchases should be accurate
 current and complete and .You agree to update your account and other information immediately, 
 including your email address and credit card numbers and expiration dates, so that we can complete 
 your transactions and contact you as needed.</br><br/>
 
&nbsp;3.3.PRODUCT AVAILABILITY AND QUANTITY AND ORDER LIMITS<br/>
&nbsp;&nbsp;Pricing page of our product can be changed at any time without notice. 
digiBlitz Inc. may limit on the number that may be purchased per account, per person, per order, 
 per credit card, or per CPU and core. We have rights to refuse or reject any order at any time, 
 refunding you any money you have paid for the order, for reasons which include, but are not limited
 to, you have follow the conditions specified at the time of the order, otherwise your payment cannot
 be processed. In case if we are unable to supply our product, we will contact you and we will make 
 an alternative. If you do not choose to purchase the alternative product, we will cancel your order.
 If the product has some error, we reserve the right to correct the error and charge you the correct 
 price. In that case will offer you the option of purchasing the product and also for cancelling the
 order. Credits or refunds will be made to the same method of payment and account used to place the
 order.<br/><br/>
 
3.4.SOFTWARE PURCHASES AND LICENSE TERMS<br/>
&nbsp;&nbsp;Any software made available to download or purchase from the website or dB store is the 
copyrighted work of digiBlitz Inc. When you purchase software, you are actually purchasing a license 
to use the software rather than purchasing the software itself. Software licenses purchased form any
 of digiBlitz's owned or controlled website or from an authorized reseller are subject to the license 
 agreement that accompanies the software (the "License Agreement"). You will be required to agree to
 the terms and conditions of the License Agreement when you install the software.<br/><br/>
 
&nbsp;&nbsp;Any reproduction or redistribution of software or merchandise not in accordance with 
the relevant License Agreement and applicable law is expressly prohibited and may result in severe 
civil and criminal penalties. Violators risk being prosecuted to the maximum extent possible.<br/><br/>

3.5.Refund<br/>
&nbsp;&nbsp;Refunds will be made in the same method as above. For refund the intimation should 
be given to digiBlitz Inc.  by customer and it will be processed with 15 days.<br/><br/></p></p>

<p style="font-size:16px;"><center><strong>Terms and Condition</strong></center>

<p align="justify"><strong>1.	Payment and pricing:</strong><br/>
&nbsp;&nbsp;Pricing of all products are stated in digiBlitz's relevant product or platform websites.
 Pricing page of our product(s) and platform(s) can be changed at any time without notice. digiBlitz 
 Inc. may limit on the number that may be purchased per order, per account, per credit card, per
 person or per CPU. Pricing shown in the website will include all tax and charges of the product.
 <br/><br/>
 
<strong>2.	AUTO RENEWAL OF THE PRODUCTS</strong><br/>
&nbsp;&nbsp;All products of digiBlitz Inc.  will be renewed automatically at the end of each month
 on a prorate basis or depending up on the date of purchase (depending upon individual cases). 
 We will also inform you about the renewal through email before the subscription of the product.
 Once we informed you about the auto renewal, we will charge automatically for the product. 
 The intimation will be given before one week from the renewal to digiBlitz Inc. by the customer. 
 We will provide you with instruction on cancelling the product service or for suspending the product.
 However, no intimation will be given to you for subscription renewal of any dB store components. 
 You must cancel the services before the renewal date to avoid being billed for the renewal.
 <br/><br/>
 
<strong>3.	Return, Refund and Exchange</strong><br/>
&nbsp;&nbsp;The return policy is provided in addition to any legal return rights that you may have
 under law. digiBlitz Inc. will accept returns, refunds and exchanges within 30 day after purchasing 
 of product. We have rights to refuse any refund, return or exchange if it fails to meet our norm.
 For Return, Refund and Exchange the intimation should be given before one week from the renewal to
 digiBlitz Inc. by the customer and it will be processed within 30 days. We may occasionally extend 
 the 15-day return period during holiday or other periods. If a longer return period was advertised 
 through a promotional campaign on the Website when you made your purchase, that applies within the 
 clause mentioned in the promotional campaign.<br/><br/>
 
<strong>4.	Trial-period</strong><br/>
&nbsp;&nbsp;If you are taking part in any trial-period, you must cancel the service before the end of 
the trial period to avoid incurring new charges unless we notify you otherwise. Your trial 
subscription will be automatically upgraded to basic pack at the end of this free subscription
period. This implies that your credit card will be charged for the basic pack. However, you could 
unsubscribe the product any time before the trial expiry through the Master account management link
 that is accessible when you login into the product.<br/><br/>

<strong>5.	Customer support</strong><br/>
&nbsp;&nbsp;Please visit our Knowledge base site for Customer support and Assistance relating to 
the product.<br/><br/>

<strong>6.	CHANGING TERMS</strong><br/>
&nbsp;&nbsp;digiBlitz Inc. may change the Terms of Return, Refund and Exchange at any time and
 without notice to you. The Terms of Return, Refund and Exchange in force at the time you place 
 your order will govern your purchase and serve as the purchase contract between us. Before your 
 next purchase, digiBlitz Inc. may change their policies. We advise you to visit the digiBlitz Inc. 
 website, to review the current terms and condition, Refund and Return policy each time. <br/><br/>
 
<strong>7.	PROTECTION OF INDIVIDUAL INFORMATION</strong><br/>
&nbsp;&nbsp;Your privacy is important to us. We may use certain information for the purpose of your
 product according to your need. <br/><br/>
 
<strong>8.	LIMITATION OF LIABILITY</strong><br/>

&nbsp;&nbsp;In this section of Contract, digiBlitz Inc. is found liable to you for any loss or 
damage that arises out of or is in any way connected with your use of the dB Store, the Services, 
or any product or service offered, you agree that your exclusive remedy is to recover from digiBlitz 
Inc.  or any affiliates, and vendors direct damages up to (1) an amount equal to the price or fee for 
one month of any service or subscription or (2) US $100 if there was no service, subscription or 
similar fee.<br/><br/>

&nbsp;&nbsp;YOU AGREE THAT YOU CAN'T RECOVER ANY OTHER DAMAGES OR LOSSES, INCLUDING, WITHOUT 
LIMITATION, CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, INCIDENTAL, OR CONCERNING PUNISHMENT. 
THESE LIMITATIONS AND EXCLUSIONS APPLY EVEN IF YOU INCUR DAMAGES AND EVEN IF WE KNEW OR SHOULD HAVE
 KNOWN ABOUT THE POSSIBILITY OF THE DAMAGES. THESE LIMITATIONS AND EXCLUSIONS APPLY TO ANYTHING
 RELATED TO THE WEBSITE OWNED AND CONTROLLED BY DIGIBLITZ INC., ITS PRODUCT (S), PLATFORM(S) OR ANY
 COMPONENTS OF DB STORE, OR SERVICE OFFERED<br/><br/>

<strong>9.	Interpreting the Contract</strong><br/>
&nbsp;&nbsp;All parts of this Contract apply to the maximum extent permitted by the relevant law of 
the United States.<br/><br/></p></p>

</div>
                                </div>
                            </div>	
							
							<div class="col-md-8">
                                <div class="form-group">                                    
	<input  type="checkbox" name="accept" disabled="disabled" id="check" /> I agree to the user License agreement and privacy policy.
	<input type="hidden" name="accept"> 
                                    <span class="form-validation" style="color:Red;">*</span>
                                </div>
                            </div>
							
							
							 <div class="col-md-8">
                                <label class="linksss">
                <input type="submit" name="Insert" value="Sign Up" class="submit" id="submit">
				</label>
				<label class="linkssss">
                 <input  type="button" value="Cancel" name="button" onClick="javascript:history.back(-1);" >
				</label>
                            </div>
							
							
                            
                            </div>
                            
							</form>
							<% }%>
							
                        </div>
                        <% }%> 
                        
						
						
                  
        </div> 
    </section>
	</div></div>
	</div></div>
<!--==============================footer=================================-->
 <footer>     
      <%@ include file = "../../include/footer.jsp" %>
       </footer>
</body>

<script type="text/javascript">
			

//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.insert.email.value!="" && document.insert.email.value.indexOf(' ')!=0)
	{

   var chsemail=document.insert.email.value;
   
   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "qual.html?cmd=checkemail&chsemail="+chsemail; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText != "false")
		{
			alert("Email already Exists Choose Another !");
			document.insert.email.value="";
			document.insert.email.focus();
		}		      
    } 
FillCountry(document.insert.country, document.insert.state, 'USA' );
FillState(document.insert.country, document.insert.state, '');
			 
 </script>
</html>
