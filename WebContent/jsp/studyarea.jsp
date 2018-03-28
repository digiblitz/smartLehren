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
     <%@ page import="com.util.baseDB"%>
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
    
   <link rel="stylesheet" href="css/verstyles.css">
   <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="js/verscript.js"></script>
   <link rel="stylesheet" href="css/tabstyle.css" type="text/css" media="screen">  
     
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
	<script type="text/javascript" src="js/progressbar.js"></script>
	<link rel="stylesheet" type="text/css" href="css/progressbar.css">
  <style>
  #toggle {
   
  }
  #tabs {
  overflow: hidden;
  width: 100%;
  margin: 0;
  padding: 0;
  list-style: none;
  font-size:10px;
}

#tabs li {
  float: left;
  margin: 0 .5em 0 0;
}

#tabs a {
  position: relative;
  background: #ddd;
  background-image: linear-gradient(to bottom, #fff, #ddd);  
  padding: .7em 3.5em;
  float: left;
  text-decoration: none;
  color: #444;
  text-shadow: 0 1px 0 rgba(255,255,255,.8);
  border-radius: 5px 0 0 0;
  box-shadow: 0 2px 2px rgba(0,0,0,.4);
}

#tabs a:hover,
#tabs a:hover::after,
#tabs a:focus,
#tabs a:focus::after {
  background: #fff;
}

#tabs a:focus {
  outline: 0;
}

#tabs a::after {
  content:'';
  position:absolute;
  z-index: 1;
  top: 0;
  right: -.5em;  
  bottom: 0;
  width: 1em;
  background: #ddd;
  background-image: linear-gradient(to bottom, #fff, #ddd);  
  box-shadow: 2px 2px 2px rgba(0,0,0,.4);
  transform: skew(10deg);
  border-radius: 0 5px 0 0;  
}

#tabs #current a,
#tabs #current a::after {
  background: #fff;
  z-index: 3;
}

#contents {
  background: #fff;
  padding: 2em;
  height: 220px;
  position: relative;
  z-index: 2; 
  border-radius: 0 5px 5px 5px;
  box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
}
#table-scroll {
    overflow:scroll;
	overflow: auto;
    height: 710px;     
   position:relative;
}
#Course {

  border: medium none;
  border-radius: 2px;
  font-family: arial,sans-serif;
  font-size: 13px;
  height: 28px;
  margin: 0;
  outline: medium none;
   padding: 6px;
  width: 200px;
}

#progressBar{
		width: 292px;
		height: 17px;
	}
	#innerppp{
		width: 200px;
		height: 17px;		
	}
  </style>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script type="text/javascript">
  function postData(postProcess){
	

	if(postProcess=="Course"){
	if(document.frmstudyarea.Course.value!=""){
		prog=document.frmstudyarea.Course.value;
		document.frmstudyarea.method="post";
		document.frmstudyarea.action="map.html?cmd=initstudycourse&coursecode="+prog;		
		document.frmstudyarea.submit();
		
		
		}
		
		}

	}
  function gotolink(){
		
			document.frmstudyarea.method="post";
			document.frmstudyarea.action="map.html?cmd=initcommunity";
			
			document.frmstudyarea.submit();
			
			}

  function initload(){
	  document.getElementById('show').style.display = "none";
	   }
	   
  function toggle_visibility(id) 
  {
      var e = document.getElementById(id);
      if (e.style.display == 'block' || e.style.display=='')
      {
          e.style.display = 'none';
      }
      else 
      {
          e.style.display = 'block';
      }
  }
  </script>
</head>
 <body class="page1" id="top" onLoad="initload();">
 <headere><div>
  
<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;">
 <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<% baseDB db6=baseDB.getInstance(); %>
<div class="content">
  <div class=" ">
      <div class="">
	  <%String program=(String)session.getAttribute("prog");
	  String user_id=(String)session.getAttribute("user_id");
String subprogram=(String)session.getAttribute("subprog");
String url_link=(String)request.getAttribute("url_link");

