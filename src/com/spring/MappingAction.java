/*******************************************************************************
*Copyright: 2019 digiBlitz Foundation
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.util.userDB;

@Controller
public class MappingAction {
	
	static Logger log = Logger.getLogger(MappingAction.class.getName());

	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	@RequestMapping("/map.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		//final String LOG_FILE = "/Log4j.properties"; 
	      Properties logProp = new Properties();
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is);
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");   
	      
		try{
		HttpSession session = request.getSession(true); 
		 String mapProcess = request.getParameter("cmd");
		 adminDB db1 = adminDB.getInstance();
		 baseDB db6 = baseDB.getInstance();
		 studentDB db5 = studentDB.getInstance();
		 userDB db = userDB.getInstance();
		 CustomerDB db7 = CustomerDB.getInstance();
		 
		 if(mapProcess!=null && mapProcess.equalsIgnoreCase("initProgMap")){			 
			ArrayList progList=db1.getcourse();
			request.setAttribute("progList", progList);
			//request.setAttribute("courseList", null);
			 return new ModelAndView("frmMapPrograms");
		 }

		 
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("savecontactus")){
			 
			
			String name=request.getParameter("name");
			String emailid=request.getParameter("emailid");
			String phoneno=request.getParameter("phoneno");
			String company=request.getParameter("company");
			String message=request.getParameter("message");
			
		
			String status=db.savecontact(name, emailid, phoneno, message, company);
			
			
			Thread thread=new Thread();
			thread.sleep(5000);
			
			if(status != null){
				ArrayList contactlist=db.getcontactlist(emailid);
				
				if(contactlist != null){					
					Iterator itr=contactlist.iterator();
					String namee=null;
					String emailidd=null;
					String phonenoo=null;
					String companyy=null;
					String messagee=null;					
					if(itr.hasNext()){
						String contacts[]=(String[])itr.next();
						namee=contacts[0];
						emailidd=contacts[1];
						phonenoo=contacts[2];					
						messagee=contacts[3];
						companyy=contacts[4];
					}
					
					String digiblitz="digiblitz";
					request.setAttribute("namee", namee);
					request.setAttribute("emailidd", emailidd);
					request.setAttribute("phonenoo", phonenoo);
					request.setAttribute("companyy", companyy);
					request.setAttribute("messagee", messagee);		
					request.setAttribute("digiblitz", digiblitz);	
					request.setAttribute("status", status);		
				}
			}
			
			return new ModelAndView("contactus");	
		 }
		 
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("selProg")){
			 
			String progId=request.getParameter("prog");
			ArrayList subProgList=db1.getsubcourse(progId);
			ArrayList progList=db1.getcourse();
			
			request.setAttribute("progList", progList);
			request.setAttribute("progId", progId);	
			request.setAttribute("subProgList", subProgList);	
			session.setAttribute("progList", progList);
			session.setAttribute("progId", progId);	
			session.setAttribute("subProgList", subProgList);
			//request.setAttribute("courseList", null);	
			return new ModelAndView("frmMapPrograms");	
		 }
		 
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("selectsubcourse")){
			 
				String prog=request.getParameter("prog");
				ArrayList list=db1.getcourse();
				
				String course_id=db1.getcourseid(prog);
				ArrayList subcourselist=db1.getsubcourse(course_id);
				//request.setAttribute("courseList", null);	
							
				request.setAttribute("list", list);
				request.setAttribute("subcourselist", subcourselist);	
				request.setAttribute("coursenamee", prog);
				
				return new ModelAndView("createsubcourse");	
			 }
		/* else if(mapProcess!=null && mapProcess.equalsIgnoreCase("selSem")){
			 
			 Stinittryregisterring progId=request.getParameter("progId");
			 String subProgId=request.getParameter("subProgId");
			 String sem=request.getParameter("sem");
			 String graduation=request.getParameter("grdCateg");
			 
			ArrayList courseList=adminBean.getMapDetails(progId,subProgId,sem,graduation);
			
			request.setAttribute("courseList", courseList);
					
			return new ModelAndView("frmMapPrograms");	
		 }*/
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("mapAll")){
			 
			
			 String progId=request.getParameter("selProg");
			 String subProgId=request.getParameter("selSubProg");
			 String sem=request.getParameter("selSemester");
			 String graduation=request.getParameter("grdCateg");
			
			 String status="";
			
			
			 for(int i=1; i<=8;i++){	 
			 
			 String courseCd=request.getParameter("courseCode"+i);
			 String courseName=request.getParameter("coursename"+i);
		
			 
			if(courseCd!=null && courseCd.trim().length()!=0 && courseName!=null && courseName.trim().length()!=0){
				
			String mapId=db1.getMapDetails(progId,subProgId,sem,graduation,courseCd);
			String courseMapId=db1.getMapIdCourseName(progId,subProgId,sem,graduation,courseName);
				 					
			if(mapId!=null && mapId.trim().length()!=0 || courseMapId!=null && courseMapId.trim().length()!=0){	
			 
			 status=db1.updateMapDetails(mapId,courseCd,courseName);
			}else{
				status=db1.insertMapDetails(progId,subProgId,sem,graduation,courseCd,courseName);
			}
			
			}
			 }
			 request.setAttribute("status", status); 
			 ArrayList progList=db1.getcourse();
			request.setAttribute("progList", progList);			 
			 return new ModelAndView("frmMapPrograms");		 
		 }
		 
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initstudycourse")){
			 session.removeAttribute("urllist");
			 session.removeAttribute("toplist");
			 session.removeAttribute("subtoplist");
			 session.removeAttribute("assign_name");
			 String course_code=request.getParameter("coursecode");
			
			ArrayList assign_name=db5.getassignname(course_code);
			ArrayList quiz_name=db5.getquizname(course_code);
			 ArrayList urllist=db5.getcoursemateriallinklist(course_code);
				if(urllist!=null && urllist.size()!=0){
			 
			 Iterator itr = urllist.iterator();
				if(itr.hasNext()){
				 String sr4[] = (String[]) itr.next();
				 String sm = sr4[0];
				 request.setAttribute("url_link", sm);
				}}else{
					String url="https://localhost:8085/index.html";
					request.setAttribute("url_link", url);
				}
				 ArrayList toplist=db1.getcoursetopicname(course_code);
				 ArrayList subtoplist=db1.getcoursesubtopicname(course_code);
				 ArrayList rclist=db6.getrecordedclass(course_code);
				 session.setAttribute("rclist", rclist);
			 session.setAttribute("assign_name", assign_name);
			 session.setAttribute("quiz_name", quiz_name);
			 request.setAttribute("course_code", course_code);
			 session.setAttribute("urllist", urllist);
			 session.setAttribute("toplist", toplist);
			 session.setAttribute("subtoplist", subtoplist);
			 return new ModelAndView("studyarea"); 
		 }
		 
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initrecordedclass")){
			 String course_code=request.getParameter("course_code");
			 ArrayList rclist=db6.getrecordedclass(course_code);
			 request.setAttribute("rclist", rclist);
			 return new ModelAndView("studyarea"); 
		 }

		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initcommunity")){
			
			 return new ModelAndView("sample"); 
		 }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initbundles")){
				
			 return new ModelAndView("frmBundles"); 
		 }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initassignmentreport")){
			 
			 String  user_id = (String)session.getAttribute("user_id");	
			 String course_code = request.getParameter("coursecode");
			 ArrayList assign_name = db5.getassignname(course_code);
			 ArrayList cmcourselist = db.getcourseforcoursementor(user_id); 
			 
			 request.setAttribute("cmcourselist", cmcourselist);			 
			 request.setAttribute("assign_name", assign_name);
			 request.setAttribute("course_code", course_code);
			 
			 return new ModelAndView("assignmentreport"); 
		 }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("inittestreport")){
			 String course_code=request.getParameter("coursecode");
			 
			 return new ModelAndView("testreport"); 
		 }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initgetstart")){
				
			 return new ModelAndView("Pricing"); 
		 }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("onlineedition")){
	    	 return new ModelAndView("onlineedition"); 
	     }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initcontactus")){
	    	 return new ModelAndView("contactus"); 
	     }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("inittryregister")){
			 String type=request.getParameter("type");
			 String amount=request.getParameter("amount");
			 String plantype=request.getParameter("plantype");
			 String onetimecost=request.getParameter("onetimecost");
			 
			 request.setAttribute("type", type);
			 request.setAttribute("amount", amount);
			 request.setAttribute("plantype", plantype);
			 request.setAttribute("onetimecost", onetimecost);
			 
	    	 return new ModelAndView("onlineedition"); 
	     }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("inithome")){
	    	 return new ModelAndView("SLHome"); 
	     }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("initprivacy")){
	    	 return new ModelAndView("privacypolicy"); 
	     }
		 else if(mapProcess!=null && mapProcess.equalsIgnoreCase("signup")){
			 String expiryyear=null;
			 String expirymonth=null;
			 String cardno =null;
			 String cvvno =null;
			 String status = null;String statuss=null;
	    	 String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String e_mail = request.getParameter("email");
				String mobileno = request.getParameter("mobileno");
				String state = request.getParameter("state");
				
				String city = request.getParameter("city");
				String country = request.getParameter("country"); 
				String companyname = request.getParameter("companyname"); 
				String type = request.getParameter("type");
				String subscription_type = request.getParameter("subscriptiontype");
				String plan_type = request.getParameter("plantype");
				String amounts = request.getParameter("amount");
				String fee = request.getParameter("fee");
				String cardtype = request.getParameter("cardtype");
				 cardno = request.getParameter("cardno"); 
				 cvvno = request.getParameter("cvvno"); 
				String name = request.getParameter("name"); 
				 expirymonth = request.getParameter("expirymonth"); 
				 expiryyear = request.getParameter("expiryyear"); 
				String expirydate = expirymonth+expiryyear;	
				String expirydate1 = expirymonth+"/"+expiryyear;	
				String coupon_offer = null;
				String coupon_code =null;
				 coupon_code = request.getParameter("coupon_code");
				 coupon_code = request.getParameter("couponcode");
				if(coupon_code!=null && coupon_code!=""){
					 coupon_offer = db6.getcouponoffer(coupon_code);
				}
				
				String forTryNowPay = request.getParameter("forTryNowPay");
				log.info("forTryNowPay --> "+forTryNowPay);
				
				log.info(" ------- type = "+type+" coupon_code "+coupon_code);
				
				
				log.info("country "+country+" state "+state);
															
			if(type.equalsIgnoreCase("trynow")){
				
				log.info("email "+e_mail);
				
				 String userid = db6.getuseridbyemail(e_mail);
				 
				 log.info("email "+e_mail+ " user id "+userid);
				
				 if(userid != null){
					 
					status = "Already Registered";
					
					request.setAttribute("status", status);
					
					return new ModelAndView("onlineedition");
				}else{
					
					if(forTryNowPay != null && forTryNowPay.equals("forTryNowPay")){
						

						 int CcExpMonth = 0;
					        int CcExpYear = 0;
					        int CcCvvid =0;
					        double amount =0;
					        long CcNumber = 0;
					        long checkNumber=0;
					        String reqIp=request.getRemoteAddr();
						 String paymenttype=request.getParameter("paytype");  
						  float total=0;
						String product_type=type; 
						  					     
						  if(request.getParameter("expirymonth")==null){
				                CcExpMonth =0;
				            } else {
				                CcExpMonth=Integer.parseInt(request.getParameter("expirymonth"));
				            }
				            
				            if(request.getParameter("expiryyear")==null){
				                CcExpYear =0;
				            } else{
				                CcExpYear = Integer.parseInt(request.getParameter("expiryyear"));
				            }
				            
				            if(request.getParameter("cvvno")==null && request.getParameter("cvvno").trim().length()==0){
				                CcCvvid =0;
				            } else if(!request.getParameter("cvvno").equals("") && request.getParameter("cvvno").trim().length()!=0){
				                CcCvvid = Integer.parseInt(request.getParameter("cvvno"));
				            } else {
				                CcCvvid =0;
				            }
				            
				            if(request.getParameter("cardno")==null){
				                CcNumber =0;
				            } else{
				                CcNumber = Long.parseLong(request.getParameter("cardno"));
				            }
				            
				            if(request.getParameter("total_amount")!=null && request.getParameter("total_amount").trim().length()!=0) {
				                amount = Double.valueOf(request.getParameter("total_amount")).doubleValue();
				            } else {
				                amount = 0.00;
				            }
				            
				            // Setting Parent member id in session after creating a member for payment rollback
				             int intVId = 0;
				            String inVoiceId1="1";
				            if (inVoiceId1.equalsIgnoreCase("0")) {
				                intVId = 1;
				            } else {
				                intVId = 1;
				            }
				             String expYear = request.getParameter("expiryyear");
				            

				            String expDate = request.getParameter("expirymonth")+ expYear;
				            String expDate1 = request.getParameter("expirymonth")+"/"+ expYear;
				           // session.setAttribute("parentId",parentId);
				              session.setAttribute("sessionInvoiceId","1");
				            request.setAttribute("AMT", request.getParameter("total_amount"));
				            request.setAttribute("PAYMENTACTION", "Authorization");
				            request.setAttribute("CREDITCARDTYPE", request.getParameter("cardtype"));
				            request.setAttribute("ACCT", request.getParameter("cardno"));
				            request.setAttribute("EXPDATE", expDate);
				            request.setAttribute("IPADDRESS", reqIp);
				            request.setAttribute("FIRSTNAME", name);
				            System.out.println("Cardholder name check=====>"+name);
				            request.setAttribute("CVVNo", request.getParameter("cvvno"));
				            request.setAttribute("STREET", request.getParameter("street"));
				            request.setAttribute("CITY", city);
				            request.setAttribute("STATE", state);
				            request.setAttribute("expDat1", expDate1);
				            request.setAttribute("couponcode", coupon_code);
				            request.setAttribute("couponvalue", coupon_offer);
				            request.setAttribute("product_type", product_type);
				            request.setAttribute("ZIP", request.getParameter("zip"));
				            request.setAttribute("COUNTRYCODE", request.getParameter("country"));
				            request.setAttribute("EMAIL", request.getParameter("email"));
				            //session.setAttribute("objPayment", objPayment);//no need
				           // session.setAttribute("URLPATH", "MembershipReg.do?process=reg");
				            
				               request.setAttribute("intVId", String.valueOf(intVId));			           
				            request.setAttribute("purpose", "memberregistration");
				            
				            request.setAttribute("firstname", firstname);
				            request.setAttribute("lastname", lastname);
				            request.setAttribute("mobileno", mobileno);
				            request.setAttribute("companyname", companyname);
				            request.setAttribute("country", country);
				            request.setAttribute("subscription_type", subscription_type);
				            request.setAttribute("plan_type", plan_type);
				            request.setAttribute("fee", fee);
				            
				            Calendar now = Calendar.getInstance();
							SimpleDateFormat formatyear = new SimpleDateFormat("yyy");
							Date date=now.getTime();
							String year = formatyear.format(date);						
							SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
							Date dateMonth=now.getTime();
							String month=formatmonth.format(dateMonth);	
							String monthYear=year+month+"SML";
							
							request.setAttribute("monthYear", monthYear);
					        
							return new ModelAndView("testpaypal"); 
					
						
					}else{
					
					log.info("inside if trynow");
					String Product_type=type;
					Calendar now = Calendar.getInstance();
					SimpleDateFormat formatyear = new SimpleDateFormat("yyy");
					Date date = now.getTime();
					String year = formatyear.format(date);						
					SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
					Date dateMonth = now.getTime();
					String month = formatmonth.format(dateMonth);	
					String monthYear = year+month+"SML";
					//String customer_id=db6.selectcustomer_id(monthYear);
					String transactionId=null;
					log.info(firstname+" 1==== "+lastname+" 1==== "+e_mail+" 1==== "+mobileno+" 1==== "+city+" 1==== "+state+" 1==== "+country+" 1==== "+companyname+" 1==== "+cardtype+" 1==== "+cardno+" 1==== "+cvvno+" 1==== "+name+" 1==== "+expirydate+" 1==== "+monthYear+" 1==== "+subscription_type+" 1==== "+ plan_type+" 1==== "+ fee);
					
					String Cardno="Null";
					String Cvvno ="Null";
					String Expirydate="Null";
					
					statuss=db6.insertsignup(firstname,lastname,e_mail,mobileno,city,state,country,companyname,cardtype,Cardno,Cvvno,name,Expirydate,monthYear, subscription_type, plan_type, fee,transactionId,coupon_code,coupon_offer,Product_type);					
					log.info("statuss "+statuss);

					 if(statuss != null){
						  request.setAttribute("firstname", firstname);
						  request.setAttribute("lastname", lastname);
						  request.setAttribute("e_mail", e_mail);
						  request.setAttribute("companyname", companyname);
						  
						  log.info("e_mail ===> "+e_mail);
						  
						  String cmid = db6.selectcompanyid(e_mail);	
						  String subscription_id = db6.selectsubscriptionid(e_mail);
						  String order_id = db6.selectorderid(e_mail);
						  String customerid = db6.selectcustomerid(e_mail);	
						  String us = db6.getuserandpass(e_mail);
						  
						  String[] parts = us.split("/");
							 String user = parts[0];
							 String pass = parts[1]; 
						
						  log.info("cmid "+cmid+" subscription_id "+subscription_id+" order_id "+order_id+" customerid "+customerid);
						  
						  
						  request.setAttribute("coupon_code", coupon_code);
						  request.setAttribute("cmid", cmid);
						  request.setAttribute("subscription_id", subscription_id);
						  request.setAttribute("order_id", order_id);
						  request.setAttribute("customerid", customerid);
						  request.setAttribute("plantype", plan_type);
						  request.setAttribute("subscription_type", subscription_type);
						  String reason="I am from mappingaction java class, here to tell you the reason";
						  request.setAttribute("reason", reason);
						  request.setAttribute("user", user);
						  request.setAttribute("pass", pass);
						  status="Registered Successfully";
						  
						  
						  return new ModelAndView("signupdetails");
					}
					 else{
						 request.setAttribute("firstname", firstname);
						  request.setAttribute("lastname", lastname);
						  request.setAttribute("e_mail", e_mail);
						  request.setAttribute("companyname", companyname);
						  String cmid=db6.selectcompanyid(e_mail);	
						  String subscription_id=db6.selectsubscriptionid(e_mail);
						  String order_id=db6.selectorderid(e_mail);
						  String customerid=db6.selectcustomerid(e_mail);						  
						
						  request.setAttribute("cmid", cmid);
						  request.setAttribute("subscription_id", subscription_id);
						  request.setAttribute("order_id", order_id);
						  request.setAttribute("customerid", customerid);
						  request.setAttribute("plantype", plan_type);
						  request.setAttribute("subscription_type", subscription_type);						 
						  String reason="Sorry for the Inconvenience, your registration has failed...";
						  request.setAttribute("reason", reason);						
						  status="Registration Failed";
						  
						  return new ModelAndView("signfailure");
					 }	
				}
				}
				
			}
			
		else if(type.equalsIgnoreCase("buynow")){
					 int CcExpMonth = 0;
				        int CcExpYear = 0;
				        int CcCvvid =0;
				        double amount =0;
				        long CcNumber = 0;
				        long checkNumber=0;
				        String reqIp=request.getRemoteAddr();
					 String paymenttype=request.getParameter("paytype");  
					  float total=0;
					String product_type=type; 
					  					     
					  if(request.getParameter("expirymonth")==null){
			                CcExpMonth =0;
			            } else {
			                CcExpMonth=Integer.parseInt(request.getParameter("expirymonth"));
			            }
			            
			            if(request.getParameter("expiryyear")==null){
			                CcExpYear =0;
			            } else{
			                CcExpYear = Integer.parseInt(request.getParameter("expiryyear"));
			            }
			            
			            if(request.getParameter("cvvno")==null && request.getParameter("cvvno").trim().length()==0){
			                CcCvvid =0;
			            } else if(!request.getParameter("cvvno").equals("") && request.getParameter("cvvno").trim().length()!=0){
			                CcCvvid = Integer.parseInt(request.getParameter("cvvno"));
			            } else {
			                CcCvvid =0;
			            }
			            
			            if(request.getParameter("cardno")==null){
			                CcNumber =0;
			            } else{
			                CcNumber = Long.parseLong(request.getParameter("cardno"));
			            }
			            
			            if(request.getParameter("total_amount")!=null && request.getParameter("total_amount").trim().length()!=0) {
			                amount = Double.valueOf(request.getParameter("total_amount")).doubleValue();
			            } else {
			                amount = 0.00;
			            }
			            
			            // Setting Parent member id in session after creating a member for payment rollback
			             int intVId = 0;
			            String inVoiceId1="1";
			            if (inVoiceId1.equalsIgnoreCase("0")) {
			                intVId = 1;
			            } else {
			                intVId = 1;
			            }
			             String expYear = request.getParameter("expiryyear");
			            

			            String expDate = request.getParameter("expirymonth")+ expYear;
			            String expDate1 = request.getParameter("expirymonth")+"/"+ expYear;
			           // session.setAttribute("parentId",parentId);
			              session.setAttribute("sessionInvoiceId","1");
			            request.setAttribute("AMT", request.getParameter("total_amount"));
			            request.setAttribute("PAYMENTACTION", "Authorization");
			            request.setAttribute("CREDITCARDTYPE", request.getParameter("cardtype"));
			            request.setAttribute("ACCT", request.getParameter("cardno"));
			            request.setAttribute("EXPDATE", expDate);
			            request.setAttribute("IPADDRESS", reqIp);
			            request.setAttribute("FIRSTNAME", name);
			            System.out.println("Cardholder name check=====>"+name);
			            request.setAttribute("CVVNo", request.getParameter("cvvno"));
			            request.setAttribute("STREET", request.getParameter("street"));
			            request.setAttribute("CITY", city);
			            request.setAttribute("STATE", state);
			            request.setAttribute("expDat1", expDate1);
			            request.setAttribute("couponcode", coupon_code);
			            request.setAttribute("couponvalue", coupon_offer);
			            request.setAttribute("product_type", product_type);
			            request.setAttribute("ZIP", request.getParameter("zip"));
			            request.setAttribute("COUNTRYCODE", request.getParameter("country"));
			            request.setAttribute("EMAIL", request.getParameter("email"));
			            //session.setAttribute("objPayment", objPayment);//no need
			           // session.setAttribute("URLPATH", "MembershipReg.do?process=reg");
			            
			               request.setAttribute("intVId", String.valueOf(intVId));			           
			            request.setAttribute("purpose", "memberregistration");
			            
			            request.setAttribute("firstname", firstname);
			            request.setAttribute("lastname", lastname);
			            request.setAttribute("mobileno", mobileno);
			            request.setAttribute("companyname", companyname);
			            request.setAttribute("country", country);
			            request.setAttribute("subscription_type", subscription_type);
			            request.setAttribute("plan_type", plan_type);
			            request.setAttribute("fee", fee);
			            
			            Calendar now = Calendar.getInstance();
						SimpleDateFormat formatyear = new SimpleDateFormat("yyy");
						Date date=now.getTime();
						String year = formatyear.format(date);						
						SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
						Date dateMonth=now.getTime();
						String month=formatmonth.format(dateMonth);	
						String monthYear=year+month+"SML";
						
						request.setAttribute("monthYear", monthYear);
				        
						return new ModelAndView("testpaypal"); 
				}
				 
	     } 
		 
		 
		 
		 
		}catch(Exception e)
        {
			e.printStackTrace();
        }
		return new ModelAndView("SLHome"); 
	}
	
}
