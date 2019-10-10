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

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.util.EnrollDB;
import com.util.ReportDB;
import com.util.adminDB;
import com.util.baseDB;
import com.util.studentDB;
import com.util.trainerDB;
import com.util.userDB;

@Controller
public class EnrollmentAction {

	static Logger log = Logger.getLogger(EnrollmentAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	@RequestMapping("/enroll.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		Properties logProp = new Properties();
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is);
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
	      
				try{
					HttpSession session = request.getSession(true);
					userDB db = userDB.getInstance();
					adminDB db1 = adminDB.getInstance();					
					studentDB db5 = studentDB.getInstance();
					trainerDB db4 = trainerDB.getInstance();
					baseDB db6 = baseDB.getInstance();
					ReportDB db7 = ReportDB.getInstance();
					EnrollDB db8 = EnrollDB.getInstance();
					 
			String cmd=request.getParameter("cmd");
			String EnrollProcess=request.getParameter("EnrollProcess");
			
			if(cmd != null && cmd.equalsIgnoreCase("initprevailingupcourses")){
				
				
				ArrayList programlist = db8.getprogramlist();
				
				request.setAttribute("programlist", programlist);
				
				 return new ModelAndView("prevailingupcourses");
			}	
			
			else if(cmd != null && cmd.equalsIgnoreCase("getsubprogramlist")){
					
				String programid = request.getParameter("programid");
				
					ArrayList programlist = db8.getprogramlist();
					
					ArrayList subprogramlist = db8.getsubprogram(programid);							
					
					request.setAttribute("subprogramlist", subprogramlist);
					request.setAttribute("programlist", programlist);					
					 return new ModelAndView("prevailingupcourses");
				}	
			
			else if(cmd != null && cmd.equalsIgnoreCase("initadmissionstatus")){
				
				ArrayList admissionlist = db8.getadmissionlist();
							
				request.setAttribute("admissionlist", admissionlist);	
				
					 return new ModelAndView("admissionstatus");
				}	
			
	else if(cmd != null && cmd.equalsIgnoreCase("initcertificate")){
				
					 return new ModelAndView("certificate");
				}	
	else if(cmd != null && cmd.equalsIgnoreCase("createcertificate")){
		
		String userid = (String)session.getAttribute("user_id");
		
		log.info("insidecreate certificate");
		String logolocation = null;
		String signlocation = null;
				
		String universityname = null;
		String address = null;
		String status = null;
		
		ArrayList certificatelist = new ArrayList();
		
		try {
			 String logoSavePath;
			    final String UPLOAD_DIRECTORY = "C://userdocuments//";
			    logoSavePath =  UPLOAD_DIRECTORY;
			    
			    if (!(new File(logoSavePath)).exists()) {
		            (new File(logoSavePath)).mkdir();    // creates the directory if it does not exist        
		        }   
			    
			      String resp = "";
			        int i = 1;
			       resp += "<br>Here is information about uploaded files.<br>";
			       
			    try{   
		MultipartParser multiparser = new MultipartParser(request, 1024 * 1024 * 1024);
		
		 Part part;
		 
		 while((part = multiparser.readNextPart()) != null){
			 
			 String genName = part.getName();
			 
				
			 			 
			 if(part.isFile()){
				 FilePart fPart = (FilePart) part;  // get some info about the file
				 String name = fPart.getFileName();
		if (name != null) {
			long fileSize = fPart.writeTo(new File(logoSavePath));
			  resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
				  String saveFile = logoSavePath+name;
				  logolocation = saveFile;
				  certificatelist.add(logolocation);
				 } else {
		  resp = "<br>The user did not upload a file for this part.";
		}	
	 }
			 
			if(part.isFile()){
				 FilePart fPart = (FilePart) part;  // get some info about the file
				 String name = fPart.getFileName();
		if (name != null) {
			long fileSize = fPart.writeTo(new File(logoSavePath));
			  resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
				  String saveFile = logoSavePath+name;
				  signlocation = saveFile;
					certificatelist.add(signlocation);
		} else {
		  resp = "<br>The user did not upload a file for this part.";
		}	
	 }	 
			 
			 if(part.isParam()){
				 ParamPart paramPart = (ParamPart)part;
           	  if(genName.equals("universityname")){
           		universityname = paramPart.getStringValue();  
           		certificatelist.add(universityname);
           	  }	
           	 if(genName.equals("address")){
           		address = paramPart.getStringValue();
           		certificatelist.add(address);
            	  }	
           	log.info("university values saved successfully");	
			 }			 
		 }
		 
		 String logopath = null; String university = null; String signature = null; String address1 = null;
		 certificatelist.removeAll(Collections.singleton(null));
		 LinkedHashSet set = new LinkedHashSet();
		 set.addAll(certificatelist);
		 
		 if(set != null){
			 Iterator itr = set.iterator();
			 while(itr.hasNext()){
				 
				 logopath = (String)itr.next();
				 university = (String)itr.next();
				 address1 = (String)itr.next();
				 signature = (String)itr.next();				 
			 }			
		 }
		 status = db8.setCertificatedetails(userid,logopath,university,address1,signature);
		}
	catch (Exception e){
					e.printStackTrace();
				} 
		}		
		catch (Exception e){
			e.printStackTrace();
		}
		request.setAttribute("status", status);
		 return new ModelAndView("certificate");
	}
			
	else if(cmd != null && cmd.equalsIgnoreCase("initadmissionletter")){
		
		String user_id = (String)session.getAttribute("user_id");
		
		ArrayList admissionlist = db8.getadmissionletterlist();
		
		String universityname = null;
		String universityaddress = null;
		String logopath = null;
		String signpath = null;
		String logodata = null;
		String signdata = null;
					
		if(admissionlist != null){
			Iterator itr = admissionlist.iterator();
			while(itr.hasNext()){
				String strarr[] = (String[])itr.next();
				
				universityname = strarr[0];
				universityaddress = strarr[1];
				logopath = strarr[2];
				signpath = strarr[3];				
			}
		}
		
		if(logopath != null && signpath != null){
		
			 FileInputStream inpStream = new FileInputStream(logopath);
			 byte[] bytearr= IOUtils.toByteArray(inpStream);
			 byte byteImageData[]  =com.bea.xbean.util.Base64.encode(bytearr);
			 logodata= new String(byteImageData);	
			 
			 FileInputStream inpStream1 = new FileInputStream(signpath);
			 byte[] bytearr1= IOUtils.toByteArray(inpStream1);
			 byte byteImageData1[]  =com.bea.xbean.util.Base64.encode(bytearr1);
			 signdata= new String(byteImageData1);
		}  
			 String name = null;
			 String programid = null;
			 String subprogramid = null;
			 ArrayList studentlist = db8.getstudentlist(user_id);
			 
			 if(studentlist != null){
				 Iterator itr = studentlist.iterator();
				 while(itr.hasNext()){
					 String strarr[] = (String[])itr.next();
					 name = strarr[0];
					 programid = strarr[1];
					 subprogramid = strarr[2];
				 }
			 }
			 
			 String programname = db6.getprogramname(programid);
			 	String subprogramname = db6.getsubprogram(programid, subprogramid);
			  
		request.setAttribute("name", name);
		request.setAttribute("programname", programname);
		request.setAttribute("subprogramname", subprogramname);			 			 
		request.setAttribute("universityname", universityname);
		request.setAttribute("universityaddress", universityaddress);
		request.setAttribute("logodata", logodata);
		request.setAttribute("signdata", signdata);
		
		return new ModelAndView("admissionletter");
	}		
			
		
}
		catch(Exception e){
				e.printStackTrace();			
				}				
				return new ModelAndView("SLHome");

			
		}
	
	}
