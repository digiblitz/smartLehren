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
package com.exam;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.google.gson.Gson;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.util.adminDB;
import com.util.controlDB;
import com.util.examDB;
import com.util.studentDB;
import com.util.trainerDB;
import com.util.userDB;

@Controller
public class examAction{

	static Logger log = Logger.getLogger(examAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	@RequestMapping("/exam.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");
	      
		try{
		HttpSession session=request.getSession(true); 
		 String examProcess = request.getParameter("cmd");
		 
		 userDB db = userDB.getInstance();
		 adminDB db1 = adminDB.getInstance();
		 trainerDB db4 = trainerDB.getInstance();
		 controlDB db7 = controlDB.getInstance();
		 studentDB db5 = studentDB.getInstance();
		 examDB db8 = examDB.getInstance();
		 
		 if(examProcess!=null && examProcess.equalsIgnoreCase("initCreateExam")){			 
			 
			 ArrayList progList = db1.getcourse();
			 //ArrayList subProgList=db1.getsubcourse();
			 ArrayList batch = db1.getbatch();
			 ArrayList coursename = db1.getcoursename();
				request.setAttribute("progList", progList);
				//request.setAttribute("subProgList", subProgList);
				request.setAttribute("batch", batch);
				request.setAttribute("coursename", coursename);
			 
				
				 return new ModelAndView("createexam");
			 }
		 else if(examProcess!=null && examProcess.equalsIgnoreCase("getlistofcourse")){			 
			 
			 String semester = request.getParameter("semester");
			 String pro_id = request.getParameter("pro_id");
			 String sub_coursename = request.getParameter("subpro_id");
			 String testbatch = request.getParameter("batch");
			 String json = null;
			 String subpro_id=db1.getsubcourseid(sub_coursename);
			
			 //System.out.println("semester"+semester);
			 //System.out.println("pro_id"+pro_id);
			 //System.out.println("subpro_id"+subpro_id);
			 //System.out.println("batch"+batch);
			 
			 ArrayList courselist=db7.getcourselist(pro_id,subpro_id,semester);
			 request.setAttribute("courselist", courselist);
			 request.setAttribute("ram", "your are the best");
			 ArrayList progList=db1.getcourse();
			
			 //ArrayList subProgList=db1.getsubcourse();
			
			 ArrayList batchs=db1.getbatch();
			 ArrayList coursename=db1.getcoursename();
				
			 request.setAttribute("progList", progList);
				//request.setAttribute("subProgList", subProgList);
				request.setAttribute("batch", batchs);
				request.setAttribute("coursename", coursename);
				request.setAttribute("pro_id", pro_id);  
				request.setAttribute("semester", semester);
				request.setAttribute("batchs", testbatch);
				request.setAttribute("sub_coursename", sub_coursename);
				
				return new ModelAndView("createexam");
				
			 }else if(examProcess!=null && examProcess.equalsIgnoreCase("createexams")){	
				 
				 String status = null;
				 String semester = request.getParameter("selSemester");
				 String pro_id = request.getParameter("selProgg");
				 String sub_coursename = request.getParameter("selSubProg");
				 String testbatch = request.getParameter("selBatch");
				 String upto = request.getParameter("upto");
				
				 String subpro_id=db1.getsubcourseid(sub_coursename);
				 				 
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				 				 	
				 int ff = Integer.parseInt(upto);
				 for(int i=0;i<ff;i++){
					 
				 String coursenamess = request.getParameter("coursenamess"+i);
				 String coursecode = db8.getcoursecode(coursenamess);
				 String date = request.getParameter("date"+i);				 
				 String section = request.getParameter("section"+i);
				 String starttime1 = request.getParameter("starttime"+i);
				 String startmins = request.getParameter("startmins"+i);
				 String starttime = starttime1+":"+startmins;
				 String starttimemethod = request.getParameter("starttimemethod"+i);
				 String endtime1 = request.getParameter("endtime"+i);
				 String endmins = request.getParameter("endmins"+i);
				 String endtime = endtime1+":"+endmins;
				 String endtimemethod = request.getParameter("endtimemethod"+i);
				 
				 log.info("from for loop "+date);
				 
		 if(date != ""){
				 status = db7.createExams(pro_id,subpro_id,testbatch,semester,coursenamess,coursecode,date,section,starttime,starttimemethod,endtime,endtimemethod);
				 }
				 }
				 
				 ArrayList progList = db1.getcourse();				
				 ArrayList batch = db1.getbatch();
				 ArrayList coursename = db1.getcoursename();
					
				 request.setAttribute("progList", progList);
				 request.setAttribute("batch", batch);
				 request.setAttribute("coursename", coursename);
				 request.setAttribute("status", status);
				 
				 return new ModelAndView("createexam");
			 }
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("initexam")){			 
				 ArrayList batch=db1.getbatch();
				 request.setAttribute("batch", batch);
				
				
					return new ModelAndView("showexamdetails");
				 }
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("getexamdetails")){	
				 String user_id=(String)session.getAttribute("user_id");
				 String subproid=db5.getsubprogramid(user_id);
				  String proid=db5.getprogramid(user_id);
				 String semester = request.getParameter("semester");
				 String batch = request.getParameter("batch");
								 
				 ArrayList courselist=db7.getexamdetails(proid,subproid,semester,batch);
				 request.setAttribute("courselist", courselist);
				
					request.setAttribute("semester", semester);
					request.setAttribute("batch", batch);
					request.setAttribute("ram", "digiblitz");
					return new ModelAndView("showexamdetails");
				 }
		 
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("initfee")){	
				 ArrayList progList=db1.getcourse();
				 //ArrayList subProgList=db1.getsubcourse();
				 ArrayList batch=db1.getbatch();
				 
					request.setAttribute("progList", progList);
					//request.setAttribute("subProgList", subProgList);
					request.setAttribute("batch", batch);
					
					return new ModelAndView("showfeedetails");
				 }
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("getfeereports")){	
				 
				 String user_id=(String)session.getAttribute("user_id");
				
				 // String subproid=db5.getsubprogramid(user_id);
				 // String proid=db5.getprogramid(user_id);
				 
				 String semester = request.getParameter("semester");
				 String pro_id = request.getParameter("pro_id");
				 String sub_coursename = request.getParameter("subpro_id");
				 String testbatch = request.getParameter("batch");
				 String upto = request.getParameter("upto");
				 String subpro_id=db1.getsubcourseid(sub_coursename);
								 
				 ArrayList feelist=db7.getfeedetails(pro_id,subpro_id,testbatch,semester);
				 request.setAttribute("feelist", feelist);
				 ArrayList progList=db1.getcourse();
				 //ArrayList subProgList=db1.getsubcourse();
				 ArrayList batchs=db1.getbatch();
				 
					request.setAttribute("progList", progList);
					//request.setAttribute("subProgList", subProgList);
					request.setAttribute("batch", batchs);
					
					request.setAttribute("ram", "digiblitz");
					
					return new ModelAndView("showfeedetails");
				 }
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("selProg")){
				 
				 String json = null;
				 String progId=request.getParameter("prog");
				 ArrayList subProgList=db1.getsubcourselist(progId);
				
				
				//session.setAttribute("subProgList", subProgList);
				//request.setAttribute("courseList", null);	
				//return new ModelAndView("frmMapPrograms");
				 json = new Gson().toJson(subProgList);				 
	             response.setContentType("application/json");	             
	             response.getWriter().write(json);
	             
			 }			 
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("inithallticket")){			 
					 String user_id=(String)session.getAttribute("user_id");
					 
					 ArrayList studentlsist = db7.getstudentlist(user_id);
					 
					 String subproid1=db7.getstudent_subprogramid(user_id);
					  String proid1=db7.getstudent_programid(user_id);
					  String batch1=db7.getbatch(user_id);
					  
					  String program_id = null;
		            	String sub_program_id = null;
		            	String batch = null;
					  
					  
					  if(studentlsist != null){
						  Iterator itr = studentlsist.iterator();
						  while(itr.hasNext()){
							  String[] temp = (String[])itr.next();
							  
							  String register_no = temp[0];
				            	String firstname = temp[1];
				            	String lastname = temp[2];
				            	program_id = temp[3];
				            	sub_program_id = temp[4];
				            	batch = temp[5];
				            				            	
						  }
					  }
					  
					  String progname = db7.getprogname(program_id);
					 String suprogname = db7.getsubprogname(sub_program_id);
					 
					  String semester=db.getsemester(batch);
					  
					 ArrayList examdetails=db7.getexamdetails(program_id,sub_program_id,semester,batch);

					 request.setAttribute("progname", progname);
					 request.setAttribute("suprogname", suprogname);
					 request.setAttribute("examdetails", examdetails);	
					 request.setAttribute("studentlsist", studentlsist);	
					
						return new ModelAndView("hallticket");
						
					 }else if(examProcess!=null && examProcess.equalsIgnoreCase("initcreateexamquestion")){			 
						 String  user_id=(String)session.getAttribute("user_id");
						 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
						 request.setAttribute("cmcourselist", cmcourselist);
						
							return new ModelAndView("exam_quepaper");
						 }
					 else if(examProcess!=null && examProcess.equalsIgnoreCase("initcreateexamquestion")){			 
						 String  user_id=(String)session.getAttribute("user_id");
						 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
						 request.setAttribute("cmcourselist", cmcourselist);
						
							return new ModelAndView("exam_quepaper");
						 }else if(examProcess!=null && examProcess.equalsIgnoreCase("CreateQuestion")){			 
							 String user_id=(String)session.getAttribute("user_id");
							 //SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
						     String examname=request.getParameter("examname");
						     String coursecode=request.getParameter("coursecode");
							 String s=request.getParameter("smallquestion");
							 String b=request.getParameter("bigquestion");
							// String status=db7.addassign(examname,s,b,coursecode);
								return new ModelAndView("exam_quepaper");
							 }
		 
		 /*
		  * Course Mentor creates exam for particular Course
		 */
			 else if(examProcess!=null && examProcess.equalsIgnoreCase("initscheduleexam")){
				 
				 String  user_id=(String)session.getAttribute("user_id");
				 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
				 

				 request.setAttribute("user_id", user_id);				 
				 request.setAttribute("cmcourselist", cmcourselist);				
				return new ModelAndView("exam");
			 }
			 
 else if(examProcess!=null && examProcess.equalsIgnoreCase("examschedule")){
	 
	 	String  user_id=(String)session.getAttribute("user_id");	 
	 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
	 
	 String  coursecode=request.getParameter("coursecode");	
	 String  examnname=request.getParameter("examnname");
	 String  shortmark=request.getParameter("shortmark");
	 String  briefmark=request.getParameter("briefmark");
	 String  allowdate=request.getParameter("allowdate");
	 String  password=request.getParameter("password");
	 String  shquestion = request.getParameter("shquestion1");
	 String  brquestion = request.getParameter("brquestion1");	 
	 String  keytwoo = request.getParameter("keytwo1");
	 String  keysixtnn = request.getParameter("keysixtn1");
	 
	 log.info("from of ques shquestion "+shquestion+" brquestion "+brquestion+" keytwoo "+keytwoo+" keysixtnn "+keysixtnn);
	 
	 String  question = null;
	 String  question1 = null;	 
	 String  keytwo = null;
	 String  keysixtn = null;
	 
	 String tmquestion = "";
	 String smquestion = "";
	 
	/* tmquestion=tmquestion+"<p>"+shquestion+"</p>";
	 smquestion=smquestion+"<p>"+brquestion+"</p>";*/	 
	
	 
	 String keyshort = "";
	 String keybrief = "";
	 
	 String  questioncount = request.getParameter("shquestioncount");
	 String  questioncount1 = request.getParameter("brquestioncount");
	 
	 System.out.println(questioncount +" == "+questioncount1);
	 	 
	 if(questioncount != null && questioncount1 != null && questioncount != "" && questioncount1 != ""){
		 int quescount = Integer.parseInt(questioncount);
		 int quescount1 = Integer.parseInt(questioncount1);
		 
		 for(int i=1; i<=quescount; i++){
			  question = request.getParameter("shquestion"+i);
			  keytwo = request.getParameter("keytwo"+i);
			  
			  if(question != null && keytwo!= null){
			  tmquestion=tmquestion+"<p>"+question+"</p>";
			  keyshort=keyshort+"<p>"+keytwo+"</p>";
			  }
		 }
		 
		 for(int j=1; j<=quescount1; j++){
			 question1 = request.getParameter("brquestion"+j);
			 keysixtn = request.getParameter("keysixtn"+j);
			
			 if(question1 != null && keysixtn!= null){
			 smquestion=smquestion+"<p>"+question1+"</p>";
			 keybrief=keybrief+"<p>"+keysixtn+"</p>";
			 }
		 }
	 }else{
		 
		 System.out.println("inside sh quest if else ");
			tmquestion = shquestion;
			smquestion = brquestion;
			keyshort = keytwoo;
			keybrief = keysixtnn;
			
			System.out.println(" tmquestion "+tmquestion+" smquestion "+smquestion);
			System.out.println(" keyshort "+keyshort+" keybrief "+keybrief);
			
	 }
	 
	 
	
	 Date allow_date=null;
	 SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
	 SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
		
				
		if (allowdate != null && allowdate.trim().length() != 0) {
			 try {
				 Date date1 = (Date) formatter1.parse(allowdate);
				 String strdate1 = sdf.format(date1);					 
				allow_date = (Date) sdf.parse(strdate1);
			} catch (ParseException e) {					
				e.printStackTrace();
			}
           }
				
		int shortansmark = Integer.parseInt(shortmark);
		int briefansmark = Integer.parseInt(briefmark);
	
		
	String status=db4.scheduleexam(coursecode,examnname,tmquestion,keyshort,smquestion,keybrief,allow_date,password,shortansmark,briefansmark);
				
				 request.setAttribute("status", status);
				 request.setAttribute("user_id", user_id);
				 request.setAttribute("cmcourselist", cmcourselist);	
				 
				return new ModelAndView("exam");
			 }
		  
		 else if(examProcess!=null && examProcess.equalsIgnoreCase("initcheckpassword")){
						 
			 String  user_id = (String)session.getAttribute("user_id");	 
			 String  exam_id = request.getParameter("examid");
			 String  exam_name = request.getParameter("exam_name");
		 	 String  course_code = request.getParameter("course_code");
		 	 String  course_name = request.getParameter("course_name");
		 	 String  allow_date = request.getParameter("allow_date");		 	
		 			 	
		 	request.setAttribute("exam_id", exam_id);
		 	request.setAttribute("user_id", user_id);
		 	request.setAttribute("exam_name", exam_name);
		 	request.setAttribute("course_code", course_code);
		 	request.setAttribute("course_name", course_name);
		 	request.setAttribute("allow_date", allow_date);
		 	
			 return new ModelAndView("checkpasswordexam");
		 }
 else if(examProcess!=null && examProcess.equalsIgnoreCase("initshowexamdetails")){
	 
		 	
	 	String  user_id = (String)session.getAttribute("user_id");	 
	 	String  exam_name = request.getParameter("exam_name");
	 	String  course_code = request.getParameter("course_code");
	 	String  course_name = request.getParameter("course_name");
	 	String  allow_date = request.getParameter("allow_date");	 		 	
	 	String  examcode = request.getParameter("examcode");
	 	String  exampassword = request.getParameter("exampassword");
	 	String  exam_id = request.getParameter("exam_id");
	 	
	 	log.info("exam_id "+exam_id);
	 	
	 	SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	 	Date date1 = formatter1.parse(allow_date);
	 	
	 	String examceckpassword = db8.getexamcheck(exam_name,course_code,date1);
	 	
	 	String status = null;
	 	
	 	if(examcode.equals(course_code) && exampassword.equals(examceckpassword)){
	 		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		 	Date date = formatter.parse(allow_date);
		 	
		 	String tmquestion = null;
		 	String smquestion = null;
		 	
		 	ArrayList examdetailss = db8.getexamdetails(course_code,exam_name,date,exam_id);
		 	
		 		if(examdetailss != null){
		 			Iterator itr = examdetailss.iterator();
		 			while(itr.hasNext()){
		 				String[] strquestion = (String[])itr.next();
		 				tmquestion = strquestion[0];
		 				smquestion = strquestion[1];
		 			}
		 		}
		 	status = "Success";
		 	
		 	request.setAttribute("exam_id", exam_id);
		 	request.setAttribute("examdate", allow_date);
		 	request.setAttribute("tmquestion", tmquestion);
		 	request.setAttribute("smquestion", smquestion);
		 	request.setAttribute("course_name", course_name);
		 	request.setAttribute("course_code", course_code);
		 	request.setAttribute("exam_name", exam_name);
		 	
		 	//request.setAttribute("examdetailss", examdetailss);
					return new ModelAndView("examdetails");
	 	}else{
	 		status = "Sorry you Entered Password or Code Mismatches";
	 	}
	 	
	 	request.setAttribute("course_name", course_name);
	 	request.setAttribute("course_name", course_name);
	 	request.setAttribute("course_code", course_code);
	 	request.setAttribute("exam_name", exam_name);
	 	request.setAttribute("status", status); 	
	 	return new ModelAndView("checkpasswordexam");
			 }
		 
		 
 else if(examProcess!=null && examProcess.equalsIgnoreCase("submitexam")){
	 
	 String user_id = (String) session.getAttribute("user_id");		
	 String assign_status = "Submitted";
	 String grade_status = "Not yet given";
	 
	/* ArrayList shortanswerlist = new ArrayList();
	 ArrayList briefanswerlist = new ArrayList();
	*/ 
	 
	 String shortcount = request.getParameter("shortcount");
	 String briefcount = request.getParameter("briefcount");
	 String exam_name = request.getParameter("exam_name");
	 String course_code = request.getParameter("course_code");
	 String examdate = request.getParameter("examdate");
	 String course_name = request.getParameter("course_name");
	 
	 String tmquestion = request.getParameter("tmquestion");
	 String smquestion = request.getParameter("smquestion");
	 String exam_id = request.getParameter("exam_id");
	 
	 log.info("exam_id "+exam_id);
 	
 	
	 int countshorti = Integer.parseInt(shortcount);
	  int countbriefj = Integer.parseInt(briefcount);
	  
	 String keyforshort = null;
	 String keyforbrief = null;
	 String shortmark = null;
	 String briefmark = null;
	 
	 String str1 = "";
	 String str2 = "";
	 String shortanswerfull = "";
	 String briefanswerfull = "";
	 
	 String shortkeywords[] = null;
		String briefkeywords[] = null;
		ArrayList shortmarklist = new ArrayList();
		ArrayList brieftmarklist = new ArrayList();
		ArrayList ashortmark = new ArrayList();
		   ArrayList abriefmark = new ArrayList();

		   int scount = 0;
		   int bcount = 0;
		   
		   ArrayList keywordlist = db8.getkeywordlist(course_code,exam_name,examdate);			
	 try{
		 
	 
	 if(keywordlist != null){
		 Iterator itr = keywordlist.iterator();
		 while(itr.hasNext()){
			 String strarr[] = (String[])itr.next();
			 keyforshort = strarr[0];
			 keyforbrief = strarr[1];
			 shortmark = strarr[2];
			 briefmark = strarr[3];
			//log.info("keyforshort "+keyforshort+" keyforbrief "+keyforbrief+" shortmark "+shortmark+" briefmark "+briefmark);
		 }
	 }
	 
	 int shortmarki = Integer.parseInt(shortmark);
	 int briefmarki = Integer.parseInt(briefmark);
	 	 				
		try{
		if(keyforshort != null){
			
			
			 //trim the keywords starts
			/*keyforshort = keyforshort.replaceAll("[0-9]", "");
			keyforbrief = keyforbrief.replaceAll("[0-9]","");*/
	
				keyforshort = keyforshort.replaceAll("[-+.^:]","");
				keyforbrief = keyforbrief.replaceAll("[-+.^:]","");
				
				
				keyforshort = keyforshort.replaceAll("<p>","");
				keyforbrief = keyforbrief.replaceAll("<p>","");
				
				
				
				keyforshort = keyforshort.replaceAll(" ",",");
				keyforbrief = keyforbrief.replaceAll(" ",",");
				
				
				keyforshort = keyforshort.replaceAll(",,",",");
				keyforbrief = keyforbrief.replaceAll(",,",",");
				
				
				keyforshort = keyforshort.replaceAll(" ","");				
				keyforbrief = keyforbrief.replaceAll(" ","");
			
						
		}
		
	}catch(Exception e){
			e.printStackTrace();
		}
		
		String shortans[] = keyforshort.split("</p>");
		String briefans[] = keyforbrief.split("</p>");		
		//trim the keywords ends
		
		//getting all the answers from jsp page starts
		   float smark = 0;	               
	       float shortfloatval = 0;
	       float shortfinalfloat = 0;
		int k;
		
		  for( k = 0; k<countshorti; k++){
			  String shortanswer = request.getParameter("shortanswer"+k);
				
			  shortanswerfull = shortanswerfull+"<p>"+shortanswer+"</p>";
			  
							  	
					String shortsplit = shortans[k];
										
					/*shortsplit = shortsplit.replaceFirst("^,", "");
					shortsplit = shortsplit.replaceAll(" ", "");	*/									
					
					shortkeywords = shortsplit.split(",");	
					
					for(int i = 0; i<shortkeywords.length; i++){
						
						String shortkeyword = shortkeywords[i];
											
					        scount = shortkeywords.length;					     
					        smark = (float)shortmarki/scount;	
					   
					        Boolean found = shortanswer.contains(shortkeyword);
					     
						if(found){		
								shortfloatval = smark;
								shortfinalfloat = shortfinalfloat+shortfloatval;	
								
								log.info("yse its found shortfloatval "+shortfloatval+" shortfinalfloat "+shortfinalfloat);
							}
							else{		
								log.debug("Sorry Failed");
							}						
				
							int smallmark = Math.round(shortfinalfloat);
							  													
							if(i == shortkeywords.length-1){								
															
								String shortansmark = Integer.toString(smallmark);
								shortmarklist.add(shortansmark);	
							}
					}		
					shortfloatval = 0;
				     shortfinalfloat = 0;
		  }
		  
			
			if(shortmarklist != null){									
				shortfinalfloat = 0;
				Iterator itr = shortmarklist.iterator();
				while(itr.hasNext()){
					String str = (String)itr.next();
					 str1 = str1+"<p>"+str+"</p>";	
					}			
			}
		  
		  float bmark = 0;
		  float floatvalbr = 0;
	      float finalfloatbr = 0;
		  
		  for( k = 0; k<countbriefj; k++){
			  String briefanswer = request.getParameter("briefanswer"+k);		  
		
			  briefanswerfull = briefanswerfull+"<p>"+briefanswer+"</p>";
									
					String briefsplit = briefans[k];
					
					//briefsplit = briefsplit.replaceFirst("^,", "");
				
					briefkeywords = briefsplit.split(",");	
										
					for(int i = 0; i<briefkeywords.length; i++){
					
						String briefkeyword = briefkeywords[i];		
												
					       bcount = briefkeywords.length;					      
					       bmark = (float)briefmarki/bcount;
					      
					       Boolean found = briefanswer.contains(briefkeyword);					 
					       if(found){			
					    	   floatvalbr = bmark;
						    	finalfloatbr = finalfloatbr+floatvalbr;						    	
							}
					       else{			
					    	   log.debug("Sorry Failed");
					       }					       	
					       int bigmark = Math.round(finalfloatbr);	
					       
					      if(i == briefkeywords.length-1){
																
								String briefansmark = Integer.toString(bigmark);
								brieftmarklist.add(briefansmark);
							}
					}	
					   floatvalbr = 0;
				       finalfloatbr = 0;
	      }
		  
		  if(brieftmarklist != null){									
				finalfloatbr = 0;
				Iterator itr = brieftmarklist.iterator();
				while(itr.hasNext()){
					
					String strr = (String)itr.next();										
					 str2 = str2+"<p>"+strr+"</p>";
					}
			}
		  
		  int shortfullcount = 0;
		   int bigcount = 0;
		  
		  String [] strarr = tmquestion.split("</p>");
		   String [] strarr1 = str1.split("</p>");
		   for(int i = 0; i<strarr.length; i++){
			   String str = strarr[i];
			   str = str.replaceAll("<p>","");
			   
			   String strr = strarr1[i];
			   strr = strr.replaceAll("<p>","");
			   int i1 = Integer.parseInt(strr);
			   shortfullcount = shortfullcount+i1;
			   
			   String s = str+ "("+strr+")";			   
			   ashortmark.add(s);			   
		   }
		  
		   
		   String [] strarrr = smquestion.split("</p>");
		   String [] strarrr1 = str2.split("</p>");
		   for(int i = 0; i<strarrr.length; i++){
			   String strr = strarrr[i];
			   
			   String strrr = strarrr1[i];
			   strrr = strrr.replaceAll("<p>","");
			   int i1 = Integer.parseInt(strrr);
			   bigcount = bigcount+i1;
			   
			   String s = strr+"("+strrr+")";			   
			   abriefmark.add(s);			   
		   }
		 		  
		//getting all the answers from jsp page ends
		  int totalmark = shortfullcount+bigcount;	
		  		  
		  ArrayList assignmentlist = db8.getassignmentlist(user_id,course_code);
		  String assign_marks = null;
		  String assign_name = null;
		  String strassign = null;
		  float fmarks = 0;
		  int imarks = 0;
		  		  
			if(assignmentlist != null && assignmentlist.size() != 0){
				Iterator itr = assignmentlist.iterator();
				while(itr.hasNext()){
					String str[] = (String[])itr.next();
					assign_marks = str[0];
					assign_name = str[1];
					
					strassign = assign_marks.substring(0,assign_marks.length()-4);
					fmarks = Float.parseFloat(strassign);
					imarks = (int) (imarks+fmarks);				
				}
			}
		  
		  
String status = db8.submitexam(user_id, grade_status, assign_status, examdate, course_code, exam_name, exam_id, briefanswerfull, shortanswerfull, str1, str2, totalmark,shortmarki,briefmarki); 
		   
		  
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	 request.setAttribute("course_name", course_name);
	 request.setAttribute("exam_name", exam_name);
	 request.setAttribute("course_code", course_code);
	 request.setAttribute("smquestion", smquestion);
	 request.setAttribute("tmquestion", tmquestion);
	 request.setAttribute("abriefmark", abriefmark);
	 request.setAttribute("ashortmark", ashortmark);
	 request.setAttribute("exam", "exam");
	 
	  return new ModelAndView("exammarkshow");
 }
 else if(examProcess!=null && examProcess.equalsIgnoreCase("submitexamdocument")){
	 
	 String user_id=(String) session.getAttribute("user_id");		
		 String assign_status="Submitted";
		 String grade_status="Not yet given";
		 
	 String answer=null;String exam_name=null;String filelocation=null;String file_name=null;
	 String course_code = null;
	 String shortcount = null;
	 String briefcount = null;
	
	 String shortanswer = null;
	 String briefanswer = null;
	 ArrayList shortanswerlist = new ArrayList();
	 ArrayList briefanswerlist = new ArrayList();
	 
	 try {
				
		 String fileSavePath;
		    final String UPLOAD_DIRECTORY = "C://examdocuments//";

		    
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
		                        String saveFile = fileSavePath+name;
		                        filelocation = saveFile;file_name=name;
		                    } else {
		                        resp = "<br>The user did not upload a file for this part.";
		                    }
		                }
		                if(_part.isParam()){
		                	
		                	 ParamPart paramPart = (ParamPart)_part;
		                	 
		                	 if(genName.equals("shortcount")){
		                		 log.info(" shortcount val is 1"+shortcount);
		                		 shortcount = paramPart.getStringValue();
		                		 log.info(" shortcount val is 2"+shortcount);
		                	  }
		                	  if(genName.equals("briefcount")){
		                		  log.info(" briefcount val is 1 "+briefcount);
		                		  briefcount = paramPart.getStringValue();		
		                		  log.info(" briefcount val is 2 "+briefcount);
		                	  }
		                	  log.info("briefcount "+briefcount+" shortcount "+shortcount);
		                	  int countshorti = Integer.parseInt(shortcount);
		                	  int countbriefj = Integer.parseInt(briefcount);
		                	  
		                	  for(int shorti = 0; shorti<countshorti; shorti++){
		                		  if(genName.equals("shortanswer"+i+1)){
		                			  log.info(" shortanswer val is 1 "+shortanswer);
		                			  shortanswer = paramPart.getStringValue();	
		                			  shortanswerlist.add(shortanswer);
		                			  log.info(" shortanswer val is 2 "+shortanswer);
			                	  }	
		                	  }
		                	  
		                	  for(int briefj = 0; briefj<countbriefj; briefj++){
		                		  if(genName.equals("briefanswer"+i+1)){
		                			  log.info(" briefanswer val is 1 "+briefanswer);
		                			  briefanswer = paramPart.getStringValue();	
		                			  briefanswerlist.add(briefanswer);
		                			  log.info(" briefanswer val is 2 "+briefanswer);
			                	  }	
		                	  }
		                	  if(genName.equals("answer")){
		                		  answer = paramPart.getStringValue();		                           
		                	  }	
		                	  if(genName.equals("exam_name")){
		                		  exam_name = paramPart.getStringValue();		                         	
		                	  }		                	  
		                	  if(genName.equals("course_code")){
		                		  course_code = paramPart.getStringValue();		                         	
		                	  }
		                	  
		                }		            
		            }// end while 
		    
		           
