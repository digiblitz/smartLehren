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
     
     <script src="js/jquery.js"></script>
           <script src="js/datetimepicker_css.js"></script>
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
  <script>
$(document).ready(function() {

	$('#selProgg').change(function(event) {
        var sports = $("#selProgg").val();
		
		$.get('exam.html?cmd=selProg', {
        	prog : sports
        }, function(response) {
        	if(response != null){
        		 var select = $('#selSubProg');
        	        select.find('option').remove();
        	          $.each(response, function(index, value) {
        	          $('<option>').val(value).text(value).appendTo(select);
        	      });
        	}       
        });
        });
		
		
		
		$('#selSemester').change(function(event){

var semester = $("#selSemester").val();
var pro_id = $("#selProgg").val();
var subpro_id = $("#selSubProg").val();
var batc = $("#selBatch").val();
url = "exam.html?cmd=getlistofcourse&pro_id="+pro_id+"&subpro_id="+subpro_id+"&semester="+semester+"&batch="+batc; 
      $( location ).attr('href', url);

});

});
/* var select = $('#selSubProg');
select.find('option').remove();
  $.each(response, function(index, value) {
  $('<option>').val(value).text(value).appendTo(select);
}); */


function postData(){
alert(postProcess);


if(document.createExam.selSemester.value!=""){

	semester = document.getElementById("selSemester").value;
	pro_id = document.getElementById("selProg").value;
	subpro_id = document.getElementById("selSubProg").value;
	batc = document.getElementById("selBatch").value;
	
	document.createExam.method="post";
	document.createExam.action="exam.html?cmd=getlistofcourse&pro_id="+pro_id+"&subpro_id="+subpro_id+"&semester="+semester+"&batch="+batc;
	document.createExam.submit();
	
	
	}
	
	

}
</script> 

	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}

.lab1{
	font-family:"Times New Roman", Times, serif;	
	font-size:18px;
	font-weight:bold;
	text-align: left;
}
em{
	color:#b70000;
}
	</style>
     </head>
	 <body class="page1" id="top">
	 <%
	String programId = (String) request.getAttribute("pro_id");
	if(programId==null){
		programId = "";
	}
	
	String batchss = (String) request.getAttribute("batchs");
	String semesterss = (String) request.getAttribute("semester");
	String sub_coursename = (String) request.getAttribute("sub_coursename");
System.out.println("semesterss"+semesterss);

%>
	
 <headere><div>
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div><%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
      <div>&nbsp;</div>
    
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Map Course Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
       
   <div align="center">  
   
   <%
	String status = (String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span><%} %>
	
<form name="createExam" id="createExam" action="./exam.html" method="post">
	  
<table width="800" style="margin-top:20px;">
<input type="hidden" name="cmd"  value="createexams">
<%int j=0; 
String s=(String)request.getAttribute("ram");
%>

	 
<tr>
<td  height="40" width="60" align="left"  class="textBold"><label class="lab">Program Name:</label></td>
	 								  <td width="200">
	 	<select name="selProgg" id="selProgg" style="width:230px; height:20px; font-family:'Times New Roman', Times, serif; font-size:15px;" >
								 		<option selected="selected" value="">Select Program Name</option>
								 			 <%
									ArrayList progList = (ArrayList)request.getAttribute("progList");
									
									if(progList!=null && progList.size()!=0){
										Iterator itProgList = progList.iterator();
										while(itProgList.hasNext()){
											String[] progLists = (String [])itProgList.next();
											
											String progId = progLists[0];
											String progName = progLists[1];
											if(programId.equals(progId)){
											%>											
                      <option value="<%=progId%>" selected="selected"><%=progName%></option>
                      <%
											 }
											 
											 else{
											 %>
                      <option value="<%=progId%>"><%=progName%></option>
                      <%
											 }
										}
									}
							%>
                    </select>
											 
								 		</td></tr>
										
										
										<tr>
<td  height="40" width="60" align="left"  class="textBold"><label class="lab">Sub Program Name:</label></td>
	 								  <td width="200">
	 								  <select name="selSubProg" id="selSubProg" style="width:230px; height:20px; font-family:'Times New Roman', Times, serif;">
								 		<option value=""><label class="lab">Select Sub Program Name<label></option>
								<%if(sub_coursename != null){%>
								<option selected="selected" value="<%=sub_coursename%>"><label class="lab"><%=sub_coursename%><label></option>
								<%}%>
					</select>
											 
								 		</td></tr>	
				
		
										<tr>
<td  height="40" width="100" align="left"  class="textBold"><label class="lab">Batch:</label></td>
								<td width="200">
	<select name="selBatch" id="selBatch" style="width:150px; height:20px; font-family:'Times New Roman', Times, serif;" >
								<option  value="" selected="selected">Select Batch</option>
								<%
									ArrayList batch = (ArrayList)request.getAttribute("batch");
									
									if(batch!=null && batch.size()!=0){
										Iterator itbatch = batch.iterator();
										while(itbatch.hasNext()){
											String[] batch1 = (String [])itbatch.next();
											
											String bat = batch1[0];
											
										if(batchss != null && batchss.equals(bat) ){	
											%>
                 	
										
										<option value="<%=bat%>" selected="selected"><%=bat%></option>	
										<%}else{%>
										
										<option value="<%=bat%>" ><%=bat%></option>	
										<%
									}}}
							%>
								</select>
								</td>
	 								  </tr>		
										
										<tr>
