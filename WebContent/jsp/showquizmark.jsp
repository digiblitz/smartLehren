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
     </head>
	 <body class="page1" id="top">
 
 

<div><%@ include file = "../../include/header.jsp" %></div>
<div  style="background-color:#333333; width:auto;"> <%@ include file = "../../include/Hmenu.jsp" %></div>   


<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="grid_12">

	            <h3 style="font-family:'Times New Roman', Times, serif;">View Mark</h3>
<%String quiz_name=(String)request.getAttribute("quiz_name"); %>
<%String total=(String)request.getAttribute("total"); %>
<%String upto=(String)request.getAttribute("upto"); %>

<form align="center" action="./login.html" method="post">
<input type="hidden" name="cmd"  value="initmainindex">
<input type="hidden" name="quiz_name"  value="<%=quiz_name%>">
<table width="800" border="1" style="font-family:'Times New Roman', Times, serif; border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin;  color:#000000; font-size:16px; ">
<tr><td>
<table align="left" border="0" width="100%"><tr><td>
<div align="center" style="font-family:'Times New Roman', Times, serif; background-color:#339999; color:#FFFFFF;">Total mark:<%=total%>/<%=upto%></div>
<div>&nbsp;</div>
</td></tr>

<%
ArrayList<String> s = (ArrayList<String>)request.getAttribute("s");
ArrayList enrol = (ArrayList)request.getAttribute("question_name");


if(enrol!=null && enrol.size()!=0){
Iterator it = enrol.iterator();
int i=0;
while(it.hasNext()){
 String sr[] = (String[]) it.next();
 String q_no = sr[0];
 String question = sr[1];
 String a = sr[2];
 String b = sr[3];
 String c = sr[4];
 String d = sr[5];
 String answer = sr[6];
 String cho=s.get(i);
 %>

<tr><td bgcolor="">
<%
if(cho != null){
if(a.equals(cho)){if(a.equals(answer)){ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" checked><%=a%><img src="images/right.png" height="12" width="12"> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Correct</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}else{ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" checked><%=a%><img src="images/wrong.png" alt="wrong" height="12" width="12"> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Incorrect</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}
}%>


<%if(b.equals(cho)){if(b.equals(answer)){ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left " style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" checked><%=b%><img src="images/right.png" alt="right" height="12" width="12"><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Correct</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}else{ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" checked><%=b%><img src="images/wrong.png" height="12" width="12"><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Incorrect</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}
}%>


<%if(c.equals(cho)){if(c.equals(answer)){ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" checked><%=c%><img src="images/right.png" height="12" width="12"><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Correct</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}else{ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%><br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" checked><%=c%><img src="images/wrong.png" alt="wrong" height="12" width="12"> <br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answers is Incorrect</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}
}%>


<%if(d.equals(cho)){if(d.equals(answer)){ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" checked><%=d%><img src="images/right.png" alt="right" height="12" width="12"><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Correct</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}else{ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%> <br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" checked><%=d%><img src="images/wrong.png" height="12" width="12"><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Your Answer is Incorrect</div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">Right Answer is: <%=answer%></div>
<%}
}%>

<%

}else{ %>
<div align="left" style="color:#000000"><%=i+1%>. <%=question%></div>
<div align="left" style="color:#000000">
<input type="radio" id="<%=a%>" name="digi_<%=i%>" value="<%=a%>" ><%=a%><br>
<input type="radio" id="<%=b%>" name="digi_<%=i%>" value="<%=b%>" ><%=b%><br>
<input type="radio" id="<%=c%>" name="digi_<%=i%>" value="<%=c%>" ><%=c%><br>
<input type="radio" id="<%=d%>" name="digi_<%=i%>" value="<%=d%>" ><%=d%><br></div>
<div align="left" style="background-color: #FFFFC6; color:#000000;">You are not answer this Question</div>
<div align="left" style="background-color: #FFFFC6;  color:#000000;">Right Answer is: <%=answer%></div>
<%
}%>


<br>

<% 
i++; 

}%>
<input type="hidden" name="upto"  value="<%=i%>">
<% 
}%>
</td></tr>
</table>

</td></tr>
<tr><td>
<table border="0" align="center">
<label><img src="images/finish.jpg" alt="finish" width="20" height="20" style="cursor:pointer;"><input type="submit" value="Finish"  style="font-family:'Times New Roman', Times, serif; background-color: transparent; border:none; cursor:pointer; width:50px; height:20px;" ></label>
</table></td></tr></table>
</form>
						
							
       
      </div>
     
      <div class="clear"></div>  
      
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

