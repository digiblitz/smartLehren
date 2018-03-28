<!--
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
-->
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.hlccommon.util.*" %>
<%@ page import="com.hlccommon.util.Debug" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat"%>


<%! 
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    String  nullCheck(String fieldName){
        String retValue = "";
        if(fieldName!=null && fieldName.trim().length()!=0){
            retValue = fieldName;
        }
        return retValue;
    }
	 String  noCheck(String fieldName){
        String retValue = "";
        if(fieldName!=null && fieldName.trim().length()!=0){
            retValue = fieldName;
        }
        return retValue;
    }
    %>
    <%! String dateCheck(Date fieldName){
        String detValue = "";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
    }
	
    %>

<html>

<head>

<%--<script language=JavaScript>
<!--

//Disable right click script III- By Renigade (renigade@mediaone.net)
//For full source code, visit http://www.dynamicdrive.com

var message="";
///////////////////////////////////
function clickIE() {if (document.all) {(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")
// --> 
</script>--%>


<body onLoad="document.frmPaypal.submit();" >

<%--<script language=JavaScript>
<!--

//Disable right click script III- By Renigade (renigade@mediaone.net)
//For full source code, visit http://www.dynamicdrive.com

var message="";
///////////////////////////////////
function clickIE() {if (document.all) {(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")
// --> 
</script>--%>

<!-- a Buy Now button is specified by the command _xclick -->

<div class="loading" align="center" style="padding:10px; margin-top:100px; margin-left:50px;">Processing......Please allow transaction to complete. <br />
Clicking <strong>REFRESH or BACK </strong> in your browser could result in multiple payment requests being processed! </div>
<div class="loading" align="center" style="padding:10px;"><img src="images/processing.gif" alt="processing"/></div>

<form action="./paypal.html" method="post" name="frmPaypal">
<input type="hidden" name="cmd" value="PaypalProcess">
<INPUT TYPE="hidden" name="undefined_quantity" value="1">
<input type="hidden" name="business" value="dhivya@digiblitz.com">




<% 
	String purpose = (String)request.getAttribute("purpose");
	String amt=(String)request.getAttribute("AMT");
	String payAct=(String)request.getAttribute("PAYMENTACTION");
    String ccTyp = (String) request.getAttribute("CREDITCARDTYPE");
	String acct=(String)request.getAttribute("ACCT");
    String expDt = (String) request.getAttribute("EXPDATE");
	String ipAddrs=(String)request.getAttribute("IPADDRESS");
    String fName = (String) request.getAttribute("FIRSTNAME");
	String cvvNo=(String)request.getAttribute("CVVNo");
    String strt = (String) request.getAttribute("STREET");
	String city=(String)request.getAttribute("CITY");
    String state = (String) request.getAttribute("STATE");
	String zip=(String)request.getAttribute("ZIP");
    String counCode = (String) request.getAttribute("COUNTRYCODE");
	String email = (String) request.getAttribute("EMAIL");
	String inVId = (String) request.getAttribute("intVId");
	String expDat1 = (String) request.getAttribute("expDat1");
	String firstname = (String) request.getAttribute("firstname");
	String lastname = (String) request.getAttribute("lastname");
	String mobileno = (String) request.getAttribute("mobileno");
	String companyname = (String) request.getAttribute("companyname");
	String country = (String) request.getAttribute("country");
	String subscription_type = (String) request.getAttribute("subscription_type");
	String plan_type = (String) request.getAttribute("plan_type");
	String couponcode=(String)request.getAttribute("couponcode");
	String couponvalue=(String)request.getAttribute("couponvalue");
	String product_type=(String)request.getAttribute("product_type");
	String monthYear = (String) request.getAttribute("monthYear");
	
		String amount="0.00";
		if(amt!=null){
			amount = amt;
		}
%>

<!--<input type="hidden" name="USER" value="donations_api1.useventing.com">
<input type="hidden" name="PWD" value="Q6YSP3U2UBKPV9M5">
<input type="hidden" name="SIGNATURE" value="A3eTNkCKR-Vl1aVdOIJLhvtoY7iPA2-jjuIwUqZt8Nhr8QnbOLL87Hw0">-->
<input type="hidden" name="purpose" value="<%=purpose%>">
<input type="hidden" name="PAYMENTACTION" value="<%=payAct%>">
<input type="hidden" name="CREDITCARDTYPE" value="<%=ccTyp%>">
<input type="hidden" name="ACCT" value="<%=acct%>">
<input type="hidden" name="EXPDATE" value="<%=expDt%>">
<input type="hidden" name="IPADDRESS" value="<%=ipAddrs%>">
<input type="hidden" name="FIRSTNAME" value="<%=fName%>">
<input type="hidden" name="CVVNO" value="<%=cvvNo%>">
<input type="hidden" name="STREET" value="<%=strt%>">
<input type="hidden" name="CITY" value="<%=city%>">
<input type="hidden" name="STATE" value="<%=state%>">
<input type="hidden" name="ZIP" value="<%=zip%>" />
<input type="hidden" name="AMT" value="<%=amt%>">
<input type="hidden" name="COUNTRYCODE" value="<%=counCode%>">
<input type="hidden" name="EMAIL" value="<%=email%>">
<input type="hidden" name="INVId" value="<%=inVId%>">
<input type="hidden" name="coupon_code" value="<%=couponcode%>">
<input type="hidden" name="coupon_value" value="<%=couponvalue%>">
<input type="hidden" name="product_type" value="<%=product_type%>">
<input type="hidden" name="expDat1" value="<%=expDat1%>">

<%System.out.println("date check inside jsp====>"+expDat1+couponcode); %>
<input type="hidden" name="VERSION" value="51.0">
<input type="hidden" name="METHOD" value="DoDirectPayment">
  <input type="hidden" name="ENVIRON" value="live"> 
<!-- <input type="hidden" name="ENVIRON" value="sandbox"> -->
<INPUT TYPE="hidden" NAME="CURRENCYCODE" value="USD">
<input type="hidden" name="charset" value="utf-8">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="cbt" value="CLICK HERE TO COMPLETE YOUR PAYMENT"/>
<%--<input type="hidden" name="image_url" value="http://www.fusiontutoring.com/loading.swf">
--%><%--<input type="hidden" name="notify_url" value="http://192.168.1.5:8080/dashboard/temppaypal.do">
<input type="hidden" name="return" value="http://192.168.1.5:8080/dashboard/temppaypal.do">
<input type="hidden" name="cancel_return" value="http://192.168.1.5:8080/dashboard/temppaypal.do">--%>
<!-- Do not prompt customer to include a note with the urchase -->
<input type="hidden" name="no_note" value="1">
<input type="hidden" name="firstname" value="<%=firstname%>">
<input type="hidden" name="lastname" value="<%=lastname%>">
<input type="hidden" name="mobileno" value="<%=mobileno%>">
<input type="hidden" name="companyname" value="<%=companyname%>">
<input type="hidden" name="country" value="<%=country%>">
<input type="hidden" name="type" value="<%=subscription_type%>">
<input type="hidden" name="plan" value="<%=plan_type%>">
<input type="hidden" name="monthYear" value="<%=monthYear%>">

</form>
</body>
</head>
</html>
