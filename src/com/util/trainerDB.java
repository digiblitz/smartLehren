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
package com.util;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.apache.log4j.Logger;

public class trainerDB {
	
	static Logger log = Logger.getLogger(trainerDB.class.getName());
	private static trainerDB myInstance = new trainerDB(); 
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    public static trainerDB getInstance(){
		return myInstance;    	
    }
	 private trainerDB(){}
	 Connectiondb connection = Connectiondb.getInstance();
	 
	 public ArrayList getassignuserdetails(String course_code,String assign_name){
	    	
    	    ArrayList userlist= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   String role="student";	   
	        try {
	        	connection.makeConnection();
	        	// String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail, b.status, b.grade, b.answer_text from tbluserdetails a" +
	        	 	//	"inner join tblassignsubmitted b ON a.user_id = b.user_id where a.course = ? ";
	        	String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail, b.status, b.grade, b.answer_text, b.file_location, b.file_name from tblEnrolldetails a, tblassignsubmitted b where a.user_id = b.user_id and b.assign_name = ?"; 				     
			       
	        	
	        	prepStmt2 = connection.con.prepareStatement(str);
			      // prepStmt2.setString(1,course_code);  
			       prepStmt2.setString(1,assign_name);
			      // prepStmt2.setString(2,role); and a.role_name = ? where a.course = ? 
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String user_id = rs2.getString(1);
		            	String firstname = rs2.getString(2);
		            	String lastname = rs2.getString(3);
		            	String e_mail = rs2.getString(4);
		            	String status = rs2.getString(5);
		            	String grade = rs2.getString(6);
		            	String answer_text = rs2.getString(7);
		            	String filelocation = rs2.getString(8);
		            	String filename = rs2.getString(9);
		            	
		               
		            	String[] temp={user_id,firstname,lastname,e_mail,status,grade,answer_text,filelocation,filename};
		            		
		            	userlist.add(temp);
		            }			    
			   rs2.close();
		       prepStmt2.close();
		       connection.releaseConnection(); 

	        }catch (SQLException sqe) {
		    	sqe.printStackTrace();
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
	        }
	        return userlist;
}
	 
	 public ArrayList getusernotsublist(String userid){
	    	
 	    ArrayList userlist= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   String role="student";	   
	        try {
	        	connection.makeConnection();
	        	
	       String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a where a.user_id = ?"; 				     
			       
	        	
	        	prepStmt2 = connection.con.prepareStatement(str);
			    
			       prepStmt2.setString(1,userid);
			       
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String user_id = rs2.getString(1);
		            	String firstname = rs2.getString(2);
		            	String lastname = rs2.getString(3);
		            	String e_mail = rs2.getString(4);
		            		            	
		               
		            	String[] temp={user_id,firstname,lastname,e_mail};
		            		
		            	userlist.add(temp);
		            }			    
			   rs2.close();
		       prepStmt2.close();
		       connection.releaseConnection(); 

	        }catch (SQLException sqe) {
		    	sqe.printStackTrace();
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
	        }
	        return userlist;
}
	 
	 public ArrayList getassignmentanswers(String student_user_id, String course_code,String assign_name){
	    	
 	    ArrayList userlist= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	    
	        try {
	        	connection.makeConnection();
	        	// String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail, b.status, b.grade, b.answer_text from tbluserdetails a" +
	        	 	//	"inner join tblassignsubmitted b ON a.user_id = b.user_id where a.course = ? ";
	        	String str="SELECT a.answer_text, b.question from tblassignsubmitted a, tblassignment b where a.assign_name = b.assign_name and a.course_code = b.course_code and a.user_id=? and a.course_code=? and a.assign_name=?"; 				     
			       
	        	
	        	prepStmt2 = connection.con.prepareStatement(str);
	        	
	        	  prepStmt2.setString(1,student_user_id);
	        	   prepStmt2.setString(2,course_code);  
			       prepStmt2.setString(3,assign_name);
			      // prepStmt2.setString(2,role); and a.role_name = ? where a.course = ? 
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		          
		            	String answer_text = rs2.getString(1);
		            	String question = rs2.getString(2);
		            
		            	String[] temp={answer_text,question};
		            		
		            	userlist.add(temp);
		            }			    
			   rs2.close();
		       prepStmt2.close();
		       connection.releaseConnection(); 

	        }catch (SQLException sqe) {
		    	sqe.printStackTrace();
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
	        }
	        return userlist;
}
	 
	 public ArrayList getreassignmentanswers(String student_user_id, String course_code,String assign_name){
	    	
	 	    ArrayList userlist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    
		        try {
		        	connection.makeConnection();
		        	// String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail, b.status, b.grade, b.answer_text from tbluserdetails a" +
		        	 	//	"inner join tblassignsubmitted b ON a.user_id = b.user_id where a.course = ? ";
		        	String str="SELECT DISTINCT a.answer_text, b.question from tblReassignsubmit a, tblAssignmentParticular b where a.assign_name = b.assign_name and a.course_code = b.course_code and a.student_user_id=? and a.course_code=? and a.assign_name=?"; 				     
				       
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
				       
		        	   prepStmt2.setString(1,student_user_id);
		        	   prepStmt2.setString(2,course_code);  
				       prepStmt2.setString(3,assign_name);
				      // prepStmt2.setString(2,role); and a.role_name = ? where a.course = ? 
			            rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			          
			            	String answer_text = rs2.getString(1);
			            	String question = rs2.getString(2);
			            
			            	String[] temp={answer_text,question};
			            		
			            	userlist.add(temp);
			            }			    
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return userlist;
	}
	 
	 public ArrayList getreassignuserdetails(String course_code,String assign_name){
	    	
 	    ArrayList userlist= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   String role="student";	   
	        try {
	        	connection.makeConnection();	        	
	        	String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail, b.status, b.grade, b.answer_text, b.file_location, b.file_name from tblEnrolldetails a, tblReassignsubmit b where a.user_id = b.student_user_id and b.assign_name = ?";			     
			 	
	        	prepStmt2 = connection.con.prepareStatement(str);			   
			       prepStmt2.setString(1,assign_name);			      
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String user_id = rs2.getString(1);
		            	String firstname = rs2.getString(2);
		            	String lastname = rs2.getString(3);
		            	String e_mail = rs2.getString(4);
		            	String status = rs2.getString(5);
		            	String grade = rs2.getString(6);
		            	String answer_text = rs2.getString(7);
		            	String filelocation = rs2.getString(8);
		            	String filename = rs2.getString(9);
		            	
		               
		            	String[] temp={user_id,firstname,lastname,e_mail,status,grade,answer_text,filelocation,filename};
		            		
		            	userlist.add(temp);
		            }			    
			   rs2.close();
		       prepStmt2.close();
		       connection.releaseConnection(); 

	        }catch (SQLException sqe) {
		    	sqe.printStackTrace();
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
	        }
	        return userlist;
}
	 
	 public ArrayList getreassignnotsubmitted(String course_code,String assign_name){
	    	
	 	    ArrayList userlist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		   String role="student";	   
		        try {
		        	connection.makeConnection();	        	
		        //	String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a, tblReassignsubmit b where a.user_id = b.student_user_id and b.assign_name = ?";			     
 	String str="SELECT a.firstname, a.lastname, a.user_id from tblEnrolldetails a INNER JOIN tblAssignmentParticular b ON a.user_id=b.student_user_id INNER JOIN tblReassignsubmit c ON c.student_user_id <> b.student_user_id where c.course_code=? and c.assign_name=?";				 	
		        	prepStmt2 = connection.con.prepareStatement(str);	
		        	
				       prepStmt2.setString(1,course_code);
				       prepStmt2.setString(2,assign_name);
				       
			            rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String user_id = rs2.getString(1);
			            	String firstname = rs2.getString(2);
			            	String lastname = rs2.getString(3);
			            	
			            				            	
			               
			            	String[] temp={user_id,firstname,lastname};
			            		
			            	userlist.add(temp);
			            }			    
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return userlist;
	}
	 
	 public ArrayList getassign(String user_id, String assign_name, String course_code){
	    	
 	    ArrayList ulist= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	    try {
	    	connection.makeConnection();
	   	String str="SELECT a.firstname, a.lastname, b.course_code, b.course_name from tblEnrolldetails a, tblStudentCourseDetails b, tblassignsubmitted c where a.user_id = b.student_user_id and a.user_id = c.user_id and c.user_id = ? and c.assign_name = ? and b.course_code = ?"; 				     
			       
	        	
	        	prepStmt2 = connection.con.prepareStatement(str);
			       prepStmt2.setString(1,user_id);  
			       prepStmt2.setString(2,assign_name);  
			       prepStmt2.setString(3,course_code);  
			       
			         rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String firstname = rs2.getString(1);
		            	String lastname = rs2.getString(2);
		            	String coursecode = rs2.getString(3);
		            	String course_name = rs2.getString(4);		               
		            	String[] temp={firstname,lastname,coursecode,course_name};	            		
		            	ulist.add(temp);
		            }			     
			   rs2.close();
		       prepStmt2.close();
		       connection.releaseConnection(); 

	        }catch (SQLException sqe) {
		    	sqe.printStackTrace();
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
	        }
	        return ulist;
}	 
	 public ArrayList getreassign(String user_id, String assign_name, String course_code){
	    	
	 	    ArrayList ulist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    try {
		    	connection.makeConnection();		        	 	 				     
		     String str="SELECT a.firstname, a.lastname, b.course_code, b.course_name from tblEnrolldetails a, tblStudentCourseDetails b, tblReassignsubmit c where a.user_id = b.student_user_id and a.user_id = c.student_user_id and c.student_user_id = ? and c.assign_name = ? and b.course_code = ?";
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
		        	 prepStmt2.setString(1,user_id);  
				       prepStmt2.setString(2,assign_name);  
				       prepStmt2.setString(3,course_code); 
				       
				         rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String firstname = rs2.getString(1);
			            	String lastname = rs2.getString(2);
			            	String coursecode = rs2.getString(3);
			            	String course_name = rs2.getString(4);		               
			            	String[] temp={firstname,lastname,coursecode,course_name};		            		
			            	ulist.add(temp);
			            }			     
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return ulist;
	}	 
	 public ArrayList getexamgradedetails(String user_id, String exam_name,String course_code, String exam_id){
	    	
	 	    ArrayList ulist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    try {
		    	connection.makeConnection();
		        	 	String str="SELECT a.firstname, a.lastname, b.course_code, b.course_name from tblEnrolldetails a, tblStudentCourseDetails b, tblexamsubmissiondetails c where a.user_id = b.student_user_id and a.user_id = c.student_user_id and c.student_user_id = ? and c.exam_name = ? and b.course_code = ? and c.exam_frm_id=?"; 				     
				       
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
				       prepStmt2.setString(1,user_id);  
				       prepStmt2.setString(2,exam_name);  
				       prepStmt2.setString(3,course_code);  
				       prepStmt2.setString(4,exam_id);  

				         rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String firstname = rs2.getString(1);
			            	String lastname = rs2.getString(2);
			            	String coursecode = rs2.getString(3);	
			            	String course_name = rs2.getString(4);	
			            	//String studentname = firstname+" "+lastname;
			            	String[] temp={firstname,lastname,coursecode,course_name};		            		
			            	ulist.add(temp);			            	
			            }			     
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return ulist;
	}	
	 
	 public ArrayList getalreadyassignedcourse(String user_id){
	    	
	 	    ArrayList corslist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    try {
		    	connection.makeConnection();
		        	 	String str="SELECT course_code, course_name from tblStudentCourseDetails where student_user_id = ?"; 				     
				       
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
				       prepStmt2.setString(1,user_id);  
				         rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String co_code = rs2.getString(1);
			            	String co_name = rs2.getString(2);
			            	 
			            	String[] temp={co_code,co_name};
			            			
			            	corslist.add(temp);
			            }				    
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return corslist;
	}	 
	 
	 public ArrayList getcoursementorcourselist(String user_id){
	    	
	 	    ArrayList corslist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    try {
		    	connection.makeConnection();
		        	 	String str="SELECT course_code, course_name from tblAssignCourse where user_id = ?"; 				     
				       
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
				       prepStmt2.setString(1,user_id);  
				         rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String co_code = rs2.getString(1);
			            	String co_name = rs2.getString(2);
			            	 
			            	String[] temp={co_code,co_name};
			            			
			            	corslist.add(temp);
			            }				    
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return corslist;
	}	 
	 
	 
	 public void updategrade(String grade1,String comment,String assign_name,String user_id)
	    {
	    	String grade=grade1+".00/100";
	    	try{
	    		connection.makeConnection(); 
	    	String insertStmt=  "update tblassignsubmitted SET grade = ?, comments = ? where assign_name = ? and user_id = ? ";
	        
	    	prepStmt = connection.con.prepareStatement(insertStmt);
	        prepStmt.setString(1,grade);
	        prepStmt.setString(2,comment);
	        prepStmt.setString(3,assign_name);
	        prepStmt.setString(4,user_id);
	       
	       prepStmt.executeUpdate();
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    } 
	 
	 public void updatereassigngrade(String grade1,String comment,String assign_name,String user_id)
	    {
	    	String grade=grade1+".00/100.00";
	    	try{
	    		connection.makeConnection(); 
	    	String insertStmt=  "update tblReassignsubmit SET grade = ?, comments = ? where assign_name = ? and student_user_id = ? ";
	        
	    	prepStmt = connection.con.prepareStatement(insertStmt);
	        prepStmt.setString(1,grade);
	        prepStmt.setString(2,comment);
	        prepStmt.setString(3,assign_name);
	        prepStmt.setString(4,user_id);
	       
	       prepStmt.executeUpdate();
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    } 
	 
	 public void updateexamrevaluation(String grade1, String user_id, String course_code, String exam_name, String exam_date)
	    {
	    		    	
	    	int grademark = Integer.parseInt(grade1);
	    	try{
	    		connection.makeConnection(); 
	    	String insertStmt=  "update tblexamsubmissiondetails SET totalmark = ?, revaluation_status='Evaluated' where student_user_id = ? and course_code = ? and exam_name = ? and exam_date = ? ";
	        
	    	prepStmt = connection.con.prepareStatement(insertStmt);
	        prepStmt.setInt(1,grademark);
	        prepStmt.setString(2,user_id);
	        prepStmt.setString(3,course_code);
	        prepStmt.setString(4,exam_name);
	        prepStmt.setString(5,exam_date);
	        
	        log.info("from give grade revaluation db grade1 "+grade1+" user_id "+user_id+ " course_code "+course_code+" exam_name "+exam_name+" exam_date "+exam_date);
	       
	       prepStmt.executeUpdate();
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    } 
	 
	 public void updateexamgrade(String grade1,String exam_name,String user_id)
	    {
	    	String grade=grade1+".00/100.00";
	    	try{
	    		connection.makeConnection(); 
	    	String insertStmt=  "update tblexamsubmissiondetails SET grade = ? where exam_name = ? and student_user_id = ? ";
	        
	    	prepStmt = connection.con.prepareStatement(insertStmt);
	        prepStmt.setString(1,grade);	        
	        prepStmt.setString(2,exam_name);
	        prepStmt.setString(3,user_id);
	       
	       prepStmt.executeUpdate();
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    } 
	 
	 public void addquizname(String quizname,String course_id) {
			
			 try{
				 connection.makeConnection(); 
			    	String insertStmt=  "Insert into tbltestMaster(test_name,course_code) values (?,?)";
			        		    	
			        prepStmt = connection.con.prepareStatement(insertStmt);			        
			        prepStmt.setString(1,quizname);
			        prepStmt.setString(2,course_id);			       
			        prepStmt.executeUpdate();
			        prepStmt.close();
			      
			    } 
			    catch (SQLException sqe) {
			        sqe.printStackTrace();
			        connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
			    }
	 }
	 
	 public void addslidematerial(String course_id,String fileName,String pathname,String name) {
			
		 try{
			 connection.makeConnection(); 
		    	String insertStmt=  "Insert into tblslidematerial(course_id,filename,pathname,name) values (?,?,?,?)";
		        		    
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,course_id);
		        prepStmt.setString(2,fileName);
		        prepStmt.setString(3,pathname);
		        prepStmt.setString(4,name);
		       
		        prepStmt.executeUpdate();
		        prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		        sqe.printStackTrace();
		        connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
 }
	 
	 public void addquizquestion(String quizname_id,String question,String a,String b,String c,String d,String answer) {
			
		 try{
			 connection.makeConnection(); 
		    	String insertStmt=  "Insert into tbltestDetails(test_id,question,a,b,c,d,answer) values (?,?,?,?,?,?,?)";
		        
		    	prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,quizname_id);
		        prepStmt.setString(2,question);
		        prepStmt.setString(3,a);
		        prepStmt.setString(4,b);
		        prepStmt.setString(5,c);
		        prepStmt.setString(6,d);
		        prepStmt.setString(7,answer);
		        
		       
		        int count = prepStmt.executeUpdate();
		        
		        if(count > 0){
		        	log.info("in database while addquizquestion "+count);
		        }
		        
		        prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		        sqe.printStackTrace();
		        connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
 }
	 
	 public void addtestquestion(String quizname_id,String question) {
			
		 try{
			 connection.makeConnection(); 
		    	String insertStmt=  "Insert into tblDescriptivetest(test_id,question) values (?,?)";
		        		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,quizname_id);
		        prepStmt.setString(2,question);
		        
		       
		        prepStmt.executeUpdate();
		        prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		        sqe.printStackTrace();
		        connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
 }
	 
	 public String getquiznameid(String quizname,String coursecode)
	    {
	    	 
	    	String quizname_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT test_id FROM tbltestMaster WHERE test_name=? and course_code=? and test_status='Act'";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,quizname);
				            prepStmt.setString(2,coursecode);
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	quizname_id = rs.getString(1);
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
			       
			    return quizname_id;
	    }
	 
	 public String updatetestStatusActive(String quizname_id)
	    {
	    	 
	    	String quiznamestatus=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="update tbltestMaster set test_status='Active' WHERE test_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,quizname_id);
				            				            
				          int count = prepStmt.executeUpdate();
				            if (count != 0 && count>0){
				            	quiznamestatus = "Updated Successfully";
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
			       
			    return quiznamestatus;
	    }
	 
	 public String getassignmentcount(String co_code)
	    {
	    	 
	    	String count=null;
			    
			  //SELECT COUNT(CustomerID) AS OrdersFromCustomerID7 FROM Orders
	    	//WHERE CustomerID=7;  	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT COUNT(course_code) FROM tblassignment where course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,co_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	count = rs.getString(1);
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
			       
			    return count;
	    }
	 
	 public String getassignsubmittedcount(String user_id)
	    {
	    	 
	    	String count=null;
			    
			  //SELECT COUNT(CustomerID) AS OrdersFromCustomerID7 FROM Orders
	    	//WHERE CustomerID=7;  	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT COUNT(user_id) FROM tblassignsubmitted where user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	count = rs.getString(1);
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
			       
			    return count;
	    }
	 
	 public void deleteassignment(String assign_id,String course_code) {
			try{
		    	 
		    	
				connection.makeConnection(); 
		    	String insertStmt=  "update tblassignment set assignment_status='DeActive' where assign_id=? and course_code=?";
		        
		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,assign_id);
		        prepStmt.setString(2,course_code);
		       	             
		       prepStmt.executeUpdate();
		       prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
		    		
		} 
	 
	 public void deleteReassignment(String assign_id,String course_code) {
			try{
		    	 
		    	
				connection.makeConnection(); 
		    	String insertStmt=  "update tblAssignmentParticular set reAssignment_status='DeActive' where assign_id=? and course_code=?";
		        
		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,assign_id);
		        prepStmt.setString(2,course_code);
		       	             
		       prepStmt.executeUpdate();
		       prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
		    		
		} 
	 
	 public String deleteExam(String course_code, String allow_date) {
		
		 String status = null;
		 
		 try{	    	 
		    	
				connection.makeConnection(); 
		    	String insertStmt=  "update tblExamDetails set exam_status='DeActivate' where course_code=? and exam_date=?";
		        
		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,course_code);
		        prepStmt.setString(2,allow_date);
		       	             
		        int cnt = prepStmt.executeUpdate();
		        if(cnt>0){           	
		        	status="Exam Deleted Successfully";	 
		        	log.info("status from db "+status);
		          }
		       prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
		return status;
		    		
		} 
	 
	 public String deleteTest(String test_id, String course_code) {
			
		 String status = null;
		 
		 try{	  
		    	
				connection.makeConnection(); 
		    	String insertStmt=  "update tbltestMaster set test_status='DeActivate' where test_id=? and course_code=?";
		        
		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,test_id);
		        prepStmt.setString(2,course_code);
		       	             
		        int cnt = prepStmt.executeUpdate();
		        if(cnt>0){           	
		        	status="Test Deleted Successfully";
		          }
		       prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
		return status;
		    		
		} 
	 
	 
	 public ArrayList getnotansuserdetails(String course_code,String assign_name){
	    	
	 	    ArrayList notansuserlist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		   
		        try {
		        	connection.makeConnection();
		        	// String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail, b.status, b.grade, b.answer_text from tbluserdetails a" +
		        	 	//	"inner join tblassignsubmitted b ON a.user_id = b.user_id where a.course = ? ";
//String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a, tblassignsubmitted b, tblStudentCourseDetails c, tblassignment d  where a.user_id <> b.user_id and b.user_id=c.student_user_id and b.assign_name=d.assign_name and d.assign_name=? and c.course_code=?"; 				     

		        	//String str="SELECT a.user_id, a.firstname, a.lastname, a.e_mail from tblEnrolldetails a INNER JOIN tblStudentCourseDetails b ON a.user_id=b.student_user_id INNER JOIN tblassignsubmitted c ON c.user_id <> b.student_user_id where c.course_code=b.course_code and c.assign_name=? and c.course_code=?";
		        	
String str="SELECT DISTINCT a.student_user_id from tblStudentCourseDetails a, tblassignsubmitted b where b.user_id<>a.student_user_id and a.course_code=b.course_code and b.assign_name=? and b.course_code=? and a.course_code=?";
						prepStmt2 = connection.con.prepareStatement(str);
				      // prepStmt2.setString(1,course_name);	
						prepStmt2.setString(1,assign_name);
				       prepStmt2.setString(2,course_code);
				       prepStmt2.setString(3,course_code);
				       			       log.info("assign_name "+assign_name+" course_code "+course_code);
			            rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String user_id = rs2.getString(1);
			            	log.info(" user_id from db "+user_id);
			            	String[] temp={user_id};			            			
			            	notansuserlist.add(temp);			            	
			            }				  
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return notansuserlist;
	}
	 
	 public String getmaterialid(String fileename) 
	    {
	    	 
	    	String materialid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT material_id FROM tblcoursematerial WHERE file_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,fileename);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	materialid = rs.getString(1);
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
			       
			    return materialid;
	    }
	    

	 public ArrayList getemailID(String program_id, String subprogram_id){
	    	
	 	    ArrayList corslist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    try {
		    	connection.makeConnection();
		        	 String str="SELECT e_mail FROM tblEnrolldetails WHERE program_id=? and sub_program_id=?";
				     
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
		        	 prepStmt2.setString(1,program_id);
			            prepStmt2.setString(2,subprogram_id);  
				         rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String email = rs2.getString(1);
			            	
			            	 
			            	String[] temp={email};
			            			
			            	corslist.add(temp);
			            }				   
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return corslist;
	}	 
	 
	 public String setclassschedule(String course_code, String course_name,String title, String dateandtime, String description, String user_id, String program_id, String subprogram_id, String time) {
			
		 String status = null;
		 try{
			 connection.makeConnection(); 
		    	String insertStmt=  "Insert into tblClassSchedule(course_code,course_name,title,dateandtime,description,user_id,program_id,subprogram_id,time) values (?,?,?,?,?,?,?,?,?)";
		        		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,course_code);
		        prepStmt.setString(2,course_name);
		        prepStmt.setString(3,title);
		        prepStmt.setString(4,dateandtime);
		        prepStmt.setString(5,description);
		        prepStmt.setString(6,user_id);
		        prepStmt.setString(7,program_id);
		        prepStmt.setString(8,subprogram_id);
		        prepStmt.setString(9,time);
		        
		        int count = prepStmt.executeUpdate();
		        if(count>0){
		        	status = "Inserted Successfully";
		        }
		        
		        prepStmt.close();
		    } 
		    catch (SQLException sqe) {
		        sqe.printStackTrace();
		        connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }		 
		 return status;
 }
	 
	 public String getcoursename(String course) 
	    {
	    	 
	    	String coursename=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT course_name FROM tblAssignCourse WHERE course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	coursename = rs.getString(1);
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
			       
			    return coursename;
	    }
	 
	
		public String addassign(String assign_name, String question,String course_id, Date allow_date, Date last_date) {			
			String status=null;
			 try{
				 connection.makeConnection(); 
			    	String insertStmt=  "Insert into tblassignment(assign_name,question,course_code,allow_date,last_date) values (?,?,?,?,?)";
			        			    	
			        prepStmt = connection.con.prepareStatement(insertStmt);
			        
			        prepStmt.setString(1,assign_name);
			        prepStmt.setString(2,question);
			        prepStmt.setString(3,course_id);
			        prepStmt.setDate(4,connection.toSQLDate(allow_date));
			        prepStmt.setDate(5,connection.toSQLDate(last_date));
			        prepStmt.executeUpdate();
			        prepStmt.close();
			      status="Assignment Created Successfully";
			    } 
			    catch (SQLException sqe) {
			        sqe.printStackTrace();
			        connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
			    }
			 return status;
		}		
		
public String scheduleexam(String coursecode, String examnname, String tmquestion, String keytwo, String smquestion, String keysixtn, Date allow_date, String password, int shortmark, int briefmark) {			
			String status= "Exam not Created";
			 try{
				 connection.makeConnection(); 
			    	String insertStmt=  "Insert into tblExamSchedule(course_code,exam_name,tmquestion,smquestion,allow_date,keyfor_short,keyfor_brief,password,shortmark,briefmark) values (?,?,?,?,?,?,?,?,?,?)";
			        			    	
			        prepStmt = connection.con.prepareStatement(insertStmt);
			        
			        prepStmt.setString(1,coursecode);
			        prepStmt.setString(2,examnname);
			        prepStmt.setString(3,tmquestion);
			        prepStmt.setString(4,smquestion);
			        prepStmt.setDate(5,connection.toSQLDate(allow_date));
			        prepStmt.setString(6,keytwo);
			        prepStmt.setString(7,keysixtn);
			        prepStmt.setString(8,password);
			        prepStmt.setInt(9,shortmark);
			        prepStmt.setInt(10,briefmark);
			        
			        prepStmt.executeUpdate();
			        prepStmt.close();
			      status="Exam Created Successfully";
			    } 
			    catch (SQLException sqe) {
			        sqe.printStackTrace();
			        connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
			    }
			 return status;
		}

}




