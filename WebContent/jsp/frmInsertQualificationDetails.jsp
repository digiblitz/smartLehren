<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>


<!--%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %-->
<!--%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
       <script  src="js/ts_picker.js"></script>
     <script src="js/TMForm.js"></script> 

 <script type="text/javascript">
function initload(){

 document.getElementById('forug').style.display = "none";
 document.getElementById('forpg').style.display = "none";

  }
  
  function disp(){
  
    var selValue = null;		 
   			 var e = frmInsertValidation.category.value;//get the combobox
			  //alert(e);
    		 //selValue = e.options[e.checked].value; //get selected value
			
  			 if(e == "UG") {
	   document.getElementById('forug').style.display  = "block"; 
	  document.getElementById('forpg').style.display = "none";
  }else{
	 document.getElementById('forug').style.display = "none";
	  document.getElementById('forpg').style.display = "block";   
  }
  }
</script> 
<script language="javascript" type="text/javascript">
function myValidate(){
	if(document.frmSelEvents.eventType.value==""){
		alert("Select an Event Type");
		document.frmSelEvents.eventType.focus();
		return false;
	}
	
	if(document.frmSelEvents.userType.value==""){
		alert("Select an User Type");
		document.frmSelEvents.userType.focus();
		return false;
	}
		
	if(document.frmSelEvents.selArea.value!="" && document.frmSelEvents.chmpStatus.value==""){		
		alert("Select a Championship Status");
		document.frmSelEvents.chmpStatus.focus();
		return false;			
	}		
	return true;
}
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
<%String qulamapid=(String)request.getAttribute("qulamapid"); %>
<link href="css/core-ie.css" rel="stylesheet" type="text/css" />
</head>
<body  class="page1" id="top" onLoad="initload();" >
 <headere><div>
 


<%@ include file = "../../include/header.jsp" %>
 <%@ include file = "../../include/Hmenu.jsp" %>
</div></headere>
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Insert Qualification Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 


				<!-- CONTENTS START HERE -->
				

		 <table  width="933" border="0" cellpadding="0" align="center" cellspacing="0" >
		 <form name="frmInsertValidation" id="frmInsertValidation" action="./qual.html" method="post" >
		  <input type="hidden" name="QualificationProcess" value="insertDetails"  />
  		  
		 <%
	String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>
	   <tr>
        <td width="473" style="height:30; " align="center"><strong><font color="#FF0000"><%=status%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>
		
		 <tr>
		 <td height="40" width="">Graduation Category</td>
		 <td width="" >
		   <input type="radio" name="category" id="category" value="UG"   onclick="disp()" />
		   UG
		   <input type="radio" name="category" id="category" value="PG" onclick="disp()" />
		   PG
		  <label style=" color:#FF0000">*</label></td>
		 </tr>
		
		  
	 
	
		  <tbody id="forug">
			
		  <tr style="margin-top:20px">
			
			<td height="40" width="473"  >Min. Age</td>
			<td><label style=" color:#FF0000">*</label><input type="text" name="age" id="age" style="width:250px; height:20px;" /></td>	</tr>
			
			<tr><td height="40" width="473"  >Standard</td>
			<td><label style=" color:#FF0000">*</label><input type="text" name="std" id="std"  style="width:250px; height:20px;"/></td>	</tr>
			<tr><td height="40" width="473"  >Supportive Documents</td>
			<td><label style=" color:#FF0000">*</label><input type="radio" name="document" id="document" value="1" />Yes
		 <input type="radio" name="document" id="document" value="0" />No</td>	</tr>
			
		  </tbody>
		  
		  <tbody id="forpg">
			
		
			
			<tr><td  height="40" width="" align="left"  class="textBold">UG Program Name</td>
	 								  <td width=""><label style=" color:#FF0000">*</label>
	 								  <select name="standard" id="standard" style="width:230px; height:20px;" >
								 		<option  value="">Select Program Name</option>
								 			<%ArrayList programlist = (ArrayList)session.getAttribute("ugprogramlist");
   
   if(programlist!=null && programlist.size()!=0){
   Iterator itr5 = programlist.iterator();
   
   while(itr5.hasNext()){
    String sr3[] = (String[]) itr5.next();
    
    
    //String allowdate = sr3[1];
    String ugprogram = sr3[0];
    
	
   %>
                      <option value="<%=ugprogram%>"><%=ugprogram%></option>
                     
                     
                    
                    </select>
					<%}}%>						 
			 		</td>	</tr>
			<tr><td height="40" width="473"  >Supportive Documents</td>
			<td><label style=" color:#FF0000">*</label><input type="radio" name="document" id="document" value="1" />Yes
		 <input type="radio" name="document" id="document" value="0" />No</td>	</tr>
			
		  </tbody>
		
			
				   <tr>
					<td colspan="2" align="center">
					<img src="images/submit.jpg" alt="submit"  width="20" height="20" style="cursor:pointer"/><input type="submit" name="insert" id="appButton" value="Submit" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" onclick="return onValidate();"  />	
					<img src="images/create.jpg" alt="edit" width="20" height="20" style="cursor:pointer"/><input type="submit" name="insert" id="appButton" value="Edit" style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"    />		</td>
				  </tr>
			  </form>
		  
	  </table>
	 </div>   
  </div>  
			<!-- CONTENTS END HERE -->		
			  <br><br>  
    
</div>
<div>&nbsp;</div>	
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
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}
	

function onValidate()
{

chosen="";
len = document.frmInsertValidation.category.length ;
for(i=0;i<len;i++)
{if(document.frmInsertValidation.category[i].checked)
  { chosen= document.frmInsertValidation.category[i].value; }
}
if(chosen=="")
{alert("Select the Category");
 
 return false;
}

if(document.frmInsertValidation.age.value==""){
		alert("Age cannot be empty");
		document.frmInsertValidation.age.focus();
		return false;
	}
	
	if(Dospace(document.frmInsertValidation.age.value)||((document.frmInsertValidation.age.value.indexOf(' '))==0))
	   { alert("Enter valid Age");
	   document.frmInsertValidation.age.focus();
	   return false; }
	if(document.frmInsertValidation.std.value==""){
		alert("Standard cannot be empty");
		document.frmInsertValidation.std.focus();
		return false;
	}
	
	if(Dospace(document.frmInsertValidation.std.value)||((document.frmInsertValidation.std.value.indexOf(' '))==0))
	   { alert("Enter valid Standard");
	   document.frmInsertValidation.std.focus();
	   return false; }
	
	   
	   
	   
	   
	 
	return true;
}
</script>
</html>
