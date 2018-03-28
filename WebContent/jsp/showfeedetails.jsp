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

$('#selProg').change(function(event) {
        var sports = $("select#selProg").val();
        $.get('exam.html?cmd=selProg', {
        	prog : sports
        }, function(response) {

        var select = $('#selSubProg');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
        
        

        
});

function postData(){
//alert(postProcess);


if(document.feereport.selSemester.value!=""){
	semester = document.getElementById("selSemester").value;
	pro_id = document.getElementById("selProg").value;
	subpro_id = document.getElementById("selSubProg").value;
	batc = document.getElementById("selBatch").value;
	document.feereport.method="post";
	document.feereport.action="exam.html?cmd=getfeereports&pro_id="+pro_id+"&subpro_id="+subpro_id+"&semester="+semester+"&batch="+batc;
	document.feereport.submit();
	
	
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

em{
	color:#b70000;
}


table.attendancestatus table{
	border:1px solid black;
	align:center;
	height:25px;
}

table.attendancestatus tr{

	height:25px;
}

table.attendancestatus th{
	border:1px solid black;
	align:center;
	height:25px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.attendancestatus td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:50px;
	font-family:"Times New Roman", Times, serif;
	
}	

.attendancestatus tr{
		background: #b8d1f3;
	}

.attendancestatus tr:nth-child(odd){ 
		background: #b8d1f3;
}
	
.attendancestatus tr:nth-child(even){
		background: #dae5f4;
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
  <div class="container_12 ">
      <div>&nbsp;</div>
    
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Fee Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
       
   <div align="center">    
   
   <form name="feereport" id="feereport" action="exam.html" method="post">
<table width="800" >

<input type="hidden" name="cmd"  value="initcreateexam">
<% String s=(String)request.getAttribute("ram");
%>
<%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	 <tr ><td style="font-size:12pt;"></td><td colspan="2" style="color:red"><%=status%></td></tr><%} %>
	 
<tr>
<td  height="40" width="60" align="left"  class="textBold"><label class="lab">Program Name:</label></td>
	 								  <td width="200">
	 <select name="selProg" id="selProg" style="font-family:'Times New Roman', Times, serif; width:230px; height:20px;" >
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
	 								  <select name="selSubProg" id="selSubProg" style="font-family:'Times New Roman', Times, serif; width:230px; height:20px;">
					<option value="">Select Sub Program Name</option>
								<%if(sub_coursename != null){%>
								<option selected="selected" value="<%=sub_coursename%>">								
								<%=sub_coursename%></option>
								<%}%>
					</select>
											 
								 		</td></tr>		
										<tr>
<td  height="40" width="100" align="left"  class="textBold"><label class="lab">Batch:</label></td>
								<td width="200">
	 							<select name="selBatch" id="selBatch" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;" >
								<option  value="" selected="selected"><label class="lab">Select Batch</label></option>
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
	 						<select name="selSemester" id="selSemester" onChange="postData()" style="font-family:'Times New Roman', Times, serif; width:150px; height:20px;">
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
									if(semesterss != null && semesterss.equals(str) ){System.out.println("semesterss::::"+semesterss);											%>
									<option value="<%=i%>" selected="selected"><%=i%><%=semLabel%></option>	
										
									<%}else{%>
									
									<option value="<%=i%>"><%=i%><%=semLabel%></option>	
									<%}}
									
							%>
                    </select>
								 		</td></tr>	</table>
										
										

<% if(s != null){%>										
			<table width="870" class="attendancestatus" align="center" style="margin-top:50px; font-family:'Times New Roman', Times, serif;">
            <tr  style="font-size:18px; height:20px; font-weight:bold">
			<td width="150"  height="50" >First Name</td>
			<td width="150"  height="50" >Last Name</td>
			<td width="150"  height="50" >Email</td>
			<td width="210"  height="50" >Payment Mode</td>
			<td width="150"  height="50" >Amount</td>
			<td width="150"  height="50" >DD Number</td>
			<td width="150"  height="50" >DD Date</td>
			<td width="210"  height="50" >Bank Name</td>
			<td width="210"  height="50" >Bank Branch</td>
			
			
		   </tr>

				<%
									ArrayList coursenamess = (ArrayList)request.getAttribute("feelist");
									if(coursenamess!=null && coursenamess.size()!=0){
										Iterator cou = coursenamess.iterator();
										int i=0;
										while(cou.hasNext()){
											String[] coursena = (String [])cou.next();
											
											String firstname = coursena[0];
											String lastname = coursena[1];
											String e_mail = coursena[2];
											String payment_type = coursena[3];
											String amount = coursena[4];
											String dd_number = coursena[5];
											String dd_date = coursena[6];
											String bank_name = coursena[7];
											String bank_branch = coursena[8];
											%>

 <tr>
		  <td  height="50" ><%=firstname%></td>
			<td  height="50" ><%=lastname%></td>
			<td  height="50" ><%=e_mail%></td>	
			<td  height="50" ><%=payment_type%></td>	
			<td  height="50" ><%=amount%></td>
			<td  height="50" ><%=dd_number%></td>
			<td  height="50" ><%=dd_date%></td>	
			<td  height="50" ><%=bank_name%></td>
			<td  height="50" ><%=bank_branch%></td>
		   </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19"colspan="9" align="center"><strong>No user to enroll</strong></td>
           </tr>
		   <%}} %>		

<!-- <tr><td colspan="9" align="center">			
	 	<img src="images/map.png" width="20" height="20" style="cursor:pointer"/>
		<input type="submit" name="map" value="Map" onClick="return onValidate();" 
		style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;" >&nbsp;
		<label><img src="images/Cancel.png"  width="20" height="20" style="cursor:pointer"/>
		
		<input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; font-family:'Times New Roman', Times, serif;
		cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
		</label>
								 		</td></tr>	-->	
	

   

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
  </footer>
</body>

</html>

