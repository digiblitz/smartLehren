<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="java.util.*"%>
   <%@ page import="java.util.*" %>
      <%@ page import="java.io.File" %>
       <%@ page import="java.util.*" %>
          <%@ page import="java.io.BufferedInputStream"%>
    <%@ page import="java.io.BufferedOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
 
  <% String pathname="C:\\userpicture\\ajith.jpg";
String filena="ajith.jpg";%>

<%
response.setContentType("image/jpeg");  
ServletOutputStream out1;  
out1 = response.getOutputStream();  
FileInputStream fin = new FileInputStream("C:\\userpicture\\ajith.jpg");  
  
BufferedInputStream bin = new BufferedInputStream(fin);  
BufferedOutputStream bout = new BufferedOutputStream(out1);  
int ch =0; ;  
while((ch=bin.read())!=-1)  
{  
bout.write(ch);  
}  
  
bin.close();  
fin.close();  
bout.close();  
out1.close();  
%>

	
