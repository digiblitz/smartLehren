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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.xmlrpc.XmlRpcException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.infusionejb.session.InfusionSessionBean;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.services.StudentService;
import com.util.adminDB;
import com.util.baseDB;
import com.util.examDB;
import com.util.studentDB;
import com.util.userDB;

@Controller
public class Studentaction {
	
	String course_id=null;
	static Logger log = Logger.getLogger(Studentaction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
 
	@RequestMapping("/student.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		  Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");
	      
	      
		try{
			
			userDB db = userDB.getInstance();
			studentDB db5 = studentDB.getInstance();
			adminDB db1 = adminDB.getInstance();		
			baseDB db6 = baseDB.getInstance();
			examDB db8 = examDB.getInstance();
			CommonForAll common = CommonForAll.getInstance();
			QualificationAction qa = QualificationAction.getInstance();
		
			StudentService stuService = StudentService.getInstance();
		
		 HttpSession session = request.getSession(true); 
		 InfusionSessionBean emails=new InfusionSessionBean();
		
		 String StudentProcess = request.getParameter("StudentProcess");
		 String pro = request.getParameter("cmd");
		
		  if(pro!=null && pro.equalsIgnoreCase("initshowwork")){
				
			  	 String user_id = (String)session.getAttribute("user_id");
				 String course_name = request.getParameter("course_name");
				 String course_code = request.getParameter("course_code");
				 
				 log.info("course_name --> "+course_name+" course_code --> "+course_code);
				 
				 request.setAttribute("course_name", course_name);
				 request.setAttribute("course_code", course_code);
				 
				 ArrayList assign_name=db5.getassignname(course_code);				 
				 request.setAttribute("assign_name", assign_name);
				 
				 ArrayList quiz_name=db5.getquizname(course_code);
				 request.setAttribute("quiz_name", quiz_name);
				 
				 			 
				 //Assignment for Particular list
				 ArrayList particularlist = db8.getParticularList(user_id,course_code);
				 if(particularlist != null){
				 request.setAttribute("particularlist", particularlist);				 
				 }
				 
				 ArrayList courselist = db8.getcourselist(user_id);
				 String coursecode = null;
				 
				// ArrayList examlists = null;
				 ArrayList examlist = new ArrayList();
				
				 Date date1 = new Date();
				 SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
				 String strdate = formatter.format(date1);
								 
				 String examSubmission = null;
				 //to fetch exam by date wise 
				 String coursename = null;
				 	String str = null;
				 	String end = null;	
				 	String examdate = null;
				 	
				 	SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
				 	String submissionDt = formatter1.format(date1);
				 	
				 	String examSubmissionStatus = db8.getexamSubmissionStatus(course_code, submissionDt);
				 	
				 	log.info("examSubmissionStatus "+examSubmissionStatus);
				 	
				 	if(examSubmissionStatus != null){
				 		
				 		examSubmission = "You have Submitted the exam";
				 		
				 	}else{	
				 		
				 ArrayList examlist1 = db8.getexamlist(course_code, strdate);		
				 
				 	
				 if(examlist1 != null){
				 		Iterator itr = examlist1.iterator();
				 		while(itr.hasNext()){
				 			String strarr[] = (String[])itr.next();
				 			coursename = strarr[0];
				 			str = strarr[1];
				 			end = strarr[2];
				 			examdate = strarr[3];
				 		}
				 	}	
				}
				 	
				 	String newTime = null;
				 	 String afterendtime = null;
				 	 
		if(coursename != null && str != null && end != null && examdate != null){
				 		
				 		// display exam five minutes before starts
				 		String startdate = examdate+" "+str;
						String startend = examdate+" "+end;
						
						SimpleDateFormat parseFormat = new SimpleDateFormat("MM-dd-yyyy hh:mm a");
						
						Date date = parseFormat.parse(startdate);
						Date dateend = parseFormat.parse(startend);
						
						Calendar cal = Calendar.getInstance();
						  cal.setTime(date);		  
						 cal.add(cal.MINUTE, -5);		  
						   newTime = parseFormat.format(cal.getTime());		  
						  Date datestart = parseFormat.parse(newTime);
						  
						  Date datetime = new Date();
						
						  
				if((datetime.equals(datestart) || datetime.after(datestart)) && (datetime.equals(dateend) || datetime.before(dateend))){
					
					examlist = db8.getExamname(course_code,date);	
						  }else if(datetime.after(dateend)){
							  Date datee = dateend;
							  afterendtime = parseFormat.format(datee);
						  }
				 		//display exam five minutes before ends				 							
					}
		
		String examsubmitted = null;
		ArrayList arrearList = db8.getArrearList(user_id);
		if(arrearList != null){
			examsubmitted = "submitted";
		}
		
		log.info("examsubmitted --> "+examsubmitted);
		
					request.setAttribute("examSubmission", examSubmission);
					request.setAttribute("examsubmitted", examsubmitted);
					request.setAttribute("afterendtime", afterendtime);
					request.setAttribute("newTime", newTime);
				 	request.setAttribute("examlist", examlist);
				// ArrayList test_name=db5.getcoursematerial(course_code);
				// request.setAttribute("test_name", test_name);
				
				 	
				 	
				 	return new ModelAndView("stushowwork");			
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initshowquiz")){
			
			 String test_id = request.getParameter("test_id");
			 String quiz_name = request.getParameter("quiz_name"); 
			 String course_code = request.getParameter("course_code"); 
			
			 String quizname_id=db5.getquizid(quiz_name);
 
			 ArrayList ans=new ArrayList();
			 
			 ArrayList question_name=db5.getquizquestionname(test_id);
			 
			 if(question_name!=null && question_name.size()!=0){
				 Iterator itr = question_name.iterator();
				 int i=0;
				 while(itr.hasNext()){
				  String sr[] = (String[]) itr.next();
				  String q_no = sr[0];
				  String question = sr[1];
				  String a = sr[2];
				  String b = sr[3];
				  String c = sr[4];
				  String d = sr[5]; 
				  String answer = sr[6];
				  
				ans.add(answer);
				 }
				 request.setAttribute("question_name", question_name);
				 session.setAttribute("question_name", question_name);
				 session.setAttribute("ans", ans);
				
				 request.setAttribute("quiz_name", quiz_name);
				 request.setAttribute("course_code", course_code);
				 
				 return new ModelAndView("showquiz");
				 
			 }else{
					 
				 String question=db5.gettestquestionname(test_id);
				
				 request.setAttribute("question", question);
				 request.setAttribute("quiz_name", quiz_name);
				 
				 return new ModelAndView("showtest");
				 }
			
			 //return new ModelAndView("showquiz");
		 }
		  
		 else if(pro!=null && pro.equalsIgnoreCase("initcoursematerial")){
			
			 ArrayList coursematerial=db5.getcoursematerial(course_id);
			
			 request.setAttribute("coursematerial", coursematerial);
				
			 return new ModelAndView("coursematerial");	
			}
		  
		 else if(pro!=null && pro.equalsIgnoreCase("initmyprofile")){
			
			 String user_id=(String)session.getAttribute("user_id"); 
			 ArrayList userli=db.getuserlist(user_id);
			 
			 request.setAttribute("userli", userli);
				
			 return new ModelAndView("myprofile");	
			}
		  
		 else if(pro!=null && pro.equalsIgnoreCase("initstudyguideline")){
	           
	          return new ModelAndView("studyguideline"); 
	         }
		 else if(pro!=null && pro.equalsIgnoreCase("initshowslidename")){
			 
			 String course_name = request.getParameter("course_name");
			 course_id=db1.getsubcourseid(course_name);
			 ArrayList slide_name=db5.getslidematerial(course_id); 
			 request.setAttribute("slide_name", slide_name);
			 
			 return new ModelAndView("showslide");
		 }	
else if(pro!=null && pro.equalsIgnoreCase("initshowevents")){
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	
	String currdate = formatter.format(date);		
	
	
			 String user_id=(String)session.getAttribute("user_id");
			 ArrayList pgmList=db1.fetchProgram_id(user_id);
			 String program_id=null;
			 String sub_program_id=null;
			 
			 Iterator itr=pgmList.iterator();
			 
			 	while(itr.hasNext()){
			 		String[] str=(String[])itr.next();
			 		program_id=str[0];
			 		sub_program_id=str[1];				 		
			 	}
			 	
			 	ArrayList eventDetailsList=db1.fetchEventDetails(program_id,sub_program_id);
			 	session.setAttribute("eventlist", eventDetailsList);
			 	session.setAttribute("currdate", currdate);
			 
			 	//response.sendRedirect("month/themegreen.jsp");
			 	RequestDispatcher dispatcher = request.getRequestDispatcher("month/themegreen.jsp");
				dispatcher.include( request, response );
			 	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initreassign")){
				 
				 String assign_id = request.getParameter("assign_id");
				 String assign_name = request.getParameter("assign_name");
				 String course_name = request.getParameter("course_name");
				 String course_code = request.getParameter("course_code");
				 String user_id = request.getParameter("user_id");	
				 
				
	 String question = db5.getrequestionname(assign_id,assign_name);
	 			ArrayList status = db5.getrestatus(assign_name,user_id);
	 				 			 
	 			String allowdate = null;
	 			String lastdate = null;
				 ArrayList assigndate=db5.getassigndate(assign_name);
				 if(assigndate != null){
					 Iterator itr = assigndate.iterator();
					 while(itr.hasNext()){
						 String strarr[] = (String[])itr.next();
						 allowdate = strarr[0];
						 lastdate = strarr[1];
					 }
				 }
				 String days = null;
				 if(lastdate != null){
				    days = common.getdate(lastdate);
				 }
				 String currentdate = common.getcurrentdate();
	 			log.info("allowdate "+allowdate +" lastdate "+lastdate+" days "+ days+" currentdate "+currentdate);	 
				 
	 			request.setAttribute("status", status);			
	 	 		request.setAttribute("question", question);
	 	 		request.setAttribute("lastdate", lastdate);
				request.setAttribute("allowdate", allowdate);
				request.setAttribute("currentdate", currentdate);
				request.setAttribute("days", days);
				 
	 			request.setAttribute("assign_name", assign_name);
	 			request.setAttribute("course_name", course_name);
	 			request.setAttribute("course_code", course_code);
	 			request.setAttribute("user_id", user_id);	 			
	 			return new ModelAndView("stushowreassign");
			}

		 else if(pro!=null && pro.equalsIgnoreCase("initshowassign")){
			 
			 String assign_id = request.getParameter("assign_id");
			 String assign_name = request.getParameter("assign_name");
			 String course_name = request.getParameter("course_name");
			 String course_code = request.getParameter("course_code");
			 String user_id = request.getParameter("user_id");			
			 //course_id=db1.getsubcourseid(course_name);
			 
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("assign_name", assign_name);
			 
			 String question=db5.getquestionname(assign_id,assign_name);
			 request.setAttribute("question", question);
			 
			 ArrayList status=db5.getstatus(assign_name,user_id);
			 request.setAttribute("status", status);
			 
			 String lastdate=db5.getlastdate(assign_name);
			 String allowdate=db5.getallowdate(assign_name);
			 String days = common.getdate(lastdate);
			 String currentdate = common.getcurrentdate();
			 request.setAttribute("lastdate", lastdate);
			 request.setAttribute("allowdate", allowdate);
			 request.setAttribute("currentdate", currentdate);
			 request.setAttribute("days", days);
			 
				return new ModelAndView("stushowassign");	
		 }
		
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("addassign")){
			 String course_name = request.getParameter("course_name"); 
			 String assign_name = request.getParameter("assign_name");
			 String course_code = request.getParameter("course_code");
			 String question = request.getParameter("question");
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("assign_name", assign_name);
			 request.setAttribute("question", question);
			 			 
			 return new ModelAndView("subassign"); 
		 }
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("addreassign")){
			 String course_name = request.getParameter("course_name");
			 String course_code = request.getParameter("course_code");
			 String assign_name = request.getParameter("assign_name");
			 String question = request.getParameter("question");
			 
			 log.info("course_name "+course_name+" course_code "+course_code+" assign_name "+assign_name+" question "+question);
			 
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("assign_name", assign_name);
			 request.setAttribute("question", question);
			 
			 return new ModelAndView("subreassign"); 
		 }
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("subreassignment")){
			 
			 String user_id=(String) session.getAttribute("user_id");		
				 String assign_status="Submitted";
				 String grade_status="Not yet given";
				 String status = null;
			
				 String answer="";String assign_name=null;String filelocation=null;String file_name=null;
				 String ansCount = null;
				 String course_code = null;
				 String course_name = null;
				 String batch = null;
				 String semester = null;
				 
				 try {	
					 String fileSavePath;
					    final String UPLOAD_DIRECTORY = "C://reassignmentdocuments//";

					    
					        fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
					        if (!(new File(fileSavePath)).exists()) {
					            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
					        }
					        String resp = "";
					        int i = 1;
					        resp += "<br>Here is information about uploaded files.<br>";
					        try {
					            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
					            Part _part;
					            while ((_part = parser.readNextPart()) != null) {
					            	
					            	String genName= _part.getName();
					                if (_part.isFile()) {
					                    FilePart fPart = (FilePart) _part;  // get some info about the file
					                    String name = fPart.getFileName();
					                    
					                    if (name != null) {
					                        long fileSize = fPart.writeTo(new File(fileSavePath));
					                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
					                        String saveFile=fileSavePath+name;
					                        filelocation=saveFile;file_name=name;
					                        //db5.adddocumentfromstudent(user_id,name,saveFile);
					                        
					                    } else {
					                        resp = "<br>The user did not upload a file for this part.";
					                    }
					                }
					                if(_part.isParam()){
					                	
					                	 ParamPart paramPart = (ParamPart)_part;
					                	 					                	 
					                	  if(genName.equals("answer")){					                		  
					                		  String ans = paramPart.getStringValue();
					                		  log.info("ans "+ans);
					                		  String anss[] = ans.split("\n");
					                		  for(int j=0; j<anss.length; j++){
					                			  answer = answer+"<p>"+anss[j]+"</p>";
					                			  log.info("answer---> "+answer);
					                		  }			                           
					                	  }
					                	  if(genName.equals("assign_name")){
					                		  assign_name = paramPart.getStringValue();					                         	
					                	  }
					                	  if(genName.equals("course_code")){
					                		  course_code = paramPart.getStringValue();					                         	
					                	  }
					                	  if(genName.equals("course_name")){
					                		  course_name = paramPart.getStringValue();					                         	
					                	  }
					                }
					                
					                log.info("=======before while in end=======");
					            }// end while 
					            
					            log.info("after while");
					            
					            SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
					            Date date = new Date();  
					            String currdate = formatter2.format(date);
					            
					            ArrayList batchlist = db5.getBatchList(currdate);
								 
								 if(batchlist != null && batchlist.size() != 0){
									 Iterator itr = batchlist.iterator();
									 while(itr.hasNext()){
										 String batchdetails[] = (String[])itr.next();									 
										 batch = batchdetails[0];
										 semester = batchdetails[1];
										 log.info("batch "+batch+" semester "+semester);
									 }
								 }		
					           
   status=db5.addreassignsubmit(user_id,answer,grade_status,assign_status,assign_name,filelocation,file_name,course_code,batch,semester); 
					  
			                	  
					        } catch (java.io.IOException ioe) {
					            resp = ioe.getMessage();
					        }
					        request.setAttribute("status", status);
					        request.setAttribute("reassign", "reassign");
					
		//request.setAttribute("status", status);		
				}catch(Exception e){
					e.printStackTrace();
				}
				 return new ModelAndView("assignsuccess");				 
		 }
		 
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("subassignment")){
			 String user_id=(String) session.getAttribute("user_id");
			// String answer = request.getParameter("answer");
			 String assign_status="Submitted";
			 String grade_status="Not yet given";
			// String assign_name = request.getParameter("assign_name");			 
			// String status=db5.addassignsubmit(user_id,answer,grade_status,assign_status,assign_name);
			// String course=db5.getcoursebyuserid( user_id);
			// request.setAttribute("status", status);
			// request.setAttribute("course_name", course);
			// request.setAttribute("assign_name", assign_name);
			 
			 String answer="";String assign_name=null;String filelocation=null;String file_name=null;
			 String course_code = null;
			 String batch = null;
			 String semester = null;
			 
			 try {	
				 String fileSavePath;
				    final String UPLOAD_DIRECTORY = "C://assignmentdocuments//";

				    
				        fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
				        if (!(new File(fileSavePath)).exists()) {
				            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
				        }
				        String resp = "";
				        int i = 1;
				        resp += "<br>Here is information about uploaded files.<br>";
				        try {
				            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
				            Part _part;
				            while ((_part = parser.readNextPart()) != null) {
				            	
				            	String genName= _part.getName();
				                if (_part.isFile()) {
				                    FilePart fPart = (FilePart) _part;  // get some info about the file
				                    String name = fPart.getFileName();
				                    
				                    if (name != null) {
				                        long fileSize = fPart.writeTo(new File(fileSavePath));
				                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
				                        String saveFile=fileSavePath+name;
				                        filelocation=saveFile;file_name=name;
				                        //db5.adddocumentfromstudent(user_id,name,saveFile);
				                        
				                    } else {
				                        resp = "<br>The user did not upload a file for this part.";
				                    }
				                }
				                if(_part.isParam()){
				                	
				                	 ParamPart paramPart = (ParamPart)_part;
				                	  if(genName.equals("answer")){
				                		  String ans = paramPart.getStringValue();
				                		  log.info("ans "+ans);
				                		  String anss[] = ans.split("\n");
				                		  for(int j=0; j<anss.length; j++){
				                			  answer = answer+"<p>"+anss[j]+"</p>";
				                			  log.info("answer "+answer);
				                		  }
				                	  }
									
				                	
				                	  if(genName.equals("assign_name")){
				                		  assign_name = paramPart.getStringValue();
				                         	
				                	  }
				                	  
				                	  if(genName.equals("course_code")){
				                		  course_code = paramPart.getStringValue();
				                         	
				                	  }
				                }
				            }// end while 
				            SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
				            Date date = new Date();  
				            String currdate = formatter2.format(date);
				            
				            ArrayList batchlist = db5.getBatchList(currdate);
							 
							 if(batchlist != null && batchlist.size() != 0){
								 Iterator itr = batchlist.iterator();
								 while(itr.hasNext()){
									 String batchdetails[] = (String[])itr.next();									 
									 batch = batchdetails[0];
									 semester = batchdetails[1];
									 log.info("batch "+batch+" semester "+semester);
								 }
							 }							 							 
				           
	String status=db5.addassignsubmit(user_id,answer,grade_status,assign_status,assign_name,filelocation,file_name,batch,semester,course_code); 
				       	
			                	  
				        } catch (java.io.IOException ioe) {
				            resp = ioe.getMessage();
				        }
				        request.setAttribute("message", resp);
				
	//request.setAttribute("status", status);		
			}catch(Exception e){
				e.printStackTrace();
			}
	
			
			 return new ModelAndView("assignsuccess");
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initlogout")){
			 return new ModelAndView("index"); 
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initstudentcourse")){
			 String user_id=(String) session.getAttribute("user_id");
			 ArrayList stucourselist=db5.getstudentcourse(user_id);
			 request.setAttribute("stucourselist", stucourselist);
				return new ModelAndView("student");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("inittrainercourse")){
			 
			 
				return new ModelAndView("trainer");	
			}
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("enrollrequest")){
			 
			 String user_id=(String)session.getAttribute("user_id"); 
			 String category = request.getParameter("category"); 
			 String programname = request.getParameter("programname"); 
			 String subprogramname = request.getParameter("subname"); 
			 String school_10 = request.getParameter("schoolname_10"); 
			 String board_10 = request.getParameter("board_10"); 
			 String mark_10 = request.getParameter("mark_10"); 
			 String yop_10 = request.getParameter("yop_10"); 
			 String school_12 = request.getParameter("schoolname_12"); 
			 String board_12 = request.getParameter("board_12"); 
			 String mark_12 = request.getParameter("mark_12"); 
			 String yop_12 = request.getParameter("yop_12"); 
			 String collegename = request.getParameter("collegename"); 
			 String dept = request.getParameter("dept"); 
			 String university = request.getParameter("university"); 
			 String ugmark = request.getParameter("ugmark"); 
			 String yop = request.getParameter("yop"); 
			 
			
			 String standard =null;
			 if(school_10 !=null  && !(school_10.equalsIgnoreCase("")) && board_10!=null && !(board_10.equalsIgnoreCase("")) &&  mark_10!=null  && !(mark_10.equalsIgnoreCase(""))&& yop_10!=null && !(yop_10.equalsIgnoreCase(""))  ){ 
				 
				 standard =" 10";
			 }

 if(school_12 !=null && !(school_12.equalsIgnoreCase("")) && board_12!=null && !(board_12.equalsIgnoreCase("")) && mark_12!=null && !(mark_12.equalsIgnoreCase("")) && yop_12!=null && !(yop_12.equalsIgnoreCase(""))  )
			 { 
				  standard =" 12";					
		 }

if(dept!=null && !(dept.equalsIgnoreCase("")) && university!=null && !(university.equalsIgnoreCase("")) && ugmark!=null && !(ugmark.equalsIgnoreCase("")) && yop!=null  && !(yop.equalsIgnoreCase(""))){
				 
				  standard ="UG";					
			 }
			 if(category.equalsIgnoreCase("UG")){
			db5.addprovisionenrolldetails(user_id,category,programname,subprogramname,school_10,board_10,mark_10,yop_10,
					school_12,board_12,mark_12,yop_12,collegename,dept,university,ugmark,yop,standard);
			 db5.updateapprovestatus(user_id);
			 }else if(category.equalsIgnoreCase("PG")){
				 db5.addprovisionenrolldetails(user_id,category,programname,subprogramname,school_10,board_10,mark_10,yop_10,
							school_12,board_12,mark_12,yop_12,collegename,dept,university,ugmark,yop,standard);
					 db5.updateapprovestatus(user_id); 
			 }
			 request.setAttribute("user_id", user_id);          
			       
				return new ModelAndView("uploaddocument");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("uploaddocument")){
			 String user_id = request.getParameter("user_id"); 
			 
			 String fileSavePath;
			    final String UPLOAD_DIRECTORY = "C://userdocuments//";

			    
			        fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
			        if (!(new File(fileSavePath)).exists()) {
			            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
			        }
			    

			    
			        String resp = "";
			        int i = 1;
			        resp += "<br>Here is information about uploaded files.<br>";
			        try {
			            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
			            Part _part;
			            while ((_part = parser.readNextPart()) != null) {
			                if (_part.isFile()) {
			                    FilePart fPart = (FilePart) _part;  // get some info about the file
			                    String name = fPart.getFileName();
			                    
			                    if (name != null) {
			                        long fileSize = fPart.writeTo(new File(fileSavePath));
			                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
			                        String saveFile=fileSavePath+name;
				                    db5.adddocumentfromstudent(user_id,name,saveFile);
			                    } else {
			                        resp = "<br>The user did not upload a file for this part.";
			                    }
			                }
			            }// end while 
			        } catch (java.io.IOException ioe) {
			            resp = ioe.getMessage();
			        }
			        request.setAttribute("message", resp);
			   			     
			 return new ModelAndView("uploadsuccess");	  
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initshowcourselist")){
			
			 String categoryid = request.getParameter("categoryid");
			 ArrayList colist=db1.getsubcourse(categoryid);
			 String course_name = request.getParameter("course_name");
			
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("colist", colist);
				
			 return new ModelAndView("stushowcourselist");	
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initstudyarea")){
			
			 String url_link = request.getParameter("url"); 
			 String rm_link = request.getParameter("rmurl"); 
			 
			 request.setAttribute("url_link", url_link);
			 request.setAttribute("rm_link", rm_link);
				
			 return new ModelAndView("studyarea");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initwritingexcellance")){
			 
				return new ModelAndView("writingexcellance");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initjqueryrequest")){			
			 String json = null;
			 String coursename = request.getParameter("Category"); 
			 
			 String courseid=db1.getcourseid(coursename);
			 
				ArrayList courselist=db1.getsubcoursee(courseid);
				//ArrayList list=db1.getcourse();
				
				//request.setAttribute("list", list);
				//request.setAttribute("courseid", courseid);
				//request.setAttribute("courselist", courselist);	
			// request.setAttribute("list", list);
				 json = new Gson().toJson(courselist);
	                response.setContentType("application/json");
	                response.getWriter().write(json);
				//return new ModelAndView("enrollrequest");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initjquerycategory")){			 
			 String json = null;
			 String category = request.getParameter("Category"); 
			 
			 ArrayList clist=db6.getcategoryandcourses(category);
			 
				//ArrayList courselist=db1.getsubcoursee(courseid);
				//ArrayList list=db1.getcourse();
				
				//request.setAttribute("list", list);
				//request.setAttribute("courseid", courseid);
				//request.setAttribute("courselist", courselist);	
			// request.setAttribute("list", list);
				 json = new Gson().toJson(clist);
	                response.setContentType("application/json");
	                response.getWriter().write(json);
				//return new ModelAndView("enrollrequest");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("enrollrequest")){
			 System.out.println("inside enrollrequest------------- > ");
			 
			 String user_id=(String)session.getAttribute("user_id"); 
			 System.out.println("user_id--------- > "+user_id);
			 
				String status=null;String category=null;String programname=null;String subprogramname=null;
				String school_10=null;String board_10=null;String mark_10=null;String yop_10=null;String school_12=null;
				String board_12=null;String mark_12=null;String yop_12=null;String collegename=null;
				String dept=null;String university=null;String ugmark=null;String yop=null;
				String filelocation=null;String file_name=null;
				
				
				
					try {
						 
						
						 String fileSavePath;
						    final String UPLOAD_DIRECTORY = "C://userdocuments//";

						    
						        fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
						        if (!(new File(fileSavePath)).exists()) {
						            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
						        }
						    

						    
						        String resp = "";
						        int i = 1;
						        resp += "<br>Here is information about uploaded files.<br>";
						        try {
						            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
						            Part _part;
						            while ((_part = parser.readNextPart()) != null) {
						            	
						            	String genName= _part.getName();
						                if (_part.isFile()) {
						                    FilePart fPart = (FilePart) _part;  // get some info about the file
						                    String name = fPart.getFileName();
						                    
						                    if (name != null) {
						                        long fileSize = fPart.writeTo(new File(fileSavePath));
						                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
						                        String saveFile=fileSavePath+name;
						                        filelocation=saveFile;file_name=name;
						                        db5.adddocumentfromstudent(user_id,name,saveFile);
						                        System.out.println("file path"+saveFile);	 
						                    } else {
						                        resp = "<br>The user did not upload a file for this part.";
						                    }
						                }
						                if(_part.isParam()){
						                	
						                	 ParamPart paramPart = (ParamPart)_part;
						                	  if(genName.equals("category")){
						                		  category = paramPart.getStringValue();
						                           
						                	  }
											
						                	
						                	  if(genName.equals("programname")){
						                		  programname = paramPart.getStringValue();
						                         	
						                	  }
						                	
						                	  if(genName.equals("subname")){
						                		  subprogramname = paramPart.getStringValue();
						                         	
						                	  }
											
						                	  if(genName.equals("schoolname_10")){
						                		  school_10 = paramPart.getStringValue();
						                     		
						                	  }
						                	  if(genName.equals("board_10")){
						                		  board_10 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("mark_10")){
						                		  mark_10 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("yop_10")){
						                		  yop_10 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("schoolname_12")){
						                		  school_12 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("board_12")){
						                		  board_12 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("mark_12")){
						                		  mark_12 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("yop_12")){
						                		  yop_12 = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("collegename")){
						                		  collegename = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("dept")){
						                		  dept = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("university")){
						                		  university = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("ugmark")){
						                		  ugmark = paramPart.getStringValue();
					                     		
					                	  }
						                	  if(genName.equals("yop")){
						                		  yop = paramPart.getStringValue();
					                     		
					                	  }
						                	 
						                	 
						                	 
						                	
						                }
						            }// end while 
						            
						            String standard =null;
									 if(school_10 !=null  && !(school_10.equalsIgnoreCase("")) && board_10!=null && !(board_10.equalsIgnoreCase("")) &&  mark_10!=null  && !(mark_10.equalsIgnoreCase(""))&& yop_10!=null && !(yop_10.equalsIgnoreCase(""))  ){ 
										 
										 standard =" 10";
						System.out.println("standard1"+standard);
									 }

						 if(school_12 !=null && !(school_12.equalsIgnoreCase("")) && board_12!=null && !(board_12.equalsIgnoreCase("")) && mark_12!=null && !(mark_12.equalsIgnoreCase("")) && yop_12!=null && !(yop_12.equalsIgnoreCase(""))  )
									 {
										 
										 
										  standard =" 12";
											System.out.println("standard2"+standard);
								 }

						if(dept!=null && !(dept.equalsIgnoreCase("")) && university!=null && !(university.equalsIgnoreCase("")) && ugmark!=null && !(ugmark.equalsIgnoreCase("")) && yop!=null  && !(yop.equalsIgnoreCase(""))){
										 
										  standard ="UG";
											System.out.println("standard3"+standard);
									 }
						            
						       	 if(category.equalsIgnoreCase("UG")){
						 			db5.addprovisionenrolldetails(user_id,category,programname,subprogramname,school_10,board_10,mark_10,yop_10,
						 					school_12,board_12,mark_12,yop_12,collegename,dept,university,ugmark,yop,standard);
						 			 db5.updateapprovestatus(user_id);
						 			 }else if(category.equalsIgnoreCase("PG")){
						 				 db5.addprovisionenrolldetails(user_id,category,programname,subprogramname,school_10,board_10,mark_10,yop_10,
						 							school_12,board_12,mark_12,yop_12,collegename,dept,university,ugmark,yop,standard);
						 					 db5.updateapprovestatus(user_id); 
						 			 }
				        		 
				                	  
						        } catch (java.io.IOException ioe) {
						            resp = ioe.getMessage();
						        }
						        request.setAttribute("message", resp);
						
			request.setAttribute("status", status);		
					}catch(Exception e){
						e.printStackTrace();
					}
			
					return new ModelAndView("uploadsuccess");	
			}
		  
		 else if(pro!=null && pro.equalsIgnoreCase("initregistration")){
			 		 
			 //String user_id=(String)session.getAttribute("user_id"); 
			 	String firstname=null;
				String lastname=null;String username=null;String password=null;	String e_mail=null;
				String gender=null;	String mobileno=null;String date=null;String fathername=null;
				String mothername=null;	String address1=null;String address2=null;String state=null;
				String pincode=null;String city=null;String country=null; String status=null;
				String filelocation=null; String file_name=null; Date dob=null;
				
				String username1 = null;
				String password1 = null;
				String e_mail1 = null;
				String companyname = null;	
				
				
				 try {
						 
			 String fileSavePath;
			 final String UPLOAD_DIRECTORY = "C://userdocuments//";						    
			 fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
		    
		if (!(new File(fileSavePath)).exists()) {
		            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
		        }
		
		      String resp = "";
		      int i = 1;
		      resp += "<br>Here is information about uploaded files.<br>";

		       
		       try {
		         
		    	   MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
		           Part _part;
		           
		           while ((_part = parser.readNextPart()) != null) {
		          	
		      	String genName= _part.getName();
		      	
		        if (_part.isFile()) {
		        	  
				 FilePart fPart = (FilePart) _part;  // get some info about the file
				 String name = fPart.getFileName();
						                    
			if (name != null) {
			
				long fileSize = fPart.writeTo(new File(fileSavePath));
				resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
				String saveFile=fileSavePath+name;
				filelocation=saveFile;file_name=name;
					 //db5.adddocumentfromstudent(user_id,name,saveFile);
				} else {
			    resp = "<br>The user did not upload a file for this part.";
				 }
			}
						                
		    if(_part.isParam()){
		    	ParamPart paramPart = (ParamPart)_part;
				
		    	if(genName.equals("firstname")){
		    		firstname = paramPart.getStringValue();
				}
		    	if(genName.equals("lastname")){
		    		lastname = paramPart.getStringValue();
		    		}
		    	if(genName.equals("username")){
		    		username = paramPart.getStringValue();
		    		}
		    	if(genName.equals("password")){
		    		password = paramPart.getStringValue();
		    		}
		    	if(genName.equals("email")){
		    		e_mail = paramPart.getStringValue();
		    		}
		    	if(genName.equals("company")){
		    		companyname = paramPart.getStringValue();
		    		}
		    	if(genName.equals("gender")){
		    		gender = paramPart.getStringValue();
		    		}
		    	if(genName.equals("mobileno")){
		    		mobileno = paramPart.getStringValue();
		    		}
		    	if(genName.equals("date")){
		    		date = paramPart.getStringValue();
		    		}
		    	if(genName.equals("fathername")){
		    		fathername = paramPart.getStringValue();
		    		}
		    	if(genName.equals("mothername")){
		    		mothername = paramPart.getStringValue();
		    		}
		    	if(genName.equals("address1")){
		    		address1 = paramPart.getStringValue();
		    		}
		    	if(genName.equals("address2")){
		    		address2 = paramPart.getStringValue();
		    		}
		    	if(genName.equals("state")){
		    		state = paramPart.getStringValue();
		    		}
		    	if(genName.equals("pincode")){
		    		pincode = paramPart.getStringValue();
		    		}
		    	if(genName.equals("city")){
		    		city = paramPart.getStringValue();
		    		}
		    	if(genName.equals("country")){
		    		country = paramPart.getStringValue();
		    		}
		    	}
		    }// end while 
		           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					//String userid=db1.getuserid(username);
		
		           if (date != null && date.trim().length() != 0) {
		        	   dob = (Date) sdf.parse(date);
						            }		
			log.info("date "+date+" dob "+dob);	   
			
			status = stuService.studentRegistartion(username,password,firstname,lastname,gender,e_mail,
					dob,mobileno,fathername,mothername,address1,address2,city,state,country,pincode,companyname);
			
			//db6.createuserforlms(username,password,firstname,lastname,gender,e_mail,dob,mobileno,fathername,mothername,address1,address2,city,state,country,pincode);
	
			String userid = db1.getuserid(username);
			db1.adduserpicture(userid,filelocation);
					
			log.info("status "+status);
			if(status!=null){
				
			ArrayList userlist=db.getuserslist(username);
			log.info("usernamee "+username+" userlist "+userlist.size());
			
			if(userlist != null){
			Iterator itr = userlist.iterator();
			if(itr.hasNext()){
			 String sr[] = (String[]) itr.next();
			
			 username1 = sr[0];
			 password1 = sr[1];	
			 e_mail1 = sr[2]; 	
			}
		}
	}
			log.info("check fine 1");
		       } catch (java.io.IOException ioe) {
						   resp = ioe.getMessage();
						  }
		       request.setAttribute("message", resp);
		       log.info("check fine resp "+resp);
			//request.setAttribute("status", status);		
					}catch(Exception e){
						e.printStackTrace();
					}
			
					request.setAttribute("username1", username1);
					request.setAttribute("password1", password1);
					request.setAttribute("e_mail1", e_mail1);
					
					 log.info("check fine username1 "+username1+" password1 "+password1+" e_mail1 "+e_mail1);
					 
					/* RequestDispatcher rd=request.getRequestDispatcher("jsp/frmUserSuccess.jsp");  
					 rd.forward(request, response);*/
					 //******infusion payment decline***//
                     boolean  emailstatus=false;
                     String fromAddress="care@smartlehren.com";
           		  String toAddress=e_mail1;
                     String ccAddresses="parasuram@digiblitz.in"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                      String subject="User Credential Details"; String textBody="";
                      String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                  			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                  			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:18443/smartlehren/images/smartLehrenlogo.png\" alt=\"Logo\"/></a></td>" +
                  			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                  			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                  			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                  					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">You Have Register Successfully</h4><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                  					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:18443/smartlehren\"><span style=\" display: block;text-align: center; color: #fff;\">Login Here</span></a></td>" +
                  					"</tr> </tbody> </table> <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                  					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                  					"<strong>User Name</strong><br />"+username1+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                  					"<strong>Password</strong><br />"+password1+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                  					"<strong>Email Id</strong><br /> "+e_mail1+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                  					
                  					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                     try {
    					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
    				} catch (XmlRpcException e) {
    					// TODO Auto-generated catch block
    					e.printStackTrace();
    				}
					 
		return new ModelAndView("frmUserSuccess");
					
			}
		  		  
		 else if(pro!=null && pro.equalsIgnoreCase("profilepicture")){
			 String user_id = request.getParameter("user_id"); 
			String filelocation=null;
			 String status=null;
			 String fileSavePath;
			    final String UPLOAD_DIRECTORY = "C://userpicture//";

			    
			        fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
			        if (!(new File(fileSavePath)).exists()) {
			            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
			        }
			    
			        String resp = "";
			        int i = 1;
			        resp += "<br>Here is information about uploaded files.<br>";
			        try {
			            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
			            Part _part;
			            while ((_part = parser.readNextPart()) != null) {
			            	
			            	String genName= _part.getName();
			                if (_part.isFile()) {
			                    FilePart fPart = (FilePart) _part;  // get some info about the file
			                    String name = fPart.getFileName();
			                    
			                    if (name != null) {
			                        long fileSize = fPart.writeTo(new File(fileSavePath));
			                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
			                        String saveFile=fileSavePath+name;
			                        filelocation=saveFile;//file_name=name;
			                        //db1.adduserpicture(user_id,saveFile);
			                        status="Image Uploaded Successfully";			                        
			                    } else {
			                        resp = "<br>The user did not upload a file for this part.";
			                        status="Image failed to Upload";
			                    }
			                }
			 
			            }//end while
			            
			            String pro_id=db6.getprofileid(user_id);
			            if(pro_id != null){
			            	db6.updateuserpicture(user_id,filelocation);
			            }else{
			            	db1.adduserpicture(user_id,filelocation);
			            }
			 
			        } catch (java.io.IOException ioe) {
			            resp = ioe.getMessage();
			        }         
			        
			        request.setAttribute("status", status);		     		
			 return new ModelAndView("profilepicture");	 
		 }
		 
		  
		else if(pro!=null && pro.equalsIgnoreCase("initallnotes")){
			// Runtime runtime = Runtime.getRuntime();
			// Process process = runtime.exec("C:\\Windows\\notepad.exe C:\\notes\\test.txt");
			return new ModelAndView("notes");		
			}
		  
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("evaluatetest")){
			 String answer = request.getParameter("answer"); 
			 String test_name = request.getParameter("test_name");
			 
			
			 			 
			 return new ModelAndView("subassign"); 
		 }
		 
		 else if(StudentProcess!=null && StudentProcess.equalsIgnoreCase("showquiz")){
				
			    String user_id=(String)session.getAttribute("user_id");
				int upto=Integer.parseInt(request.getParameter("upto"));
				int total=0;
				
				 String quiz_name = request.getParameter("quiz_name");
				 String course_code = request.getParameter("course_code");
				 String quizname_id=db5.getquizid(quiz_name);
				 ArrayList ans=(ArrayList)session.getAttribute("ans");
				 
				 ArrayList question_name=(ArrayList)session.getAttribute("question_name");
				 //ArrayList finalanswer=new ArrayList();
				 //ArrayList choice=new ArrayList();
				 ArrayList s=new ArrayList();
				 for (int i=0;i<=upto-1;i++){ 
					 
					 s.add(request.getParameter("digi_"+i));
				 			 }
				 for (int i=0;i<=upto-1;i++){ 
					 if(s.get(i)!= null){
					 if(s.get(i).equals(ans.get(i))){
						 total=total+1;
						//String[] temp={(String) s.get(i),(String) ans.get(i)}; 
						//choice.add(temp);
					 }else {
						 total=total+0;
							//String[] temp={(String) s.get(i),(String) ans.get(i)}; 
							//choice.add(temp);
					 }
					 }else{
						 total=total+0; 
					 }
				 }
				 String totalmark=String.valueOf(total);
				 String upto1=String.valueOf(upto); 	
				 
				 request.setAttribute("s", s);
				 request.setAttribute("upto", upto1);
				 request.setAttribute("question_name", question_name); 
				 request.setAttribute("total", totalmark);
				
				 int per=total*100/upto;
				 String percent=String.valueOf(per);
				 db5.inserttestmark(user_id,quizname_id,percent,upto1,totalmark);
				 log.info("course_code "+course_code);
				 
				 return new ModelAndView("showquizmark"); 	 
			 }
			}catch(Exception e)
	        {
	           e.printStackTrace();
	        }				
		 
		return null; 	 
	}
	 
}
	
