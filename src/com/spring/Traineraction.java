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


import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ProtocolException;
import java.net.URL;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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

import com.util.adminDB;
import com.util.baseDB;
import com.util.examDB;
import com.util.studentDB;
import com.util.trainerDB;
import com.util.userDB;

@Controller
public class Traineraction {
	
	static Logger log = Logger.getLogger(Traineraction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
 
	String course_id=null;
	
	@RequestMapping("/trainer.html")
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
		trainerDB db4 = trainerDB.getInstance();
		adminDB db1 = adminDB.getInstance();		
		baseDB db6 = baseDB.getInstance();
		examDB db8 = examDB.getInstance();
		CommonForAll common = CommonForAll.getInstance();
		 HttpSession session=request.getSession(true); 
		
		
		 String TrainerProcess = request.getParameter("TrainerProcess");
		 String pro = request.getParameter("cmd");
		 String Quiz = request.getParameter("Quiz");
		 String Assign = request.getParameter("Assign");
		 String Map = request.getParameter("Map");
		 String FileUpload = request.getParameter("FileUpload");
		 
		 		 
		 if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AssignProcess")){
			 if(Assign!=null && Assign.equalsIgnoreCase("Create")){
				 
				 String ques = request.getParameter("question1");
			 String question = "";
			 			 
			 SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
			 SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
			 
			 	 
		     String assign_name = request.getParameter("assignname");
		     String coursecode = request.getParameter("coursecode");
			 //String quess = request.getParameter("question");
			 String questionCount = request.getParameter("assignmentquesC");
			 
			// String user_id=(String)session.getAttribute("user_id");
			// String username=db1.getusername(user_id); 
			 
			 System.out.println("questionCount "+questionCount);
			 
			 if(questionCount != null && questionCount != ""){
				 int quescountstr = Integer.parseInt(questionCount);
				 log.info("quescountstr "+quescountstr);
				 
					 for(int i=1; i<=quescountstr; i++){
						 question = question+"<p>"+i+"."+request.getParameter("question"+i)+"</p>";
						 log.info("question is "+question);
					 }
				 
			 }else{
				 question = ques;
				 log.info("question from else is "+question);
			 }
			 
			 
			
			 
			 
			 
				/* String criteria= "\n";
			 
			String [] strarr = quess.split(criteria);
				for( int i =0; i<strarr.length; i++)
				{
					question=question+"<p>"+strarr[i]+"</p>";
				} */
				
			 String allow_dat=request.getParameter("allowdate");
			 String last_dat=request.getParameter("lastdate");
			
			 Date allow_date=null;
			 Date last_date=null;
		
			 if (allow_dat != null && allow_dat.trim().length() != 0) {
				 try {
					 Date date1 = (Date) formatter1.parse(allow_dat);
					 String strdate1 = sdf.format(date1);					 
					allow_date = (Date) sdf.parse(strdate1);
				} catch (ParseException e) {					
					e.printStackTrace();
				}
               }
			 if (last_dat != null && last_dat.trim().length() != 0) {
				 try {
					 Date date2 = (Date) formatter1.parse(last_dat);
					 String strdate2 = sdf.format(date2);	
					last_date = (Date) sdf.parse(strdate2);
				} catch (ParseException e) {					
					e.printStackTrace();
				}
              }
					 
			 
			// java assignment
			String status=db4.addassign(assign_name,question,coursecode,allow_date,last_date);
			 request.setAttribute("status", status);
			 return new ModelAndView("createassign");
				  }
			 
			 if(Assign != null && Assign.equals("CreateParticular")){
				 
				 SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
				 SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
				 
				 String quesTemp = request.getParameter("question1");
				 String coursecode=request.getParameter("coursecode");
				 String assignname=request.getParameter("assignname");			     
				 //String s=request.getParameter("question");
				 String user_id=request.getParameter("user_id");
				 String allow_dat=request.getParameter("allowdate");
				 String last_dat=request.getParameter("lastdate");
				 //String username=db1.getusername(user_id); 
				 String studentcount=request.getParameter("studentcount");
				 String student[] = null;
				 //String criteria= "\n";
				 String status = null;
				 String question ="";
				 
				 String questionCount = request.getParameter("assignmentquesC");
				 
				 if(questionCount != null && questionCount != ""){
					 int quescountstr = Integer.parseInt(questionCount);
					 log.info("quescountstr "+quescountstr);
					 
					 for(int i=1; i<=quescountstr; i++){
						 question = question+"<p>"+i+"."+request.getParameter("question"+i)+"</p>";
						 log.info("question is "+question);
					 }
				 }else{
					 question = quesTemp;
				 }
				 
				 
				 
				/* String [] strarr = s.split(criteria);
					for( int i =0; i<strarr.length; i++)
					{
						question=question+"<p>"+strarr[i]+"</p>";
					} */
				
				 
				 Date allow_date=null;
				 Date last_date=null;
			
				 if (allow_dat != null && allow_dat.trim().length() != 0) {
					 try {
						 Date date1 = (Date) formatter1.parse(allow_dat);
						 String strdate1 = sdf.format(date1);					 
						allow_date = (Date) sdf.parse(strdate1);
					} catch (ParseException e) {					
						e.printStackTrace();
					}
	               }
				 if (last_dat != null && last_dat.trim().length() != 0) {
					 try {
						 Date date2 = (Date) formatter1.parse(last_dat);
						 String strdate2 = sdf.format(date2);	
						last_date = (Date) sdf.parse(strdate2);
					} catch (ParseException e) {					
						e.printStackTrace();
					}
	              }
				 
				 int i = Integer.parseInt(studentcount);
				 for(int j=0; j<i; j++){
					String studentuserid = request.getParameter("student"+j);
					if(studentuserid != null){
					 status = db8.setAssignParticular(studentuserid,assignname,question,coursecode,allow_date,last_date); 
					 log.info("student name "+studentuserid);
					}
					
				 }
				 
 log.info(" coursecode "+coursecode+" assignname "+assignname+" question "+question+" user_id "+user_id+" allow_dat "+allow_dat+" last_dat "+last_dat+" student "+student);
 				
 ArrayList cmcourselist=db.getcourseforcoursementor(user_id);

 			request.setAttribute("course_code", coursecode);
 			request.setAttribute("user_id", user_id);
 			request.setAttribute("cmcourselist", cmcourselist); 			
 			request.setAttribute("studentindi", null);
 			request.setAttribute("status", status);
				
				 return new ModelAndView("assignforparticular");
			 }			
		 }		 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("showquiz")){
			 
			 String quiz_name = request.getParameter("quiz_name");
			 String test_id = request.getParameter("test_id");
			 String course_code = request.getParameter("course_code");
			 
			 request.setAttribute("coursecode", course_code);
			 request.setAttribute("quizname_id", test_id);
			 request.setAttribute("quizname", quiz_name);
			 
			 return new ModelAndView("createnextquiz"); 
		 }
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("givegrade")){
			
			 String grade = request.getParameter("grade");
			 String user_id = request.getParameter("user_id");
			 String comment = request.getParameter("comment");
			 String assign_name = request.getParameter("assign_name");
			 String exam_name = request.getParameter("exam_name");
			 String reassign = request.getParameter("reassign");
			 
			 String course_code = request.getParameter("course_code");
			 String exam_date = request.getParameter("exam_date");
			 
			 String exam = request.getParameter("exam");
			 String reexam = request.getParameter("reexam");
			 String assignment = request.getParameter("assignment");
			 String reassignment = request.getParameter("reassignment");
			 
			 log.info("exam "+exam+" reexam "+reexam+" assignment "+assignment+" reassignment "+reassignment);
			 
			 String status = null;
			 
			 log.info("grade "+grade+" user_id "+user_id+" comment "+comment+" assign_name "+assign_name+" exam_name "+exam_name+" reassign "+reassign+" course_code "+course_code+" exam_date "+exam_date);
			 
			 if(assignment != null && assignment.equalsIgnoreCase("assignment")){
				 db4.updategrade(grade,comment,assign_name,user_id);
				 status = "Assignment Mark Updated Successfully";
				 log.info("this is for assign grade grade "+grade+" comment "+comment +" assign_name "+assign_name+" user_id "+user_id);
			 }
			 if(exam != null && exam.equalsIgnoreCase("exam")){
				 db4.updateexamgrade(grade,exam_name,user_id);
				 status = "Exam Mark Updated Successfully";
				 log.info("this is for exam grade grade "+grade+" exam_name "+exam_name +" user_id "+user_id);
			 }
			 if(reassignment != null && reassignment.equalsIgnoreCase("reassignment")){
				 db4.updatereassigngrade(grade, comment, assign_name, user_id);	
				 status = "Re-Assignment Mark Updated Successfully";
				 log.info("this is for reassign grade grade "+grade+" comment "+comment +" assign_name "+assign_name+" user_id "+user_id);
			 }
			 if(reexam != null && reexam.equalsIgnoreCase("reexam")){
				 db4.updateexamrevaluation(grade,user_id,course_code,exam_name,exam_date);
				 status = "Exam Revaluation Mark Updated Successfully";
				 log.info("this is for exam revaluation grade grade "+grade+" course_code "+course_code +" exam_name "+exam_name+" user_id "+user_id+" exam_date "+exam_date);
			 }
			 
			 log.info("grade "+grade+" user_id "+user_id +" exam_name "+exam_name+" exam_date "+exam_date+ " course_code "+course_code);
			 
			 request.setAttribute("status", status);
			 
			 return new ModelAndView("givegrade");
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initshowquiz")){
			 
			 String test_id = request.getParameter("test_id");
			 String course_code = request.getParameter("test_id");
			 			 
			 String quiz_name = request.getParameter("quiz_name"); 
			 //String quizname_id = db5.getquizid(quiz_name);
			 
			 ArrayList question_name = db5.getquizquestionname(test_id);
			 request.setAttribute("question_name", question_name);
			 request.setAttribute("quiz_name", quiz_name);
			 request.setAttribute("test_id", test_id);
			 request.setAttribute("course_code", course_code);
			 
			 return new ModelAndView("traishowquiz");
		 }		
		 
		/* else if(pro!=null && pro.equalsIgnoreCase("initcreatequiz")){
			 String  user_id=(String)session.getAttribute("user_id");
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
			 request.setAttribute("cmcourselist", cmcourselist);
				return new ModelAndView("createquiz");	
			}*/
		 else if(pro!=null && pro.equalsIgnoreCase("initcoursematerial")){
			 ArrayList coursematerial=db5.getcoursematerial(course_id);
			 request.setAttribute("coursematerial", coursematerial);
				return new ModelAndView("coursematerial");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initshowcourselist")){
			 String categoryid = request.getParameter("categoryid");
			 ArrayList colist=db1.getsubcourse(categoryid);
			 String course_name = request.getParameter("course_name");
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("colist", colist);
				return new ModelAndView("trishowcourselist");	
			}
 else if(pro!=null && pro.equalsIgnoreCase("initeventcreation")){
			 
			 String user_id=(String)session.getAttribute("user_id");
			 ArrayList programList=db1.getProgram_id(user_id);
			 request.setAttribute("programList", programList);
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
			 request.setAttribute("courselist", cmcourselist);
				return new ModelAndView("createEvent");	
			}
		 
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initcreateassignment")){
			String  user_id=(String)session.getAttribute("user_id");
		
			 request.setAttribute("user_id", user_id);
				return new ModelAndView("chooseassigntype");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("assignmentforall")){
			 String  user_id=request.getParameter("user_id");
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
			 request.setAttribute("cmcourselist", cmcourselist);
			 return new ModelAndView("createassign");	
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("assignmentforparticular")){
			 String  user_id=request.getParameter("user_id");
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id);
		 			 
			 request.setAttribute("user_id", user_id);
			 request.setAttribute("cmcourselist", cmcourselist);
			 return new ModelAndView("assignforparticular");
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initcoursein")){
				return new ModelAndView("error");	
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initstudentpaidlist")){
			 String user_id = request.getParameter("user_id");
			 ArrayList paidlist=db5.getpaidstudentlist(user_id);
			 request.setAttribute("paidlist", paidlist);
			 request.setAttribute("user_id", user_id);
				return new ModelAndView("studentpaidforapproval");	
			}
 else if(pro!=null && pro.equalsIgnoreCase("initstudentpaymentlist")){
			 
			 ArrayList allpaidlist=db5.getallpaidstudentlist();
			 request.setAttribute("allpaidlist", allpaidlist);
				return new ModelAndView("studentpaidlist");	
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initshowwork")){
			 String course_name = request.getParameter("course_name");
			 String course_code = request.getParameter("course_code");
			
			 log.info("course_name --> "+course_name+" course_code --> "+course_code);
			 
			// course_id=db1.getsubcourseid(course_name);;
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("course_name", course_name);
			
			 ArrayList assign_name = db5.getassignname(course_code);
			 request.setAttribute("assign_name", assign_name);
			 			 
			 
			 ArrayList quiz_name = db5.getquizname(course_code);
			 request.setAttribute("quiz_name", quiz_name);
			 
			 
			 
			 ArrayList reassign_name = db5.getreassignname(course_code);
			 request.setAttribute("reassign_name", reassign_name);
			 
			 
			 ArrayList examdetails = db8.getexamdetails(course_code);
			 request.setAttribute("examdetails", examdetails);
			
			 log.info("assign_name --> "+assign_name.size()+" quiz_name --> "+quiz_name.size());
			 log.info("reassign_name --> "+reassign_name.size()+" examdetails --> "+examdetails.size());
			 // ArrayList coursematerial=db5.getcoursematerial(course_code);
			 // request.setAttribute("coursematerial", coursematerial);
			 
				return new ModelAndView("traishowwork");
			
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initshowreassign")){
			 
			 String assign_id = request.getParameter("assign_id");
			 String assign_name = request.getParameter("assign_name");
			 String course_code = request.getParameter("course_code");
			 String course_name = request.getParameter("course_name");
			 String user_id = request.getParameter("user_id");
			 
			 String question=db5.getrequestionname(assign_id,assign_name);
			 
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
			 
			 request.setAttribute("question", question);
	 	 	 request.setAttribute("lastdate", lastdate);
			 request.setAttribute("allowdate", allowdate);
			 request.setAttribute("currentdate", currentdate);
			 request.setAttribute("days", days);
			 request.setAttribute("user_id", user_id);
				
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("assign_name", assign_name);
			 
			 return new ModelAndView("traishowreassign");
		 }
		
		 else if(pro!=null && pro.equalsIgnoreCase("initshowassign")){
			 
			 String assign_id = request.getParameter("assign_id");
			 String assign_name = request.getParameter("assign_name");
			 String course_code = request.getParameter("course_code");
			 String course_name = request.getParameter("course_name");			
			 //course_id=db1.getsubcourseid(course_name);
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("assign_name", assign_name);
			 String question=db5.getquestionname(assign_id,assign_name);
			 String lastdate=db5.getlastdate(assign_name);
			 String days = common.getdate(lastdate);
			 String allowdate = db5.getallowdate(assign_name);
			 String currentdate = common.getcurrentdate();
			 request.setAttribute("lastdate", lastdate);
			 request.setAttribute("allowdate", allowdate);
			 request.setAttribute("currentdate", currentdate);
			 request.setAttribute("days", days);
			 request.setAttribute("question", question);
				return new ModelAndView("traishowassign");	
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initviewreassign")){
			 String course_code = request.getParameter("course_code");
			 String assign_name = request.getParameter("assign_name");
			 String course_name = request.getParameter("course_name");
			 
			 ArrayList reassignuserlist = db4.getreassignuserdetails(course_code,assign_name);
			 
			 ArrayList reassignnotsub = db4.getreassignnotsubmitted(course_code,assign_name);
			 
			 request.setAttribute("reassignnotsub", reassignnotsub);
			 request.setAttribute("reassignuserlist", reassignuserlist);
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("assign_name", assign_name);
			 request.setAttribute("reassign", "reassign");
			 request.setAttribute("course_name", course_name);
			 
			 return new ModelAndView("reassignsubmited");	
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initviewuser")){
			 String course_code = request.getParameter("course_code");
			 String course_name = request.getParameter("course_name");
			 String assign_name = request.getParameter("assign_name");
			 String question = request.getParameter("question");
			 String userid = null;
			 
			 ArrayList userlist = db4.getassignuserdetails(course_code,assign_name);
			 log.info("from assignment submission "+course_code);
			 		 
			 ArrayList notansuserid = db4.getnotansuserdetails(course_code,assign_name);
			 ArrayList userdetails = null;
			 ArrayList notansuserlist = new ArrayList();
			 
			 if(notansuserid != null && notansuserid.size() != 0){
				 Iterator itr = notansuserid.iterator();
				 while(itr.hasNext()){
					String str[] = (String[])itr.next();
					userid = str[0];
					userdetails = db4.getusernotsublist(userid);
					notansuserlist.addAll(userdetails);
					log.info("userid "+userid+" notansuserid "+notansuserid.size());
				 }
			 }
			 
					 			 
			 			 
			 request.setAttribute("userlist", userlist);
			 request.setAttribute("notansuserlist", notansuserlist);
			 request.setAttribute("assign_name", assign_name);
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("question", question);
			 
			 return new ModelAndView("assignsubmiteduser");	 
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("reassignmentanswercorrection")){
			 
			 String student_user_id = request.getParameter("student_user_id");			
			 String name = request.getParameter("name");
			 String reassign = request.getParameter("reassign");
			 String course_code = request.getParameter("course_code");
			 String course_name = request.getParameter("course_name");
			 String assign_name = request.getParameter("assign_name");
			 
			 log.info("student_user_id "+student_user_id+" name "+name+" course_name "+course_name+" course_code "+course_code+" assign_name "+assign_name);
			 
			 ArrayList answerdetails=db4.getreassignmentanswers(student_user_id,course_code,assign_name);
			 
			 request.setAttribute("answerdetails", answerdetails);	
			 	 request.setAttribute("student_user_id", student_user_id);				
				 request.setAttribute("studentname", name);				
				 request.setAttribute("course_name", course_name);
				 request.setAttribute("course_code", course_code);
				 request.setAttribute("assign_name", assign_name);
				 request.setAttribute("reassign", reassign);
			 
			 return new ModelAndView("reassignmentanswers");	
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("assignmentanswercorrection")){
			 String student_user_id = request.getParameter("student_user_id");
			 //String answer_text = request.getParameter("answer_text");
			 String name = request.getParameter("name");
			 String course_name = request.getParameter("course_name");
			 String course_code = request.getParameter("course_code");
			 String assign_name = request.getParameter("assign_name");
			 //String question = request.getParameter("question");
			 log.info("student_user_id "+student_user_id+" name "+name+" course_name "+course_name+" course_code "+course_code+" assign_name "+assign_name);
			 
			
			 ArrayList answerdetails=db4.getassignmentanswers(student_user_id,course_code,assign_name);
			
			 request.setAttribute("answerdetails", answerdetails);
			 request.setAttribute("student_user_id", student_user_id);
			// request.setAttribute("answer_text", answer_text);
			 request.setAttribute("studentname", name);
			// request.setAttribute("question", question);
			 request.setAttribute("course_name", course_name);
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("assign_name", assign_name);
			 
			 return new ModelAndView("assignmentanswers");	 
		 }
