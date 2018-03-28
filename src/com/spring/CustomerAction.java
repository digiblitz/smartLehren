/*******************************************************************************
*Copyright: 2018 digiBlitz Foundation
*
*License: digiBlitz Public License 1.0 (DPL) 
*Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
*
*Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
*
*Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
*
*"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
******************************************************************************/
package com.spring;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.util.CustomerDB;
import com.util.adminDB;
import com.util.baseDB;
import com.util.studentDB;
import com.util.trainerDB;
import com.util.userDB;

@Controller
public class CustomerAction {
	
	static Logger log = Logger.getLogger(CustomerAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;

	@RequestMapping("/customer.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
				
		
	      Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");    
	            
		userDB db = userDB.getInstance();
		adminDB db1 = adminDB.getInstance();		
		studentDB db5 = studentDB.getInstance();
		trainerDB db4 = trainerDB.getInstance();
		baseDB db6 = baseDB.getInstance();
		CustomerDB db7 = CustomerDB.getInstance();
		QualificationAction qa = QualificationAction.getInstance();
		HttpSession session = request.getSession(true); 
		 
		 String CustomerProcess = request.getParameter("CustomerProcess");
		 String cmd = request.getParameter("cmd");

		 if(cmd!=null && cmd.equalsIgnoreCase("initcustomer")){			
			 
				 return new ModelAndView("customersearch");			
		 }		
		 else if(cmd !=null && cmd.equalsIgnoreCase("initsearch")){
				
				String customerid=request.getParameter("customerid");
				
				String firstname = null;
 	        	String lastname = null;
 	        	String e_mail = null;
 	        	String mobile_no = null;
 	        	String institution_name = null;
 	        	String city = null;
 	        	String state = null;
 	        	String country = null;
 	        	String card_type = null;
 	        	String card_number = null;
 	        	String cvv_no = null;
 	        	String cardholder_name = null;
 	        	String expiry_date = null;
 	        	String register_id = null;
 	        	String date = null;
 	        	String subscription_id = null;
 	        	String order_id = null;
 	        	String amount = null;
 	        	String plan_type = null;
 	        	String subscription_type = null;
 	        	
 	        	ArrayList customerlist = db6.getcustomerlist(customerid);
 	        	
				if(customerlist != null){
					
					Iterator itr = customerlist.iterator();
					while(itr.hasNext()){
						String cuslist[]=(String[])itr.next();
						
						firstname = cuslist[0];
		 	        	lastname = cuslist[1];
		 	        	e_mail = cuslist[2];
		 	        	mobile_no = cuslist[3];
		 	        	institution_name = cuslist[4];
		 	        	city = cuslist[5];
		 	        	state = cuslist[6];
		 	        	country = cuslist[7];
		 	        	card_type = cuslist[8];
		 	        	card_number = cuslist[9];
		 	        	cvv_no = cuslist[10];
		 	        	cardholder_name = cuslist[11];
		 	        	expiry_date = cuslist[12];
		 	        	register_id = cuslist[13];
		 	        	date = cuslist[14];      	
		 	        	subscription_id = cuslist[15];
		 	        	order_id = cuslist[16];
		 	        	amount = cuslist[17];
		 	        	plan_type = cuslist[18];
		 	        	subscription_type = cuslist[19];
					}	
				}
				request.setAttribute("firstname", firstname);
				request.setAttribute("lastname", lastname);
				request.setAttribute("e_mail", e_mail);
				request.setAttribute("mobile_no", mobile_no);
				request.setAttribute("institution_name", institution_name);
				request.setAttribute("city", city);
				request.setAttribute("state", state);
				request.setAttribute("country", country);
				request.setAttribute("card_type", card_type);
				request.setAttribute("card_number", card_number);
				request.setAttribute("cvv_no", cvv_no);
				request.setAttribute("cardholder_name", cardholder_name);
				request.setAttribute("expiry_date", expiry_date);
				request.setAttribute("register_id", register_id);
				request.setAttribute("date", date);
				request.setAttribute("subscription_id", subscription_id);
				request.setAttribute("order_id", order_id);
				request.setAttribute("amount", amount);
				request.setAttribute("plan_type", plan_type);
				request.setAttribute("subscription_type", subscription_type);				
				request.setAttribute("customerid", customerid);				
				
			 return new ModelAndView("customerdetails");		
	 }	 
		 else if(cmd!=null && cmd.equalsIgnoreCase("updatecustomer")){			
			 
			 String firstname=request.getParameter("firstname");
			 String lastname=request.getParameter("lastname");
			 String email=request.getParameter("email");
			 String mobileno=request.getParameter("mobileno");
			 String date=request.getParameter("date");
			 String institution=request.getParameter("institution");
			 String country=request.getParameter("country");
			 String state=request.getParameter("state");
			 String city=request.getParameter("city");
			 String pincode=request.getParameter("pincode");
			 String amount=request.getParameter("amount");
			 String cardtype=request.getParameter("cardtype");
			 String cardnumber=request.getParameter("cardnumber");
			 String cvvno=request.getParameter("cvvno");
			 String cardholdername=request.getParameter("cardholdername");
			 String expirydate=request.getParameter("expirydate");
			 String registerid=request.getParameter("registerid");
			 String subscriptionid=request.getParameter("subscriptionid");
			 String subscriptiontype=request.getParameter("subscriptiontype");
			 String orderid=request.getParameter("orderid");
			 String plantype=request.getParameter("plantype");
			 String customerid=request.getParameter("customerid");
			 String customeridold=request.getParameter("customeridold");
			 
			 String status = db7.updatecustomer(firstname, lastname, email, mobileno, institution, country, state, city, amount, cardtype, cardnumber, cvvno, cardholdername, expirydate, registerid, subscriptionid, subscriptiontype, orderid, plantype, customerid, customeridold);
			
			 if(status != null){
				 request.setAttribute("firstname", firstname);
				 request.setAttribute("lastname", lastname);
				 request.setAttribute("e_mail", email);
				 request.setAttribute("mobile_no", mobileno);
				 request.setAttribute("date", date);
				 request.setAttribute("institution_name", institution);
				 request.setAttribute("country", country);
				 request.setAttribute("state", state);
				 request.setAttribute("city", city);
				 request.setAttribute("pincode", pincode);
				 request.setAttribute("amount", amount);
				 request.setAttribute("card_type", cardtype);
				 request.setAttribute("card_number", cardnumber);
				 request.setAttribute("cvv_no", cvvno);
				 request.setAttribute("cardholder_name", cardholdername);
				 request.setAttribute("expiry_date", expirydate);
				 request.setAttribute("register_id", registerid);
				 request.setAttribute("subscription_id", subscriptionid);
				 request.setAttribute("subscription_type", subscriptiontype);
				 request.setAttribute("order_id", orderid);
				 request.setAttribute("plan_type", plantype);
				 request.setAttribute("customerid", customerid);
				 
			 }
			 
			 return new ModelAndView("customerdetails");			
	 }
		 else if(cmd!=null && cmd.equalsIgnoreCase("initcreatecoupon")){
			
			 //String user_id = (String) session.getAttribute("user_id");
			 
			 return new ModelAndView("createcoupon");
		 }
		 else if(CustomerProcess != null && CustomerProcess.equalsIgnoreCase("createcoupon")){
			
			 String user_id = (String) session.getAttribute("user_id");
			 String coupon_code = request.getParameter("coupon_code");
			 String coupon_description = request.getParameter("coupon_description");
			 String coupon_offer = request.getParameter("coupon_offer");
			 
			 log.info(" ------------ > coupon_code "+coupon_code+" coupon_description "+coupon_description+" coupon_offer "+coupon_offer);
			 
			 String status = db7.setcreatecoupon(coupon_code,coupon_description,coupon_offer);
			 
			 request.setAttribute("status", status);
			 
			 return new ModelAndView("createcoupon");
		 }
		 else if(cmd!=null && cmd.equalsIgnoreCase("initcouponlist")){
			 
			 ArrayList<String> couponlist = db7.getCouponList();
			 String coupon_code = null;
			 String coupon_description = null;
			 String coupon_offer = null;
			 
			 if(couponlist != null ){
				 
				 Iterator itr = couponlist.iterator();
				 while(itr.hasNext()){
					String couponstr[] = (String[]) itr.next();
					coupon_code = couponstr[0];
					coupon_description = couponstr[1];
					coupon_offer = couponstr[2];
					
					log.info(" --------- coupon_code "+coupon_code+" coupon_description "+coupon_description+" coupon_offer "+coupon_offer);
					
				 }				 
			 }
			 
			 request.setAttribute("couponlist", couponlist);
			 
			 return new ModelAndView("couponlist");
		 }
		 
		 else if(cmd!=null && cmd.equalsIgnoreCase("deActiveCoupon")){
			 
			 String coupon_id = request.getParameter("coupon_id");
			 
			 log.info("coupon_id "+coupon_id);
			 
			 String status = db7.deactivateCoupon(coupon_id);
			 ArrayList<String> couponlist = db7.getCouponList();
			 
			 request.setAttribute("status", status);
			 request.setAttribute("couponlist", couponlist);
			 
			 return new ModelAndView("couponlist");
		 }
		 
		 else if(cmd!=null && cmd.equalsIgnoreCase("updateCoupon")){
			 
			 String coupon_id = request.getParameter("coupon_id");
			 String coupon_code = request.getParameter("coupon_code");
			 String	coupon_description = request.getParameter("coupon_desc");
			 String coupon_offer = request.getParameter("coupon_offer");
			 
			 
			 log.info("coupon_id "+coupon_id+" coupon_code "+coupon_code+" coupon_description "+coupon_description+" coupon_offer "+coupon_offer);
			 
			 
			 String status = db7.updateCoupon(coupon_id,coupon_code,coupon_description,coupon_offer);
			 ArrayList<String> couponlist = db7.getCouponList();
			 
			 request.setAttribute("status", status);
			 request.setAttribute("couponlist", couponlist);
			 
			 return new ModelAndView("couponlist");
		 }
		 
		 else if(CustomerProcess != null && CustomerProcess.equalsIgnoreCase("coupon_check")){
			 
			 String coupon_code = request.getParameter("coupon_code");
			 String amount = request.getParameter("amount");
			 log.info("coupon_code "+coupon_code+" amount ---> "+amount);
			 
			 String status = null;
			 String coupon_offer = db7.getCouponOffer(coupon_code);
			 
			 log.info("coupon_offer "+coupon_offer);
			 
			 if(coupon_offer != null){
				 
				 log.info("it is not null --------- ");
				 
				 status = "Welcome, your Coupon Code has been Accepted." +
				 		"You can Use it 3 Months for Free.";
				 
				 request.setAttribute("coupon_code", coupon_code);
				 request.setAttribute("coupstatus", status);
				 request.setAttribute("coupon_acc", "coupon_acc");
				 request.setAttribute("plantype", "basic");
				 request.setAttribute("type", "trynow");
				 request.setAttribute("amount", amount);				 
				 
				 return new ModelAndView("onlineedition");
				 
			 }else{
				
				 status = "Invalid Coupon Code";
				 
				 log.info("it is null --------- ");
				 
				 request.setAttribute("coupstatus", status);
				 request.setAttribute("plantype", "basic");
				 request.setAttribute("type", "trynow");
				 
				 return new ModelAndView("onlineedition");
			 }
		 }
		 		 
		 return new ModelAndView("SLHome");
			   }
}
