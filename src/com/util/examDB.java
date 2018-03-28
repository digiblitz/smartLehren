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
package com.util;

import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.apache.log4j.Logger;

public class examDB {
	static Logger log = Logger.getLogger(examDB.class.getName());
	
	private static examDB myInstance = new examDB(); 		
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    public static examDB getInstance(){
		return myInstance;    	
    }
    private examDB(){
    	
    }
    Connectiondb connection = Connectiondb.getInstance();
    public ArrayList getcourselist(String user_id){
		 
		 ArrayList pgmList = new ArrayList();
		 
		 try{
			 connection.makeConnection();
		 
		 String fetchProgramid="select course_code from tblStudentCourseDetails where student_user_id=?";
		 
		 prepStmt = connection.con.prepareStatement(fetchProgramid);
		 prepStmt.setString(1,user_id);
		 rs = prepStmt.executeQuery();
		 
		 while(rs.next()){
			 String course_code=rs.getString(1);
    		 pgmList.add(course_code);
		 }
		 	prepStmt.close();
		 	rs.close();
		 
		 }
		 catch(SQLException sqe){
			 connection.releaseConnection();		 
		 }
		 finally { connection.releaseConnection(); }
		 return pgmList;
	 }
    
    public ArrayList getExamname(String coursecode, Date date)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT exam_id,course_code,exam_name,allow_date FROM tblExamSchedule WHERE course_code=? and allow_date=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);
			            prepStmt.setDate(2,connection.toSQLDate(date));			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String exam_id = rs.getString(1);
			            	String course_code = rs.getString(2);
			            	String exam_name = rs.getString(3);
			            	String allow_date = rs.getString(4);
			            	
			            	String strarr[] = {exam_id,course_code,exam_name,allow_date};			            	
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    
    public ArrayList getexamdetails(String coursecode, String examname, Date date, String exam_id)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT tmquestion,smquestion FROM tblExamSchedule WHERE course_code=? and exam_name=? and allow_date=? and exam_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);
			            prepStmt.setString(2,examname);
			            prepStmt.setDate(3,connection.toSQLDate(date));
			            prepStmt.setString(4,exam_id);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String tmquestion = rs.getString(1);
			            	String smquestion = rs.getString(2);
			            	
			            	String strarr[] = {tmquestion,smquestion};			            	
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getexamquestions(String coursecode, String examname, String allow_date, String exam_id)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT tmquestion,smquestion FROM tblExamSchedule WHERE course_code=? and exam_name=? and allow_date=? and exam_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);
			            prepStmt.setString(2,examname);
			            prepStmt.setString(3,allow_date);
			            prepStmt.setString(4,exam_id);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String tmquestion = rs.getString(1);
			            	String smquestion = rs.getString(2);
			            	
			            	String strarr[] = {tmquestion,smquestion};			            	
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getexamlist(String coursecode, String allow_date)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_name,start_time,end_time,exam_date FROM tblExamDetails WHERE course_code=? and exam_date=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);			            
			            prepStmt.setString(2,allow_date);			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String course_name = rs.getString(1);			            	
			            	String start_time = rs.getString(2);
			            	String end_time = rs.getString(3);
			            	String exam_date = rs.getString(4);
			            	
			            	String strarr[] = {course_name,start_time,end_time,exam_date};			            	
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public String getexamSubmissionStatus(String course_code, String submissionDt){
    	
    	String status  = null;  
    	try{
    		connection.makeConnection();   
        	
        	String str="SELECT status FROM tblexamsubmissiondetails WHERE course_code=? and exam_date=?";
        	prepStmt = connection.con.prepareStatement(str);
        	prepStmt.setString(1, course_code);
        	prepStmt.setString(2, submissionDt);
        	
        	rs = prepStmt.executeQuery();
        	if(rs.next()){
        		status = rs.getString(1);
        	}
        	rs.close();
        	prepStmt.close();        	
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	finally{
    		connection.releaseConnection();
    	}
    	
    	return status;
    }
    
    public String getcoursecode(String course_name)
    {
    	 
    	String course_code=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_code FROM tblMapProgram WHERE course_name=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,course_name);		            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	course_code = rs.getString(1);
			                          }				     			    
			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return course_code;
    }
    
    public String getcoursename(String course_code)
    {
    	 
    	String course_name=null;
		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_name FROM tblMapProgram WHERE course_code=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,course_code);		            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	course_name = rs.getString(1);
			            	 log.info(" coursename "+course_name);
			                          }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return course_name;
    }
    
    public String submitexam(String user_id, String grade_status, String assign_status, String examdate, String course_code, String exam_name, String exam_id, String briefanswerfull, String shortanswerfull, String str1, String str2, int totalmark, int scount, int bcount)
    {
	 String status=null;	
	 try{
		 connection.makeConnection(); 
    	String insertStmt=  "Insert into tblexamsubmissiondetails(student_user_id,course_code,grade,status,exam_name,exam_date,briefanswerfull,shortanswerfull,shortmark,briefmark,totalmark,shortactmark,briefactmark,exam_frm_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);	        
        prepStmt.setString(1,user_id);
        prepStmt.setString(2,course_code);        
        prepStmt.setString(3,grade_status);
        prepStmt.setString(4,assign_status);
        prepStmt.setString(5,exam_name);   
        prepStmt.setString(6,examdate); 
        prepStmt.setString(7,briefanswerfull);
        prepStmt.setString(8,shortanswerfull);
        prepStmt.setString(9,str1);
        prepStmt.setString(10,str2);
        prepStmt.setInt(11, totalmark);
        prepStmt.setInt(12, scount);
        prepStmt.setInt(13, bcount);
        prepStmt.setString(14, exam_id);
        
       prepStmt.executeUpdate();

       prepStmt.close();
      status="Exam submitted successfully";
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
    	connection.releaseConnection();
              
    } finally {
    	connection.releaseConnection();
    }
    	return status;	
    }
    
    public ArrayList getexamdetails(String coursecode)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT DISTINCT a.course_code, a.exam_name, a.allow_date, a.exam_id FROM tblExamSchedule a, tblExamDetails b WHERE a.course_code=? and b.exam_status='Active'";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String course_code = rs.getString(1);	
			            	String exam_name = rs.getString(2);
			            	String allow_date = rs.getString(3);
			            	String exam_id = rs.getString(4);
			            	
			            	log.info("course_code "+course_code +" exam_name "+exam_name + " allow_date "+allow_date+" exam_id "+exam_id);
			            				
			            	String[] strarr = {course_code,exam_name,allow_date,exam_id};
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getsubmissionlist(String coursecode, String exam_name, String course_name, String exam_id)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT DISTINCT a.firstname, a.lastname, b.student_user_id, b.status, b.grade, b.exam_date from tblEnrolldetails a, tblexamsubmissiondetails b, tblExamSchedule c where a.user_id = b.student_user_id and b.exam_date = c.allow_date and b.course_code = ? and b.exam_name = ? and b.exam_frm_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);			            
			            prepStmt.setString(2,exam_name);	
			            prepStmt.setString(3,exam_id);	
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            				            	
			            	String firstname = rs.getString(1);
			            	String lastname = rs.getString(2);
			            	String user_id = rs.getString(3);
			            	String status = rs.getString(4);
			            	String grade = rs.getString(5);
			            	String exam_date = rs.getString(6);
			            	String course_code = coursecode;
			            	String examname = exam_name;
			            	String coursename = course_name;
			            				            	
			            	String name = firstname+"  "+lastname;
			            	
			            	String[] temp={name,user_id,status,grade,exam_date,course_code,examname,coursename};
			            	examlist.add(temp);			            	
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getnotsubmittedlist(String coursecode, String exam_name)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
 //String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a, tblStudentCourseDetails b where a.user_id = b.student_user_id and b.course_code = ? and a.user_id <> ?";
