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
       <%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>smartLehren</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/DBlogo.png">
     <link rel="shortcut icon" href="images/DBlogo.png" />
     <link rel="stylesheet" href="css/touchTouch.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/style.css">
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
		  
		  $("#shortans").click(function(){
			
			var shortans = $("#shortanswer").val();
				alert(shortans);
		return false;
	});
		  
		  
       });  
    

     </script>
 
	     
      <!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">


    <![endif]-->
	<style>
 .lab{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
}

.answers{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:35px;
	text-align: left;
	margin-top:15px;
	color:#b70000;
	text-decoration: underline;
}



.button {
  font-size: 1em;
  padding: 5px;
  color: #333;
  border: 2px solid #06D85F;
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  background: #06D85F;
}

.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 100px auto;
  padding: 30px;
  background: #fff;
  border-radius: 5px;
  width: 50%;
  position: relative;
  /*transition: all 5s ease-in-out;*/
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  /*transition: all 200ms;*/
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 50%;
  }
  .popup{
    width: 70%;
  }
}
	</style>
     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_123 ">
     

 <div>&nbsp;</div>
      
     <div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);"> Revaluation Applied List</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">


<input type="hidden" name="TrainerProcess"  value="Process">
<%String user_id=(String)request.getAttribute("user_id");

%>
  <input type="hidden" name="user_id"  value="<%=user_id%>">
  
    <%
	String restatus=(String)request.getAttribute("restatus");
	 if(restatus!=null){
	 %>
                <tr> <td colspan="2"><span style="font-family:'Times New Roman', Times, serif; font-size:20px; "><font color="#FF0000"><%=restatus%></font></span></td>  <%
	}
	
	%>
  

<table width="100%" >
<tr style="font-weight:bold" >
			<td width="99" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Student Name</td>
			<td width="97" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Course Name</td>
			<td width="85" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Exam Name</td>
			<td width="80" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Exam Deate</td>
			<td width="100" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Your Mark</td>
			<td width="90" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Answers</td>
			
			<!-- <td width="80" class="tblRowHeadTwo" style="text-align:left; font-family:'Times New Roman', Times, serif;">Brief Answer</td> -->
	    </tr>
<%
ArrayList revaluationlist = (ArrayList)request.getAttribute("revaluationlist");
if(revaluationlist != null && revaluationlist.size() != 0){	

	Iterator itr = revaluationlist.iterator();
	while(itr.hasNext()){
		String str[] = (String[])itr.next();
		
		String studentname = str[0];
		String student_user_id = str[1];
    	String exam_name = str[2];
    	String exam_date = str[3];
    	String shortanswerfull = str[4];
    	String briefanswerfull = str[5];
    	String totalmarktook = str[6];
    	String exam_frm_id = str[7];
		String grade = str[8];
    	String course_name = str[9];
    	String tmquestion = str[10];
    	String smquestion = str[11];
    	String course_code = str[12];
 
   %>
<tr height="50">
		  	<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=studentname%></div></td>
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=course_name%></div></td>	
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=exam_name%></div></td>	
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><%=exam_date%></div></td>	
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a href="exam.html?cmd=updaterevaluation&studentname=<%=studentname %>&student_user_id=<%=student_user_id%>&exam_name=<%=exam_name%>&exam_date=<%=exam_date %>&course_code=<%=course_code %>&course_name=<%=course_name %>" class="edit" style="color:#b70000;">edit</a>&nbsp;&nbsp;<%=totalmarktook%></div></td>	
			<td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a class="button" href="exam.html?cmd=fullanswers&student_user_id=<%=student_user_id%>&exam_name=<%=exam_name%>&exam_date=<%=exam_date%>&course_code=<%=course_code%>&user_id=<%=user_id%>&studentname=<%=studentname%>&course_name=<%=course_name%>&exam_frm_id=<%=exam_frm_id%>">Answers</a></div></td>	
			
			<!-- <td class="alignCenter"><div style="text-align:left; margin-top:20px; font-family:'Times New Roman', Times, serif;"><a class="button" href="#popup2">Brief Answers</a></div></td>	 -->
			
			</tr>
			<input type="hidden" name="shortanswer" value="<%=smquestion%>">
			
	<% }
} %>
</table>

		<div align="center" style="margin-top:25px; "><label><img src="images/back.png" alt="back" width="20" height="20" style="cursor:pointer"/><input action="action" type="button" value="Back" onClick="history.go(-1);" style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;"  ></label></div>			

</div></div>




<% String showanswers = (String)request.getAttribute("showanswers");
 String studentname = (String)request.getAttribute("studentname");
 String course_name = (String)request.getAttribute("course_name");
 