<td  height="40" width="60" align="left"  class="textBold"><label class="lab">Semester:</label></td>
	 								  <td width="200">
	 						<select name="selSemester" id="selSemester" style="width:150px; height:20px; font-family:'Times New Roman', Times, serif;">
								 		<option selected="selected" value="">Select Semester</option>
								 			 <%
									for(int i=1;i<=8;i++){
										String semLabel="";
									if(i==1){	
								 semLabel="st Semester";	}
									else if(i==2){
								 semLabel="nd Semester";	}
									else if(i==3){
								 semLabel="rd Semester";	}	
									else{
								semLabel="th Semester";	}	
								String str = Integer.toString(i);
									if(semesterss != null && semesterss.equals(str) ){
																
											%>
                    
									<option value="<%=i%>" selected="selected"><%=i%><%=semLabel%></option>	
										
									<%}else{%>
									
									<option value="<%=i%>"><%=i%><%=semLabel%></option>	
									<%}}
									
							%>
                    </select>
								 		</td></tr>	</table>
										
										
<table width="900" >
<% if(s != null){%>										
			
			<tr>
<td height="40" width="350" align="left"  class="textBold"><label class="lab1">Course Name:</label></td>
<td><label class="lab1">Date</label></td><td><label class="lab1">Session</label></td><td><label class="lab1">Start Time</label></td><td><label class="lab1">End Time</label></td></tr>
				<%
									ArrayList coursenamess = (ArrayList)request.getAttribute("courselist");
									if(coursenamess!=null && coursenamess.size()!=0){
										Iterator cou = coursenamess.iterator();
										
										while(cou.hasNext()){
											String[] coursena = (String [])cou.next();
											String coursen = coursena[0];											
											%>

<tr height="40"><td><label class="lab"><input type="hidden" style="font-family:'Times New Roman', Times, serif; font-size:18px;" name="coursenamess<%=j%>" value="<%=coursen%>"><%=coursen%></label></td>
					
					<td width="200">
		<input type="text" style="width:100px;" name="date<%=j%>" id="date<%=j%>">
<img src="images/calendar.jpg" alt="Click To View Calendar" width="30" height="20" style="vertical-align:bottom;cursor:pointer" border="0"
  onClick="javascript:NewCssCal('date<%=j%>')" /></td>
  
					<td width="100"><select name="section<%=j%>" id="section<%=j%>" style="font-family:'Times New Roman', Times, serif; width:50px; height:20px;" >
								 		
								<option  value="FN" selected="selected">FN</option>
								<option  value="AN">AN</option>
								
					</select></td>
	
	<td width="225"><select name="starttime<%=j%>" id="starttime<%=j%>" style="font-family:'Times New Roman', Times, serif; width:50px; height:20px;">
								 		
								<option  value="1" selected="selected">1</option>
								<option  value="2">2</option>
								<option  value="3">3</option>
								<option  value="4">4</option>
								<option  value="5">5</option>
								<option  value="6">6</option>
								<option  value="7">7</option>
								<option  value="8">8</option>
								<option  value="9">9</option>
								<option  value="10">10</option>
								<option  value="11">11</option>
								<option  value="12">12</option>
								
					</select>
					
					<select name="startmins<%=j%>" id="startmins<%=j%>" style="font-family:'Times New Roman', Times, serif; width:45px; height:20px;">
					<% for(int l=0;l<=60;l++){%>
					<option  value="<%=l%>" ><%=l%>
					</option>
					<% }%>
					</select>
					<select name="starttimemethod<%=j%>" id="starttimemethod<%=j%>" style="font-family:'Times New Roman', Times, serif; width:50px; height:20px;" >
								 		
								<option  value="AM" selected="selected">AM</option>
								<option  value="PM">PM</option>
								
					</select></td>
			
		<td width="225"><select name="endtime<%=j%>" id="endtime<%=j%>" style="font-family:'Times New Roman', Times, serif; width:50px; height:20px;">
								 		
								
								<option  value="1" selected="selected">1</option>
								<option  value="2">2</option>
								<option  value="3">3</option>
								<option  value="4">4</option>
								<option  value="5">5</option>
								<option  value="6">6</option>
								<option  value="7">7</option>
								<option  value="8">8</option>
								<option  value="9">9</option>
								<option  value="10">10</option>
								<option  value="11">11</option>
								<option  value="12">12</option>
								
					</select>
					<select name="endmins<%=j%>" id="endmins<%=j%>" style="font-family:'Times New Roman', Times, serif; width:45px; height:20px;">
					<% for(int l=0;l<=60;l++){%>
					<option  value="<%=l%>" ><%=l%>
					</option>
					<% }%>
					</select>
					<select name="endtimemethod<%=j%>" id="endtimemethod<%=j%>" style="font-family:'Times New Roman', Times, serif; width:50px; height:20px;">
								 		
								<option  value="AM" selected="selected">AM
								</option>
								<option  value="PM">PM</option>
								
					</select></td></tr>	
					

<%j++;}} }%>	<input type="hidden" name="upto" value="<%=j%>">	

<tr height="25"><td colspan="5" align="center">			
	 	<img src="images/map.png" alt="map" width="20" height="20" style="cursor:pointer"/>
		
<input type="submit" name="map" value="Map" onClick="return onValidate();" 
		style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;" >&nbsp;
		<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>
		
		<input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; font-family:'Times New Roman', Times, serif;
		cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
		</label>
								 		</td></tr>		
	
</table>

</form>	   

	 </div></div></div>   			

     <br><br>  
   
  </div>   
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

</html>

