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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form id="form" name="insert" action="map.html?cmd=savecontactus" method="post">
			
			<table>
			<tr>
			<td>
			<label class="name"><input type="text" name="name" style="width:350px; border-color:#696969;"/>
			
			</label></td>
					</tr>	
                            
               <tr>
			<td>
			<label class="email">
			<input type="text" name="emailid" style="width:350px; border-color:#696969;"/>
                      
			</label></td>
					</tr>	
                          
                          <tr>
			<td>
			<label class="phone">
			<input type="text" name="phoneno" style="width:350px; border-color:#696969;"/>
                       </label></td>
					</tr>	
                          
                          <tr>
			<td>
			<label class="company"><input type="text" name="company" style="width:350px; border-color:#696969;"/>
                         
			</label></td>
					</tr>	
              
                <tr>
			<td>
			<label class="message"><textarea name="message" style="width:450px; height:180px; border-color:#696969;"></textarea>
                      
			</label></td>
					</tr>	 
					
					<tr>
					<td> <%System.out.println("status====>before send"); %>
                      <input type="submit" value="Send Message" class="btn" id="btn" style="width:150px; border-color:#696969;">
                        <%System.out.println("status====>after send"); %>
						
             </td>
					</tr>                 
			
			</table>
					
                      </form>  
</body>
</html>