if(showanswers != null){
	

 %>
 
 

<div class="pp" style="margin: 16px 0 16px 0;  padding: 10px;  BACKGROUND: #F2F2EB;  -moz-border-radius: 12px 12px 0 0;  -webkit-border-radius: 12px 12px 0 0;  border-radius: 12px 12px 0 0;">
<div class="ppp" style="font-family: Candara, Trebuchet MS, Verdana, Arial, Helvetica, sans-serif;  font-size: 22px;  font-weight: bold;  color: #4e4e4e;  margin-bottom: 8px;  TEXT-SHADOW: 0 1px 0 rgba(255, 255, 255, 0.85);">Answers</div>
<div class="pps" style=" border: 2px SOLID #e2e2d6;  background: white;  padding: 10px;  font-size: 15px; color:black;">

<div>
<div style="float:right;">
<div style="color:#b70000; font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;">Student Name: <label style="color:#000;"><%=studentname%></label></div>
<div style="color:#b70000; font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;">Course: <label style="color:#000;"><%=course_name%></label></div>
</div>
<%

		ArrayList answerlist = (ArrayList)request.getAttribute("answerlist");
		System.out.println("from revaluation list "+answerlist.size());
		if(answerlist != null){
			Iterator itr1 = answerlist.iterator();
			while(itr1.hasNext()){
				String stra[] = (String[])itr1.next();
				
				String shortanss = stra[0];
				String briefanss = stra[1];
				String shortquess = stra[2];
				String briefquess = stra[3];
				
			%>
		
<div class="answers">Short Answers</div>
		
		<% 
		String shortan[] = shortanss.split("</p>");
		String shortqu[] = shortquess.split("</p>");
				
		for(int i=0; i<shortan.length; i++){
			String ans = shortan[i];
			String ques = shortqu[i];			
			%>
			<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=ques%></div>
			<div style="text-align:left; margin-top:10px; font-family:'Times New Roman', Times, serif;"><%=ans%></div>
		<%	
		}
		
		%>
			
		<div class="answers">Brief Answers</div>
		
		<% 
		String shortan1[] = briefanss.split("</p>");
		String shortqu1[] = briefquess.split("</p>");
				
		for(int i=0; i<shortan1.length; i++){
			String ans = shortan1[i];
			String ques = shortqu1[i];
			System.out.println("from revaluation list stra "+ans+" "+ques);
			%>
			<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=ques%></div>
			<div style="text-align:left; margin-top:10px; font-family:'Times New Roman', Times, serif;"><%=ans%></div>
		<%	
		}		
		
			}
		}

 %>

 </div>
		</div>		
		<div>
</div></div>

<%}%>
 <div>&nbsp;</div>
   
      <div class="clear"></div>  
    
   <div>&nbsp;</div>
  </div>   
</div>
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











<%-- <div id="" class="overlay">
	<div class="popup">
		
		<a class="close" href="#">&times;</a>
		<div class="content">
		
		<% 
		String strarr[] = shortanswerfull.split("</p>");
		String strarrr[] = tmquestion.split("</p>");
		System.out.println(strarr.length+" "+strarrr.length);
		for(int i=0; i<strarr.length; i++){
			String ans = strarr[i];
			String ques = strarrr[i];
			%>
			<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=ques%></div>
			<div style="text-align:left; margin-top:10px; font-family:'Times New Roman', Times, serif;"><%=ans%></div>
		<%	
		}
		
		%>
			
		</div>
	</div>
</div>

<div id="" class="overlay">
	<div class="popup">
		
		<a class="close" href="#">&times;</a>
		<div class="content">
			<% 
		String strarr1[] = briefanswerfull.split("</p>");
		String strarrr1[] = smquestion.split("</p>");
		System.out.println(strarr1.length+" "+strarrr1.length);
		for(int i=0; i<strarr1.length; i++){
			String ansbr = strarr1[i];
			String ques1 = strarrr1[i];
			System.out.println(ansbr+" ansbr-====- ques1 "+ques1);
			%>
			<div style="font-weight:bold; text-align:left; margin-top:25px; font-family:'Times New Roman', Times, serif;"><%=ques1%></div>
			<div style="text-align:left; margin-top:10px; font-family:'Times New Roman', Times, serif;"><%=ansbr%></div>
		<%	
		}
		
		%> 
		</div>
	</div>
</div>
<%
	}
}else{
	
		%>
		
		<tr>
<td colspan="7"><div style="font-family:'Times New Roman', Times, serif; font-size:16px; height:40px; margin-top:15px;" >No Arrears</div></td>
</tr>	
<%	
}
%>
 --%>