//String status=db8.submitexam(user_id,answer,grade_status,assign_status,exam_name,filelocation,file_name,course_code); 
		   log.info("from xam submissioin -------------- "+user_id+" "+answer+" "+grade_status+" "+assign_status+" "+exam_name+" "+filelocation+" "+file_name+" "+course_code);
        		 
                	  
		        } catch (java.io.IOException ioe) {
		            resp = ioe.getMessage();
		        }
		        request.setAttribute("message", resp);
		
//request.setAttribute("status", status);		
	}catch(Exception e){
		e.printStackTrace();
	}
	  request.setAttribute("exam", "exam");
	  return new ModelAndView("assignsuccess");
 }
 else if(examProcess!=null && examProcess.equalsIgnoreCase("showexamsubmissiondetails")){
	
	 String exam_name = request.getParameter("exam_name");
	 String coursecode = request.getParameter("coursecode");
	 String course_name = request.getParameter("course_name");
	 String allow_date = request.getParameter("allow_date");
	 String exam_id = request.getParameter("exam_id");
	 
	 String tmquestion = null;
	 String smquestion = null;
	 
	 ArrayList questionlist = db8.getexamquestions(coursecode,exam_name,allow_date,exam_id);
	
	 if(questionlist != null){
		 Iterator itr = questionlist.iterator();
		 while(itr.hasNext()){
			 String strarr[] = (String[])itr.next();
			 tmquestion = strarr[0];
			 smquestion = strarr[1];
		 }
	 }
	 
	 request.setAttribute("tmquestion", tmquestion);
	 request.setAttribute("smquestion", smquestion);
	 request.setAttribute("exam_name", exam_name);
	 request.setAttribute("course_code", coursecode);
	 request.setAttribute("course_name", course_name);
	 request.setAttribute("exam_id", exam_id);
	 
	 return new ModelAndView("examshowsubmission");
	 
 }
 else if(examProcess!=null && examProcess.equalsIgnoreCase("valuationanswers")){
	 
	 String user_id = (String)session.getAttribute("user_id");
	 
	 String exam_name = request.getParameter("exam_name");
	 String course_code = request.getParameter("course_code");
	 String course_name = request.getParameter("course_name");
	 String exam_id = request.getParameter("exam_id");
	 
	 ArrayList submissionlist = db8.getsubmissionlist(course_code,exam_name,course_name,exam_id);
	 	 	
	 ArrayList notsubmittedlist = db8.getnotsubmittedlist(course_code,exam_name);
	 
	 request.setAttribute("user_id", user_id);
	 request.setAttribute("submissionlist", submissionlist);
	 request.setAttribute("notsubmittedlist", notsubmittedlist);
	 request.setAttribute("exam_name", exam_name);
	 request.setAttribute("course_code", course_code);
	 request.setAttribute("course_name", course_name);
	 request.setAttribute("studentindi", null);
	 request.setAttribute("exam_id", exam_id);
	 
	 return new ModelAndView("examvaluation");
 }
 else if(examProcess!=null && examProcess.equalsIgnoreCase("assigncoursestudents")){
	 
	 String course_code = request.getParameter("course_code");
	 String  user_id=request.getParameter("user_id");
	 
	 ArrayList studentdetails = new ArrayList();
	 ArrayList studentlist = db8.getstudentlist(course_code);
	 if(studentlist != null){
		 Iterator itr = studentlist.iterator();
		 while(itr.hasNext()){
			 String studentuserid = (String)itr.next();
			 ArrayList studentlist1 = db8.getstudentlist1(studentuserid);
			 studentdetails.addAll(studentlist1);
		 }
	 }
	 	 
	 ArrayList cmcourselist=db.getcourseforcoursementor(user_id);
	
	 request.setAttribute("course_code", course_code);
	 request.setAttribute("user_id", user_id);
	 request.setAttribute("cmcourselist", cmcourselist);
	 request.setAttribute("studentdetails", studentdetails);
	 request.setAttribute("studentindi", "studentindi");
	 return new ModelAndView("assignforparticular");
 }
	 
 else if(examProcess!=null && examProcess.equalsIgnoreCase("initarrearlist")){
	 
	 String user_id = (String)session.getAttribute("user_id");
	 
	 ArrayList sarrearlist = new ArrayList();
	
	 ArrayList arrearList = db8.getArrearList(user_id);
	 
	 String shotarr[] = null;
	 String briefarr[] = null;
	 
	 if(arrearList != null){	
		 		
		 String coursename = null;
		 String semester = null;
		 String status = null;

			Iterator itr = arrearList.iterator();
			while(itr.hasNext()){
				String str[] = (String[])itr.next();
				String course_code = str[0];
				String exam_name = str[1];	
		    	String exam_date = str[2];
		    	String shortmark = str[3];
		    	String briefmark = str[4];
		    	String totalmark = str[5];
		    	String shortactmark = str[6];
		    	String briefactmark = str[7];
		    	
		    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    	SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
		    	Date date = formatter.parse(exam_date);
		    	
		    	String strdate = formatter1.format(date);
		    	
		    	semester = db8.getsemester(course_code,strdate);
		    	
		    	 coursename = db8.getcoursename(course_code);
		    	 
		    	 shotarr = shortmark.split("</p>");
		    	 int shorti = shotarr.length;		    	
		    	 
		    	 briefarr = briefmark.split("</p>");
		    	 int briefi = briefarr.length;		    	
		    	 
		    	
		    	int totalcount = Integer.parseInt(totalmark);
		    		    			    	
		    	int ishortmark = shorti*Integer.parseInt(shortactmark);
		    	int ibriefmark = briefi*Integer.parseInt(briefactmark);
		    			    			    	
		    	int acccount = ishortmark+ibriefmark;
		    	
		    	String marktook = Integer.toString(acccount);
		    	if(totalcount >= acccount/2){
		    		status = "Pass";		    		
		    		ishortmark = 0;
		    		ibriefmark = 0;
		    		shorti = 0;
		    		briefi = 0;    		
		    		
		    	}else{
		    		status = "fail";		    		
		    		ishortmark = 0;
		    		ibriefmark = 0;
		    		shorti = 0;
		    		briefi = 0;
		    	}
		    	String strarr[] = {exam_name,exam_date,totalmark,marktook,coursename,status,semester};
	    		sarrearlist.add(strarr); 
			}
		}
	 	 	 
	 request.setAttribute("user_id", user_id);
	 request.setAttribute("sarrearlist", sarrearlist);
	 	 
	 return new ModelAndView("arrearlist");
 }
		 
 else if(examProcess!=null && examProcess.equalsIgnoreCase("initrevaluation")){
	 
	 String user_id = (String)session.getAttribute("user_id");
	 
	 ArrayList sarrearlist = new ArrayList();
	
	 ArrayList arrearList = db8.getArrearList(user_id);
	 
	 if(arrearList != null){	
		 		
		 String coursename = null;
		 String semester = null;
		 String status = null;

			Iterator itr = arrearList.iterator();
			while(itr.hasNext()){
				String str[] = (String[])itr.next();
				String course_code = str[0];
				String exam_name = str[1];	
		    	String exam_date = str[2];
		    	String shortmark = str[3];
		    	String briefmark = str[4];
		    	String totalmark = str[5];
		    	String shortactmark = str[6];
		    	String briefactmark = str[7];
		    	String revaluation_status = str[8];
		    	
		    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    	SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
		    	Date date = formatter.parse(exam_date);
		    	
		    	String strdate = formatter1.format(date);
		    	
		    	semester = db8.getsemester(course_code,strdate);
		    	
		    	 coursename = db8.getcoursename(course_code);
		    	 
		    	 String shotarr[] = shortmark.split("</p>");
		    	 int shorti = shotarr.length;		    	
		    	 
		    	 String briefarr[] = briefmark.split("</p>");
		    	 int briefi = briefarr.length;		    	
		    	 
		    	int totalcount = Integer.parseInt(totalmark);
		    		    			    	
		    	int ishortmark = shorti*Integer.parseInt(shortactmark);
		    	int ibriefmark = briefi*Integer.parseInt(briefactmark);
		    	 		    			    	
		    	int acccount = ishortmark+ibriefmark;
		    	
		    	String marktook = Integer.toString(acccount);
		    	if(totalcount >= acccount/2){
		    		status = "Pass";		    		
		    	}else{
		    		status = "fail";
		    		String strarr[] = {exam_name,exam_date,totalmark,marktook,coursename,status,semester,course_code,revaluation_status};
		    		sarrearlist.add(strarr);
		    	}
		    	
			}
		}
	 	 	 
	 request.setAttribute("user_id", user_id);
	 request.setAttribute("sarrearlist", sarrearlist);
	 	 
	 return new ModelAndView("revaluation");
 }
		
 else if(examProcess!=null && examProcess.equalsIgnoreCase("assignrevaluation")){
	 
	 String user_id = request.getParameter("user_id");
	 String examname = request.getParameter("exam_name");	 
	 String course_name = request.getParameter("coursename");	 
	 
	 String examdate = request.getParameter("exam_date");
	 String coursecode = request.getParameter("course_code");
	 
	 
	 ArrayList sarrearlist = new ArrayList();
		
	 ArrayList arrearList = db8.getArrearList(user_id);
	 
	 if(arrearList != null){	
		 		
		 String coursename = null;
		 String semester = null;
		 String status = null;

			Iterator itr = arrearList.iterator();
			while(itr.hasNext()){
				String str[] = (String[])itr.next();
				String course_code = str[0];
				String exam_name = str[1];	
		    	String exam_date = str[2];
		    	String shortmark = str[3];
		    	String briefmark = str[4];
		    	String totalmark = str[5];
		    	String shortactmark = str[6];
		    	String briefactmark = str[7];
		    	String revaluation_status = str[8];
		    	
		    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    	SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
		    	Date date = formatter.parse(exam_date);
		    	
		    	String strdate = formatter1.format(date);
		    	
		    	semester = db8.getsemester(course_code,strdate);
		    	
		    	 coursename = db8.getcoursename(course_code);
		    	 
		    	 String shotarr[] = shortmark.split("</p>");
		    	 int shorti = shotarr.length;		    	
		    	 
		    	 String briefarr[] = briefmark.split("</p>");
		    	 int briefi = briefarr.length;		    	
		    	 
		    	int totalcount = Integer.parseInt(totalmark);
		    		    			    	
		    	int ishortmark = shorti*Integer.parseInt(shortactmark);
		    	int ibriefmark = briefi*Integer.parseInt(briefactmark);
		    	 		    			    	
		    	int acccount = ishortmark+ibriefmark;
		    	
		    	String marktook = Integer.toString(acccount);
		    	if(totalcount >= acccount/2){
		    		status = "Pass";		    		
		    	}else{
		    		status = "fail";
		    		String strarr[] = {exam_name,exam_date,totalmark,marktook,coursename,status,semester,course_code,revaluation_status};
		    		sarrearlist.add(strarr);
		    	}
		    	
			}
		}
	 
	 String restatus = db8.updaterevaluation(user_id,examname,coursecode,examdate);
	 
	 request.setAttribute("restatus", restatus);
	 request.setAttribute("user_id", user_id);
	 request.setAttribute("sarrearlist", sarrearlist);
	 
	 return new ModelAndView("revaluation");
 }
		 
 else if(examProcess!=null && examProcess.equalsIgnoreCase("initrevaluationlist")){
	 
	 String user_id = (String)session.getAttribute("user_id");
	 
	  
	 ArrayList coursecode = db8.getcourse_code(user_id);
	 ArrayList revaluation = null;
	 ArrayList revaluationlist = new ArrayList();
	 String course_code = null;
	 	 
	 if(coursecode != null){
		 Iterator itr = coursecode.iterator();
		 while(itr.hasNext()){
			 course_code = (String)itr.next();
			 
			 revaluation = db8.getrevaluationlist(course_code);
			 		 
			 revaluationlist.addAll(revaluation);
		 }
	 }
	 	 
	 request.setAttribute("user_id", user_id);
	 request.setAttribute("revaluationlist", revaluationlist);
	 request.setAttribute("showanswers", null);
	 	 
	 return new ModelAndView("revaluationlist");
 }
		 
 else if(examProcess !=null && examProcess.equalsIgnoreCase("updaterevaluation")){
	 
	 String studentname = request.getParameter("studentname");
	 String student_user_id = request.getParameter("student_user_id");
	 String course_code = request.getParameter("course_code");
	 String exam_name = request.getParameter("exam_name");
	 String exam_date = request.getParameter("exam_date");
	 String course_name = request.getParameter("course_name");
	 String exam_frm_id = request.getParameter("exam_frm_id");
	 	
	 request.setAttribute("exam_frm_id", exam_frm_id);
	 request.setAttribute("studentname", studentname);
	 request.setAttribute("user_id", student_user_id);
	 request.setAttribute("course_code", course_code);
	 request.setAttribute("course_name", course_name);
	 request.setAttribute("exam_name", exam_name);
	 request.setAttribute("exam_date", exam_date);
	 request.setAttribute("revalExam", "revalExam");
	 
	 return new ModelAndView("givegrade");
 }
		 
		 