String coursecode=(String)request.getAttribute("course_code");
System.out.println("url_link"+url_link);
%>
<form name="frmstudyarea" id="frmstudyarea" action="map.html" method="post">
<input type="hidden" name="cmd"  value="mapAll">
<table width="100%" >
    
   <tr>
   <td width=100% align="center">
   
  	 <table width=100% border="0" align="center" >
   			 
			<tr>
		
			<td width=23% style="background-color:  #f6f6f6; "  valign="top" id="toggle" style=" margin-left:10;">
			<!-- LEFT MENU STARTS HERE -->
			<div id="table-scroll">
					<table width="98%" align="left" style="margin-top: 25px; margin-left:10;">
                         <tr style=" margin-left:20px;">
                         	<td><div style="background-color:#999999; height:65px; color:#FAEBD7; font-size:16px; font-weight:bold; margin-left:20px;  margin-right:15px; border-radius:5px;">&nbsp; Program:<br>&nbsp;<%=program %>
                            </div></td>
                         </tr>
                         <tr><td height=10></td></tr>
                          <tr>
                         	<td>
							
				<div style="font-family:'Times New Roman', Times, serif; background-color:#999999; height:60px; color:#FAEBD7; font-size:16px;font-weight:bold; margin-left:20px;  margin-right:15px; border-radius:5px;">&nbsp;Course:<br>&nbsp; 
                         	<select name="Course" id="Course" onChange="postData('Course');" style="font-family:'Times New Roman', Times, serif;">
								 <option value="">Select Course</option>	
								 		<%	
				ArrayList stucourselist = (ArrayList)session.getAttribute("stucourselist");
				
					if(stucourselist!=null && stucourselist.size()!=0){
						
					Iterator itr = stucourselist.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
										 
					 String course_code = sr4[0]; 
					 String course_name = sr4[1]; 
			if(course_code.equals(coursecode)){		 	
			%>			
				<option value="<%=course_code%>" selected ><%=course_name%></option>
				<%}else{%>
				<option value="<%=course_code%>" ><%=course_name%></option>
                      <%}}}%>	
                    </select></div></td></tr>	
                    
                 						   
				<tr>
			<td>
	<div style="height:20px; width:75px;
			color:#000000; font-weight:bold; margin-left:25px; margin-top:8px;">Assignment</div>
							</td></tr>
                          <tr>
                    <td style="margin-top:8px; margin-left:20px;">                         	
          <div id="progressBar" class="tiny-green" style="margin-top:5px; margin-left:20px;">
					<div id="innerppp"></div></div>
	<input type="hidden" class="progresssize" id="progresssize" value="69">
                         	</td>
                         </tr>  
						 
                         <tr><td style="margin-top:20px; margin-left:20px;"></td></tr>  
                          <tr style="margin-top:20px;">
                         	<td style="margin-top:20px; margin-left:20px;">
                         	<div id='cssmenuss' style="font-family:'Times New Roman', Times, serif;margin-top:10px; margin-left:20px;  margin-right:15px;" >
<ul>
   <li class='active'><a href='#'><span>Study Plan</span></a></li>
    <%	
				ArrayList toplist = (ArrayList)session.getAttribute("toplist");
				
					if(toplist!=null && toplist.size()!=0){
						
					Iterator itr = toplist.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
					 String topic_id = sr4[0]; 					 
					 String topic_name = sr4[2]; 
					
					 	
			%>
   <li class='has-sub'><a href='#'><span><%=topic_name %></span></a>
      <ul> <%	
				ArrayList subtoplist = (ArrayList)session.getAttribute("subtoplist");
				
					if(subtoplist!=null && subtoplist.size()!=0){
						
					Iterator itrs = subtoplist.iterator();
					while(itrs.hasNext()){
					 String sr[] = (String[]) itrs.next();
										 
					 String topic_ids = sr[2]; 
					 String subtopic_name = sr[3]; 
					 String urllinks = sr[4]; 
					 if(topic_id.equals(topic_ids)){
						 
			%>
         <li><a href='<%=urllinks%>'><span><%=subtopic_name %></span></a></li>
        <%}}%>
      </ul>
   </li>
  
   <%}}} %>
</ul>
</div></td>
                         </tr>
                           <tr><td ></td></tr> 	
                           
						   <tr>
                         	<td><table width="90%"  style="background-color: #999999; margin-left:20px; margin-top:10px; border-radius:5px;">
							<tr style="background-color: #333333; border-radius:5px;">
			<td style="background-color:#333333;">
	<div style="background-color: #333333; height:30px; color:#ffffff; font-weight:bold; margin-left:20px;">Assignment</div>
							</td></tr>
							<tr><td> <%
ArrayList enrolList = (ArrayList)session.getAttribute("assign_name");
int i=1;
if(enrolList!=null && enrolList.size()!=0){
Iterator itr = enrolList.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String assign_id = sr[0];
 String assign_name = sr[1];
 String cou_code = sr[2];
 String cou_name=db6.getcoursename(cou_code);
   %>
   <div  style="margin-bottom:20px; color:#FAEBD7; " align="left"><a href="student.html?cmd=initshowassign&assign_name=<%=assign_name%>&course_code=<%=cou_code%>&user_id=<%=user_id%>&course_name=<%=cou_name %>" style="text-decoration: none"><%=assign_name%>-Assignment <%=i%></a></div>
   
<%i++;}
}else{ %>
 <div  style="margin-bottom:20px; color:#FAEBD7" align="left">No Assignment</div>
<%} %>
							</td></tr>
							</table></td>
                         </tr>	
						 	 <tr><td height=10></td></tr> 	
							  <tr>
                         	<td><table width="90%" style="background-color:#999999; margin-left:20px; margin-top:10px; ">
							<tr style="background-color: #333333; border-radius:5px;"><td style="background-color:#333333;"><div style="background-color: #333333; height:30px; color:#ffffff; font-weight:bold; margin-left:20px;">
                            Test</div>
							</td></tr>
							<tr><td><%
ArrayList quiz_nameli = (ArrayList)session.getAttribute("quiz_name");
 i=1;
