<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
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
     <link rel="stylesheet" href="css/form.css">
     
      <script src="js/cscombo_new.js" type="text/javascript" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 
  
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
     <script src="js/datetimepicker_css.js"></script>
    
      <script src="js/jquery.leanModal.min.js"></script>
      <script  src="js/ts_picker.js"></script>
      
      <script src="js/dist/jquery.validate.js"></script>
      <script type="text/javascript" src="js/jquery.min.js"></script> 
	  <script type="text/javascript" src="js/jquery-ui.min.js"></script> 
      <script src="js/cscombo_new.js" type="text/javascript" ></script>	

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
		  
		  $("#flip1").click(function(){  
			$("#panel").show();   
		});    
		$("#flip2").click(function(){ 
			$("#panel").hide();  
		});
		
			
		$("#cancel").click(function(){
       url = "login.html?cmd=initmainindex";
      $( location ).attr('href', url);
    });
		
		
       });  
    

     </script>
  <%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

	     
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
	<style>
 label{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}

#panel{
	display:none;
}
	</style>
	
	
     </head>
	 <body class="page1" id="top">
	
 <headere><div>
  <%String role_name=(String)session.getAttribute("role_name"); %>
<%String course_name=(String)session.getAttribute("course_name"); %>
<%String userid=(String)session.getAttribute("user_id"); %>
<input type="hidden" name="course_name"  value="<%=role_name%>">

<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
	 
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Edit Profile</div>

<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

      <table width="1000" >
<%String user_id=(String)request.getAttribute("user_id"); %>
         
         <%
	String upstatus=(String)request.getAttribute("upstatus");
	 if(upstatus!=null){
	 %>
        <span width="139" style="height:30" align="center" colspan="2">
        <strong><font color="#FF0000"><%=upstatus%></font></strong></span>       
	 <%}%>  
	 



<table width="750" border="0" align="center" style="margin-left:250px; margin-top:20px" >
 
 
 <FORM id="form" name="insert" ACTION="login.html?LoginProcess=update&user_id=<%=user_id%>" METHOD=POST name="uploadfile">

 