else if(examProcess !=null && examProcess.equalsIgnoreCase("couponname")){
	 
	
	 String json = null;
	 String couponcode=request.getParameter("prog");
	 String cost=request.getParameter("cost");
	 System.out.println("parasu checking -----couponcode--->"+couponcode);
	 System.out.println("parasu checking -----cost--->"+cost);
	 String offer=db1.getcouponoffer(couponcode);
	 System.out.println("parasu checking -----offer--->"+offer);
	
	if(offer != null){
		int off = Integer.parseInt(offer);
		double aa=Double.parseDouble(cost);  
		int amount = (int)Math.round(aa);
		 
		int to=amount*off/100;
		int total=amount-to;
		db1.updatecouponstatus(couponcode);
		json = new Gson().toJson(total);				 
	     response.setContentType("application/json");	             
	     response.getWriter().write(json);
	}else{
		
		json = new Gson().toJson(offer);				 
	     response.setContentType("application/json");	             
	     response.getWriter().write(json);
	}
	 
	 
 }
		 
 else if(examProcess !=null && examProcess.equalsIgnoreCase("fullanswers")){
	 
	 String student_user_id = request.getParameter("student_user_id");
	 String exam_name = request.getParameter("exam_name");
	 String exam_date = request.getParameter("exam_date");
	 String coursecode = request.getParameter("course_code");
	 String course_name = request.getParameter("course_name");
	 String studentname = request.getParameter("studentname");
	 String manualcorrection = request.getParameter("manualcorrection");
	 String exam_frm_id = request.getParameter("exam_frm_id");
	 
	 log.info("exam_frm_id "+exam_frm_id);
	 
	 String mentoruser_id = request.getParameter("user_id");
	 	 
	 ArrayList answerlist = db8.getanswers(student_user_id,coursecode,exam_date,exam_frm_id);
	 	 
	//for revaluation applied list 
	 ArrayList coursecodedetails = db8.getcourse_code(mentoruser_id);
	 ArrayList revaluation = null;
	 ArrayList revaluationlist = new ArrayList();
	 String course_code = null;
	 	 
	 if(coursecodedetails != null){
		 Iterator itr = coursecodedetails.iterator();
		 while(itr.hasNext()){
			 course_code = (String)itr.next();
			
			 revaluation = db8.getrevaluationlist(course_code);
			 		 
			 revaluationlist.addAll(revaluation);
		 }
	 }
	 
	 request.setAttribute("exam_frm_id", exam_frm_id);
	 request.setAttribute("user_id", mentoruser_id);
	 request.setAttribute("revaluationlist", revaluationlist);
	 request.setAttribute("answerlist", answerlist);
	 request.setAttribute("showanswers", "showanswers");
	 request.setAttribute("studentname", studentname);
	 request.setAttribute("course_name", course_name);
	 
	 return new ModelAndView("revaluationlist");
 }
		 
