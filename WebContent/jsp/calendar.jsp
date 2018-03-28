<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@page import="java.util.*, java.util.Date, java.text.*" %>
<HTML><HEAD><TITLE>Calendar</TITLE></HEAD><BODY>
<%	// First get the month and year from the form.
	boolean yyok = false;	// -1 is a valid year, use boolean
	int yy = 0, mm = 0;
	String yyString = request.getParameter("year");
	if (yyString != null && yyString.length() > 0) {
		try {
			yy = Integer.parseInt(yyString);
			yyok = true;
		} catch (NumberFormatException e) {
			out.println("Year " + yyString + " invalid");
		}
	}
	Calendar c = Calendar.getInstance();
	if (!yyok)
		yy = c.get(Calendar.YEAR);
 
	String mmString = request.getParameter("month");
	if (mmString == null) {
		mm = c.get(Calendar.MONTH);
	} else {
		for (int i=0; i<months.length; i++) {
			if (months[i].equals(mmString)) {
				mm = i;
				break;
			}
		}
	}
 %>
<% /* %>
<form method=post action="CalendarPage.jsp">
	Month: <select name=month>
			<% for (int i=0; i<months.length; i++) {
				if (i==mm)
					out.print("<option selected>");
				else
					out.print("<option>");
				out.print(months[i]);
				out.println("</option>");
			}
			%>
	</select>
	Year (4-digit): 
	<input type="text" size="5" name="year"	value="<%= yy %>"></input>
	<input type=submit value="Display">
</form>
<% */ %>
<%!
	/** The names of the months */
	String[] months = {
		"January", "February", "March", "April",
		"May", "June", "July", "August",
		"September", "October", "November", "December"
	};
 
	/** The days in each month. */
	int dom[] = {
			31, 28, 31, 30,	/* jan feb mar apr */
			31, 30, 31, 31, /* may jun jul aug */
			30, 31, 30, 31	/* sep oct nov dec */
	};
%>
 
<%
	/** The number of days to leave blank at the start of this month */
	int leadGap = 0;
%>


<TABLE border="1" cellpadding="0" cellspacing="0" 
		background="<%= request.getParameter("background") %>"
	 valign="bottom" width="100%" style="font-family:'Times New Roman', Times, serif;">
<TR>
	<TH colspan="7"  class="labelHeader"
	style="border-left:1px solid #000000;border-right:1px solid #000000;border-bottom:1px solid #000000;border-top:1px solid #000000;">
		<%= months[mm] %>  <%= yy %>
	</TH>
</TR>
 
<%	GregorianCalendar calendar = new GregorianCalendar(yy, mm, 1); %>
 
<TR>
	<TH>Su</TH><TH>Mo</TH><TH>Tu</TH>
	<TH>We</TH><TH>Th</TH><TH>Fr</TH><TH>Sa</TH>
</TR>
 
<%
		// Compute how much to leave before the first.
// ) returns 0 for Sunday, which is just right.
		leadGap = calendar.get(Calendar.DAY_OF_WEEK)-1;
 
		int daysInMonth = dom[mm];
		if (calendar.isLeapYear(calendar.get(Calendar.YEAR)) && mm == 1)
			++daysInMonth;
 
		out.print("<TR>");
 
		// Blank out the labels before 1st day of month
		for (int i = 0; i < leadGap; i++) {
			out.print("<TD >");
		}
 			// today's Date
 		Date currDate = new Date(); 
	 	int todaysDate = currDate.getDate();
 	
		// Fill in numbers for the day of month.
		for (int i = 1; i <= daysInMonth; i++) {
 
 			if (todaysDate == i) {
				out.print("<TD align='center' bgcolor='#7FFF00'><FONT COLOR='#FF0000'><B>" 
					+ i + "</B></FONT></TD>"); 			
 			} else {
				out.print("<TD align='center'>" + i + "</TD>");
 			}
 			
			if ((leadGap + i) % 7 == 0) {		// wrap if end of line.
				out.println("</TR>");
				out.print("<TR>");
			}
		}
%>
</TR>
</TABLE>



</BODY></HTML>
