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
      <%@ page import="java.util.*, java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

     <meta name = "format-detection" content = "telephone=no" />
        <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />  
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/form.css">
     
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>

  <script type="text/javascript">
$(document).ready(function () {
    $("#submitButton").click(function () {
        var $form1 = $("#form1");
        $.post($form1.attr("action"), $form1.serialize(), function () {
            //alert('Form 1 submitted');
        });

        $('form[name="Class Schedule"]').each(function () {
            var $form = $(this);
            $.post($form.attr("action"), $form.serialize(), function () {
                //alert('Form 2 submitted');
            });
        });
    });
	
	

});

function myFunction(){
//alert('hai');
document.getElementById("scheduleclass").submit();
}
</script>	
  
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	
	}
	</style>
     </head>
	 
	 <body class="page1" id="top" onload="myFunction()" >
	
 <headere><div>

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12">
      <div>&nbsp;</div>
      
      <%String course=(String)request.getAttribute("course");
      String title=(String)request.getAttribute("title");
      String dateandtime=(String)request.getAttribute("dateandtime");
      String description=(String)request.getAttribute("description");%>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Request Form</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


								 			<% 
								 				Thread thread = new Thread();
								 			ArrayList cmcourselist =(ArrayList)request.getAttribute("emailId");
											int i=0;
											if(cmcourselist!=null && cmcourselist.size()!=0){
											
											Iterator itr = cmcourselist.iterator();
											 while (itr.hasNext()) {
											 String sr[] = (String[]) itr.next();
											
											 String emailID = sr[0];
											 thread.sleep(2000); 
									System.out.println("emailID from success class "+emailID);
															%>
															
															
															
			<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/fcb3f777bca8e46a4ec03ef7854133f6" id="scheduleclass" style="display:none;" class="infusion-form" method="POST" name="Class Schedule" onSubmit="var form = document.forms[0];
var resolution = document.createElement('input');
resolution.setAttribute('id', 'screenResolution');
resolution.setAttribute('type', 'hidden');
resolution.setAttribute('name', 'screenResolution');
var resolutionString = screen.width + 'x' + screen.height;
resolution.setAttribute('value', resolutionString);
form.appendChild(resolution);
var pluginString = '';
if (window.ActiveXObject) {
    var activeXNames = {'AcroPDF.PDF':'Adobe Reader',
        'ShockwaveFlash.ShockwaveFlash':'Flash',
        'QuickTime.QuickTime':'Quick Time',
        'SWCtl':'Shockwave',
        'WMPLayer.OCX':'Windows Media Player',
        'AgControl.AgControl':'Silverlight'};
    var plugin = null;
    for (var activeKey in activeXNames) {
        try {
            plugin = null;
            plugin = new ActiveXObject(activeKey);
        } catch (e) {
            // do nothing, the plugin is not installed
        }
        pluginString += activeXNames[activeKey] + ',';
    }
    var realPlayerNames = ['rmockx.RealPlayer G2 Control',
        'rmocx.RealPlayer G2 Control.1',
        'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
        'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
        'RealPlayer'];
    for (var index = 0; index &lt; realPlayerNames.length; index++) {
        try {
            plugin = new ActiveXObject(realPlayerNames[index]);
        } catch (e) {
            continue;
        }
        if (plugin) {
            break;
        }
    }
    if (plugin) {
        pluginString += 'RealPlayer,';
    }
} else {
    for (var i = 0; i &lt; navigator.plugins.length; i++) {
        pluginString += navigator.plugins[i].name + ',';
    }
}
pluginString = pluginString.substring(0, pluginString.lastIndexOf(','));
var plugins = document.createElement('input');
plugins.setAttribute('id', 'pluginList');
plugins.setAttribute('type', 'hidden');
plugins.setAttribute('name', 'pluginList');
plugins.setAttribute('value', pluginString);
form.appendChild(plugins);
var java = navigator.javaEnabled();
var javaEnabled = document.createElement('input');
javaEnabled.setAttribute('id', 'javaEnabled');
javaEnabled.setAttribute('type', 'hidden');
javaEnabled.setAttribute('name', 'javaEnabled');
javaEnabled.setAttribute('value', java);
form.appendChild(javaEnabled);">

<input name="inf_form_xid" type="hidden" value="fcb3f777bca8e46a4ec03ef7854133f6" />
<input name="inf_form_name" type="hidden" value="Class Schedule" />
<input name="infusionsoft_version" type="hidden" value="1.50.0.37" />
<div class="default beta-base beta-font-b" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div>
<div>
<div class="title" style="text-align:left">
<div class="title" contentid="title" style="text-align: left;">
<div style="text-align: center;">
Schedule Class
</div>
</div>
</div>
</div>
</div>
<div>
<div style="height:15px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_CourseLookingFor">Title *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_CourseLookingFor" name="inf_custom_CourseLookingFor" type="text" value=<%=title %> />
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_EventDateTime">Class Date & Time *</label>
</td><td class="infusion-field-input-container" style="width:200px;">
<table cellpadding="0" cellspacing="0">
<tbody>
<tr>
<td>
<input class="infusion-field-input-container" id="inf_custom_EventDateTime" name="inf_custom_EventDateTime" type="text" value=<%=dateandtime %> />
</td>
<td style="padding-left:3px;">&nbsp;

</td>
<td style="padding-left:3px;">
<select id="inf_custom_EventDateTime" name="inf_custom_EventDateTime"><option value="00:00">12:00 AM</option><option value="00:15">12:15 AM</option><option value="00:30">12:30 AM</option><option value="00:45">12:45 AM</option><option value="01:00">01:00 AM</option><option value="01:15">01:15 AM</option><option value="01:30">01:30 AM</option><option value="01:45">01:45 AM</option><option value="02:00">02:00 AM</option><option value="02:15">02:15 AM</option><option value="02:30">02:30 AM</option><option value="02:45">02:45 AM</option><option value="03:00">03:00 AM</option><option value="03:15">03:15 AM</option><option value="03:30">03:30 AM</option><option value="03:45">03:45 AM</option><option value="04:00">04:00 AM</option><option value="04:15">04:15 AM</option><option value="04:30">04:30 AM</option><option value="04:45">04:45 AM</option><option value="05:00">05:00 AM</option><option value="05:15">05:15 AM</option><option value="05:30">05:30 AM</option><option value="05:45">05:45 AM</option><option value="06:00">06:00 AM</option><option value="06:15">06:15 AM</option><option value="06:30">06:30 AM</option><option value="06:45">06:45 AM</option><option value="07:00">07:00 AM</option><option value="07:15">07:15 AM</option><option value="07:30">07:30 AM</option><option value="07:45">07:45 AM</option><option value="08:00">08:00 AM</option><option value="08:15">08:15 AM</option><option value="08:30">08:30 AM</option><option value="08:45">08:45 AM</option><option value="09:00">09:00 AM</option><option value="09:15">09:15 AM</option><option value="09:30">09:30 AM</option><option value="09:45">09:45 AM</option><option value="10:00">10:00 AM</option><option value="10:15">10:15 AM</option><option value="10:30">10:30 AM</option><option value="10:45">10:45 AM</option><option value="11:00">11:00 AM</option><option value="11:15">11:15 AM</option><option value="11:30">11:30 AM</option><option value="11:45">11:45 AM</option><option selected="selected" value="12:00">12:00 PM</option><option value="12:15">12:15 PM</option><option value="12:30">12:30 PM</option><option value="12:45">12:45 PM</option><option value="13:00">01:00 PM</option><option value="13:15">01:15 PM</option><option value="13:30">01:30 PM</option><option value="13:45">01:45 PM</option><option value="14:00">02:00 PM</option><option value="14:15">02:15 PM</option><option value="14:30">02:30 PM</option><option value="14:45">02:45 PM</option><option value="15:00">03:00 PM</option><option value="15:15">03:15 PM</option><option value="15:30">03:30 PM</option><option value="15:45">03:45 PM</option><option value="16:00">04:00 PM</option><option value="16:15">04:15 PM</option><option value="16:30">04:30 PM</option><option value="16:45">04:45 PM</option><option value="17:00">05:00 PM</option><option value="17:15">05:15 PM</option><option value="17:30">05:30 PM</option><option value="17:45">05:45 PM</option><option value="18:00">06:00 PM</option><option value="18:15">06:15 PM</option><option value="18:30">06:30 PM</option><option value="18:45">06:45 PM</option><option value="19:00">07:00 PM</option><option value="19:15">07:15 PM</option><option value="19:30">07:30 PM</option><option value="19:45">07:45 PM</option><option value="20:00">08:00 PM</option><option value="20:15">08:15 PM</option><option value="20:30">08:30 PM</option><option value="20:45">08:45 PM</option><option value="21:00">09:00 PM</option><option value="21:15">09:15 PM</option><option value="21:30">09:30 PM</option><option value="21:45">09:45 PM</option><option value="22:00">10:00 PM</option><option value="22:15">10:15 PM</option><option value="22:30">10:30 PM</option><option value="22:45">10:45 PM</option><option value="23:00">11:00 PM</option><option value="23:15">11:15 PM</option><option value="23:30">11:30 PM</option><option value="23:45">11:45 PM</option></select>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_DescriptionOfNeed">Class Description *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_DescriptionOfNeed" name="inf_custom_DescriptionOfNeed" type="text" value=<%=description %> />
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_FirstName">Mentor Name *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="parasu" />
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value=<%=emailID %> />
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button style="width:50px; height:10px; background-color:#FFFFFF; color:#FFFFFF; font-size:14px; font-family:Helvetica; border-color:#FFFFFF; border-style:Solid; border-width:1px; -moz-border-radius:1px;border-radius:1px;" type="submit" value="Submit">Submit</button>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</form>	
											
											
			
															
															<% 
														i++;
													}
												}
											%>
											 
		 	<!-- 	
							 		
 <form id="form1" form="center" action="trainer.html?cmd=classschedulesuccess"  method="post">
 <span><label class="lab">Click this button </label></span>	
          <label class="lab">  <input type="button" id="submitButton" value="Submit" /></label>
        </form>
    -->
  </div>   
</div>
</div></div>
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

</html>

