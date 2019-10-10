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
package com.digital.certification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;


import com.sun.mail.iap.ProtocolException;

@Controller
public class DigiCert{
	
	
	@RequestMapping("/digi.html")
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
		
		System.out.println("This is key management");
		try{
			
				String cmd=request.getParameter("cmd");
				
				
				if(cmd != null && cmd.equalsIgnoreCase("initmain")){
					
					String number=request.getParameter("number");
					System.out.println("number"+number);
					String url="digi.html?cmd=welcomenote";
					request.setAttribute("url", url);
					return new ModelAndView("digicert");
						
				}else if(cmd != null && cmd.equalsIgnoreCase("process")){
					
					String number=request.getParameter("number");
					System.out.println("number"+number);
					
					String nam="Parasuraman Ayyanar";
					String dep="Computer Science and Engineering";
					String cla="First Class";
					String yer="2016";
					request.setAttribute("nam", nam);
					request.setAttribute("dep", dep);
					request.setAttribute("cla", cla);
					request.setAttribute("yer", yer);
					return new ModelAndView("digicertimg");
					}else if(cmd != null && cmd.equalsIgnoreCase("welcomenote")){
						
						
						return new ModelAndView("digicertinfo");
						}
					else if(cmd != null && cmd.equalsIgnoreCase("mainprocess")){
						String number=request.getParameter("number");
						System.out.println("number"+number);
						String url="digi.html?cmd=process&number="+number;
						request.setAttribute("url", url);
						
						return new ModelAndView("digicert");
						}
				
				
				
	 
		 
			}catch(Exception e){
				e.getStackTrace();
			}
			 
			 
		
		return null;	 
			 
		}
}
