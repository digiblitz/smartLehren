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
	 
	 <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
	        <script src="js/lib/jquery.js"></script>
			<script src="js/dist/jquery.validate.js"></script>
			<script src="jquery-1.11.3.min.js"></script>
     
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
    
	

function postData(postProcess){
//alert(postProcess);

if(postProcess=="selProg"){
if(document.frmMapPrograms.selProg.value!=""){
	prog=document.frmMapPrograms.selProg.value;
	document.frmMapPrograms.method="post";
	document.frmMapPrograms.action="map.html?cmd=selProg&prog="+prog;
	document.frmMapPrograms.submit();
	
	
	}
	
	}

}

/*function courseData(){
	var semValue = document.frmMapPrograms.selSemester.value;
	var progId = document.frmMapPrograms.selProg.value;
	var subProgId = document.frmMapPrograms.selSubProg.value;
	var grdCateg = document.frmMapPrograms.grdCateg.value;
	
	document.frmMapPrograms.method="post";
	document.frmMapPrograms.action="./map.html?cmd=selSem&sem="+semValue"&progId="+progId"&subProgId="+subProgId"&grdCateg="+grdCateg;
	document.frmMapPrograms.submit();
}*/

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

	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}

em{
	color:#b70000;
}
	</style>
     </head>
	 <body class="page1" id="top">
	 <%
	String programId = (String) request.getAttribute("progId");
	if(programId==null){
		programId = "";
	}
	
	

%>
	
 <headere><div>
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div>&nbsp;</div>
    
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Map Course </div>
<div class="pps" style="font-family:'Times New Roman', Times, serif; border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
       
   <div align="center">    
<table width="800" >
<form name="frmMapPrograms" id="frmMapPrograms" action="map.html" method="post">
<input type="hidden" name="cmd"  value="mapAll">

<%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	 <tr ><td style="font-size:12pt;"></td><td colspan="2" style="color:red"><%=status%></td></tr><%} %>
	 
<tr>
<td  height="40" width="60" align="left"  class="textBold"><label class="lab">Program Name:</label></td>
	 								  <td width="200">
	 								  <select name="selProg" id="selProg" style="font-family:'Times New Roman', Times, serif; width:230px; height:20px;" onChange="postData('selProg');" required >
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
                      <option value="<%=progId%>" selected="selected"><label class="lab"><%=progName%></label></option>
                      <%
											 }
											 
											 else{
											 %>
                      <option value="<%=progId%>"><label class="lab"><%=progName%></label></option>
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
	 								  <select name="selSubProg" id="selSubProg" style="font-family:'Times New Roman', Times, serif; width:230px; height:20px;" required >
								 		<option selected="selected" value=""><label class="lab">Select Sub Program Name<label></option>
								 			 <%
									ArrayList subProgList = (ArrayList)request.getAttribute("subProgList");
									if(subProgList!=null && subProgList.size()!=0){
										Iterator itSubProgList = subProgList.iterator();
										while(itSubProgList.hasNext()){
											String[] subProgLists = (String [])itSubProgList.next();
											
											String subProgId = subProgLists[0];
											String subProgName = subProgLists[1];
											
											%>
                 			
                      <option value="<%=subProgId%>"><%=subProgName%></option>
                      <%
										}
									}
							%>
                    </select>
											 
								 		</td></tr>		
										<tr>
<td  height="40" width="100" align="left"  class="textBold"><label class="lab">Graduation Category:</label></td>
	 								  <td width="200">
	 							<input type="radio" size="10" name="grdCateg" id="grdCateg" value="UG" required/>
                  UG
                  <input type="radio" size="10" name="grdCateg" id="grdCateg" value="PG" required/> PG
								 		</td></tr>		
										
										<tr>
<td  height="40" width="60" align="left"  class="textBold"><label class="lab">Semester:</label></td>
	 								  <td width="200">
	 						<select name="selSemester" id="selSemester" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" required >
								 		<option selected="selected" value=""><label class="lab">Select Semester</label></option>
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
									
											%>
                 			
                      <option value="<%=i%>"><%=i%><%=semLabel%></option>
                      <%
										}
									
							%>
                    </select>
								 		</td></tr>			
				
				<%
			
	for(int j=1;j<=8;j++){
				%>
				
			
			
			<tr>
<td height="40" width="250" align="left"  class="textBold"><label class="lab">Course Code <%=j%>/Course Name <%=j%>:</label></td>
	 								  <td>
	 				<input  type="text" name="courseCode<%=j%>"  id="courseCode<%=j%>" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" ><em>*</em></td>
					<td><input  type="text" name="coursename<%=j%>"  id="coursename<%=j%>" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;"><em>*</em>
					
					
					
								 		</td></tr>		
				
				<%}%>
											<tr>

	 								  <td align="center" colspan="2">
	 	<img src="images/map.png" alt="map" width="20" height="20" style="cursor:pointer"/>
		<input type="submit" name="map" value="Map" 
		style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;" >&nbsp;
		<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>
		
		<input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; font-family:'Times New Roman', Times, serif; cursor:pointer; width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
		</label>
								 		</td></tr>		
	

</form>	   

</table>	 </div></div></div>   			

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
<script type="text/javascript">
function Dospace(str){
	if(str.indexOf("  ")!=-1)
	{return true;}
	else {return false;}
	}
	

function onValidate()
{

	if(document.frmMapPrograms.selProg.value==""){
		alert("Program Name cannot be empty");
		document.frmMapPrograms.selProg.focus();
		return false;
	}
	   
	    if(document.frmMapPrograms.selSubProg.value==""){
		alert("Sub Program Name cannot be empty");
		document.frmMapPrograms.selSubProg.focus();
		return false;
	}
	chosen="";
len = document.frmMapPrograms.grdCateg.length ;
for(i=0;i<len;i++)
{if(document.frmMapPrograms.grdCateg[i].checked)
  { chosen= document.frmMapPrograms.grdCateg[i].value; }
}
if(chosen=="")
{alert("Select the Category");
 
 return false;
}
	    
	
	 if(document.frmMapPrograms.selSemester.value==""){
		alert("Semester cannot be empty");
		document.frmMapPrograms.selSemester.focus();
		return false;
	}
	  for( j=1;j<=8;j++){
	   if(document.frmMapPrograms.courseCode[j].value==""){
		alert("courseCode cannot be empty");
		document.frmMapPrograms.courseCode[j].focus();
		return false;
	}
	
	if(Dospace(document.frmMapPrograms.courseCode[j].value)||((document.frmMapPrograms.courseCode[j].value.indexOf(' '))==0))
	   { alert("Enter valid courseCode");
	   document.frmMapPrograms.courseCode[j].focus();
	   return false; }}
	   for( j=1;j<=8;j++){
	   if(document.frmMapPrograms.coursename[j].value==""){
		alert("CourseName cannot be empty");
		document.frmMapPrograms.coursename[j].focus();
		return false;
	}
	
	if(Dospace(document.frmMapPrograms.coursename[j].value)||((document.frmMapPrograms.coursename[j].value.indexOf(' '))==0))
	   { alert("Enter valid courseName");
	   document.frmMapPrograms.coursename[j].focus();
	   return false; }}
	return true;
}
</script>
</html>