if(quiz_nameli!=null && quiz_nameli.size()!=0){
Iterator itr = quiz_nameli.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String quiz_id = sr[0];
 String quiz_name = sr[1];
 String cou_code = sr[2];
   %>
<div style="margin-bottom:20px; color:#FAEBD7;" align="left"><a href="student.html?cmd=initshowquiz&quiz_name=<%=quiz_name%>&course_code=<%=cou_code%>" style="text-decoration: none"><%=quiz_name%> Quiz <%=i%></a></div>


<%i++;}
}else{ %>
 <div  style="margin-bottom:20px; color:#FAEBD7" align="left">No Test</div>
<%} %>
							</td></tr>
							</table></td>
                         </tr>						  								  
                    </table></div>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="2%"><a href="#"><img src="images/closearrow.png" alt="closearrow"style="margin-top:25px;" id="ram"></a></td>
			<td width="75%" valign="top" style="background-color:  #6f6f6; ">
			<table  width="50%" >
				<tr><td height=25></td></tr>
				<tr>
					<%	
				ArrayList urllist = (ArrayList)session.getAttribute("urllist");
				
					if(urllist!=null && urllist.size()!=0){
						
					Iterator itr = urllist.iterator();
					while(itr.hasNext()){
					 String sr4[] = (String[]) itr.next();
										 
					 String sm = sr4[0]; 
					 String rm = sr4[1];
					 String rc = sr4[2]; 
					 String lc = sr4[3]; 
					 String pb = sr4[4]; 
					 String sg = sr4[5]; 
					 String we = sr4[6]; 
					 String cc = sr4[7]; 
					 	
			%>
					<td><ul id="tabs">
    <li><a href="student.html?cmd=initstudyarea&url=<%=sm %>" name="tab1">Study Material</a></li>
    <li><a href="#" name="tab2">Reference Material</a></li>
     
</ul></td>
				</tr>
								
			</table>
			
			<div width="100%">
			<%if(url_link != null){System.out.println("url_link"+sm); %>
			<iframe src="<%=url_link %>" style="height:600px; width:1005px"></iframe>
			<%} %>
				
			</div> 
		<div width="100%" style="font-size:10px;">
		<div class="example" >
    <ul id="nav" >
        <li class="current"><a href="student.html?cmd=initstudyarea&url=jsp/recordedclass.jsp">Recorded Class</a></li>
        <li><a href="https://www.digiblitzonline2.com:5443/openmeetings" target="_blank">Live Class</a></li>
        <li><a href="student.html?cmd=initstudyarea&url=<%=pb %>">Pdf Books</a></li>
         <li><a href="student.html?cmd=initstudyarea&url=jsp/studyguideline.jsp">Study Guideline</a></li>
        <li><a href="#">Writing Excellance</a></li>
        <li><a href="student.html?cmd=initstudyarea&url=jsp/sample.jsp">Help</a></li>
        <li><a href="javascript:gotolink();" >Course Community</a></li>
         <li><a href="javascript:toggle_visibility('show');" id="ram">Notes</a></li>		  
    </ul>
	
	
</div>	
			
		</td>	
		
		<td id="show">		
		<div class="example" style="margin: 0 0 0 -21px;">
		<textarea rows="35" cols="25" style=" height:653px;"></textarea>	

    <ul id="nav" style="width:100%; height:65px;">
      <!--  <li class="current"><a href="#">Save</a></li> -->
        <li><a href="javascript:toggle_visibility('show');">Cancel</a></li>
    </ul>
</div>	
		</td>			
	    </tr>
		
		<%}}else{ %>
	<td><ul id="tabs">
    <li><a href="#" name="tab1">Study Material</a></li>
    <li><a href="#" name="tab2">Reference Material</a></li>
     
</ul></td>
				</td></tr>
								
			</table>
			
			<div width="100%" >
			
			<%if(url_link != null){ %>
			<iframe src="<%=url_link %>" width="100%" height="800" ></iframe>
			<%} %>
				
			</div> 
		<div width="100%" style="font-size:10px;">
			
			<div class="example">
    <ul id="nav">
        <li class="current"><a href="#">Recorded Class</a></li>
        <li><a href="#">Live Class</a></li>
        <li><a href="#">Pdf Books</a></li>
         <li><a href="#">Study Guideline</a></li>
        <li><a href="#">Writing Excellance</a></li>
        <li><a href="#">Help</a></li>
        <li><a href="#">Course Community</a></li>
        <li><a href="#notesmodel"  id="modaltrigger">Notes</a></li>
    </ul>
</div>	</div>
	<%}%>
			
		</td>		
	    </tr>
	  </table></td></tr>
 
</table></form>
</div></div></div>
<!--==============================footer=================================-->
  <footer>   
    <div class="container_12"><br>
      <%@ include file = "../../include/footer-in.jsp" %>
      </div>
  </footer>
<script>
$(document).ready(function(){
			$(' #ram' ).click(function() {
				
			  $( "#toggle" ).toggle();
			  if($("#toggle").is(':visible')){ 
			      $("#ram").attr('src','images/closearrow.png'); 
			  }
			  else{
			      $("#ram").attr('src','images/openarrow.png');
			  }
			});

				var size=$('#progresssize').val();								
			progressBar(size, $('#progressBar'));	
});
</script>
</body>
</html>
