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

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.email.EmailContent;
import com.email.MailMail;
import com.hlcform.util.Debug;
import com.util.OptionsBuilder;
import com.util.adminDB;
import com.util.baseDB;
import com.util.userDB;

@Controller
public class QualificationAction {
	
	static Logger log = Logger.getLogger(MappingAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	private static QualificationAction myInstance = new QualificationAction();
	
	public static QualificationAction getInstance(){		
		return myInstance;
	}
	
	private QualificationAction(){
		
	}

	@RequestMapping("/qual.html")
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
		 String QualificationProcess = request.getParameter("QualificationProcess");
		 String Update = request.getParameter("Update");
		 String insert = request.getParameter("insert");
		 String qualcmd=request.getParameter("cmd");
		 adminDB db1=adminDB.getInstance();
		 userDB db=userDB.getInstance();
		 baseDB db6=baseDB.getInstance();
		 PrintWriter writer = response.getWriter(); 
		 if(qualcmd!=null && qualcmd.equalsIgnoreCase("initinsert")){	
			 ArrayList ugprogramlist=db.getugprogramlist();
			 
			
			request.setAttribute("ugprogramlist", ugprogramlist);
		
			session.setAttribute("ugprogramlist", ugprogramlist);
			
				 return new ModelAndView("frmInsertQualificationDetails");
			 }
		
		 
		 else if(QualificationProcess!=null && QualificationProcess.equalsIgnoreCase("insertDetails")){
				 if(insert!=null && insert.equalsIgnoreCase("Submit")){
				 String category=request.getParameter("category");
				 String age=request.getParameter("age");
				 String std=request.getParameter("std");

 std=request.getParameter("standard");
				 String document=request.getParameter("document");
				 ArrayList ugprogramlist=db1.getugprogramlist();
				 
					 
				 
					String qualificationstatus = db1.insertqualificationdetails(category,age,std,document);
					
					// String  status=db1.Editdetails(qulamapid,age,std);
					
					request.setAttribute("qualificationstatus", qualificationstatus);
					
					//request.setAttribute("document", document);
					
					
					//request.setAttribute("age", age);	
					//request.setAttribute("std", std);	
					//request.setAttribute("ugprogramlist", ugprogramlist);					
				
					 return new ModelAndView("frmInsertQualificationDetails");
				 }
				 else if(insert!=null && insert.equalsIgnoreCase("Edit")){
					
					 //String age=request.getParameter("age");
					// String std=request.getParameter("std");
				 String category=request.getParameter("category");
					 if(category.equalsIgnoreCase("UG")){
						//String age=request.getParameter("age");
						 
						 ArrayList ugqualificationdetails=db1.getugqualificationdetails();
							request.setAttribute("ugqualificationdetails", ugqualificationdetails);
						
							 //String std=request.getParameter("std");
						//String age=request.getParameter("age");
							 //String document=request.getParameter("document");
						// String  status=db1.Editdetails(category,age,std,document);
						 //request.setAttribute("status", status);
							return new ModelAndView("frmEditQualificationDetails"); 		
				 }
				 else
				 {
					 ArrayList pgqualificationdetails=db1.getpgqualificationdetails();
						request.setAttribute("pgqualificationdetails", pgqualificationdetails);
					
					// String std=request.getParameter("std");
						//String age=request.getParameter("age");
							 //String document=request.getParameter("document");
							 //String  status=db1.Editpgdetails(category,std,document);
						return new ModelAndView("frmEditQualificationDetails"); 	// request.setAttribute("status", status);
							 
				 }
					
						 //String mapid=request.getParameter("map_id");
						
					//String  status=db1.Editdetails(age,std,document);
					 
					//request.setAttribute("status", status);
						
					 //ArrayList qualificationdetails=db1.getqualificationdetails();
						//request.setAttribute("qualificationdetails", qualificationdetails);
				 }
				return new ModelAndView("frmInsertQualificationDetails");	
			 }
		 
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initedit")){
				 //ArrayList qualificationdetails=db1.getugqualificationdetails();
					//request.setAttribute("qualificationdetails", qualificationdetails);
				
			      return new ModelAndView("frmEditQualificationDetails"); 
			     }
			 else if(Update!=null && Update.equalsIgnoreCase("Update")){ 
				 String category=request.getParameter("category");
			 
				 if(category.equalsIgnoreCase("UG")){
				
				 String std=request.getParameter("std");
					String age=request.getParameter("age");
						 String document=request.getParameter("document");
					String  status=db1.Editdetails(category,age,std,document);
					request.setAttribute("status", status);				 
				
					return new ModelAndView("frmEditQualificationDetails");
				 }
				 else{
					 String std=request.getParameter("std");
						//String age=request.getParameter("age");
							 String document=request.getParameter("document");
							 String  status=db1.Editpgdetails(category,std,document);
						 	 request.setAttribute("status", status);
					 return new ModelAndView("frmEditQualificationDetails");
				 }
				 
				
				 
			 }
			 else if(QualificationProcess!=null && QualificationProcess.equalsIgnoreCase("External")){
				
				 String filename=request.getParameter("filename");
				 String pathname=request.getParameter("pathname");				
					String extrenalapp = db1.insertexternalapp(filename,pathname);
					request.setAttribute("extrenalapp", extrenalapp);
					
				 return new ModelAndView("frmExternalApp");
				
			 }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initexterapp")){
				 //ArrayList qualificationdetails=db1.getugqualificationdetails();
					//request.setAttribute("qualificationdetails", qualificationdetails);
				