else if(examProcess !=null && examProcess.equalsIgnoreCase("fullanswersmanualcorrection")){
	 
	 String student_user_id = request.getParameter("student_user_id");
	 String exam_name = request.getParameter("exam_name");
	 String exam_date = request.getParameter("exam_date");
	 String coursecode = request.getParameter("course_code");
	 String course_name = request.getParameter("course_name");
	 String studentname = request.getParameter("studentname");
	 	 
	 String mentoruser_id = request.getParameter("user_id");
	 
	 ArrayList answerlist = db8.getanswers(student_user_id,coursecode,exam_date);
	 	 
	 
	 request.setAttribute("user_id", mentoruser_id);	 
	 request.setAttribute("answerlist", answerlist);
	 request.setAttribute("showanswers", "showanswers");
	 request.setAttribute("studentname", studentname);
	 request.setAttribute("course_name", course_name);
	 request.setAttribute("student_user_id", student_user_id);
	 request.setAttribute("exam_date", exam_date);
	 request.setAttribute("coursecode", coursecode);
	 request.setAttribute("exam_name", exam_name);
	 
	 return new ModelAndView("manualexamcorrection");
 }
		 
		 
		 
		}catch(Exception e)
        {
            log.info(e.getMessage());
        }
		return null;
	
	}
	
}
