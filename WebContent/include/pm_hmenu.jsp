<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="java.util.*"%>

<%
String user_id1=(String)session.getAttribute("user_id"); %>


<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/hormenu.css">
   
   <title>SmartLehren</title>
</head>
<body>

<div id='cssmenu'>
<ul>
  
   <li class='active has-sub'><a href='#'><span>BPM Business Process</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Analyze Business Process</span></a></li>
         <li class='has-sub'><a href='#'><span>Create Business Process</span></a></li>
         <li class='has-sub'><a href='#'><span>Deploy Business Process</span></a></li>
         <li class='has-sub'><a href='#'><span>Monitor Business Process</span></a></li>
      </ul>
   </li>
   
   
   <li class='active has-sub'><a href='#'><span>Business Process</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Business Process Voting List</span></a></li>
         <li class='has-sub'><a href='#'><span>List of Business Process</span></a></li>
          <li class='has-sub'><a href='#'><span>Move BP Life Cycle Stage</span></a></li>
     
      </ul>
   </li>
   
</ul></div>
</body>
</html>