else if(TrainerProcess !=null && TrainerProcess.equalsIgnoreCase("createEvent")){
			 
			 String program_id = request.getParameter("program_id");
			 String subprogram_id = request.getParameter("subprogram_id");
			 String course_id = request.getParameter("coursecode");
			 String title = request.getParameter("title");
			 String sdate = request.getParameter("startdate");
			 String edate = request.getParameter("enddate");
			 String description = request.getParameter("description");
			 
			
			 SimpleDateFormat formatter1 = new SimpleDateFormat("MM-dd-yyyy");
			 SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			 			 
			 String addEventDetails = null;
			 String startdate = null;
			 String enddate = null;		
			 
					Date stdate = formatter1.parse(sdate);
					Date eddate = formatter1.parse(edate);
					startdate = formatter2.format(stdate);
					enddate = formatter2.format(eddate);
									
					addEventDetails = db1.addEventDetails(program_id, subprogram_id, course_id, title, startdate, enddate, description);
								 
			 request.setAttribute("status", addEventDetails);
			 
			 return new ModelAndView("createEvent");
		 }
				
		 else if(pro!=null && pro.equalsIgnoreCase("initgivegrade")){
			 
			 String user_id = request.getParameter("user_id"); 
			 String assign_name = request.getParameter("assign_name");
			 String exam_name = request.getParameter("exam_name");
			 String course_code = request.getParameter("course_code");
			 String reassign = request.getParameter("reassign");
			 String exam_id = request.getParameter("exam_id");
			 
			 log.info("exam_id "+exam_id);
			 
			 ArrayList ulist = null;
			 
			 if(exam_id != null && exam_name != null && reassign == null){
				 ulist = db4.getexamgradedetails(user_id,exam_name,course_code,exam_id);
				 log.info("user_id from give grade 1 "+user_id+" "+exam_name+" "+course_code);
			 }
			 if(assign_name != null && reassign == null){
				 ulist = db4.getassign(user_id,assign_name,course_code);	 
				 log.info("user_id from give grade 2 "+user_id+" "+assign_name+" "+course_code);
			 }	
			 if(exam_name == null && reassign != null){
				 ulist = db4.getreassign(user_id,assign_name,course_code);	 
				 log.info("user_id from give grade 3 "+user_id+" "+assign_name+" "+course_code);
			 }	
			 
			 request.setAttribute("course_code", course_code);
			 request.setAttribute("ulist", ulist);
			 request.setAttribute("exam_name", exam_name);
			 request.setAttribute("assign_name", assign_name);
			 request.setAttribute("user_id", user_id);
			 request.setAttribute("reassign", reassign);
			 
			 return new ModelAndView("givegrade");
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initdeleteassignment")){
			 
			 String assign_id = request.getParameter("assign_id");
			 String assig_name = request.getParameter("assign_name");
			 String course_code = request.getParameter("course_code");
			 String course_name = request.getParameter("course_name");	
			 
			 db4.deleteassignment(assign_id,course_code);
			 		 
				
				// course_id=db1.getsubcourseid(course_name);
				 request.setAttribute("course_code", course_code);
				 request.setAttribute("course_name", course_name);
				
				 ArrayList assign_name=db5.getassignname(course_code);
				 request.setAttribute("assign_name", assign_name);
				 
				 ArrayList quiz_name=db5.getquizname(course_code);
				 request.setAttribute("quiz_name", quiz_name);
				 
				 ArrayList reassign_name=db5.getreassignname(course_code);
				 request.setAttribute("reassign_name", reassign_name);
				 
				 
				 ArrayList examdetails = db8.getexamdetails(course_code);
				 request.setAttribute("examdetails", examdetails);
				 
				// ArrayList coursematerial=db5.getcoursematerial(course_code);
				// request.setAttribute("coursematerial", coursematerial);
				 
					return new ModelAndView("traishowwork");
					
			}
		 
