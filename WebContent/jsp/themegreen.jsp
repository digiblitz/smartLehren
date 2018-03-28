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
    <title>smartLehren</title>
	
	 <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="../images/DBlogo.png">
     <link rel="shortcut icon" href="../images/DBlogo.png" />
     <link rel="stylesheet" href="../css/touchTouch.css">
     <link rel="stylesheet" href="../css/owl.carousel.css">
     <link rel="stylesheet" href="../css/style.css">
     <link rel="stylesheet" href="../css/form.css">	
     <link rel="stylesheet" href="../css/gender.css">
     
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>  
     <script src="../js/daypilot-all.min.js?v=192" type="text/javascript"></script>
	<link type="text/css" rel="stylesheet" href="../themes/month_green.css?v=192" />    
	 <link type="text/css" rel="stylesheet" href="../themes/navigator_white.css?v=192" />    

	<!-- /head -->
</head>
<body>

<header><div>
  
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

</div></header>

<% String currdate = (String)session.getAttribute("currdate");
ArrayList eventlist = (ArrayList)session.getAttribute("eventlist");
System.out.println("eventlist size is "+eventlist.size());
%>
<input type="hidden" id="currdate" value="<%=currdate%>">
<%		
	int j=0;
	String s1 = null;
	String s2 = null;
	String s3 = null;
	String s4 = null;
	if(eventlist != null){
	Iterator itr=eventlist.iterator();
	System.out.println("success");
	while(itr.hasNext()){
		String strarr[] = (String[])itr.next();
		s1 = strarr[0];
		s2 = strarr[1];
		s3 = strarr[2];
		s4 = strarr[3];
		%>
		  <input type="hidden" id="title<%=j%>" value="<%=s1%>">
    <input type="hidden" id="sdate<%=j%>" value="<%=s2%>"> 
    <input type="hidden" id="edate<%=j%>" value="<%=s3%>"> 

		<%
		j++;
	}	
System.out.println(j);	
  } %>
<input type="hidden" id="count" value="<%=j%>"> 
        <div id="container" >
	  
	        <div id="content">
	            <div>
<!-- /top -->
<div class="space">
    <span id="start"><%=currdate%></span> <a href="#" onclick="picker.show(); return false;">Change</a>
</div>

<script type="text/javascript">
    var picker = new DayPilot.DatePicker({
        target: 'start', 
        pattern: 'yyyy-MM-dd', 
        onTimeRangeSelected: function(args) { 
            dp.startDate = args.start;
            dp.update();
        }
    });
</script>

<div style="margin-left:150px;">
<div id="dp"></div>
</div>


<script type="text/javascript">
					
					var stdate = $("#currdate").val();
				var count = $("#count").val();
				
				var title = null;
				var sdate = null;
				var edate = null;											
				
    var dp = new DayPilot.Month("dp");

    // behavior and appearance
    dp.theme = "month_green";
    
    // view
    dp.startDate = stdate;  // or just dp.startDate = "2013-03-25";

    // generate and load events
    for(var i =0; i < count; i++){
		
		title = $("#title"+i).val();
		sdate = $("#sdate"+i).val();
		edate = $("#edate"+i).val();
				
        var e = new DayPilot.Event({
            start: new DayPilot.Date(sdate),
            end: new DayPilot.Date(edate),
            id: DayPilot.guid(),
            text: title
        });
        dp.events.add(e);
    }

    // event creating
        
    dp.init();


</script>

<!-- bottom -->
                </div>
	        </div>
        </div>
  

<!-- /bottom -->
  <footer>   
    <div class="container_12">
     <br>
       <%@ include file = "../../include/footer-in.jsp" %>
      </div>
    </div>  
  </footer>
</body>
</html>

