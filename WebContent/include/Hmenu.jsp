<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@page import="com.util.adminDB"%>
<%@ page import="java.util.*"%>

<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/hormenu.css">
   
   
   <link rel="stylesheet" href="https://cdn.rawgit.com/tonai/jquery-contenttoggle/gh-pages/stylesheets/codepen-base.css">
	   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
   <title>smartLehren</title>

</head>
<body>


<% 
String user_id1=(String)session.getAttribute("user_id"); 
adminDB db = adminDB.getInstance(); 
%>

 <ul class="menu">
      <li class="menu__item js-contentToggle">
        <div class="menu__trigger js-contentToggle__trigger">My Profile</div>
        <ul class="menu__content js-contentToggle__content">
          <li><a href='login.html?cmd=initupdateuser&user_id=<%=user_id1%>'>Edit Profile</a></li>
          <li><a href='trainer.html?cmd=initchangepassword'>Change Password</a></li>
          <li><a href='trainer.html?cmd=initprofilepicture&user_id=<%=user_id1%>'>Upload picture</a></li>
        
	  
	   <% boolean flag = db.getConfirmAdmin(user_id1); 
          
          if(flag){%>
          <li><a href='trainer.html?cmd=initprofiledetails'>Profile Details</a></li>
          <li><a href='trainer.html?cmd=initplanpackage'>Plan and Package</a></li>
          <li><a href='trainer.html?cmd=initsecurity'>Security</a></li>		
		  <% }%>
	  
     </ul>
      </li>
	  
	  
					 <%
						ArrayList privlist = (ArrayList)session.getAttribute("privlist");
						if(privlist!=null && privlist.size()!=0){
							Iterator itEntList = privlist.iterator();
							//String sessHeadEntityId = (String)session.getAttribute("entityId");
							while(itEntList.hasNext()){
								String strRolelist[]= (String[])itEntList.next();
								String priv_id = strRolelist[0];
								String priv_name = strRolelist[1];
						
								%>
   
   <li class="menu__item js-contentToggle">
   <div class="menu__trigger js-contentToggle__trigger" href="#"><%=priv_name %></div>
    
  <ul class="menu__content js-contentToggle__content" >
  
  
  					<%  				
  					 ArrayList per = (ArrayList)session.getAttribute("permlist");
						if(per!=null && per.size()!=0){
							Iterator itEntList1 = per.iterator();
							//String sessHeadEntityId = (String)session.getAttribute("entityId");
							while(itEntList1.hasNext()){
								String st[]= (String[])itEntList1.next();
								String pri_id = st[0];
								String per_id = st[1];
								String pername = st[2];
								String urllink = st[3];								
								if(priv_id.equals(pri_id)){%>
								
		   <li>
		   <a href="<%=urllink%>" class="linkFour"><%=pername%></a></li>
		   		   
  					<%}else{
					%>
					
					<%}}} %>									
				</ul>				 
				</li>				  
		   	<%}}%>	
			
			<li class="menu__item js-contentToggle">
		<a class="menu__trigger js-contentToggle__trigger" href='login.html?cmd=initresourse'>Resources</a>
		</li>	
		<li class="menu__item js-contentToggle">
	    <a class="menu__trigger js-contentToggle__trigger" target="_blank" href="https://www.digiblitz.com/support/?cat=2">Help</a>
			</li>			
			  </ul>			 
			
</body>
<html>
