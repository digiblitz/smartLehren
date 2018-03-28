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

	
     </head>
	 <body class="page1" id="top">
	
	

<!--==============================Content=================================-->
<div class="content">
  <div class="container_12 ">
      <div class="">
       <h3>Create Course Topic:</h3>
      <table   border="0">
<tr><td  >

	<%
ArrayList rclist = (ArrayList)session.getAttribute("rclist");
if(rclist!=null && rclist.size()!=0){
Iterator itr = rclist.iterator();
while(itr.hasNext()){
 String sr[] = (String[]) itr.next();
 String tittle = sr[0];
 String video_link = sr[1];
   %>
   <div><%=tittle %></div>
<div><iframe src="<%=video_link %>" width="200" height="160" ></iframe></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<%}} %>

		
</td>
</tr>
</table>
     <br><br>  
    </div>   
  </div>   
</div>
<div>&nbsp;</div>
 <!--==============================footer=================================-->
 
</body>

</html>

