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
	
	
	String batchss = (String) request.getAttribute("batchs");
	String semesterss = (String) request.getAttribute("semester");
	

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
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Map Course Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
       
   <div align="center">    
<table width="800" >
<form name="createExam" id="createExam" action="exam.html" method="post">
<input type="hidden" name="cmd"  value="initcreateexam">
<% String s=(String)request.getAttribute("ram");

System.out.println("parasu--------->"+s);%>
<%
	String status=(String)request.getAttribute("status");
//	ArrayList courseList = (ArrayList)request.getAttribute("courseList");
	 if(status!=null){
	 %>
	 <tr ><td style="font-size:12pt;"></td><td colspan="2" style="color:red"><%=status%></td></tr><%} %>
	 


										<tr>
<td  height="40" width="100" align="left"  class="textBold"><label class="lab">Batch:</label></td>
								<td width="200">
	 							<select name="selBatch" id="selBatch" style="width:150px; height:20px;" >
								<option  value="" selected="selected"><label class="lab">Select Batch</label></option>
								<%
									ArrayList batch = (ArrayList)request.getAttribute("batch");
									System.out.println("batch >>---------> "+batch);
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
	 						<select name="selSemester" id="selSemester" onChange="postData()" style="width:150px; height:20px;">
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
								String str = Integer.toString(i);
									if(semesterss != null && semesterss.equals(str) ){System.out.println("semesterss::::"+semesterss);
									
											%>
                 			
                     
                     
                    
									<option value="<%=i%>" selected="selected"><%=i%><%=semLabel%></option>	
										
									<%}else{%>
									
									<option value="<%=i%>"><%=i%><%=semLabel%></option>	
									<%}}
									
							%>
                    </select>
								 		</td></tr>	</table>
										
										

<% if(s != null){%>										
			<table width="870" align="center" >
            <tr  style="font-size:18px; height:20px; font-weight:bold">
			<td width="150"  height="50" >Course Name</td>
			<td width="150"  height="50" >Session</td>
			<td width="150"  height="50" >Start Date</td>
			<td width="210"  height="50" >End date</td>
			
			
		   </tr>

				<%
									ArrayList coursenamess = (ArrayList)request.getAttribute("courselist");
									if(coursenamess!=null && coursenamess.size()!=0){
										Iterator cou = coursenamess.iterator();
										int i=0;
										while(cou.hasNext()){
											String[] coursena = (String [])cou.next();
											
											String coursen = coursena[0];
											String section = coursena[1];
											String start_time = coursena[2];
											String end_time = coursena[3];
											
											%>

 <tr>
		  <td  height="50" ><%=coursen%></td>
			<td  height="50" ><%=section%></td>
			<td  height="50" ><%=start_time%></td>	
			<td  height="50" ><%=end_time%></td>	
			
			
		   </tr>
			<% 
				}}
			else{
				%>
	  		<tr>
			<td height="19"colspan="5" align="center"><strong>No user to enroll</strong></td>
           </tr>
		   <%}} %>
<tr><td colspan="2" align="center">			
	 	<img src="images/map.png" alt="map" width="20" height="20" style="cursor:pointer"/>
		<input type="submit" name="map" value="Map" onClick="return onValidate();" 
		style="background-color: transparent; border:none; cursor:pointer; width:50px; height:20px; font-family:'Times New Roman', Times, serif;" >&nbsp;
		<label><img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/>
		
		<input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; font-family:'Times New Roman', Times, serif;
		cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
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

</html>

