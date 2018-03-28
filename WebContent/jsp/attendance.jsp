<!-- amalesh 23-02-16 -->
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
      	<script src="js/dist/jquery.validate.js"></script>	
	 
	 <script type="text/javascript">
	$(document).ready(function() {
	
	jQuery("#attendanceform").validate({                      
        rules: {                    
                month:{
					required: true
				},
				year:{
					required:true
				},
				designation:{
					required: true
				}	
        },		
		groups:{
			somegroup:"month year"
		},
        messages: {               
			   month:"Please Select valid Month",        	
        	   year:"Please Select valid Year",
			   designation: "Please Select Designation"			   		  
            },
	errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next());				
				else
					error.appendTo(element.parent());
			}			
    });


	});
	
        function showVal(userregid,designame,username,programname,subprogram,yearmonth,semester,name,month,year){ 
   		 var cuserregid = userregid;		 
		 var designame = designame;
		 var username = username;  
		 var programname = programname;
		 var subprogram = subprogram;
		 var yearmonth = yearmonth;
		 var semester = semester;
		  var name = name;
		 var month = month;
		 var year = year;
		window.location.assign('report.html?cmd=initindividual&userregid='+cuserregid+'&designame='+designame+'&username='+username+'&programname='+programname+'&subprogram='+subprogram+'&yearmonth='+yearmonth+'&semester='+semester+'&name='+name+'&month='+month+'&year='+year);			
       }
	   
	   
	   
	   
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
	
	#attendanceform label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
		font-family:"Times New Roman", Times, serif;
		color: red;
		font-size:17px;
	}
	
 label{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
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
	height:25px;
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
	
	<!--
.attendancestatus tr{
		background: #b8d1f3;
	}

.attendancestatus tr:nth-child(odd){ 
		background: #b8d1f3;
}
	
.attendancestatus tr:nth-child(even){
		background: #dae5f4;
}

.attendancestatus input{
		background: #dae5f4;
}
-->
     </head>
	 <body class="page1" id="top">
	
 <headere><div>

<div><%@ include file = "../../include/header.jsp" %></div>
<div  > <%@ include file = "../../include/Hmenu.jsp" %></div>   

</div></headere>
<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
     <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; width:100%;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Attendance Status</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

     
        <% String username = (String)request.getAttribute("username");
        	String designame = (String)request.getAttribute("designation");
        	String programname = (String)request.getAttribute("programname");
        	String subprogram = (String)request.getAttribute("subprogramname");
        	String yearmonth = (String)request.getAttribute("yearmonth");
        	String courserolename = (String)request.getAttribute("courserolename");
        	String sturolename = (String)request.getAttribute("sturolename");
			String semester = (String)request.getAttribute("semester");
		
			String rolenamee = null;
        	%>
    

<FORM id="attendanceform" name="insert" ACTION="report.html?cmd=attendancestatus" METHOD=POST>

	<input type="hidden" value="<%=username %>" name="username">
	<table border="0" style="margin-left:250px; margin-top:20px" >
 
        
        <tr height="50" width="122">
			<td width="147">
				Program Name:			</td>
			<td width="448">
				<input id="programname" name="programname" type="text" maxlength="50" style="font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("programname"))%>" readonly>
			</td>			
		</tr>

		
                            
		<tr height="50" width="122">
			<td>
				Sub Program Name:
			</td>
			<td>
	<input id="subprogram" name="subprogram" type="text" maxlength="50" style="width:200px; font-family:'Times New Roman', Times, serif;" value="<%=nullCheck((String)request.getAttribute("subprogramname"))%>" readonly>
			</td>			
		</tr>
		
  <tr height="50" width="122">
			<td>
				Date:
			</td>
			<td>
	<select name="month" id="month" style="font-family:'Times New Roman', Times, serif;" required >
                        <option value=""> Month</option>
                        <option value="01">January</option>
                        <option value="02">Febrauary</option>
                        <option value="03"> March</option>
                        <option value="04"> April</option>
                        <option value="05"> May</option>
                        <option value="06"> June</option>
                        <option value="07">July</option>
                        <option value="08"> August</option>
                        <option value="09"> September</option>
                        <option value="10"> October</option>
                        <option value="11">Novenmber</option>
                        <option value="12"> December</option>
                        
                      
                   </select>
			<select name="year" id="year" style="font-family:'Times New Roman', Times, serif; width:70px;" required >
                        <option value="">Year</option>
                        <option value="2015">2015</option>
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
                   </select>
			</td>			
		</tr>
		
		
		
	 			
	 			<tr height="50" width="122">
				<td>
					Designation:
				</td>
				<td>
		
		<select name="designation" id="designation" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
	                        <option value="">Select Designation</option>    
	                        
	                        <%
	                        ArrayList rolelist = (ArrayList)request.getAttribute("rolelist");
	                        
	                        rolelist.removeAll(Collections.singleton(null));					
	                        if(rolelist != null){									
						 		Iterator itr=rolelist.iterator();									
						 		while(itr.hasNext()){									
						 			rolenamee = (String)itr.next();							 		
	                        %>                    
	                        <option value="<%=rolenamee%>"><%=rolenamee%></option>                      
	                      
	                      <%
						 		}
						 	}	
	                      %>
	                   </select>
				</td>			
			</tr>
	 			
	 	
             <tr height="50" width="122">
			<td>
				Semester:
			</td>
			<td>
	<select name="semester" id="semester" style="font-family:'Times New Roman', Times, serif; width:250px; height:25px;" >
                        <option value="null"> Select Semester</option>
                        <option value="1">Semester 1</option>
                        <option value="2">Semester 2</option>
                        <option value="3">Semester 3</option>
                        <option value="4">Semester 4</option>
                        <option value="5">Semester 5</option>
                        <option value="6">Semester 6</option>
                        <option value="7">Semester 7</option>
                        <option value="8">Semester 8</option>
                   </select><span style="font-family:'Times New Roman', Times, serif; color:#b70000;">(Only For Students)</span>
			</td>			
		</tr>

	<!--	<tr height="50" width="122">
			<td>
				<label id="semester" for="semester">PDF:</label>
			</td>
			
			<td>				
   <a href="myfile.png" target="_blank">to the PDF!</a>
	</td>
		</tr> -->
 
<tr  align="center" ><td colspan="2">
<img src="images/submit.jpg" alt="submit"  width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Submit" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:55px; height:20px;">
&nbsp;
<img src="images/Cancel.png" alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
</td></tr>
 

</table>
   
 </FORM>
  
 </div>   </div>   
   
  <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0; 
  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; width:100%;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Designation: <%=nullCheck((String)request.getAttribute("designation")) %></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
 
<table class="attendancestatus" width="100%">

<tr height="40"><th align="center">Register No.</th><th align="center">Name</th><th align="center">Particulars</th>

						<% ArrayList userdetails = (ArrayList)request.getAttribute("userdetails"); 
						
							
						if(userdetails != null && userdetails.size()!= 0){
							Iterator itr = userdetails.iterator();
							while(itr.hasNext()){
								String userlist[] = (String[])itr.next();								
								String userregid = userlist[0];	
								String firstname = userlist[1];
								String lastname = userlist[2];	
								String name = firstname+" "+lastname;
						%>
						
<tr>

<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=userregid%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=name%></div></td>
<td><a href="#" style="height:40px; margin-top:15px;" onClick="showVal('<%=userregid%>','<%=designame %>','<%=username %>','<%=programname %>','<%=subprogram %>','<%=yearmonth%>','<%=semester%>','<%=name%>','month','year');">View</a></td></tr>

					<%}}
					else{
					%>		
<tr><td colspan="3">No Records Found</td></tr>
					<% }%>
		 					</table>
							<br><br>
							
							
							<%
							String individual = (String)request.getAttribute("individual");
							
							if(individual != null){
							%>
		
<table class="attendancestatus" width="100%" id="panel">
<tr><td>
<div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=nullCheck((String)request.getAttribute("name")) %></div>
</td></tr>

<tr height="40"><th align="center">Date</th><th align="center">Login</th><th align="center">Logout</th><th align="center" >Working Hours</th><th align="center">Required</th><th align="center" >Prorate</th></tr>

			
			<%
				ArrayList logdetailslist = (ArrayList)request.getAttribute("logdetails");
			
			if(logdetailslist != null && logdetailslist.size()!= 0){
				Iterator itr = logdetailslist.iterator();
				while(itr.hasNext()){
					String userlist[] = (String[])itr.next();
					
					String userlogid = userlist[0];	
					String userid = userlist[1];
					String date1 = userlist[2];
					String login = userlist[3];
					String logout = userlist[4];	
					String workinghours = userlist[5];
					String required = userlist[6];	
					String prorate = userlist[7];
					String roleid2 = userlist[8];
					
					
					%>
	<tr>

<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=date1%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=login%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=logout%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=workinghours%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=required%></div></td>
<td><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" ><%=prorate%></div></td>

</tr>
					
		<%
				}
				}
				else{
					%>
					<tr>
					<td colspan="6">No Records Found</td>
					</tr>
					<%}%>
			</table>
			
			<%}%>
						
					
</div></div> 
  <div>&nbsp;</div>
 </div></div>
 
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

