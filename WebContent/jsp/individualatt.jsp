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
     
      <script src="js/cscombo_new.js" type="text/javascript" ></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 
  
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
	 
	 <script type="text/javascript">
	$(document).ready(function() {
		
		$("#flip").click(function(){  
			$("#panel").toggle();   
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





	</style>
	
	
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
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Attendance Status</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

      <table width="1000" >
        <% String username = (String)request.getAttribute("username");
        	String designame = (String)request.getAttribute("designame");
        	System.out.println("first=====================");%>
    
<FORM id="form" name="insert" ACTION="report.html?cmd=attendancestatus" METHOD=POST name="uploadfile">


	<br><br>


<tr><td>
<table width="550" border="0" align="center" style="margin-left:250px; margin-top:20px" >
 
        
        <tr height="50" width="122">
			<td>
				<label id="programname" for="programname">Program Name:</label>
			</td>
			<td>
				<input id="programname" name="programname" type="text" maxlength="50" value="<%=nullCheck((String)request.getAttribute("programname"))%>" readonly>
			</td>			
		</tr>

		
                            
		<tr height="50" width="122">
			<td>
				<label id="subprogram" for="subprogram">Sub Program Name:</label>
			</td>
			<td>
	<input id="subprogram" name="subprogram" type="text" maxlength="50" value="<%=nullCheck((String)request.getAttribute("subprogramname"))%>" readonly>
			</td>			
		</tr>
		
  <tr height="50" width="122">
			<td>
				<label id="month" for="month">Date:</label>
			</td>
			<td>
	<label class="lab"><select name="month" id="month" >
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
                        
                      
                   </select></label>
			<label class="lab"><select name="year" id="year" >
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
                   </select></label>
			</td>			
		</tr>
		
		<% 
		if(username.equalsIgnoreCase("program mentor")){%>
                <input type="hidden" name="username" value="program mentor">
		<tr height="50" width="122">
			<td>
				<label id="designation" for="designation">Designation:</label>
			</td>
			<td>
	<label class="lab"><select name="designation" id="designation" style="width:250px; height:25px;" >
                        <option value=""> <label class="lab">Select Designation</label></option>
                        <option value="course mentor"> Course Mentor</option>
                        <option value="student"> Student</option>
                      
                   </select></label>
			</td>			
		</tr>
		<%}
		else if(username.equalsIgnoreCase("course mentor")){%>
		<input type="hidden" name="username" value="course mentor">
  	<tr height="50" width="122">
			<td>
				<label id="designation" for="designation">Designation:</label>
			</td>
			<td>
	<label class="lab"><select name="designation" id="designation" style="width:250px; height:25px;" >
                        <option value=""> <label class="lab">Select Designation</label></option>
                        <option value="student"> Student</option>
                      
                   </select></label>
			</td>			
		</tr>
  
             <%} %>
 
<tr  align="center" ><td colspan="2">
<label class="lab"><img src="images/submit.jpg"  alt="submit" width="25" height="25" style="cursor:pointer"/><input type="submit" name="Insert" value="Submit" style=" background-color: transparent; border:none; cursor:pointer;  width:55px; height:20px;"></label>
&nbsp;
<label class="lab"><img src="images/Cancel.png"  alt="cancel" width="20" height="20" style="cursor:pointer"/><input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" ></label>
</td></tr>
</table></td></tr>
   </FORM></table>
   
   
 </div>   </div>   
   
  <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0; 
  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0; width:100%;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px; 
 font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Designation: <%=nullCheck((String)request.getAttribute("designation")) %></div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">
 
 
<table class="attendancestatus" width="100%">

<tr height="40"><th align="center">Register No.</th><th align="center">Name</th><th align="center">Individual</th>

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

<td><input type="text" name="userregid" value="<%=userregid%>" style="border:none;"></td>
<td><input type="text" name="name" value="<%=name%>" style="border:none;"></td>
<td><a href="report.html?cmd=initindividual">click</a></td></tr>
					<%
								}}System.out.println("last=====================");%>								
		 					</table>
							<br><br>
							
<table class="attendancestatus" width="100%" id="panel">
<tr height="40"><th align="center">Date</th><th align="center">Login</th><th align="center">Logout</th><th align="center" >Working Hours</th><th align="center">Required</th><th align="center" >Prorate</th><th align="center">Individual</th>
</table>
				
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

