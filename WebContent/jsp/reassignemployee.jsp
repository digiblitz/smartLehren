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
     <link rel="stylesheet" href="css/form.css">
	
     <link rel="stylesheet" href="css/gender.css">
	 
     <script src="js/datetimepicker_css.js"></script>
      

    
    <script src="js/lib/jquery.js"></script>
	<script src="js/dist/jquery.validate.js"></script>	
                    
          <style>	
	.lab{
	font-family:"Times New Roman", Times, serif;
	font-size:15px;
	text-align: center;
}

.title{
	font-family:"Times New Roman", Times, serif;
	font-size:35px;
	text-align: left;
	color:#9400D3;
}

table.attendancestatus th{
	border:1px solid black;
	align:center;
	height:35px;
	font-size:17px;
	font-family:"Times New Roman", Times, serif;
}

table.attendancestatus td{
	border:1px solid black;
	text-align:center;
	font-size:17px;
	height:35px;
	font-family:"Times New Roman", Times, serif;
	
}

	</style>
          
		   <script type="text/javascript">
	
	   
	   $(document).ready(function(){  
          
		  $("#programmentor").change(function(){
			   var programmentor = $("#programmentor2").val();	
			   alert(programmentor);
			   if(programmentor != null){
			  alert(programmentor);
			   }
			   else{
				   alert('error');
			   }
		  });
		  
				  
       }); 		
  
   function showVal(name,programid,subprogramid,user_id)
        { 		
   		 var name1 = name; 		
		 var programid = programid; 
		 var subprogramid = subprogramid;
		 var user_id = user_id;
   	     
	window.location.assign('report.html?cmd=programdetails&name='+name1+'&programid='+programid+'&subprogramid='+subprogramid+'&user_id='+user_id);			
       }

	   function showVal1(programid,programname,userid)
        { 
   		 var programid1 = programid; 
		 var programname1 = programname;
		 var userid = userid;
		 var programmentor = document.getElementById('programmentor').value;		 
   	    
   	 window.location.assign('report.html?cmd=subprogramdetails&name='+programmentor+'&programid='+programid+'&programname1='+programname1+'&userid='+userid);
   	
       }
	 
	   function showVal2(subprogramid,subprogramname)
       { 
  		 var subprogramid1 = subprogramid; 
		 var subprogramname1 = subprogramname; 
		   
		 
  	    document.getElementById('subprogramnamee').value = subprogramname;   			

		
      }
	   
	</script>
		  
     </head>
	 <body class="page1" id="top">
 <headere><div>
  
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>


<div><%@ include file = "../../include/header.jsp" %></div>
<div> <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content" >
  <div class="container_12">
       <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Reassign Employee</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  <%String userid=(String)request.getAttribute("user_id"); 
  
  
String status=(String)request.getAttribute("status");
	 if(status!=null){
	 %>	
	<span colspan="2" style="color:red; font-family:'Times New Roman', Times, serif; font-size:20px;"><%=status%></span>
	 <%} %>	 
		   
  
  <form align="center" style="margin:25px 0 0 0;" action="report.html?cmd=assignemployee" method="post" name="course" id="course">
<input type="hidden" name="userid" value="<%=userid%>"> 
<%	
ArrayList programlist = (ArrayList)request.getAttribute("programlist");
ArrayList subprogramlist = (ArrayList)request.getAttribute("subprogramlist");
%>

<div align="center">
	 <table width="450">
	 
<tr height="50"><td>Program Mentor Name:</td><td width="5">&nbsp;</td>
<td align="left">
<input type="text" name="programmentor"  id="programmentor" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" value="<%=nullCheck((String)request.getAttribute("name")) %>" readonly>
</td></tr>

<tr height="50"><td>Program Name:</td><td width="5">&nbsp;</td>
<td align="left">
<input type="text" name="programnamee"  id="programnamee" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" value="<%=nullCheck((String)request.getAttribute("programname")) %>" readonly>
</td></tr>

<tr height="50"><td>SubProgram Name:</td><td width="5">&nbsp;</td>
<td align="left">
<input type="text" name="subprogramnamee"  id="subprogramnamee" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" value="<%=nullCheck((String)request.getAttribute("subprogramname")) %>" readonly>
</td></tr>

</table></div>

<label> <img src="images/update.jpg" alt="" width="20" height="20" style="cursor:pointer"/><input   type="submit" name="assign" value="Assign" onClick="return(onValidate());" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></label>
				


</form>	  
 </div>  </div>
 
  <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Program Details</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px; font-size: 15px; color:black;">
  <div class="title">Program Mentor Name</div>
 <br><br>
 			<% ArrayList programmentorlist = (ArrayList)request.getAttribute("programmentorlist"); 					
 			
 				if(programmentorlist != null){
 					
 					Iterator itr = programmentorlist.iterator();
 					while(itr.hasNext()){ 						
 						String strarr[] = (String[])itr.next();
 						String firstname = strarr[0];
 						String lastname = strarr[1];
						String programid = strarr[2];
						String subprogramid = strarr[3];
						String user_id = strarr[4];
 						String name = firstname+"  "+lastname;						
 			%>
 				<div>
 	<a href="#" onClick="showVal('<%=name%>','<%=programid%>','<%=subprogramid%>','<%=user_id%>');"><%=name%></a><br><br>		
 			</div>
 		<%}}
 			%> 	

 <br><br>
 
 <%	if(programlist != null){ %>
 <div class="title">Program Name</div>
 <br><br>
 			<% 	Iterator itr = programlist.iterator();
 					while(itr.hasNext()){
 						String strarr[] = (String[])itr.next();
 						String programid = strarr[0];
 						String programname = strarr[1]; 						
 			%>
 			<input type="hidden" id="programid" value="<%=programname %>">			
 	<div><a href="#"  onClick="showVal1('<%=programid%>','<%=programname%>','<%=userid%>');"><%=programname %></a></div><br><br>
 			
 		<%}}
 			%> 	
 
  <br><br> 
  <%
	if(subprogramlist != null){
			 %>
 <div class="title">SubProgram Name</div>
 <br><br>
 			<% Iterator itr = subprogramlist.iterator();
 					while(itr.hasNext()){ 						
 						String subprogramname = (String)itr.next();				
 			%>
 						
 	<div><a href="#"  onClick="showVal2('<%=subprogramname%>','<%=subprogramname%>');"><%=subprogramname %></a></div><br><br>
 			
 		<%}}
 			%> 	
			
    </div>  </div>  </div></div>

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