			      return new ModelAndView("frmExternalApp"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initmappingepp")){
				 ArrayList rolist=db1.getrole();
				 ArrayList entitylist=db1.getentity();
				 ArrayList privilist=db1.getprivilege();
				 ArrayList permilist=db1.getpermission();
				 
					request.setAttribute("rolist", rolist);
					request.setAttribute("entitylist", entitylist);
					request.setAttribute("privilist", privilist);
					request.setAttribute("permilist", permilist);
				
			      return new ModelAndView("frmMappingEntityPP"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initprivilege")){
				 				
			      return new ModelAndView("frmCreatePrivilege"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initexternalapp")){
				 String title=null;
				 String url_name = request.getParameter("urlname");
				
				if(url_name.equals("openmeetings")){
					try
				      {
				      URL url = new URL("https://www.digiblitzonline2.com:5443/openmeetings/signin");
				         URLConnection urlConnection = url.openConnection();
				         HttpURLConnection connection = null;
				         if(urlConnection instanceof HttpURLConnection)
				         {
				            connection = (HttpURLConnection) urlConnection;
				         }
				         
				         BufferedReader in = new BufferedReader(
				         new InputStreamReader(connection.getInputStream()));
				         String urlString = "";
				         String current;
				         while((current = in.readLine()) != null)
				         {
				            urlString += current;
				         }
				         String splitableStr = ".SignInPage;jsessionid=";
				          title= StringUtils.substringBetween(urlString, splitableStr, "?");
				       
				      }catch(IOException e)
				      {
				         e.printStackTrace();
				      }
				}
				request.setAttribute("sessionid", title);
				 request.setAttribute("url_name", url_name);
			      return new ModelAndView("frmExternalApp"); 
			     }
		 
			 else if(QualificationProcess!=null && QualificationProcess.equalsIgnoreCase("Permission")){
					
				 String permissionname = request.getParameter("permissionname");
				 String url_name = request.getParameter("urlname");
					String status=db1.addpermission(permissionname,url_name);
				 
					 return new ModelAndView("frmCreatePermission");
				
			 }
			 else if(QualificationProcess!=null && QualificationProcess.equalsIgnoreCase("Privilege")){
					
				 String privilegename = request.getParameter("privilegename");
				
					String status=db1.addprivilege(privilegename);
				 
					 return new ModelAndView("frmCreatePrivilege");
				
			 }
			 else if(QualificationProcess!=null && QualificationProcess.equalsIgnoreCase("Entity")){
					
				 String entityname = request.getParameter("entityname");
				 String url_name = "login.html?cmd=initindex";
					String status=db1.addentity(entityname,url_name);
				 
					 return new ModelAndView("createentity");
				
			 }
			 else if(QualificationProcess!=null && QualificationProcess.equalsIgnoreCase("MappingEPP")){
				 String	status=null;
				 String rolename = request.getParameter("rolename");
				 String entityname = request.getParameter("entityname");
				 String privname = request.getParameter("privname");
				 String permname = request.getParameter("permname");
				 String mapid=db1.getmapentityid(rolename,entityname,privname,permname);
				 if(mapid != null){
					  status="Already Mapped";
				 }else{
					  status=db1.addmappingentity(rolename,entityname,privname,permname);	
				 }
				
				 ArrayList rolist=db1.getrole();
				 ArrayList entitylist=db1.getentity();
				 ArrayList privilist=db1.getprivilege();
				 ArrayList permilist=db1.getpermission();
				 
					request.setAttribute("rolist", rolist);
					request.setAttribute("entitylist", entitylist);
					request.setAttribute("privilist", privilist);
					request.setAttribute("permilist", permilist);
				 request.setAttribute("status", status);
					 return new ModelAndView("frmMappingEntityPP");
				
			 }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initaboutus")){
	 				
			      return new ModelAndView("aboutus"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initcertification")){
	 				
			      return new ModelAndView("certification"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("initcp")){
	 				
			      return new ModelAndView("cert_program"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("inithelppage")){
	 				
			      return new ModelAndView("helppage"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("inithome")){
					
			      return new ModelAndView("Home"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("whysmartlehren")){
					
			      return new ModelAndView("whysmartlehren"); 
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("checkusrnam")){
				 String usrId=request.getParameter("chsUserName");
		           boolean usrStat=db6.checkUserNameExist(usrId);
		            //get the member id existing or not status and respond 

		            writer.println("<userstatus><![CDATA[" + usrStat + "]]></userstatus>"); 
			      
			     }
			 else if(qualcmd!=null && qualcmd.equalsIgnoreCase("checkemail")){
				 
				 String email = request.getParameter("chsemail");
		           
				 boolean emailStat = db6.checkemailExist(email);
		            //get the member id existing or not status and respond 

		            writer.println("<userstatus><![CDATA[" + emailStat + "]]></userstatus>"); 
			      
			     }
		 
		 writer.close();
		}catch(Exception e)
        {
        e.printStackTrace();
        }
		return new ModelAndView("SLHome"); 
}
	
	void mail(String username,String password,String e_mail){
		 
	       
        
        
        /* =====================================
         *
         * Sending User Name E-mail
         *
         * ====================================*/
            
		 String toMailIds[] = {e_mail};
        EmailContent email=new EmailContent();
        email.setTo(toMailIds);
        email.setFrom("dhivya@digiblitz.in");
        email.setSubject("Your Account Details");
        
        String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                " <tr>" +
                " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                "<tr>" +
                "<td height=\"70\" valign=\"top\"><img src=\"images/traininglogo.jpg\" alt=\"Digiblitz University\" width=\"515\" height=\"55\" /></td> " +
                " </tr>"+
                "  <tr>"+
                "<td valign=\"top\">"+
                "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                "<tr>"+
                "<td width=\"13\" height=\"12\" valign=\"top\"></td> " +
                "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                "<td width=\"13\" height=\"12\" valign=\"top\"></td>" +
                "</tr>"+
                "<tr>"+
                "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                "<p>Please save this email for your records. Your account information is as follows:.<p>"+
                "<p> --------------------- <p>"+
                                                                   
                "<p> User Name : "+username+"<p>"+ 
                "<p> Password : "+password+"<p>"+ 
                                      
                "<p> --------------------- <p>"+
                "Thank You <br />"+
                "------------------ <br />"+
                "<span class=\"boldRedTxt\">Digiblitz University Team</span></td>"+
                "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                "</tr>"+
                "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                "</tr>"+
                " </table>"+
                "</td></tr>"+
                         
                " <tr>"+
                "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"></td>"+
                "</tr>"+
                "</table>";
        
        
        email.setBody(content);
        //email.setAttachments();
        
        MailMail mail = new MailMail();
        boolean emailFlag = mail.sendMimeEmail(email);
        //Debug.print("Email sent sucessfully :"+emailFlag);
        String stat="success";
        //request.setAttribute("status1",stat);
	 
	 }		
void mail(String coupon_no,String e_mail){
		 
        
        /* =====================================
         *
         * Sending User Name E-mail
         *
         * ====================================*/
            
		 String toMailIds[] = {e_mail};
        EmailContent email=new EmailContent();
        email.setTo(toMailIds);
        email.setFrom("dhivya@digiblitz.in");
        email.setSubject("Your Account Details");
        
        String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                " <tr>" +
                " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                "<tr>" +
                "<td height=\"70\" valign=\"top\"><img src=\"images/traininglogo.jpg\" alt=\"Digiblitz University\" width=\"515\" height=\"55\" /></td> " +
                " </tr>"+
                "  <tr>"+
                "<td valign=\"top\">"+
                "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                "<tr>"+
                "<td width=\"13\" height=\"12\" valign=\"top\"></td> " +
                "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                "<td width=\"13\" height=\"12\" valign=\"top\"></td>" +
                "</tr>"+
                "<tr>"+
                "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                "<p>Please save this email for your records. Your coupon code is as follows:.<p>"+
                "<p> --------------------- <p>"+
                                                                   
                "<p> Coupon Code : "+coupon_no+"<p>"+ 
               
                "<p> --------------------- <p>"+
                "Thank You <br />"+
                "------------------ <br />"+
                "<span class=\"boldRedTxt\">Digiblitz University Team</span></td>"+
                "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                "</tr>"+
                "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                "</tr>"+
                " </table>"+
                "</td></tr>"+
                         
                " <tr>"+
                "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"></td>"+
                "</tr>"+
                "</table>";
        
        
        email.setBody(content);
        //email.setAttachments();
        
        MailMail mail = new MailMail();
        boolean emailFlag = mail.sendMimeEmail(email);
        //Debug.print("Email sent sucessfully :"+emailFlag);
        String stat="success";
        //request.setAttribute("status1",stat);
	 
	 }	
public final ModelAndView getXmlContent(HttpServletRequest request,HttpServletResponse response,Vector vec) throws Exception {
	 String xml = null;
	    try {
                 xml = new OptionsBuilder().getContent(vec);
                 Debug.print("XmlContent = "+xml); 		   		     
	    } catch (Exception ex) {
	      // Send back a 500 error code.
	      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
	      return null;
	    }
	    // Set content to xml
	    response.setContentType("text/xml; charset=UTF-8");
	    response.setHeader("Cache-Control", "no-cache");
	    PrintWriter pw = response.getWriter();
	    pw.write(xml);
	    pw.close();
	    return null;     
}

/**
*  return the xml content for the given drop down
*/
public final ModelAndView getIssueContent(HttpServletRequest request,HttpServletResponse response,Vector issueType,Vector dispType) throws Exception {
String xml = null;
   try {
             xml = new OptionsBuilder().getIssueContent(issueType,dispType);
             Debug.print("XmlContent = "+xml); 		   		     
   } catch (Exception ex) {
     // Send back a 500 error code.
     response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
     return null;
   }
   // Set content to xml
   response.setContentType("text/xml; charset=UTF-8");
   response.setHeader("Cache-Control", "no-cache");
   PrintWriter pw = response.getWriter();
   pw.write(xml);
   pw.close();
   return null;     
}
}