<tr height="50" width="122">
			<td>
				Username:
			</td>
			<td>
				<input id="username" name="username" type="text" maxlength="50" onBlur="usrStat();" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("username"))%>">
			</td>			
		</tr>
        
        <tr height="50" width="122">
			<td>
				Password:
			</td>
			<td>
				<input id="password" name="password" type="text" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("password"))%>">
			</td>			
		</tr>

		
                            
		<tr height="50" width="122">
			<td>
				Confirm Password:
			</td>
			<td>
	<input id="password_confirm" name="password_confirm" type="password" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="">
			</td>			
		</tr>
                     
		<tr height="50" width="122">
			<td>
				First Name:
			</td>
			<td>
				<input id="firstname" name="firstname" type="text" maxlength="100" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("firstname"))%>">
			</td>
			<td class="status"></td>
		</tr>
                            
      
                       
		<tr height="50" width="122">
			<td>
				Last Name:
			</td>
			<td>
				<input id="lastname" name="lastname" type="text" maxlength="100" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("lastname"))%>">
			</td>			
		</tr>
		
		<tr height="50" width="122">
		<td>Are you ready to disclose your gender?:</td>
				<td><input type="radio"  name="yesno" id="flip1">Yes 
				<input type="radio"  name="yesno" id="flip2">No</td>
				 </tr>
		
			<tr id="panel" height="50" width="122">
				<td>Gender:</td>
				<td><input type="radio" name="gender"  value="male"/>Male
				<input type="radio" name="gender" value="female"/>Female
				<input type="radio" name="gender" value="others"/>Others
			</td></tr>
				
								  
                <tr height="50" width="122">
    <td   height="50" width="224">Date of Birth:</td>
    <td width="473">
  <input  type="text" name="date" id="date" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("dob"))%>" >&nbsp
  <img src="images/calendar.jpg" 
  alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('date')" />
  </td> 
  </tr>
  
  
  		<tr height="50" width="122">
  			<td>
  				Mobile No:
 			 </td>			
			<td>
               <input  type="text" name="countrycode" id="countrycode" style="font-family:'Times New Roman', Times, serif; width:30px">
			   <input  type="text" name="mobileno" id="mobileno" style="font-family:'Times New Roman', Times, serif; width:130px"  value="<%=nullCheck((String)request.getAttribute("mobileno"))%>">
            </td>              
			</tr>
			
			<tr height="50" width="122">
  			<td>
  				Phone No:
 			 </td>			
			<td>
               <input  type="text" name="phoneno" id="countrycode" style="font-family:'Times New Roman', Times, serif; width:30px">
			   <input  type="text" name="phoneno" id="phoneno" style="font-family:'Times New Roman', Times, serif; width:130px">
            </td>             
			</tr>
			
			<tr height="50" width="122">
  			<td>
  				Fax:
 			 </td>			
			<td>
               <input  type="text" name="faxno" id="countrycode" style="font-family:'Times New Roman', Times, serif; width:30px">
			   <input  type="text" name="faxno" id="faxno" style="font-family:'Times New Roman', Times, serif; width:130px">
            </td>              
			</tr>
  
 		  <tr height="50" width="122">
           <td height="56">Upload photo:</td>
 		 <td>
  		<input type="file" name="choose" id="choose"><br><span style="font-family:'Times New Roman', Times, serif;">file size should be 10kb to 40kb</span>
			  </td>
       </tr>
            
			<tr height="50" width="122"><td>
				Email:</td>
				<td><input id="email" name="email" type="email" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("email"))%>" >
			</td></tr>
			
		<tr height="50" width="122"><td>
				Father Name:</td>
				<td><input id="fathername" name="fathername" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("fathername"))%>">
		</td></tr>
			
			<tr height="50" width="122"><td>
				Mother Name:</td>
				<td><input id="mothername" name="mothername" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("mothername"))%>">
			</td>
	</tr>
			
		<tr height="50" width="122"><td>
				Address1:</td>
				<td><input id="address1" name="address1" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("address1"))%>" >
			</td></tr>
			
			<tr height="50" width="122"><td>
				Address2:</td>
				<td><input id="address2" name="address2" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("city"))%>">
			</td></tr>
			
			<!-- <tr height="50" width="122"><td>
				Floor No:</td>
				<td><input id="address3" name="address3" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("city"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				Street Address:</td>
				<td><input id="address4" name="address4" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("city"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				Lane:</td>
				<td><input id="address5" name="address5" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("city"))%>">
			</td></tr>
			
			<tr height="50" width="122"><td>
				Area:</td>
				<td><input id="address6" name="address6" type="text" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("city"))%>">
			</td></tr>
			
			
			-->
			
			<tr height="50" width="122"><td>
				Country:</td>
<td><select name="country" onChange="FillState(document.insert.country, document.insert.state, '');" style="font-family:'Times New Roman', Times, serif; width:172px; height:20px" >
	<option value="<%=nullCheck((String)request.getAttribute("country"))%>"><%=nullCheck((String)request.getAttribute("country"))%></option>
					</select>
					</td>
					</tr>
			
			<tr height="50" width="122"><td>
				State:</td>
				<td><select name="state" style="font-family:'Times New Roman', Times, serif;">	
			<option value="<%=nullCheck((String)request.getAttribute("state"))%>"><%=nullCheck((String)request.getAttribute("state"))%></option>
				</select>
					</td></tr>
					
					<tr height="50" width="122"><td>
				City:</td>
				<td><input  type="text" name="city" id="city" value="<%=nullCheck((String)request.getAttribute("city"))%>" >					
             </td><td class="status"></td></tr>             
			
			
		<tr height="50" width="122"><td>Zip/Postal Code:</td>
				<td><input  type="text" name="pincode" id="pincode" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("pincode"))%>">
				</td>               
			</tr>
 
<tr  align="center" ><td colspan="2">
<img src="images/update.jpg"   alt="update" width="20" height="20" style="cursor:pointer"/>
<input type="submit" name="Insert" value="Update" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;">

&nbsp;
<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" id="cancel" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;" value="Cancel" >
</td></tr>


</FORM>

</table>
</table>

 </div>   </div>
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

<script type="text/javascript">


//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.insert.username.value!="" && document.insert.username.value.indexOf(' ')!=0)
	{

   var chsUserName=document.insert.username.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "qual.html?cmd=checkusrnam&chsUserName="+chsUserName; 

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
			alert("User Name already Exists Choose Another !");
			document.insert.username.value="";
			document.insert.username.focus();
		}
		      
    } 
	
	FillCountry(document.insert.country, document.insert.state, 'USA' );
FillState(document.insert.country, document.insert.state, '');
	
</script>

</html>