else if(pro!=null && pro.equalsIgnoreCase("initdeleteReassignment")){
			 
			 String assign_id = request.getParameter("assign_id");
			 String assig_name = request.getParameter("assign_name");
			 String course_code = request.getParameter("course_code");
			 String course_name = request.getParameter("course_name");	
			 
			 db4.deleteReassignment(assign_id,course_code);
			 		 
				
				// course_id=db1.getsubcourseid(course_name);
				 request.setAttribute("course_code", course_code);
				 request.setAttribute("course_name", course_name);
				
				 ArrayList assign_name=db5.getassignname(course_code);
				 request.setAttribute("assign_name", assign_name);
				 
				 ArrayList quiz_name=db5.getquizname(course_code);
				 request.setAttribute("quiz_name", quiz_name);
				 
				 ArrayList reassign_name=db5.getreassignname(course_code);
				 request.setAttribute("reassign_name", reassign_name);
				 
				 
				 ArrayList examdetails = db8.getexamdetails(course_code);
				 request.setAttribute("examdetails", examdetails);
				 
				// ArrayList coursematerial=db5.getcoursematerial(course_code);
				// request.setAttribute("coursematerial", coursematerial);
				 
					return new ModelAndView("traishowwork");
					
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initdeleteexam")){
			 
			 String exam_name = request.getParameter("exam_name");
			 String course_code = request.getParameter("course_code");
			 String allow_date = request.getParameter("allow_date");			
			 //db4.deleteassignment(assig_name,course_code);
			 
			 SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			 SimpleDateFormat formatter2 = new SimpleDateFormat("MM-dd-yyyy");
			 String allowdate = null;
			 
			 try {
				Date date = formatter1.parse(allow_date);
				allowdate = formatter2.format(date);
				
				log.info("allowdate "+allowdate);
				
				
				 log.info("exam_name "+exam_name+" course_code "+course_code+" allow_date "+allow_date);
				 
				 String status = db4.deleteExam(course_code,allowdate);
				 
				 log.info("status out "+status);
				 
				 if(status != null){
					 
					 log.info("status "+status);
				
					
					// course_id=db1.getsubcourseid(course_name);
					 request.setAttribute("course_code", course_code);
					 request.setAttribute("exam_name", exam_name);
					
					 //Assignment details
					 ArrayList assign_name=db5.getassignname(course_code);
					 request.setAttribute("assign_name", assign_name);
					 
					 //Test details
					 ArrayList quiz_name=db5.getquizname(course_code);
					 request.setAttribute("quiz_name", quiz_name);
					 
					 //Re-Assignment details
					 ArrayList reassign_name=db5.getreassignname(course_code);
					 request.setAttribute("reassign_name", reassign_name);
					 
					 //Exam details
					 ArrayList examdetails = db8.getexamdetails(course_code);
					 request.setAttribute("examdetails", examdetails);
					 
				 }
				
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 
			
				 
				// ArrayList coursematerial=db5.getcoursematerial(course_code);
				// request.setAttribute("coursematerial", coursematerial);
				 
					return new ModelAndView("traishowwork");
					
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initdeleteTest")){
			 
			 
			 try{
			 String test_id = request.getParameter("test_id");
			 String course_code = request.getParameter("course_code");
			 String quizname = request.getParameter("quiz_name");	
			 
			 String status = db4.deleteTest(test_id,course_code);		 
			
				 
				 log.info("status "+status);
			
				
				// course_id=db1.getsubcourseid(course_name);
				 request.setAttribute("course_code", course_code);
				 request.setAttribute("quiz_name", quizname);
				
				 //Assignment details
				 ArrayList assign_name=db5.getassignname(course_code);
				 request.setAttribute("assign_name", assign_name);
				 
				 //Test details
				 ArrayList quiz_name=db5.getquizname(course_code);
				 request.setAttribute("quiz_name", quiz_name);
				 
				 //Re-Assignment details
				 ArrayList reassign_name=db5.getreassignname(course_code);
				 request.setAttribute("reassign_name", reassign_name);
				 
				 //Exam details
				 ArrayList examdetails = db8.getexamdetails(course_code);
				 request.setAttribute("examdetails", examdetails);
				 
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			 
			 return new ModelAndView("traishowwork");
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initcreatequiz")){
			 
			 String  user_id=(String)session.getAttribute("user_id");
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
			 request.setAttribute("cmcourselist", cmcourselist);
			 
			 return new ModelAndView("createobjective");
		 }
	/*	 else if(pro!=null && pro.equalsIgnoreCase("descriptive")){
			 String  user_id=(String)session.getAttribute("user_id");
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
			 request.setAttribute("cmcourselist", cmcourselist);
						 
			 return new ModelAndView("createdescriptive");
		 }*/
		
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("QuizProcess")){
				
			 if(Quiz!=null && Quiz.equalsIgnoreCase("Next")){
				
				 String answer=null;
				 String questiontype = request.getParameter("questiontype");	
				 log.info("questiontype --> "+questiontype);
				 
				 if(questiontype.equalsIgnoreCase("objective")){				
				 
					 String coursecode = request.getParameter("coursecode");				 
			 String quizname = request.getParameter("quizname"); 			
			 String question = request.getParameter("question");			
			 String a = request.getParameter("a"); 
			 String b = request.getParameter("b");
			 String c = request.getParameter("c"); 
			 String d = request.getParameter("d");
			 String digi = request.getParameter("digi");
			 
			 log.info("coursecode ---> "+coursecode+" quizname ---> "+quizname+" question ---> "+question);
			 
			 if(digi.equalsIgnoreCase("a")){
				  answer=a; 
			 }else if(digi.equalsIgnoreCase("b")){
				  answer=b; 
			 }else if(digi.equalsIgnoreCase("c")){
				  answer=c; 
			 }else if(digi.equalsIgnoreCase("d")){
				  answer=d; 
			 }		  
			 
			 log.info("a --> "+a+" b --> "+b+" c --> "+c+" d --> "+d+" answer --> "+answer);
			
			 db4.addquizname(quizname,coursecode);
			
			 String quizname_id = db4.getquiznameid(quizname,coursecode);
			 
			 log.info("quizname_id --> "+quizname_id);
			 
			 if(quizname_id != null){
				 String status = db4.updatetestStatusActive(quizname_id);
				 log.info("status "+status);
			 }
				
			 db4.addquizquestion(quizname_id,question,a,b,c,d,answer);
			 
			 log.info("from create quiz quizprocess 1");
			 
			 request.setAttribute("quizname", quizname);
			 request.setAttribute("coursecode", coursecode);
			 request.setAttribute("quizname_id", quizname_id);
			 
			 return new ModelAndView("createnextquiz");
				 }else{
					 
					 log.info("questiontype in else --> "+questiontype);
					 String coursecode = request.getParameter("coursecode");
					 String quizname = request.getParameter("quizname"); 
					 String question = request.getParameter("question");
					 
					 db4.addquizname(quizname,coursecode);
					 String quizname_id=db4.getquiznameid(quizname,coursecode);
					 if(quizname_id != null){
						 String status = db4.updatetestStatusActive(quizname_id);
						 log.info("status in updatetestStatusActive --> "+status);
					 }					 
					 db4.addtestquestion(quizname_id,question);
					 
					 log.info("from create quiz quizprocess finish ");
					 
					 request.setAttribute("coursecode", coursecode);
					 
					 return new ModelAndView("createquiz");
				 }
				 				 
		 }else if(Quiz!=null && Quiz.equalsIgnoreCase("Cancel")){
			 
			 	String course_name1 = (String)session.getAttribute("course_name");
				
			 	ArrayList categorylist = (ArrayList) session.getAttribute("categorylist");
				ArrayList courselist = (ArrayList) session.getAttribute("courselist");
				ArrayList s = (ArrayList) session.getAttribute("s");
				
				String user_id1 = (String)session.getAttribute("user_id");
				String role_nam1 = (String)session.getAttribute("role_nam");
				
				ArrayList userlist = (ArrayList) session.getAttribute("userlist");
				
				 session.setAttribute("userlist", userlist);
				 session.setAttribute("categorylist", categorylist);
				 session.setAttribute("courselist", courselist);
				 session.setAttribute("course_name", course_name1);
				 session.setAttribute("role_name", role_nam1);
				 session.setAttribute("user_id", user_id1);
				 session.setAttribute("s", s);
			 
			 return new ModelAndView("index"); 
		 }
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initchangepassword")){
				return new ModelAndView("changepassword");	
			} 
		 else if(pro!=null && pro.equalsIgnoreCase("initprofiledetails")){
					 
			 String userid = (String) session.getAttribute("user_id");			
			 String email = db6.getemailbyuserid(userid);			 
			 String details[] = null;
			 String username = null;
			 String password = null;
			 String institutionname = null;
			 String customerid = null;
 	         	         
			 ArrayList profiledetails = db6.getprofiledetails(email);			 
			 if(profiledetails != null){
			 Iterator itr = profiledetails.iterator();			 
			 while(itr.hasNext()){
				details = (String[]) itr.next();
				username = details[0];
				password = details[1];
				institutionname = details[2];
				customerid = details[3];
			 }} 
			 request.setAttribute("username", username);
			 request.setAttribute("password", password);
			 request.setAttribute("institutionname", institutionname);
			 request.setAttribute("customerid", customerid);
			 request.setAttribute("email", email);			 
				return new ModelAndView("profiledetails");	
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initplanpackage")){
			 
			 String userid=(String) session.getAttribute("user_id");				 
			 String email=db6.getemailbyuserid(userid);
			 
			 String details[] = null;
			 String amount=null;
			 String plan_type=null;
			 String subscription_type=null;
			 
			 ArrayList planpackage=db6.getplanpackage(email);
			 if(planpackage!=null){
				 Iterator itr=planpackage.iterator();			 
				 while(itr.hasNext()){
					details=(String[]) itr.next();
					amount=details[0];
					plan_type=details[1];
					subscription_type=details[2];					
				 }}
       
				 request.setAttribute("amount", amount);
				 request.setAttribute("plan_type", plan_type);
				 request.setAttribute("subscription_type", subscription_type);
				 
				 String dateStr=db6.getdate(email);					 
				 String difference=null;
				 
//subscription status Area---------------------------------------				  	  
				  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
					
					try {
						Date date=formatter.parse(dateStr);
						long lo=30;					
						Date afterthirty = new Date(date.getTime() + lo * 1000 * 60 * 60 * 24);					
												
						String subsenddate=formatter.format(afterthirty);						
						
						Date currentdate=new Date();
						String strcurrent=formatter.format(currentdate);	
						
	int diffInDays = (int) ((afterthirty.getTime() - currentdate.getTime()) / (1000 * 60 * 60 * 24));

						if(strcurrent.equals(subsenddate)){
							diffInDays=0;
						}		
						else{
							
							difference=Integer.toString(diffInDays);
						}
					} catch (ParseException e) {					
						e.printStackTrace();
					}
											
					request.setAttribute("difference", difference);

				return new ModelAndView("planandpackage");	
			} 
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initsecurity")){
			 
			 
				return new ModelAndView("security");	
			} 
		
		 else if(pro!=null && pro.equalsIgnoreCase("initenrollstudent")){
			 ArrayList trainerlist=db.gettrainerlist();
			 request.setAttribute("trainerlist", trainerlist);
			 ArrayList list=db1.getcourse();
				ArrayList courselist=db1.getsubcourse();
				
				request.setAttribute("courselist", courselist);
				request.setAttribute("list", list);
				
				return new ModelAndView("studentenroll");	
			} 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("Changepassword")){
			 
			 String status=""; 
			 String currentpassword = request.getParameter("currPwd"); 
			 String newpass = request.getParameter("newPwd"); 
			 String renewpass = request.getParameter("reNewPwd"); 
			
			 String user_id=(String)session.getAttribute("user_id"); 
			 if(newpass.equals(renewpass)){
				 status=db.updatepassword(user_id,currentpassword,newpass);
				 }else{
					 request.setAttribute("nstatus","newpassword and retype password did not match"); 
			 }
			
			 request.setAttribute("status", status);
			 return new ModelAndView("changepassword"); 
		 }
		 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("coursementorenroll")){
			 
			 
			 
			 
			 return new ModelAndView("coursementorenroll");  
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initCourseMentorEnrollSem")){
			 
			 
			 String user_id1 = request.getParameter("user_id");
			 String progId = request.getParameter("prog");
			 String subprogId = request.getParameter("subprog");
			 String sem = request.getParameter("sem");
			 
			 			 
			 log.info(" user_id1 "+user_id1+" progId "+progId+" subprog "+subprogId+" sem "+sem);
			 ArrayList subProgList = db1.getsubcourse(progId);
			 ArrayList progList = db1.getcourse();
			 ArrayList getcoursesem = db1.getcourselist(progId,subprogId,sem);
			 
			 ArrayList cmList=db4.getcoursementorcourselist(user_id1);
			 
			 request.setAttribute("coursesem", getcoursesem);
			 request.setAttribute("user_id", user_id1);
			 request.setAttribute("progList", progList);
			 request.setAttribute("progId", progId);
			 request.setAttribute("subprogId", subprogId);
			 request.setAttribute("sem", sem);
			 request.setAttribute("subProgList", subProgList);
			 request.setAttribute("cmList", cmList);
			 
			 return new ModelAndView("Assigncourse");
		 }
		 
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initCourseMentorEnroll")){
				String user_id = request.getParameter("user_id");
				String fromCourseMentor = request.getParameter("fromCourseMentor");
				 //ArrayList courselist=db1.getcourse();
			    // ArrayList subcourselist=db1.getsubcourse();
			    ArrayList coursecode=db1.getcoursecodeandcoursename();
			    String progId=request.getParameter("prog");
			 	ArrayList subProgList=db1.getsubcourse(progId);
			 	ArrayList progList=db1.getcourse();
			 	
			 	log.info("user_id "+user_id +" progId "+progId);
			 	
			 	request.setAttribute("progList", progList);
			 	request.setAttribute("progId", progId);	
			 	request.setAttribute("subProgList", subProgList);	
			      
				ArrayList cmList=db4.getcoursementorcourselist(user_id);
			    
				request.setAttribute("coursecode", coursecode);
				request.setAttribute("fromCourseMentor", fromCourseMentor);
			    request.setAttribute("cmList", cmList);
			    request.setAttribute("user_id", user_id);
			    request.setAttribute("assigncousuccess", null);
				
			    return new ModelAndView("Assigncourse");	
			}
		 
		
		 else if(pro!=null && pro.equalsIgnoreCase("initStudentEnroll")){
				String username=request.getParameter("username");
				ArrayList list=db1.getcourse();
				ArrayList sublist=db1.getsubcourse();
			
				request.setAttribute("courselist", list);
				request.setAttribute("sublist", sublist);
				
				request.setAttribute("username", username);
				return new ModelAndView("coursementorenroll");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initcourseforstudent")){
					 
			 
			 
			 return new ModelAndView("frmMapPrograms");	 
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("inittrainercourse")){
			 
			 
				return new ModelAndView("trainer");	
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initlogout")){
			 
			 
				return new ModelAndView("index");	
			}
		 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AssignCourseforStudent")){
			 String user_id = request.getParameter("user_id");
			 String cm_id = request.getParameter("cmname");
			 
			 String category=request.getParameter("category");
		     String semester=request.getParameter("semester");		     
		     String pro_id=request.getParameter("pro_id");
		     String subpro_id=request.getParameter("subpro_id");
		     String firstname=request.getParameter("firstname");
		     String lastname=request.getParameter("lastname");
		     
		     log.info("cm_id "+cm_id+" category "+category+" semester "+semester+" pro_id "+pro_id+" subpro_id "+subpro_id+" firstname "+firstname+" lastname "+lastname);
		     
		    // ArrayList student= db1.getcourseforstudent(category,semester,pro_id,subpro_id);			     
		     ArrayList courselist = db1.getcourseforstudent(category, semester, pro_id, subpro_id);
		     ArrayList cmlist=db5.getCourseMent(pro_id,subpro_id,user_id);			     
		     ArrayList corslist=db4.getalreadyassignedcourse(user_id);	
			String status = null;
			 for(int i=1;i<=8;i++){
			 String checkbox = request.getParameter("checkbox_"+i);
			 if(checkbox!=null){
				 
				 String[] parts = checkbox.split("/");
				 String course_code = parts[0];
				 String course_name = parts[1]; 
				 status = db5.insertstudentcourse(user_id,cm_id,course_code,course_name);
				 
			 }
			 }
			 
			 request.setAttribute("status",status);
			 request.setAttribute("student",courselist);
		     request.setAttribute("cmlist",cmlist);
		     request.setAttribute("corslist",corslist);
		     request.setAttribute("user_id",user_id);
		     request.setAttribute("firstname",firstname);
		     request.setAttribute("lastname",lastname);	
		     
		     request.setAttribute("category",category);	
		     request.setAttribute("semester",semester);	
		     request.setAttribute("pro_id",pro_id);	
		     request.setAttribute("subpro_id",subpro_id);
			 return new ModelAndView("stuassigncourse"); 
		 }
		 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AddCourseMaterials")){
			 if(Map!=null && Map.equalsIgnoreCase("Map")){
			 String selProg = request.getParameter("selProg");
			 String selSubProg = request.getParameter("selSubProg");
			 String selSemester = request.getParameter("selSemester");
			 String url = request.getParameter("url");
			
			
			 String courseCode = request.getParameter("courseCode");
			
				
				 String[] parts = courseCode.split("/");
				 String course_code = parts[0];
				 String course_name = parts[1]; 
				  

		          
				String mat_id=db1.getmaterial_id(course_code);
				if(mat_id != null){
					db1.updateslidematerial(selProg,selSubProg,selSemester,course_code,course_name,url);
				}else{
		           db1.insertcoursematerials(selProg,selSubProg,selSemester,course_code,course_name,url);
				}
			
			 return new ModelAndView("stuassigncourse"); 
			 }else if(FileUpload!=null && FileUpload.equalsIgnoreCase("FileUpload")){
				 String selProg = request.getParameter("selProg");
				 String selSubProg = request.getParameter("selSubProg");
				 String selSemester = request.getParameter("selSemester");
				 String url = request.getParameter("url");
				 String courseCode = request.getParameter("courseCode");
				 
				 request.setAttribute("selSemester", selSemester);
				 request.setAttribute("courseCode", courseCode);
				 request.setAttribute("selProg", selProg);
				 request.setAttribute("selSubProg", selSubProg);
				 return new ModelAndView("uploadfile"); 
			 }
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initshowcoursematerial")){
			 String filename = request.getParameter("filename");
			 String pathname = request.getParameter("pathname");
			 request.setAttribute("filename", filename);
			 request.setAttribute("pathname", pathname);
				return new ModelAndView("displayimage");	
			}
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initaddcoursematerials")){
			 String progId=request.getParameter("prog");
			 	ArrayList subProgList=db1.getsubcourse(progId);
			 	ArrayList progList=db1.getcourse();
			 	
			 	request.setAttribute("progList", progList);
			 	request.setAttribute("progId", progId);	
			 	request.setAttribute("subProgList", subProgList);	
			      
				 ArrayList coursecode=db1.getcoursecodeandcoursename();
				 request.setAttribute("coursecode", coursecode);
				return new ModelAndView("addcoursematerial");	
			}
		 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AddCourseMaterials")){
				// if(Map!=null && Map.equalsIgnoreCase("Map")){
				 String selProg = request.getParameter("selProg");
				 String selSubProg = request.getParameter("selSubProg");
				 String selSemester = request.getParameter("selSemester");
				 String sm = request.getParameter("sm");
				 String rm = request.getParameter("rm");
				 String rc = request.getParameter("rc");
				 String lc = request.getParameter("lc");
				 String pb = request.getParameter("pb");
				 String sg = request.getParameter("sg");
				 String we = request.getParameter("we");
				 String cc = request.getParameter("cc");
				
				
				 String course_code = request.getParameter("courseCode");
				
				
				
					//String mat_id=db1.getmaterial_id(course_code);
					//if(mat_id != null){
						//db1.updateslidematerial(selProg,selSubProg,selSemester,course_code,course_name,url);
					//}else{
			           db1.insertcoursematerials(course_code,sm,rm,rc,lc,pb,sg,we,cc);
					//}
				
				 return new ModelAndView("stuassigncourse"); 
				/* }else if(FileUpload!=null && FileUpload.equalsIgnoreCase("FileUpload")){
					 String selProg = request.getParameter("selProg");
					 String selSubProg = request.getParameter("selSubProg");
					 String selSemester = request.getParameter("selSemester");
					 String url = request.getParameter("url");
					 String courseCode = request.getParameter("courseCode");
					 
					 request.setAttribute("selSemester", selSemester);
					 request.setAttribute("courseCode", courseCode);
					 request.setAttribute("selProg", selProg);
					 request.setAttribute("selSubProg", selSubProg);
					 return new ModelAndView("uploadfile"); 
				 }*/
			 }
			 
			 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AddCourseTopic")){
				
					 String topicname = request.getParameter("topicname");
					
					 String course_code = request.getParameter("courseCode");
					
				     String status= db1.insertcoursematerialtopic(course_code,topicname);
				     request.setAttribute("status", status);
						
					 return new ModelAndView("createcoursetopic"); 
					
				 }
			 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AddCourseSubTopic")){
					
				 String topicid = request.getParameter("topicname");
				
				 String course_code = request.getParameter("courseCode");
				 String subtopic = request.getParameter("subtopicname");
				 String urllink = request.getParameter("urllink");
			         
				 String status=db1.insertcoursematerialsubtopic(course_code,topicid,subtopic,urllink);
				 request.setAttribute("status", status);
				 return new ModelAndView("createcoursesubtopic"); 
				
			 }
			 
			 else if(pro!=null && pro.equalsIgnoreCase("initshowcoursematerial")){
				 String filename = request.getParameter("filename");
				 String pathname = request.getParameter("pathname");
				 request.setAttribute("filename", filename);
				 request.setAttribute("pathname", pathname);
					return new ModelAndView("displayimage");	
				}
			 
			 else if(pro!=null && pro.equalsIgnoreCase("initaddcoursematerials")){
			
					 ArrayList coursecode=db1.getcoursecodeandcoursename();
			
					request.setAttribute("coursecode", coursecode);	
					return new ModelAndView("addcoursematerial");	
				}
			 else if(pro!=null && pro.equalsIgnoreCase("initaddcoursetopic")){
					
				 String status=null;
						 ArrayList coursecode=db1.getcoursecodeandcoursename();					 
					
						request.setAttribute("coursecode", coursecode);	
						request.setAttribute("status", status);
						return new ModelAndView("createcoursetopic");	
					}
			 else if(pro!=null && pro.equalsIgnoreCase("initaddcoursesubtopic")){
				
						 ArrayList coursecode=db1.getcoursecodeandcoursename();
						 ArrayList topiclist=db1.getcoursetopicname(); 
							
						request.setAttribute("coursecode", coursecode);	
						request.setAttribute("topiclist", topiclist);	
						return new ModelAndView("createcoursesubtopic");	
					}
			 else if(pro!=null && pro.equalsIgnoreCase("initscheduleclass")){
				 String user_id=(String)session.getAttribute("user_id");
				 ArrayList programList=db1.getProgram_id(user_id);
				 request.setAttribute("programList", programList);
				 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
				 request.setAttribute("courselist", cmcourselist);
				return new ModelAndView("scheduleclass");	
			}
			 else if(pro!=null && pro.equalsIgnoreCase("classschedulesuccess")){
				 String user_id=(String)session.getAttribute("user_id");
				
				return new ModelAndView("classschedulesuccess");	
			}
			 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("ScheduleClass")){
				
				 String course_code = request.getParameter("coursecode");
				 String title = request.getParameter("title");
				 String date = request.getParameter("date");
				 String description = request.getParameter("description");
				 String fromtime = request.getParameter("fromtime");
				 String totime = request.getParameter("totime");
				 String fromsesstime = request.getParameter("fromsesstime");
				 String tosesstime = request.getParameter("tosesstime");
				 String time =fromtime+" "+fromsesstime+" to  "+totime+" "+tosesstime;
				 				 
				 String user_id=(String)session.getAttribute("user_id");
				 
				 String course_name = db4.getcoursename(course_code);
				 
				 String program_id = request.getParameter("program_id"); 
				 String subprogram_id = request.getParameter("subprogram_id");
				 
				 String status = db4.setclassschedule(course_code,course_name,title,date,description,user_id,program_id,subprogram_id,time);
				 
				 ArrayList emailId=db4.getemailID(program_id,subprogram_id);
				 request.setAttribute("emailId", emailId);
				 request.setAttribute("course", course_code);
				 request.setAttribute("title", title);
				 request.setAttribute("dateandtime", date);
				 request.setAttribute("description", description);
				return new ModelAndView("successclass");	
			}
		 
			 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("Quiz1Process")){
				
				 String coursecode = request.getParameter("coursecode");
				 String quizname_id = request.getParameter("quizname_id");
				 
				 log.info("coursecode "+coursecode+" quiznameid "+quizname_id);
				 
				 if(Quiz!=null && Quiz.equalsIgnoreCase("Create Quiz")){
					
					 String answer=null;
				 String quizname = request.getParameter("quizname"); 
				 String question = request.getParameter("question");
				 String a = request.getParameter("a"); 
				 String b = request.getParameter("b");
				 String c = request.getParameter("c"); 
				 String d = request.getParameter("d");
				 String digi = request.getParameter("digi");
				 
				 if(digi.equalsIgnoreCase("a")){
					  answer=a; 
				 }else if(digi.equalsIgnoreCase("b")){
					  answer=b; 
				 }else if(digi.equalsIgnoreCase("c")){
					  answer=c; 
				 }else if(digi.equalsIgnoreCase("d")){
					  answer=d; 
				 } 
				 
				
				// String course_name=(String) session.getAttribute("course_name");
					//String course_id=db1.getsubcourseid(course_name);
					//db4.addquizname(quizname,course_id);
				 
					//String quizname_id=db4.getquiznameid(quizname,coursecode);
				 db4.addquizquestion(quizname_id,question,a,b,c,d,answer);
				 
				 log.info("from create next quiz process");
				 
				 request.setAttribute("quizname", quizname);
				 request.setAttribute("quizname_id", quizname_id);
				 request.setAttribute("quizname", quizname);
				 request.setAttribute("status", "Quiz created successfilly");
				 
				 return new ModelAndView("createnextquiz");
			 
				 }else  if(Quiz!=null && Quiz.equalsIgnoreCase("Finish")){
					 
					 log.info("finish quiz creation");
					 
				 return new ModelAndView("dashboard");
			 }
			 }
		 else if(pro!=null && pro.equalsIgnoreCase("inituploadfile")){
			 
			 try {
				    ServletOutputStream out=response.getOutputStream();
				    URL url=new URL("C:\\userpicture\\ajith.jpg");
				    InputStream in=url.openStream();
				    byte[] buffer=new byte[2048];
				    int size;
				    while ((size=in.read(buffer,0,buffer.length)) != -1) {
				      out.write(buffer,0,size);
				    }
				    in.close();
				    out.flush();
				  }
				 catch (  Exception ex) {
				  }
			 
			 return new ModelAndView("uploadfile");  
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initdownloadfile")){
			  final int BUFFER_SIZE = 4096;
	             
			  String filename = request.getParameter("filename"); 
			  String pathname = request.getParameter("pathname"); 
			     String filePath =pathname;
			    
			  // get absolute path of the application
			     ServletContext context = request.getSession().getServletContext();
			       // String appPath = context.getRealPath("");
			     			 
			        // construct the complete absolute path of the file
			        String fullPath =filePath;      
			        File downloadFile = new File(fullPath);
			        FileInputStream inputStream = new FileInputStream(downloadFile);
			         
			        // get MIME type of the file
			        String mimeType = context.getMimeType(fullPath);
			        if (mimeType == null) {
			            // set to binary type if MIME mapping not found
			            mimeType = "application/octet-stream";
			        }
			        			 
			        // set content attributes for the response
			        response.setContentType(mimeType);
			        response.setContentLength((int) downloadFile.length());
			 
			        // set headers for the response
			        String headerKey = "Content-Disposition";
			        String headerValue = String.format("attachment; filename=\"%s\"",
			                downloadFile.getName());
			        response.setHeader(headerKey, headerValue);
			 
			        // get output stream of the response
					
			        OutputStream outStream = response.getOutputStream();
			 
			        byte[] buffer = new byte[BUFFER_SIZE];
			        int bytesRead = -1;
			 
			        // write bytes read from the input stream into the output stream
			        while ((bytesRead = inputStream.read(buffer)) != -1) {
			            outStream.write(buffer, 0, bytesRead);
			        }
			 
			        outStream.flush();
			        inputStream.close();
			        outStream.close();
			    
			 
			 return null;//new ModelAndView("approvenroll");	 
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initdocumentfile")){
			 final int BUFFER_SIZE = 4096;
             
			  String filename = request.getParameter("filename"); 
			     String filePath = "C:/upload/"+filename;
			     
			   
			   
			 
			        // get absolute path of the application
			     ServletContext context = request.getSession().getServletContext();
			        String appPath = context.getRealPath("");
			       			 
			        // construct the complete absolute path of the file
			        String fullPath = filePath;      
			        File downloadFile = new File(fullPath);
			        FileInputStream inputStream = new FileInputStream(downloadFile);
			         
			        // get MIME type of the file
			        String mimeType = context.getMimeType(fullPath);
			        if (mimeType == null) {
			            // set to binary type if MIME mapping not found
			            mimeType = "application/octet-stream";
			        }
			       			 
			        // set content attributes for the response
			        response.setContentType(mimeType);
			        response.setContentLength((int) downloadFile.length());
			 
			        // set headers for the response
			        String headerKey = "Content-Disposition";
			        String headerValue = String.format("attachment; filename=\"%s\"",
			                downloadFile.getName());
			        response.setHeader(headerKey, headerValue);
			 
			        // get output stream of the response
					
			        OutputStream outStream = response.getOutputStream();
			 
			        byte[] buffer = new byte[BUFFER_SIZE];
			        int bytesRead = -1;
			 
			        // write bytes read from the input stream into the output stream
			        while ((bytesRead = inputStream.read(buffer)) != -1) {
			            outStream.write(buffer, 0, bytesRead);
			        }
			 
			        outStream.flush();
			        inputStream.close();
			        outStream.close();
			        
			 
			 return new ModelAndView("downloadfile");	 
		 }
		 
		 else if(pro!=null && pro.equalsIgnoreCase("initprofilepicture")){
			 String user_id = request.getParameter("user_id"); 
			
			 request.setAttribute("user_id", user_id);
			 return new ModelAndView("profilepicture");	 
		 }
		 
		 
		 else if(pro!=null && pro.equalsIgnoreCase("upload")){
			
			 String courseCode = request.getParameter("courseCode");
			 String sem = request.getParameter("sem");
			 String proid = request.getParameter("pro");
			 String subpro = request.getParameter("subpro");
			 String OUTPUT_FOLDER ="c:\\upload\\";

			 File fDir = new File(OUTPUT_FOLDER);
			 if (!fDir.exists()) {
			     fDir.mkdir();
			        
			     }

			       String saveFile = "";
			       String contentType = request.getContentType();
			       if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
			             DataInputStream in = new DataInputStream(request.getInputStream());
			             int formDataLength = request.getContentLength();
			             
			             byte dataBytes[] = new byte[formDataLength];
			             int byteRead = 0;
			             int totalBytesRead = 0;
			             while (totalBytesRead < formDataLength) {
			                   byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			                   totalBytesRead += byteRead;
			             }
			             String file = new String(dataBytes);
			             saveFile = file.substring(file.indexOf("filename=\"") + 10);
			             saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			             saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
			             int lastIndex = contentType.lastIndexOf("=");
			             String boundary = contentType.substring(lastIndex + 1, contentType.length());
			             int pos;
			             pos = file.indexOf("filename=\"");
			             pos = file.indexOf("\n", pos) + 1;
			             pos = file.indexOf("\n", pos) + 1;
			             pos = file.indexOf("\n", pos) + 1;
			             int boundaryLocation = file.indexOf(boundary, pos) - 4;
			             int startPos = ((file.substring(0, pos)).getBytes()).length;
			             int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			           String fileename=saveFile;
			           	saveFile = OUTPUT_FOLDER +"\\"+ saveFile;
			           
			             File ff = new File(saveFile);
			             FileOutputStream fileOut = new FileOutputStream(ff);
			             fileOut.write(dataBytes, startPos, (endPos - startPos));
			             fileOut.flush();
			             fileOut.close();
			            
			            
			            
			             String[] parts = courseCode.split("/");
						 String Course_Code = parts[0];
						 String Course_Name = parts[1]; 
			             
			             String mat_id=db1.getmaterial_id(Course_Code);
							if(mat_id != null){
							String existfilename=db1.getexistfilename(Course_Code);
							String existfilepath=db1.getexistfilepath(Course_Code);
							if(existfilename != null){
								db1.updatepdfmaterial(Course_Code,fileename,saveFile,existfilename,existfilepath);
							}
							}else{
								db1.addpdfcoursematerial(proid,subpro,sem,Course_Code,Course_Name,fileename,saveFile);
							}
			            
			 			
			 		//}
			      
		      }
			
		
			 return new ModelAndView("uploadfile");	
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initdownloaddocumentfile")){
			 
			 ArrayList comaterial=db5.getcoursematerial();
			 request.setAttribute("comaterial", comaterial);
			
			 
			 return new ModelAndView("downloadfile");	
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initdeleteassignment")){
			
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("initdrupalshowwork")){
			 String course_name = request.getParameter("course_name");
			 
			 course_id=db1.getsubcourseid(course_name);
			
			 
			 ArrayList coursematerial=db5.getcoursematerial(course_id);
			 request.setAttribute("coursematerial", coursematerial);
			 session.setAttribute("coursematerial", coursematerial);
			 
				return new ModelAndView("traidrupalshowwork");
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initdrupalshowcoursematerial")){
			 String filename = request.getParameter("filename");
			 String pathname = request.getParameter("pathname");
			
			 request.setAttribute("filename", filename);
			 request.setAttribute("pathname", pathname);
			 session.setAttribute("filename", filename);
			 session.setAttribute("pathname", pathname);
			 
				return new ModelAndView("displaydrupalpdffile");
			}
		 else if(pro!=null && pro.equalsIgnoreCase("initassignmentreport")){
			 
			 String  user_id = (String)session.getAttribute("user_id");
			 ArrayList cmcourselist = db.getcourseforcoursementor(user_id); 
			 
			 request.setAttribute("cmcourselist", cmcourselist);
			 
			 return new ModelAndView("assignmentreport");
		 }
		 else if(pro!=null && pro.equalsIgnoreCase("inittestreport")){
			 String  user_id=(String)session.getAttribute("user_id");
			 ArrayList cmcourselist=db.getcourseforcoursementor(user_id); 
			 request.setAttribute("cmcourselist", cmcourselist);
			 return new ModelAndView("testreport");
		 }
		 
		 else if(TrainerProcess!=null && TrainerProcess.equalsIgnoreCase("AssignReportProcess")){
			 
			 String  user_id = (String)session.getAttribute("user_id");	
			 
			 String coursecode = request.getParameter("coursecode");
			 String assignname = request.getParameter("assignname");
			 String assignid = request.getParameter("assignname");
			 
			 log.info("assignname "+assignname+" assignid "+assignid);
			 
			
			 ArrayList assignreportlist = db5.getassignmentgrade(assignid); 
			 ArrayList cmcourselist = db.getcourseforcoursementor(user_id); 
			 
			 request.setAttribute("assignname", assignname);
			 request.setAttribute("course_code", coursecode);
			 request.setAttribute("cmcourselist", cmcourselist);
			 request.setAttribute("assignreportlist", assignreportlist);	
			
			 return new ModelAndView("assignmentreport"); 
			
		 }
		
		
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return new ModelAndView("SLHome");
	}
	
	/*public String getdate(String lastdate)
		{
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar calobj = Calendar.getInstance();
			String days=null;
			String dateStart=df.format(calobj.getTime());
				
			//SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			 
			Date d1 = null;
			Date d2 = null;
	 
			try {
				d1 = df.parse(dateStart);
				d2 = df.parse(lastdate);
	 
				//in milliseconds
				long diff = d2.getTime() - d1.getTime();
	 
				long diffSeconds = Math.abs(diff / 1000 % 60);
				long diffMinutes = Math.abs(diff / (60 * 1000) % 60);
				long diffHours = Math.abs(diff / (60 * 60 * 1000) % 24);
				long diffDays = Math.abs(diff / (24 * 60 * 60 * 1000));
	 
				String sec=Long.toString(diffSeconds);
				String min=Long.toString(diffMinutes);
				String hour=Long.toString(diffHours);
				String day=Long.toString(diffDays);
	            days=day+"days"+hour+"hours"+min+"minutes";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return days;
	 
		}
	 public String getcurrentdate()
		{
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar calobj = Calendar.getInstance();
			
			String dateStart=df.format(calobj.getTime());
			
			return dateStart;
	 		}
	 */
 
			 

	 
}
	
