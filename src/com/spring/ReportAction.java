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

import java.awt.Color;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
import org.tc33.jheatchart.HeatChart;
import org.xml.sax.SAXException;

import com.birt.SimpleChart;
import com.db.GeneralDBAction;
import com.util.EnrollDB;
import com.util.ReportDB;
import com.util.adminDB;
import com.util.baseDB;
import com.util.studentDB;
import com.util.trainerDB;
import com.util.userDB;

@Controller
public class ReportAction {

	static Logger log = Logger.getLogger(ReportAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	GeneralDBAction DB=new GeneralDBAction();
	
	@RequestMapping("/report.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		
	      Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is);   
	      PropertyConfigurator.configure(logProp);      
	      log.info(" ");    		
	            
				try{
					HttpSession session=request.getSession(true);
					userDB db = userDB.getInstance();
					adminDB db1 = adminDB.getInstance();			
					studentDB db5 = studentDB.getInstance();
					trainerDB db4 = trainerDB.getInstance();
					baseDB db6 = baseDB.getInstance();
					ReportDB db7 = ReportDB.getInstance();
					EnrollDB db8 = EnrollDB.getInstance();
					 
			String cmd=request.getParameter("cmd");
			String ReportProcess=request.getParameter("ReportProcess");
			
			 //amalesh 23-02-16
			 if(cmd!=null && cmd.equalsIgnoreCase("initattendance")){	
				 
				 			 
				 	String user_id = (String)session.getAttribute("user_id");			
				 	
				 	String sturolename = null;
				 	String courserolename = null;
				 	
				 	String program_id = null;
				 	String sub_program_id = null;
				 	String rolename = null;
				 	ArrayList rolelist = new ArrayList();
				 	String nonTeachingStaff = "false";
				 	//boolean student = false;
				 	
				 	if(user_id != null){				 		 
				 					 				 	
				 	//for course mentor				 	
				 		 ArrayList coursedetails = db7.getcoursedetails(user_id);				 		 
				 		 
				 		 if(coursedetails != null){
				 			Iterator itr=coursedetails.iterator();
					 		
				 			while(itr.hasNext()){
					 			String strarr[] = (String[]) itr.next();	
					 			program_id = strarr[0];
					 			sub_program_id = strarr[1];					 			
					 		}
					 		
				 			if(program_id != null && sub_program_id!=null){
					 			rolename = db7.getrolename(user_id);
					 		}
					 		
				 			sturolename = db7.getsturole(program_id,sub_program_id);	
					 		
				 			rolelist.add(rolename);
					 		rolelist.add(sturolename);	
				 		 }
				 		
				 		 //for student
				 		 if(program_id == null && sub_program_id == null && rolename == null){
						 		
				 			 ArrayList studentlist = db7.getstudentlist(user_id);						 		
						 	
				 			 if(studentlist != null){
							 		Iterator itr=studentlist.iterator();
							 		while(itr.hasNext()){
							 			String strarr[] = (String[]) itr.next();
							 			program_id = strarr[0];
							 			sub_program_id = strarr[1];
							 			rolename = strarr[2];
							 		}
							 	}
						 		rolelist.add(rolename);	
						 		sturolename = db7.getsturole(program_id,sub_program_id);	
						 	}
				 		 
				 		 //for program mentor
				 		 if(program_id == null && sub_program_id == null && rolename == null){
				 			
				 			 ArrayList courselist = db6.getcourselist(user_id); 						 	
						 	
				 			 if(courselist != null){
						 		Iterator itr=courselist.iterator();
						 		
						 		while(itr.hasNext()){
						 			String strarr[] = (String[]) itr.next();
						 			program_id = strarr[0];
						 			sub_program_id = strarr[1];
						 			rolename = strarr[2];
						 		}						 		
						 	}	
						 	 
				 		 sturolename = db7.getsturole(program_id,sub_program_id);	
						 String courseroleid = db7.getcourserole(program_id,sub_program_id);
						 courserolename = db7.getrolename(courseroleid);						
						 rolelist.add(rolename);
						 rolelist.add(courserolename);
						 rolelist.add(sturolename);			
						 }	
				 		 
				 		 //for other users
				 		if(program_id == null && sub_program_id == null && rolename == null){
				 			
				 			//fixing a dummy value
				 			nonTeachingStaff = "true";
				 		}
				 	 
				 	
				 	
				 	}
						
					String programname = db6.getprogramname(program_id);
				 	String subprogramname = db6.getsubprogram(program_id, sub_program_id);	 
				 	
				 	request.setAttribute("nonTeachingStaff", nonTeachingStaff);
				 	request.setAttribute("rolelist", rolelist);				
				 	request.setAttribute("programname", programname);
				 	request.setAttribute("subprogramname", subprogramname);						 	
				 	request.setAttribute("username", rolename);
				 	request.setAttribute("user_id", user_id);
				 	request.setAttribute("sturolename", sturolename);
					 
				 	return new ModelAndView("attendance");
				 }
			
			 else if(cmd != null && cmd.equalsIgnoreCase("attendancestatus")){
					 			 
				
				 	String username1 = request.getParameter("username");
					String programname = request.getParameter("programname");
					String subprogram = request.getParameter("subprogram");
					String designation = request.getParameter("designation");
					String month = request.getParameter("month");
					String year = request.getParameter("year");
					String yearmonth = year+"-"+month;
					String semester = request.getParameter("semester");
					
					String user_id = (String)session.getAttribute("user_id");
				 	
					String sturolename = null;
				 	String courserolename = null;
				 	
				 	String program_id = null;
				 	String sub_program_id = null;
				 	String rolename = null;
				 	ArrayList rolelist = new ArrayList();	
				 	
				 	
				 	if(user_id != null){				 		 
		 				 	
					 	//for course mentor				 	
					 		 ArrayList coursedetails = db7.getcoursedetails(user_id);				 		 
					 		 if(coursedetails != null){
					 			Iterator itr=coursedetails.iterator();
						 		while(itr.hasNext()){
						 			String strarr[] = (String[]) itr.next();	
						 			program_id = strarr[0];
						 			sub_program_id = strarr[1];					 			
						 		}
						 		if(program_id != null && sub_program_id!=null){
						 			rolename = db7.getrolename(user_id);
						 		}
						 		 sturolename = db7.getsturole(program_id,sub_program_id);	
						 		rolelist.add(rolename);
						 		rolelist.add(sturolename);	
					 		 }
					 		
					 		 //for student
					 		 if(program_id == null && sub_program_id == null && rolename == null){
							 		ArrayList studentlist = db7.getstudentlist(user_id);
							 									 		if(studentlist != null){
								 		Iterator itr=studentlist.iterator();
								 		while(itr.hasNext()){
								 			String strarr[] = (String[]) itr.next();
								 			program_id = strarr[0];
								 			sub_program_id = strarr[1];
								 			rolename = strarr[2];
								 		}
								 	}
							 		rolelist.add(rolename);						 		
							 	}
					 		 
					 		 //for program mentor
					 		 if(program_id == null && sub_program_id == null && rolename == null){
					 			ArrayList courselist = db6.getcourselist(user_id); 						 	
							 	if(courselist != null){
							 		Iterator itr=courselist.iterator();
							 		while(itr.hasNext()){
							 			String strarr[] = (String[]) itr.next();
							 			program_id = strarr[0];
							 			sub_program_id = strarr[1];
							 			rolename = strarr[2];
							 		}						 		
							 	}	
							 	 sturolename = db7.getsturole(program_id,sub_program_id);	
							 String courseroleid = db7.getcourserole(program_id,sub_program_id);
							 courserolename = db7.getrolename(courseroleid);						
							 rolelist.add(rolename);
							 rolelist.add(courserolename);
							 rolelist.add(sturolename);			
							 }							 	
					 	 }
							 	 
				 	 
					String roleid = db7.getuserroleid(designation);	
					
					ArrayList userdetails1 = null;		
					ArrayList batchlist = null;
					ArrayList userdetails = new ArrayList();
									
					
					userdetails = db7.getmentor(roleid,program_id,sub_program_id);
						 		
					
					if(semester != "" && userdetails.size() == 0){
						
						batchlist = db7.getbatchlist(semester);
						
						if(batchlist != null){
							Iterator itr = batchlist.iterator();
					 		
							while(itr.hasNext()){
					 			String batch = (String)itr.next();				
							
						userdetails1 = db7.getstudent(roleid,program_id,sub_program_id,batch);						
						
						if(userdetails1 != null){
							Iterator itr1=userdetails1.iterator();
					 		while(itr1.hasNext()){
					 			
					 		String strarr[] = (String[]) itr1.next();
					 		
					 		String register_no = strarr[0];
					 		String firstname = strarr[1];
					 		String lastname = strarr[2];					 			
					 			
					 		String strarr1[] = {register_no,firstname,lastname};
					 			
 				 			userdetails.add(strarr1);					 			
						 	}	
						}				
					}
				}
			}	
					
						
				 	request.setAttribute("rolelist", rolelist);	
				 	request.setAttribute("userdetails", userdetails);
					request.setAttribute("programname", programname);
					request.setAttribute("subprogramname", subprogram);
					request.setAttribute("designation", designation);
					request.setAttribute("username", username1);				
					request.setAttribute("yearmonth", yearmonth);
					request.setAttribute("semester", semester);
					request.setAttribute("individual", null);
					request.setAttribute("sturolename", sturolename);
					request.setAttribute("rolename", rolename);
				
			 	return new ModelAndView("attendance");
			 }
			 
		else if(cmd != null && cmd.equalsIgnoreCase("initindividual")){
			
			//for non-teaching staff starts
			String userid = request.getParameter("user_id");
			
			String month = request.getParameter("month");
			String year = request.getParameter("year");	
			
			log.info("user id "+userid+" month "+month+" year "+year);
			
			//for non-teaching staff ends
			
				 String userregid = request.getParameter("userregid");
				 String designame = request.getParameter("designame");					 				 
				 String username1 = request.getParameter("username");				 
				 
				 String yearmonth = request.getParameter("yearmonth");
				 String name = request.getParameter("name");
				 String programname = request.getParameter("programname");
				 String subprogram = request.getParameter("subprogram");
				 String designation = request.getParameter("designation");			 
				 			 			 
				 			 			 
				 String semester = request.getParameter("semester");
			
					
					String user_id = (String)session.getAttribute("user_id");
				 	
					String individual = null;
					String sturolename = null;
				 	String courserolename = null;
				 	
				 	String program_id = null;
				 	String sub_program_id = null;
				 	String rolename = null;
				 	ArrayList rolelist = new ArrayList();			 
				
				 	
				 	if(user_id != null){				 		 
		 				 	
					 	//for course mentor				 	
					 		 ArrayList coursedetails = db7.getcoursedetails(user_id);				 		 
					 		 if(coursedetails != null){
					 			Iterator itr=coursedetails.iterator();
						 		while(itr.hasNext()){
						 			String strarr[] = (String[]) itr.next();	
						 			program_id = strarr[0];
						 			sub_program_id = strarr[1];					 			
						 		}
						 		if(program_id != null && sub_program_id!=null){
						 			rolename = db7.getrolename(user_id);
						 		}
						 		 sturolename = db7.getsturole(program_id,sub_program_id);	
						 		rolelist.add(rolename);
						 		rolelist.add(sturolename);	
						 		individual = "individual";
					 		 }
					 		
					 		 //for student
					 		 if(program_id == null && sub_program_id == null && rolename == null){
							 		ArrayList studentlist = db7.getstudentlist(user_id);
							 		
							 		if(studentlist != null){
								 		Iterator itr=studentlist.iterator();
								 		while(itr.hasNext()){
								 			String strarr[] = (String[]) itr.next();
								 			program_id = strarr[0];
								 			sub_program_id = strarr[1];
								 			rolename = strarr[2];
								 		}
								 	}
							 		rolelist.add(rolename);		
							 		individual = "individual";
							 	}
					 		 
					 		 //for program mentor
					 		 if(program_id == null && sub_program_id == null && rolename == null){
					 			ArrayList courselist = db6.getcourselist(user_id); 						 	
							 	if(courselist != null){
							 		Iterator itr=courselist.iterator();
							 		while(itr.hasNext()){
							 			String strarr[] = (String[]) itr.next();
							 			program_id = strarr[0];
							 			sub_program_id = strarr[1];
							 			rolename = strarr[2];
							 		}						 		
							 	}	
							 	 sturolename = db7.getsturole(program_id,sub_program_id);	
							 String courseroleid = db7.getcourserole(program_id,sub_program_id);
							 courserolename = db7.getrolename(courseroleid);						
							 rolelist.add(rolename);
							 rolelist.add(courserolename);
							 rolelist.add(sturolename);		
							 individual = "individual";
							 }							 	
					 	 }
							 	 
				 	 
					String roleid = db7.getuserroleid(designame);	
					ArrayList userdetails1 = null;		
					ArrayList batchlist = null;
					ArrayList userdetails = new ArrayList();
					
					
					
						 userdetails = db7.getmentor(roleid,program_id,sub_program_id);						 	
					
					if(semester != "" && userdetails.size() == 0){
						
						batchlist = db7.getbatchlist(semester);
						if(batchlist != null){
							Iterator itr=batchlist.iterator();
					 		while(itr.hasNext()){
					 			String batch = (String)itr.next();				
							
						userdetails1 = db7.getstudent(roleid,program_id,sub_program_id,batch);						
						if(userdetails1 != null){
							
							Iterator itr1=userdetails1.iterator();
					 		while(itr1.hasNext()){
					 			String strarr[] = (String[]) itr1.next();
					 		String register_no = strarr[0];
					 		String firstname = strarr[1];
					 		String lastname = strarr[2];					 			
					 			String strarr1[] = {register_no,firstname,lastname};
					 			
					 			userdetails.add(strarr1);					 			
			 		}	
						}						
						}
						}
					}	
					
												
						String useridreg = db7.getmentordetails(userregid);								
						
						if(useridreg == null){
							useridreg = db7.getstudentdetails(userregid);
						}
						String s1 = null;
						String s2 = null;
						if(yearmonth != null){
							String strarr[] = yearmonth.split("-");
							for(int j = 0; j<strarr.length; j++ ){
								 s1 = strarr[0];
								 s2 = strarr[1];		
							}
						}						
						ArrayList logdetails = db7.getlogdetails(useridreg, s1, s2);
					
				
				request.setAttribute("rolelist", rolelist);
				request.setAttribute("logdetails", logdetails);
				request.setAttribute("userdetails", userdetails);
				request.setAttribute("programname", programname);
				request.setAttribute("subprogramname", subprogram);
				request.setAttribute("designation", designame);
				request.setAttribute("username", username1);
				request.setAttribute("individual", individual);				
				request.setAttribute("yearmonth", yearmonth);
				request.setAttribute("semester", semester);
				request.setAttribute("sturolename", sturolename);
				request.setAttribute("rolename", rolename);
				request.setAttribute("name", name);
					
					return new ModelAndView("attendance");
				}	
			 
		else if(cmd!=null && cmd.equalsIgnoreCase("initreportschedule")){	
				 
	 			 
				 	String user_id=(String)session.getAttribute("user_id");
				 	
				 	String program_id = null;
				 	String sub_program_id = null;
				 	String rolename = null;
				 				 	
				 	 if(user_id != null){
				 						 		
				 		ArrayList courselist = db6.getcourselist(user_id);
					 						 	
					 	if(courselist != null){
					 		Iterator itr=courselist.iterator();
					 		while(itr.hasNext()){
					 			String strarr[] = (String[]) itr.next();
					 			program_id = strarr[0];
					 			sub_program_id = strarr[1];
					 			rolename = strarr[2];
					 		}
					 	}					 	
				 	 }
					 	
					 if(program_id == null && sub_program_id == null && rolename == null){
					 		ArrayList studentlist = db7.getstudentlist(user_id);					 		
					 		if(studentlist != null){
						 		Iterator itr=studentlist.iterator();
						 		while(itr.hasNext()){
						 			String strarr[] = (String[]) itr.next();
						 			program_id = strarr[0];
						 			sub_program_id = strarr[1];
						 			rolename = strarr[2];
						 		}
						 	}
			 	}
		 	
				 	String programname = db6.getprogramname(program_id);
				 	String subprogramname = db6.getsubprogram(program_id, sub_program_id);
				 	request.setAttribute("program_id", program_id);
				 	request.setAttribute("sub_program_id", sub_program_id);
				 	request.setAttribute("programname", programname);
				 	request.setAttribute("subprogramname", subprogramname);						 	
				 	request.setAttribute("username", rolename);
				 	request.setAttribute("show", null);
					request.setAttribute("user_id", user_id);
				 
					 return new ModelAndView("monthlyreport");
				 }
			 
		else if(cmd != null && cmd.equalsIgnoreCase("eventreportschedule")){
			
		
			String programname = request.getParameter("programname");
			String subprogramname = request.getParameter("subprogram");
			String allowdate = request.getParameter("allowdate");
			String lastdate = request.getParameter("lastdate");
			String user_id = request.getParameter("user_id");
						
			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			
			Date startdate = formatter.parse(allowdate);
			Date enddate = formatter.parse(lastdate);
			
			String startdatestr  = formatter1.format(startdate);
			String enddatestr = formatter1.format(enddate);
			
			String username = db7.getroleid(user_id);
			
			String firstname = null;
			String lastname = null;
			String program_id = null;
			String sub_program_id = null;
			String roleid = null;
			
			ArrayList programlist = null;
			
			if(program_id == null && sub_program_id == null){
				programlist = db7.getprogramlist(user_id);
				if(programlist != null){
					Iterator itr = programlist.iterator();
					while(itr.hasNext()){
						String strarr[] = (String[])itr.next();
						program_id = strarr[0];
						sub_program_id = strarr[1];
					}
				}
				
			}
			
			
			if(program_id == null && sub_program_id == null){
				programlist = db7.getcoursementorlist(user_id);
				if(programlist != null){
					Iterator itr = programlist.iterator();
					while(itr.hasNext()){
						String strarr[] = (String[])itr.next();
						program_id = strarr[0];
						sub_program_id = strarr[1];
					}
				}				
			}
			
			if(program_id == null && sub_program_id == null){
				programlist = db7.getprogrammentorlist(user_id);
				if(programlist != null){
					Iterator itr = programlist.iterator();
					while(itr.hasNext()){
						String strarr[] = (String[])itr.next();
						program_id = strarr[0];
						sub_program_id = strarr[1];
					}
				}				
			}
									
			ArrayList eventdetails = db7.geteventdetails(program_id,sub_program_id,startdatestr,enddatestr);
			
							
			request.setAttribute("eventdetails",eventdetails);
			request.setAttribute("programname",programname);
			request.setAttribute("subprogramname",subprogramname);
			request.setAttribute("subprogramname",subprogramname);
			request.setAttribute("allowdate",allowdate);
			request.setAttribute("lastdate",lastdate);
			request.setAttribute("username",username);
			request.setAttribute("show","show");
			request.setAttribute("user_id",user_id);
			
		 	return new ModelAndView("monthlyreport");
		 }
			 
		else if(cmd!=null && cmd.equalsIgnoreCase("initclassschedulereport")){	
			 
			 
		 	String user_id=(String)session.getAttribute("user_id");
		 	
		 	String program_id = null;
		 	String sub_program_id = null;
		 	String rolename = null;
		 				 	
		 	 if(user_id != null){
		 						 		
		 		ArrayList courselist = db6.getcourselist(user_id);
			 						 	
			 	if(courselist != null){
			 		Iterator itr=courselist.iterator();
			 		while(itr.hasNext()){
			 			String strarr[] = (String[]) itr.next();
			 			program_id = strarr[0];
			 			sub_program_id = strarr[1];
			 			rolename = strarr[2];
			 		}
			 	}					 	
		 	 }
			 	
			 if(program_id == null && sub_program_id == null && rolename == null){
			 		ArrayList studentlist = db7.getstudentlist(user_id);					 		
			 		if(studentlist != null){
				 		Iterator itr=studentlist.iterator();
				 		while(itr.hasNext()){
				 			String strarr[] = (String[]) itr.next();
				 			program_id = strarr[0];
				 			sub_program_id = strarr[1];
				 			rolename = strarr[2];
				 		}
				 	}
			 	}
					 	String programname = db6.getprogramname(program_id);
					 	String subprogramname = db6.getsubprogram(program_id, sub_program_id);
					 	request.setAttribute("programname", programname);
					 	request.setAttribute("subprogramname", subprogramname);						 	
					 	request.setAttribute("username", rolename);
					 	request.setAttribute("show", null);
					 	request.setAttribute("user_id", user_id);
		 
		 			return new ModelAndView("classschedulereport");
				}
			 
			else if(cmd != null && cmd.equalsIgnoreCase("classreportschedule")){
			
			String program_id = null;
			String sub_program_id = null;			
			
			String nameidentification = null;
			String programidentification = null;
			String username = null;
			
			String programname = request.getParameter("programname");
			String subprogramname = request.getParameter("subprogram");
			String allowdate = request.getParameter("allowdate");
			String lastdate = request.getParameter("lastdate");
			String user_id = request.getParameter("userid");
									
			SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = formatter.parse(allowdate);
			Date enddate = formatter.parse(lastdate);
			String startdatestr  = formatter1.format(startdate);
			String enddatestr = formatter1.format(enddate);
						
			ArrayList classscheduledetails = null;
			
			String coursementornames = null;
			
			ArrayList coursementordetails = new ArrayList();
			
			if(program_id == null && sub_program_id == null){
				ArrayList coursementor = db7.getcoursementorlist(user_id);
				
				if(coursementor != null){
					Iterator itr=coursementor.iterator();
			 		while(itr.hasNext()){
			 			String strarr[] = (String[]) itr.next();		 			
			 			program_id = strarr[0];
			 			sub_program_id = strarr[1];		 						
			 		}
			 		username = db7.getroleid(user_id);			 		 
			 		classscheduledetails = db7.getclassscheduledetails(user_id,program_id,sub_program_id,startdatestr,enddatestr);			 		
			 		nameidentification = "individualcourse";
				}				
		}
			
			ArrayList studentlist = null;			
			 String coursementorid = null;
	        	String coursecode = null;	
	        	
			if(program_id == null && sub_program_id == null){
				
			ArrayList programlist = db7.getprogramlist(user_id);
			
			if(programlist != null){
				Iterator itr=programlist.iterator();
		 		while(itr.hasNext()){
		 			String strarr[] = (String[]) itr.next();			 			
		 			program_id = strarr[0];
		 			sub_program_id = strarr[1];				
		 		}					
			}	
				studentlist = db7.getstudentcourselist(user_id);
			
				if(studentlist != null){
					Iterator itr=studentlist.iterator();
			 		while(itr.hasNext()){
			 			String strarr[] = (String[]) itr.next();			 			
			 			coursementorid = strarr[0];
			 			coursecode = strarr[1];
			 classscheduledetails =  db7.getstudentclassschedule(coursementorid,coursecode,startdatestr,enddatestr);
			 nameidentification = "individualcourse";					
			 		}					
				}		
			}
			
	
		if(program_id == null && sub_program_id == null){
				
				String coursementor = null;
				ArrayList coursementorlist = null;
				
				ArrayList programmentor = db7.getprogrammentorlist(user_id);
				if(programmentor != null){
					Iterator itr=programmentor.iterator();
			 		while(itr.hasNext()){
			 			String strarr[] = (String[]) itr.next();		 			
			 			program_id = strarr[0];
			 			sub_program_id = strarr[1];		 						
			 		}
			 		 coursementorlist = db7.coursementorlist(program_id, sub_program_id);
				}
				
				
				if(coursementorlist != null){
					Iterator itr=coursementorlist.iterator();
			 		while(itr.hasNext()){			 			
			 			 coursementor = (String) itr.next(); 
			 			coursementornames = db7.getroleid(coursementor);
			 String strarr[] = {coursementornames,coursementor};
			 coursementordetails.add(strarr);
			 		}
			
			programidentification  = "program mentor";	
			nameidentification = null;
			}
		}

			request.setAttribute("roledetails1",coursementordetails);
			request.setAttribute("programidentification",programidentification);
			request.setAttribute("nameidentification",nameidentification);
			request.setAttribute("scheduledetails",classscheduledetails);
			request.setAttribute("program_id",program_id);
			request.setAttribute("sub_program_id",sub_program_id);
			request.setAttribute("programname",programname);
			request.setAttribute("subprogramname",subprogramname);			
			request.setAttribute("allowdate",allowdate);			
			request.setAttribute("lastdate",lastdate);			
			request.setAttribute("username",username);		
			request.setAttribute("show", "show");
			request.setAttribute("user_id", user_id);
		
		 	return new ModelAndView("classschedulereport");
		 }

	else if(cmd!=null && cmd.equalsIgnoreCase("initscheduleindividual")){	
				
				String coursementorid = request.getParameter("coursementorid");
				String coursementorname = request.getParameter("coursementorname");
				String program_id = request.getParameter("program_id");
				String sub_program_id = request.getParameter("sub_program_id");
				String allowdate = request.getParameter("startdatestr");				
				String lastdate = request.getParameter("enddatestr");
				String user_id = request.getParameter("user_id");
				String username = request.getParameter("username");
				
				SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				Date startdate = formatter.parse(allowdate);
				Date enddate = formatter.parse(lastdate);
				String startdatestr  = formatter1.format(startdate);
				String enddatestr = formatter1.format(enddate);
				
				
				
		ArrayList classscheduledetails = db7.getclassscheduledetails(coursementorid,program_id,sub_program_id,startdatestr,enddatestr);
				
		String programname = db6.getprogramname(program_id);
	 	String subprogramname = db6.getsubprogram(program_id, sub_program_id);	
	 	
	 	String coursementornames = null;
	 	ArrayList coursementordetails = new ArrayList();
	 	
	 	String coursementor = null;
		ArrayList coursementorlist = null;
		String programidentification = null;
		
		ArrayList programmentor = db7.getprogrammentorlist(user_id);
		if(programmentor != null){
			Iterator itr=programmentor.iterator();
	 		while(itr.hasNext()){
	 			String strarr[] = (String[]) itr.next();		 			
	 			program_id = strarr[0];
	 			sub_program_id = strarr[1];		 						
	 		}
	 		 coursementorlist = db7.coursementorlist(program_id, sub_program_id);
		}
		
		
		if(coursementorlist != null){
			Iterator itr=coursementorlist.iterator();
	 		while(itr.hasNext()){			 			
	 			 coursementor = (String) itr.next(); 
	 			coursementornames = db7.getroleid(coursementor);
	 String strarr[] = {coursementornames,coursementor};
	 coursementordetails.add(strarr);
	 		}
	
	programidentification  = "program mentor";
	}
	 		
		request.setAttribute("program_id",program_id);
		request.setAttribute("sub_program_id",sub_program_id);
		request.setAttribute("user_id",user_id);
		
		request.setAttribute("roledetails1",coursementordetails);
	 	request.setAttribute("show", "show");
	 	request.setAttribute("programname", programname);
	 	request.setAttribute("subprogramname", subprogramname);
		request.setAttribute("scheduledetails", classscheduledetails);
		request.setAttribute("programidentification",programidentification);		
		request.setAttribute("nameidentification", "individualcourse");
		request.setAttribute("coursementorname", coursementorname);
		request.setAttribute("allowdate",allowdate);			
		request.setAttribute("lastdate",lastdate);
		request.setAttribute("username",username);
		
		
		return new ModelAndView("classschedulereport");			
	}	
			else if(cmd!=null && cmd.equalsIgnoreCase("initmonthlyreport")){	
				 
				String user_id=(String)session.getAttribute("user_id");
			 	
			 	String program_id = null;
			 	String sub_program_id = null;
			 	String rolename = null;
			 				 	
			 	 if(user_id != null){
			 						 		
			 		ArrayList courselist = db6.getcourselist(user_id);
				 						 	
				 	if(courselist != null){
				 		Iterator itr=courselist.iterator();
				 		while(itr.hasNext()){
				 			String strarr[] = (String[]) itr.next();
				 			program_id = strarr[0];
				 			sub_program_id = strarr[1];
				 			rolename = strarr[2];
				 		}
				 	}					 	
			 	 }
				 	
				 if(program_id == null && sub_program_id == null && rolename == null){
				 		ArrayList studentlist = db7.getstudentlist(user_id);					 		
				 		if(studentlist != null){
					 		Iterator itr=studentlist.iterator();
					 		while(itr.hasNext()){
					 			String strarr[] = (String[]) itr.next();
					 			program_id = strarr[0];
					 			sub_program_id = strarr[1];
					 			rolename = strarr[2];
					 		}
					 	}
		 	}
	 	
			 	String programname = db6.getprogramname(program_id);
			 	String subprogramname = db6.getsubprogram(program_id, sub_program_id);
			 	request.setAttribute("programname", programname);
			 	request.setAttribute("subprogramname", subprogramname);	
			 	request.setAttribute("program_id", program_id);
			 	request.setAttribute("sub_program_id", sub_program_id);
			 	request.setAttribute("username", rolename);
			 	request.setAttribute("show", null);
				request.setAttribute("user_id", user_id);
			 
			 			return new ModelAndView("monthlyreportschedule");
					}
			 
			else if(cmd != null && cmd.equalsIgnoreCase("monthlyschedule")){
				
							 
				String programname = request.getParameter("programname");
				String subprogramname = request.getParameter("subprogram");
				String month = request.getParameter("month");
				String year = request.getParameter("year");				
				String user_id = request.getParameter("user_id");	
				
				String roledetails = db7.getroleid(user_id);
								
				String program_id = null;
				String sub_program_id = null;
				String username = null;
				
				
				
				int yearint = Integer.parseInt(year);
				String startdate = null;
				String lastdate = null;
				
				if(month.equals("01") || month.equals("03") || month.equals("05") || month.equals("07") || month.equals("08") || month.equals("10") || month.equals("12")){
					startdate = year+"-"+month+"-"+"01";
					lastdate = year+"-"+month+"-"+"31";
				}
				else if(month.equals("04") || month.equals("06") || month.equals("09") || month.equals("11")){
					startdate = year+"-"+month+"-"+"01";
					lastdate = year+"-"+month+"-"+"30";
				}
				else if(month.equals("02")){
					if((yearint % 400 == 0) || ((yearint % 4 == 0) && (yearint % 100 != 0))){
						startdate = year+"-"+month+"-"+"01";
						lastdate = year+"-"+month+"-"+"29";
					}
					else{
						startdate = year+"-"+month+"-"+"01";
						lastdate = year+"-"+month+"-"+"28";
					}			
				}
								
				ArrayList programlist = null;
				ArrayList classscheduledetails = null;
				String nameidentification = null;
				String programidentification = null;
				
				ArrayList eventcheduledetails = null;
				
				if(program_id == null && sub_program_id == null){
					ArrayList coursementor = db7.getcoursementorlist(user_id);
					
					if(coursementor != null){
						Iterator itr=coursementor.iterator();
				 		while(itr.hasNext()){
				 			String strarr[] = (String[]) itr.next();		 			
				 			program_id = strarr[0];
				 			sub_program_id = strarr[1];		 						
				 		}
				 		username = db7.getroleid(user_id);			 		 
				 		classscheduledetails = db7.getclassscheduledetails(user_id,program_id,sub_program_id,startdate,lastdate);			 		
				 		nameidentification = "individualcourse";
				 		eventcheduledetails = db7.geteventdetails(program_id,sub_program_id,startdate,lastdate);
					}				
			}
								
				ArrayList studentlist = null;			
				 String coursementorid = null;
		        	String coursecode = null;	
		        	
				if(program_id == null && sub_program_id == null){
					
				ArrayList stuprogramlist = db7.getprogramlist(user_id);
				
				if(stuprogramlist != null){
					Iterator itr = stuprogramlist.iterator();
			 		while(itr.hasNext()){
			 			String strarr[] = (String[]) itr.next();			 			
			 			program_id = strarr[0];
			 			sub_program_id = strarr[1];				
			 		}					
				}	
					studentlist = db7.getstudentcourselist(user_id);
				
					if(studentlist != null){
						Iterator itr=studentlist.iterator();
				 		while(itr.hasNext()){
				 			String strarr[] = (String[]) itr.next();			 			
				 			coursementorid = strarr[0];
				 			coursecode = strarr[1];
				 classscheduledetails =  db7.getstudentclassschedule(coursementorid,coursecode,startdate,lastdate);
				 nameidentification = "individualcourse";
						
				 		}					
					}	
	eventcheduledetails = db7.geteventdetails(program_id,sub_program_id,startdate,lastdate);
				}
								
				
				ArrayList coursementordetails = new ArrayList();
				if(program_id == null && sub_program_id == null){
						
						String coursementor = null;
						ArrayList coursementorlist = null;
						String coursementornames = null;
						
						
						ArrayList programmentor = db7.getprogrammentorlist(user_id);
						if(programmentor != null){
							Iterator itr=programmentor.iterator();
					 		while(itr.hasNext()){
					 			String strarr[] = (String[]) itr.next();		 			
					 			program_id = strarr[0];
					 			sub_program_id = strarr[1];		 						
					 		}
					 		 coursementorlist = db7.coursementorlist(program_id, sub_program_id);
						}
						
						
						if(coursementorlist != null){
							Iterator itr=coursementorlist.iterator();
					 		while(itr.hasNext()){			 			
					 			 coursementor = (String) itr.next(); 
					 			coursementornames = db7.getroleid(coursementor);
					 String strarr[] = {coursementornames,coursementor};
					 coursementordetails.add(strarr);
					 		}
					
					programidentification  = "program";	
					nameidentification = null;	
					}
				}
				
				request.setAttribute("coursementordetails",coursementordetails);
				request.setAttribute("classscheduledetails",classscheduledetails);
				request.setAttribute("eventcheduledetails",eventcheduledetails);
				request.setAttribute("programname",programname);
				request.setAttribute("subprogramname",subprogramname);							
				request.setAttribute("username",username);
				request.setAttribute("programidentification",programidentification);
				request.setAttribute("nameidentification",nameidentification);
				request.setAttribute("show","show");
				request.setAttribute("startdate",startdate);
				request.setAttribute("lastdate",lastdate);
				request.setAttribute("user_id",user_id);
				request.setAttribute("program_id",program_id);
				request.setAttribute("sub_program_id",sub_program_id);
				
			 	return new ModelAndView("monthlyreportschedule");
			 }
			 
			 else if(cmd != null && cmd.equalsIgnoreCase("initmonthlyscheduleindividual")){
				 
				 String coursementorid = request.getParameter("coursementorid");
				 String coursementorname = request.getParameter("coursementorname");
				 String program_id = request.getParameter("program_id");
				 String sub_program_id = request.getParameter("sub_program_id");
				 String startdate = request.getParameter("startdate");
				 String enddate = request.getParameter("enddate");
				 String user_id = request.getParameter("user_id");
				 String username = request.getParameter("username");
				 
		
				 
	ArrayList classscheduledetails = db7.getclassscheduledetails(coursementorid,program_id,sub_program_id,startdate,enddate);
	ArrayList eventcheduledetails = db7.geteventdetails(program_id,sub_program_id,startdate,enddate);
	
	
	
	String coursementornames = null;
 	ArrayList coursementordetails = new ArrayList();
 	
 	String coursementor = null;
	ArrayList coursementorlist = null;
	String programidentification = null;
	
	ArrayList programmentor = db7.getprogrammentorlist(user_id);
	if(programmentor != null){
		Iterator itr=programmentor.iterator();
 		while(itr.hasNext()){
 			String strarr[] = (String[]) itr.next();		 			
 			program_id = strarr[0];
 			sub_program_id = strarr[1];		 						
 		}
 		 coursementorlist = db7.coursementorlist(program_id, sub_program_id);
	}
	
	
	if(coursementorlist != null){
		Iterator itr=coursementorlist.iterator();
 		while(itr.hasNext()){			 			
 			 coursementor = (String) itr.next(); 
 			coursementornames = db7.getroleid(coursementor);
 String strarr[] = {coursementornames,coursementor};
 coursementordetails.add(strarr);
 		}	
	}
	
	String programname = db6.getprogramname(program_id);
				 	String subprogramname = db6.getsubprogram(program_id, sub_program_id);
				 	
				 	request.setAttribute("coursementordetails",coursementordetails);
				 	request.setAttribute("programname",programname);
				 	request.setAttribute("subprogramname",subprogramname);
				 	request.setAttribute("classscheduledetails",classscheduledetails);
				 	request.setAttribute("eventcheduledetails",eventcheduledetails);				 	
				 	request.setAttribute("nameidentification","nameidentification");
				 	request.setAttribute("programidentification","programidentification");
				 	request.setAttribute("show","show");
				 	request.setAttribute("user_id",user_id);
					request.setAttribute("program_id",program_id);
					request.setAttribute("sub_program_id",sub_program_id);
					request.setAttribute("startdate",startdate);
					request.setAttribute("lastdate",enddate);
				 	
				 	return new ModelAndView("monthlyreportschedule");
				 
			 }
					
				 
			 
			else if(cmd != null && cmd.equalsIgnoreCase("initreassignemployee")){
						
				String courseroleid = null;				
				ArrayList courseuserlist = db8.getcourseuserlist();
				if(courseuserlist != null){
					Iterator itr = courseuserlist.iterator();
					while (itr.hasNext()) {
						String struserid = (String) itr.next();
						courseroleid = db8.getcourseroleid(struserid);
					}	
				}
				
				ArrayList programmentorlist = db8.getprogrammentorlist(courseroleid);
				
				request.setAttribute("programlist",null);
				request.setAttribute("subprogramlist",null);
				request.setAttribute("programmentorlist",programmentorlist);
				
				return new ModelAndView("reassignemployee");
			}
			 
			else if(cmd != null && cmd.equalsIgnoreCase("programdetails")){
				
				String programid = request.getParameter("programid");
				String subprogramid = request.getParameter("subprogramid");
				String name = request.getParameter("name");
				String user_id = request.getParameter("user_id");
				
				String programname = db8.getprogramname(programid);
				String subprogramname = db8.getsubprogramnamesub(subprogramid);
				
				ArrayList programlist = db8.getprogramlist();
					
				String courseroleid = null;
				
				ArrayList courseuserlist = db8.getcourseuserlist();
				if(courseuserlist != null){
					Iterator itr = courseuserlist.iterator();
					while (itr.hasNext()) {
						String struserid = (String) itr.next();
						courseroleid = db8.getcourseroleid(struserid);
					}	
				}				
				ArrayList programmentorlist = db8.getprogrammentorlist(courseroleid);
				
				request.setAttribute("user_id",user_id);
				request.setAttribute("name",name);
				request.setAttribute("programname",programname);
				request.setAttribute("subprogramname",subprogramname);				
				request.setAttribute("programlist",programlist);
				request.setAttribute("subprogramlist",null);
				request.setAttribute("programmentorlist",programmentorlist);
				
				
				return new ModelAndView("reassignemployee");
			}
			 
else if(cmd != null && cmd.equalsIgnoreCase("subprogramdetails")){
				
				String programid = request.getParameter("programid");
				String programname = request.getParameter("programname1");
				String name = request.getParameter("name");
				String userid = request.getParameter("userid");
												
				ArrayList subprogramlist = db8.getsubprogramname(programid);				
				ArrayList programlist = db8.getprogramlist();
				//ArrayList subprogramlist = db8.getsubprogramlist();
				
				String courseroleid = null;
				
				ArrayList courseuserlist = db8.getcourseuserlist();
				if(courseuserlist != null){
					Iterator itr = courseuserlist.iterator();
					while (itr.hasNext()) {
						String struserid = (String) itr.next();
						courseroleid = db8.getcourseroleid(struserid);
					}	
				}				
				ArrayList programmentorlist = db8.getprogrammentorlist(courseroleid);				
				request.setAttribute("user_id",userid);
				request.setAttribute("name",name);
				request.setAttribute("programname",programname);
								
				request.setAttribute("programlist",programlist);
				request.setAttribute("subprogramlist",subprogramlist);
				request.setAttribute("programmentorlist",programmentorlist);
				
				
				return new ModelAndView("reassignemployee");
			}
			 
		else if(cmd != null && cmd.equalsIgnoreCase("assignemployee")){
				
			String userid = request.getParameter("userid");		
				String name = request.getParameter("programmentor");
				String programnamee = request.getParameter("programnamee");
				String subprogramnamee = request.getParameter("subprogramnamee");
				
				String programid = db8.getprogramid(programnamee);
				String subprogramid = db8.getsubprogramid(subprogramnamee);
				
				String status = db8.setassignemployee(userid,programid,subprogramid);				
				String courseroleid = null;
				
				ArrayList courseuserlist = db8.getcourseuserlist();
				if(courseuserlist != null){
					Iterator itr = courseuserlist.iterator();
					while (itr.hasNext()) {
						String struserid = (String) itr.next();
						courseroleid = db8.getcourseroleid(struserid);
					}	
				}				
				ArrayList programmentorlist = db8.getprogrammentorlist(courseroleid);
				
				request.setAttribute("status",status);
				request.setAttribute("name",name);
				request.setAttribute("programname",programnamee);
				request.setAttribute("subprogramname",subprogramnamee);
				
				request.setAttribute("programmentorlist",programmentorlist);
				return new ModelAndView("reassignemployee");
			}
			 
		else if(cmd != null && cmd.equalsIgnoreCase("initadmissionreport")){
				
		
			
			return new ModelAndView("admissionreport");
		}
			 
		else if(cmd != null && cmd.equalsIgnoreCase("initHeatMap")){
				
				
			
			return new ModelAndView("Heatmap");
		}
		else if(cmd != null && cmd.equalsIgnoreCase("GenerateHeatMap")){
			
			String month_val=request.getParameter("month");
			String year=request.getParameter("year");
			String date="01";
			
			String startdate  = month_val +"-"+date+"-"+year;
			System.out.println("month val---"+month_val);
			System.out.println("year val---"+year);
			System.out.println("date===="+startdate);
			Calendar c = Calendar.getInstance();
			
			SimpleDateFormat fromUser = new SimpleDateFormat("MM-dd-yyyy");
			SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
			startdate = myFormat.format(fromUser.parse(startdate));
			Date startDate = myFormat.parse(startdate);
			c.setTime(startDate);
			
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			String enddate = myFormat.format(c.getTime());
			Date endDate = myFormat.parse(enddate);
			System.out.println(endDate);
			ArrayList HeatMapList=new ArrayList();
			
			
		    
			
			
			
			int count;
			double[][] data;
			int i=0;
			int dimension;
			
			List<Date> dates = new ArrayList<Date>();
			long interval = 24*1000 * 60 * 60; // 1 hour in millis
			long endTime =endDate.getTime() ; // create your endtime here, possibly using Calendar or Date
			long curTime = startDate.getTime();
			while (curTime <= endTime) {
			    dates.add(new Date(curTime));
			    curTime += interval;
			}
			for(int k=0;k<dates.size();k++){
			    Date lDate =(Date)dates.get(k);
			    String ds = myFormat.format(lDate);    
			    //System.out.println(" Date is ..." + ds);
				 count=DB.getUserCount(ds, enddate);
				System.out.println("count from action=====>"+count);
				//int countArray[]={count};
				HeatMapList.add(count);
				System.out.println(HeatMapList.size());
			}

			
			   
			
			if(HeatMapList.size()%5 == 0){
				dimension=HeatMapList.size()/5+1;
				HeatMapList.add(0);HeatMapList.add(0);
				HeatMapList.add(0);HeatMapList.add(0);
				HeatMapList.add(0);
			}else{
				
				

				if(HeatMapList.size()%5 == 1){
					HeatMapList.add(0);HeatMapList.add(0);
					HeatMapList.add(0);HeatMapList.add(0);
				}else if(HeatMapList.size()%5 == 2){
					HeatMapList.add(0);HeatMapList.add(0);HeatMapList.add(0);
				}else if(HeatMapList.size()%5 == 3){
					System.out.println("dfffffffffff---"+HeatMapList.size());
					HeatMapList.add(0);HeatMapList.add(0);HeatMapList.add(0);
					HeatMapList.add(0);HeatMapList.add(0);HeatMapList.add(0);
					HeatMapList.add(0);
					System.out.println("after adding val---"+HeatMapList.size());
				}else if(HeatMapList.size()%5 == 4){
					HeatMapList.add(0);HeatMapList.add(0);HeatMapList.add(0);
					HeatMapList.add(0);HeatMapList.add(0);HeatMapList.add(0);
				}
				dimension=(HeatMapList.size()/5)+1;
				System.out.println("dimension value--"+dimension);
			}
			data = new double[7][5];
			
			while(i<data.length){
				for (int start = 0; start < HeatMapList.size(); start += 5) {
					
					HeatMapList.get(start);
					//int end = Math.min(start + 5, HeatMapList.size());
					int end = start+5;
					
					System.out.println("start end --> "+start+"--"+end);
					List sublist = HeatMapList.subList(start, end);		        
					System.out.println(data[0].length);
					
						for(int j=0; j<data[0].length; j++){
							
							int subListCount = (Integer) sublist.get(j);
							System.out.println("subListCount --> "+subListCount);
							if(subListCount == HeatMapList.size()){
								data[i][j]= (Integer) (subListCount) ;
							}else{
								data[i][j]= (Integer) (subListCount) ;								
							}
							System.out.println(data[i][j]);
							
						}i++;
						System.out.println("------------");
					}
				}
			
			//System.out.println(sublist.size());
			
		
		
		 
		 for (int x = 0; x < data.length; x++) {
		      for (int y = 0; y < data[0].length; y++) {
		    	 
		    	  System.out.print("\t" + data[x][y]);
				}
				System.out.println();
		      }
		 	HeatChart map = new HeatChart(data);
			map.setTitle("Heat Map");
			
			String[] dateParts = startdate.split("-");
			String monthval = dateParts[1];
			System.out.println(monthval);
			int num = Integer.parseInt(monthval);
			System.out.println(num);
			String month = "wrong";
	        DateFormatSymbols dfs = new DateFormatSymbols();
	        String[] months = dfs.getMonths();
	        if (num >= 1 && num <= 12 ) {
	            month = months[num-1];
	            System.out.println(month);
	        }
	        
			map.setXAxisLabel(month);
			map.setYAxisLabel("Date");
			map.setHighValueColour(Color.RED);
			
			map.setLowValueColour(Color.YELLOW);
			String yaxisval[]={"1-5", "6-10","11-15","16-20", "21-25", "26-30", "31"};
			String xaxisval[]={""};
			map.setYValues(yaxisval);
			map.setXValues(xaxisval);
			
			map.saveToFile(new File("d:/image/java-heat-chart2.png"));
		
			String filepath="d:/image/java-heat-chart2.png";
			String HeatMapData=null;
			try
			 {
			 FileInputStream inpStream = new FileInputStream(filepath);
			 byte[] bytearr= IOUtils.toByteArray(inpStream);
			 byte byteImageData[]  =com.bea.xbean.util.Base64.encode(bytearr);
			 HeatMapData= new String(byteImageData);					 
			 }
			 catch(Exception e)
			 {					 
			 }
			session.setAttribute("HeatMapData", HeatMapData);
				 
		
		return new ModelAndView("HeatMapGeneration");
	}
		
		else if(cmd != null && cmd.equalsIgnoreCase("admissionreports")){
			
			    SimpleChart.main();
			    response.sendRedirect("https://www.digiblitzonline.com:18443/smartlehren/frameset?__report=SampleChart.rptdesign");
			
			return new ModelAndView("admissionreport");
		}
			 
			 
}catch(Exception e){
					e.printStackTrace();
				}		
				return new ModelAndView("SLHome");
	}
	
	
}