//String str="SELECT DISTINCT a.firstname, a.lastname, b.student_user_id from tblEnrolldetails a, tblexamsubmissiondetails b, tblStudentCourseDetails c  where b.student_user_id<>c.user_id and b.course_code=c.course_code and b.course_code=? and b.exam_name=?";
	
		        	/*SELECT o.OrderID, c.CustomerID, c.CustomerName, o.OrderDate
		        	FROM Orders o INNER JOIN Customers c
		        	ON o.CustomerID<>c.CustomerID where o.OrderDate='1996-07-04' and o.OrderID='10248';*/
		        	 
 String str="SELECT a.firstname, a.lastname, a.user_id from tblEnrolldetails a INNER JOIN tblStudentCourseDetails b ON a.user_id=b.student_user_id INNER JOIN tblexamsubmissiondetails c ON c.student_user_id <> b.student_user_id where c.course_code=b.course_code and c.course_code=? and c.exam_name=?";
				        prepStmt = connection.con.prepareStatement(str);
				        //prepStmt.setString(1,exam_name);
			            prepStmt.setString(1,coursecode);
			            prepStmt.setString(2,exam_name);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	
			            	String firstname = rs.getString(1);
			            	String lastname = rs.getString(2);
			            	String user_id = rs.getString(3);
			            	
			            	String name = firstname+"  "+lastname;
			            	String[] temp={user_id,name};
			            	examlist.add(temp);			            	
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public String getexamcheck(String exam_name, String course_code, Date allow_date)
    {
    	 
    	String exampassword = null;	    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT password FROM tblExamSchedule WHERE exam_name=? and course_code=? and allow_date=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,exam_name);
			            prepStmt.setString(2,course_code);		
			            prepStmt.setDate(3,connection.toSQLDate(allow_date));
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	 exampassword = rs.getString(1);			            	
			            }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return exampassword;
    }
    
    public ArrayList getstudentlist(String coursecode)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
 //String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a, tblStudentCourseDetails b where a.user_id = b.student_user_id and b.course_code = ? and a.user_id <> ?";

 String str="SELECT student_user_id from tblStudentCourseDetails where course_code=?";
				        prepStmt = connection.con.prepareStatement(str);
				        //prepStmt.setString(1,exam_name);
			            prepStmt.setString(1,coursecode);
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String user_id = rs.getString(1);			            	
			            	examlist.add(user_id);			       
			                          }			       
			            rs.close();
			       prepStmt.close();			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getstudentlist1(String studentuserid)
    {
    	 
    	ArrayList studentlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
 //String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a, tblStudentCourseDetails b where a.user_id = b.student_user_id and b.course_code = ? and a.user_id <> ?";

 String str="SELECT firstname,lastname from tblEnrolldetails where user_id=?";
				        prepStmt = connection.con.prepareStatement(str);
				        //prepStmt.setString(1,exam_name);
			            prepStmt.setString(1,studentuserid);			            
			           
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String userid = studentuserid;
			            	String firstname = rs.getString(1);
			            	String lastname = rs.getString(2);
			            	String name = firstname+"  "+lastname;			            	
			            	String strarr[] = {userid, name};
			            	studentlist.add(strarr);			         
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return studentlist;
    }
 
    public String setAssignParticular(String studentuserid, String assignname, String question, String coursecode, Date allow_date, Date last_date)
    {
	 String status=null;	
	 try{
		 connection.makeConnection(); 
    	String insertStmt=  "Insert into tblAssignmentParticular(student_user_id,assign_name,question,course_code,allow_date,last_date) values (?,?,?,?,?,?)";
        prepStmt = connection.con.prepareStatement(insertStmt);	        
        prepStmt.setString(1,studentuserid);
        prepStmt.setString(2,assignname); 
        prepStmt.setString(3,question);
        prepStmt.setString(4,coursecode);
        prepStmt.setDate(5,connection.toSQLDate(allow_date));
        prepStmt.setDate(6,connection.toSQLDate(last_date));   
       
       prepStmt.executeUpdate();

       prepStmt.close();
      status="Assignment for particular submitted successfully";
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
    	connection.releaseConnection();
              
    } finally {
    	connection.releaseConnection();
    }
    	return status;	
    }
    
    public ArrayList getParticularList(String user_id, String course_code)
    {
    	 
    	ArrayList studentlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();

 String str="SELECT assign_id,assign_name from tblAssignmentParticular where student_user_id=? and course_code=? and reAssignment_status='Active'";
				        prepStmt = connection.con.prepareStatement(str);				        
			            prepStmt.setString(1,user_id);	
			            prepStmt.setString(2,course_code);	
			           
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			 
			            	
			            	String assign_id = rs.getString(1);
			            	String assign_name = rs.getString(2);
			            				            			            	
			            	String strarr[] = {assign_id,assign_name, course_code};
			            	studentlist.add(strarr);			         
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return studentlist;
    }
    
    public ArrayList getkeywordlist(String course_code, String exam_name, String examdate)
    {
    	 
    	ArrayList studentlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();

 String str="SELECT keyfor_short,keyfor_brief,shortmark,briefmark from tblExamSchedule where course_code=? and exam_name=? and allow_date=?";
				        prepStmt = connection.con.prepareStatement(str);				        
			            prepStmt.setString(1,course_code);	
			            prepStmt.setString(2,exam_name);	
			            prepStmt.setString(3,examdate);
			           
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	String keyfor_short = rs.getString(1);
			            	String keyfor_brief = rs.getString(2);
			            	String shortmark = rs.getString(3);
			            	String briefmark = rs.getString(4);
			            				            			            	
			            	String strarr[] = {keyfor_short,keyfor_brief,shortmark,briefmark};
			            	studentlist.add(strarr);			         
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            connection.releaseConnection();
			        }
		       
		    return studentlist;
    }
    
    public ArrayList getArrearList(String user_id)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_code,exam_name,exam_date,shortmark,briefmark,totalmark,shortactmark,briefactmark,revaluation_status FROM tblexamsubmissiondetails WHERE student_user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,user_id);			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String course_code = rs.getString(1);
			            	String exam_name = rs.getString(2);	
			            	String exam_date = rs.getString(3);
			            	String shortmark = rs.getString(4);
			            	String briefmark = rs.getString(5);
			            	String totalmark = rs.getString(6);
			            	String shortactmark = rs.getString(7);
			            	String briefactmark = rs.getString(8);
			            	String revaluation_status = rs.getString(9);
			            				            				
			            	String[] strarr = {course_code,exam_name,exam_date,shortmark,briefmark,totalmark,shortactmark,briefactmark,revaluation_status};
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    public String getsemester(String course_code, String allow_date)
    {
    	 
    	String semester = null;	    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT semester FROM tblExamDetails WHERE course_code=? and exam_date=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,course_code);		
			            prepStmt.setString(2,allow_date);
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	semester = rs.getString(1);			            	
			            }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return semester;
    }
    
    public String updaterevaluation(String user_id, String exam_name, String course_code, String exam_date) throws RemoteException
    {
    	String restatus=null;  	
    	
		 try{    	 
    	
    		connection.makeConnection(); 
    	
    	String insertStmt=  "update tblexamsubmissiondetails SET revaluation_status = 'Applied' where student_user_id = ? and exam_name = ? and course_code = ? and exam_date =?";
    	
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,user_id);
        prepStmt.setString(2,exam_name);
        prepStmt.setString(3,course_code);
        prepStmt.setString(4,exam_date);
        
        log.info("user_id "+user_id+" exam_name "+exam_name+" course_code "+course_code+" exam_date "+exam_date);
                
        int cnt= prepStmt.executeUpdate();
        if(cnt>0){           	
        	restatus="Revaluation Applied Successfully";	 
          }
         prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
    	connection.releaseConnection();
              
    } finally {
    	connection.releaseConnection();
    }
		return restatus;
    	
    }
    
    public ArrayList getcourse_code(String user_id)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_code FROM tblAssignCourse WHERE user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,user_id);			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String course_code = rs.getString(1);
			            			
			            	examlist.add(course_code);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getrevaluationlist(String coursecode)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT DISTINCT a.firstname,a.lastname,b.student_user_id,b.exam_name,b.exam_date,b.shortanswerfull,b.briefanswerfull,b.totalmark,b.exam_frm_id,b.grade, c.course_name, d.tmquestion,d.smquestion FROM tblEnrolldetails a, tblexamsubmissiondetails b, tblStudentCourseDetails c, tblExamSchedule d WHERE a.user_id=b.student_user_id and b.course_code=c.course_code and b.exam_date=d.allow_date and b.course_code=? and d.course_code=? and b.revaluation_status='Applied' ";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,coursecode);
			            prepStmt.setString(2,coursecode);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	
			            	String firstname = rs.getString(1);
			            	String lastname = rs.getString(2);
			            	String student_user_id = rs.getString(3);
			            	String exam_name = rs.getString(4);	
			            	String exam_date = rs.getString(5);
			            	String shortanswerfull = rs.getString(6);
			            	String briefanswerfull = rs.getString(7);
			            	String totalmarktook = rs.getString(8);
			            	String exam_frm_id = rs.getString(9);
			            	String grade = rs.getString(10);
			            	String course_name = rs.getString(11);
			            	String tmquestion = rs.getString(12);
			            	String smquestion = rs.getString(13);
			            	String course_code = coursecode;
			            	
			            	String studentname = firstname+"  "+lastname;
			            	
			            	
			            	log.info("exam_frm_id "+exam_frm_id+"  "+smquestion+" smquestion "+tmquestion+" tmquestion "+studentname+" studentname "+" student_user_id "+student_user_id+" exam_name "+exam_name+" exam_date "+exam_date+"course_code "+course_code+" course_name "+course_name);
			            	
			            	String[] strarr = {studentname,student_user_id,exam_name,exam_date,shortanswerfull,briefanswerfull,totalmarktook,exam_frm_id,grade,course_name,tmquestion,smquestion,course_code};
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }      
    
    public ArrayList getanswers(String student_user_id, String coursecode, String exam_date, String exam_frm_id)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
 String str="SELECT a.shortanswerfull, a.briefanswerfull, b.tmquestion, b.smquestion FROM tblexamsubmissiondetails a, tblExamSchedule b WHERE a.exam_date=b.allow_date and a.course_code=? and a.exam_date=? and a.student_user_id=? and a.exam_frm_id=?";
 		     				     
				        prepStmt = connection.con.prepareStatement(str);
			            
			            prepStmt.setString(1,coursecode);
			            prepStmt.setString(2,exam_date);
			            prepStmt.setString(3,student_user_id);
			            prepStmt.setString(4,exam_frm_id);
			            
			            log.info(" coursecode "+coursecode+" exam_date "+exam_date+" student_user_id "+student_user_id);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String shortanswerfull = rs.getString(1);	
			            	String briefanswerfull = rs.getString(2);
			            	String tmquestion = rs.getString(3);
			            	String smquestion = rs.getString(4);
			            	
			            	log.info("shortanswerfull "+shortanswerfull +" briefanswerfull "+briefanswerfull + " tmquestion "+tmquestion+" smquestion "+smquestion);
			            				
			            	String[] strarr = {shortanswerfull,briefanswerfull,tmquestion,smquestion};
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    //the above method is also same without exam id
    //use it if you want to add exam id
    public ArrayList getanswers(String student_user_id, String coursecode, String exam_date)
    {
    	 
    	ArrayList examlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
 String str="SELECT a.shortanswerfull, a.briefanswerfull, b.tmquestion, b.smquestion FROM tblexamsubmissiondetails a, tblExamSchedule b WHERE a.exam_date=b.allow_date and a.course_code=? and a.exam_date=? and a.student_user_id=?";
 		     				     
				        prepStmt = connection.con.prepareStatement(str);
			            
			            prepStmt.setString(1,coursecode);
			            prepStmt.setString(2,exam_date);
			            prepStmt.setString(3,student_user_id);
			            			            
			            log.info(" coursecode "+coursecode+" exam_date "+exam_date+" student_user_id "+student_user_id);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String shortanswerfull = rs.getString(1);	
			            	String briefanswerfull = rs.getString(2);
			            	String tmquestion = rs.getString(3);
			            	String smquestion = rs.getString(4);
			            	
			            	log.info("shortanswerfull "+shortanswerfull +" briefanswerfull "+briefanswerfull + " tmquestion "+tmquestion+" smquestion "+smquestion);
			            				
			            	String[] strarr = {shortanswerfull,briefanswerfull,tmquestion,smquestion};
			            	examlist.add(strarr);
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		       
		    return examlist;
    }
    
    public ArrayList getassignmentlist(String user_id, String course_code)
    {
    	 
    	ArrayList studentlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();

 String str="SELECT grade,assign_name from tblassignsubmitted where user_id=? and course_code=?";
				        prepStmt = connection.con.prepareStatement(str);				        
			            
				        prepStmt.setString(1,user_id);
				        prepStmt.setString(2,course_code);	
			            			           
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	String grade = rs.getString(1);
			            	String assign_name = rs.getString(2);
			            				            				            			            	
			            	String strarr[] = {grade,assign_name};
			            	studentlist.add(strarr);			         
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            connection.releaseConnection();
			        }
		       
		    return studentlist;
    }
    
    public ArrayList gettestids(String course_code)
    {
    	 
    	ArrayList studentlist=new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();

 String str="SELECT test_id from tbltestMaster where course_code=?";
				        prepStmt = connection.con.prepareStatement(str);				        
			            				        
				        prepStmt.setString(1,course_code);	
			            			           
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	String test_id = rs.getString(1);
			            	
			            	studentlist.add(test_id);			         
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            connection.releaseConnection();
			        }
		       
		    return studentlist;
    }
    
    public String gettestpercent(String user_id, String testid)
    {
    	String percent = null;	
		        try {
		        	connection.makeConnection();

 String str="SELECT percent_mark from tblStudentTestDetails where user_id=? and test_id=?";
				        prepStmt = connection.con.prepareStatement(str);				        
			            				        
				        prepStmt.setString(1,user_id);
				        prepStmt.setString(2,testid);
			            			           
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	percent = rs.getString(1);
			            		log.info(" percent "+percent);	         
			                          }			       
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            connection.releaseConnection();
			        }
		       
		    return percent;
    }
}
