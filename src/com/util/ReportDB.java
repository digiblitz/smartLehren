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

import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

import com.spring.ReportAction;

public class ReportDB {
	
	private static ReportDB myInstance = new ReportDB(); 	
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    static Logger log = Logger.getLogger(ReportAction.class.getName());
	 
    public static ReportDB getInstance(){
		return myInstance;    	
    }
	 private ReportDB(){}
	 Connectiondb connection = Connectiondb.getInstance();
	 
	 public String setlogininsert(String login, String user_id, String role_id, String required) throws RemoteException
	    {
	    	String status=null;  	
	    	try{
	    		    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblAttendanceStatus(user_id,login,required,roleid) values (?,?,?,?)";
     
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        prepStmt.setString(1,user_id);
	        prepStmt.setString(2,login);
	        prepStmt.setString(3,required);
	        prepStmt.setString(4,role_id);
	      	       	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Login time inserted successfully";	 
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
	 
	 public String setlogouttime(String logout, String userlogid) throws RemoteException
	    {
	    	String status=null; 			
	    	try{
	    		connection.makeConnection(); 
	    	
	    	String insertStmt=  "update tblAttendanceStatus SET logout = ? where user_id = ? and logout is NULL";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,logout);
	        prepStmt.setString(2,userlogid);
	       // prepStmt.setString(3,userid);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Logout update successfully";	 
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
	 
	 public String setloginupdate(String login, String user_id) throws RemoteException
	    {
	    	String status=null;  	
	    	
			
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	
	    	String insertStmt=  "update tblAttendanceStatus SET login = ? where user_id = ? ";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,login);
	        prepStmt.setString(2,user_id);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Logout update successfully";	 
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
	 
	 public String getuserid(String user_id)
	    {
	    	 
	    	String userid=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT user_id FROM tblAttendanceStatus where user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	userid = rs.getString(1);
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
			    return userid;
	    }
	 
	 
	 
	 public String getuserlogid(String logout, String user_id)
	    {
	    	String userlogid = null;	      
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT userlogid FROM tblAttendanceStatus where user_id=? and logout=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);	           
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 userlogid = rs.getString(1);
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return userlogid;
	    }
	 	 
	 public String getuserroleid(String designation)
	    {
	    	 
		 String roleid = null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT role_id FROM tblrole where role_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,designation);
				         
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				             roleid = rs.getString(1);
				                		                
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
			    return roleid;
	    }
	 
	 
	 
	 
	 public ArrayList getlogdetails(String userid1,String  s1, String s2)
	    {
	    	 ArrayList useridlist = new ArrayList();	  
			    	
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT * FROM tblAttendanceStatus where user_id=? and DATEPART(yyyy,[date])=? and DATEPART(mm,[date])=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,userid1);
				            prepStmt.setString(2,s1);
				            prepStmt.setString(3,s2);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String userlogid = rs.getString(1);
				            	String user_id= rs.getString(2);
				            	String date= rs.getString(3);
				                String login= rs.getString(4);
				                String logout= rs.getString(5);
				                String workinghours= rs.getString(6);
				                String required= rs.getString(7);
				                String prorate= rs.getString(8);
				                String role_id= rs.getString(9);			                
				                
				                String userlist[] = {userlogid, user_id, date, login, logout, workinghours, required, prorate, role_id};
				                useridlist.add(userlist);
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
			      return useridlist;
	    }

	 public ArrayList getlogtimelist(String user_id)
	    {	    	
	    	ArrayList useridlist = new ArrayList();		   
			    	
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT userlogid,login,logout,required FROM tblAttendanceStatus where user_id=? and workinghours is NULL and prorate is NULL";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String userlogid= rs.getString(1);
				                String login= rs.getString(2);
				                String logout= rs.getString(3);
				                String required= rs.getString(4);
				                
				                String userlist[] = {userlogid, login, logout, required};
				                useridlist.add(userlist);
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
			       
			    return useridlist;
	    }
	 
	 public String setprorate(String proratestr, String userlogid, String workinghours) throws RemoteException
	    {
	    	String status=null; 				
	    	try{	    	
	    		connection.makeConnection(); 
	    	
	    	String insertStmt=  "update tblAttendanceStatus SET prorate = ?, workinghours = ? where userlogid = ?";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,proratestr);
	        prepStmt.setString(2,workinghours);
	        prepStmt.setString(3,userlogid);
	       // prepStmt.setString(3,userid);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Prorate update successfully";	 
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
	 
	
	 	 
	 public ArrayList getmentor(String roleid, String program_id, String sub_program_id)
	    {
	    	 ArrayList useridlist = new ArrayList();		    
			    	  try {
			    		  connection.makeConnection();
			        	 String str="SELECT emp_id,firstname,lastname FROM tblUserdetail where program_id=? and sub_program_id=? and role_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);					     
				            prepStmt.setString(1,program_id);
				            prepStmt.setString(2,sub_program_id);
				            prepStmt.setString(3,roleid);
				            				            				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String emp_id = rs.getString(1);
				            	String firstname= rs.getString(2);
				            	String lastname= rs.getString(3);				                
				                String userlist[] = {emp_id, firstname, lastname};
				                useridlist.add(userlist);
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
			       
			    return useridlist;
	    }
	 public ArrayList getstudent(String roleid,String program_id,String sub_program_id,String batch)
	    {
	    	 ArrayList useridlist = new ArrayList();		    
			    	  try {
			    		  connection.makeConnection();
			        	 String str="SELECT register_no,firstname,lastname FROM tblEnrolldetails where program_id=? and sub_program_id=? and role_id=? and batch=?";
			        	 
					        prepStmt = connection.con.prepareStatement(str);
					       
				          prepStmt.setString(1,program_id);
				          prepStmt.setString(2,sub_program_id);
				          prepStmt.setString(3,roleid);
				          prepStmt.setString(4,batch);
				          
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String register_no = rs.getString(1);
				            	String firstname= rs.getString(2);
				            	String lastname= rs.getString(3);				                
				                String userlist[] = {register_no, firstname, lastname};
				                useridlist.add(userlist);
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
			    return useridlist;
	    }
	 
	 public String getstudentdetails(String userregid)
	    {
		 String user_id = null;
			    	  try {
			    		  connection.makeConnection();
			        	 String str="SELECT user_id FROM tblEnrolldetails where register_no=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,userregid);
				            				            				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	 user_id = rs.getString(1);
				            	
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
			        
			    return user_id;
	    }
	 
	 public String getmentordetails(String userregid)
	    {
		 String user_id = null;
			    	  try {
			    		  connection.makeConnection();
			        	 String str="SELECT user_id FROM tblUserdetail where emp_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,userregid);
				            				            				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	user_id = rs.getString(1);				                
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
			    return user_id;
	    }
	 
	 	 
	 public String getbatch(String semester, String batchdate)
	    {
	    	 
	    	String yearmonth=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT batch FROM tblAttendanceStatus where yearmonth is NULL";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	yearmonth = rs.getString(1);
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
			    return yearmonth;
	    }
	 
	 public ArrayList getfilteredusers(String roleid,String  yearmonth)
	    {
	    	 ArrayList useridlist = new ArrayList();		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT DISTINCT user_id FROM tblAttendanceStatus where roleid=? and yearmonth=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,roleid);
				            prepStmt.setString(2,yearmonth);				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String user_id = rs.getString(1);			            	
				               
				                useridlist.add(user_id);				             
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
			      
			      return useridlist;
	    }
	 
	 
	 public ArrayList getstudentlist(String user_id)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select program_id,sub_program_id,role_name from tblEnrolldetails where user_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String program_id = rs.getString(1);
	 	        	String sub_program_id = rs.getString(2);
	 	        	String role_name = rs.getString(3);
	 	        	
	 	         String[] temps={program_id,sub_program_id,role_name};
	 	        
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }
	 
	 public String getroleid(String user_id)
	    {
	    	String name = null;
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT firstname,lastname FROM tblUserdetail where user_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String firstname = rs.getString(1);
	 	        	String lastname = rs.getString(2);	 	        	
	 	        	 name = firstname+" "+lastname;
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return name;
	    }
	 
	 
	 
	 public ArrayList getcoursementorlist(String user_id)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT program_id,subprogram_id FROM tblAssignCourse where user_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {	 	        	
	 	        	 String program_id = rs.getString(1);
	 	        	String sub_program_id = rs.getString(2);	 	        	
	 	        	
	 	         String[] temps={program_id,sub_program_id};
	 	        
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }
	 
	 public ArrayList getprogrammentorlist(String user_id)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT program_id,sub_program_id FROM tblUserdetail where user_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {	 	        	
	 	        	 String program_id = rs.getString(1);
	 	        	String sub_program_id = rs.getString(2);	 	        	
	 	        	
	 	         String[] temps={program_id,sub_program_id};
	 	        
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }
	 
	 	 
	 public ArrayList getstudentcourselist(String user_id)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT cm_user_id,course_code FROM tblStudentCourseDetails where student_user_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String coursementorid = rs.getString(1);
	 	        	String coursecode = rs.getString(2);
	 	        	
	 	         String[] temps={coursementorid,coursecode};	 	       
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }
	 
	 public ArrayList geteventdetails(String program_id,String sub_program_id,String startdatestr,String enddatestr)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT title,startdate,enddate,description FROM tblEventDetails where program_id=? and subprogram_id=? and date between ? and ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,program_id);
	             prepStmt.setString(2,sub_program_id);
	             prepStmt.setString(3,startdatestr);
	             prepStmt.setString(4,enddatestr);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String title = rs.getString(1);
	 	        	String startdate = rs.getString(2);
	 	        	String enddate = rs.getString(3);
	 	        	String description = rs.getString(4);
	 	        	
	 	         String[] temps={title,startdate,enddate,description};  
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }	    	
	    	return rclist;
	    }
	 
	 public ArrayList getclassscheduledetails(String user_id, String program_id,String sub_program_id,String startdatestr,String enddatestr)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT course_name,title,date,description,time FROM tblClassSchedule where user_id=? and program_id=? and subprogram_id=? and date between ? and ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             prepStmt.setString(2,program_id);
	             prepStmt.setString(3,sub_program_id);
	             prepStmt.setString(4,startdatestr);
	             prepStmt.setString(5,enddatestr);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String course_name = rs.getString(1);
	 	        	String title = rs.getString(2);
	 	        	String dateandtime = rs.getString(3);
	 	        	String description = rs.getString(4);
	 	        	String time = rs.getString(5);
	 	        	
	 	         String[] temps={course_name,title,dateandtime,description,time};
	 	         
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }	    
	    	return rclist;
	    }
	 
	 public ArrayList getclassscheduledetails(String program_id,String sub_program_id,String startdatestr,String enddatestr)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT course_name,title,date,description,time FROM tblClassSchedule where and program_id=? and subprogram_id=? and date between ? and ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             
	             prepStmt.setString(1,program_id);
	             prepStmt.setString(2,sub_program_id);
	             prepStmt.setString(3,startdatestr);
	             prepStmt.setString(4,enddatestr);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String course_name = rs.getString(1);
	 	        	String title = rs.getString(2);
	 	        	String dateandtime = rs.getString(3);
	 	        	String description = rs.getString(4);
	 	        	String time = rs.getString(5);
	 	        	
	 	         String[] temps={course_name,title,dateandtime,description,time};
	 	         
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }	    
	    	return rclist;
	    }
	 
	 public ArrayList getstudentclassschedule(String coursementorid, String coursecode, String startdatestr, String enddatestr)
	    {		 
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "SELECT course_name,title,date,description,time FROM tblClassSchedule where course_code=? and user_id=? and date between ? and ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,coursecode);
	             prepStmt.setString(2,coursementorid);
	             prepStmt.setString(3,startdatestr);
	             prepStmt.setString(4,enddatestr);
	           
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String course_name = rs.getString(1);
	 	        	String title = rs.getString(2);
	 	        	String dateandtime = rs.getString(3);
	 	        	String description = rs.getString(4);
	 	        	String time = rs.getString(5);
	 	        	
	 	         String[] temps={course_name,title,dateandtime,description,time};
	 	        
 	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }	    	
	    	return rclist;
	    }
	 
	 public ArrayList getcoursedetails(String user_id)
	    {
	    	 ArrayList useridlist = new ArrayList();		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT program_id,subprogram_id FROM tblAssignCourse where user_id=?";
					     				        	 
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	
				            	String program_id = rs.getString(1);
				            	String subprogram_id = rs.getString(2);
				            	
				                String userlist[] = {program_id,subprogram_id};
				                useridlist.add(userlist);
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
			      return useridlist;
	    }
	 
	 public String getsturole(String program_id, String sub_program_id)
	    {
	    	 
	    	String rolename=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT role_name FROM tblEnrolldetails where program_id=? and sub_program_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1, program_id);
				            prepStmt.setString(2, sub_program_id);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	rolename = rs.getString(1);
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
			    return rolename;
	    }
	 
	 public String getcourserole(String program_id, String sub_program_id)
	    {
	    	 
	    	String rolename=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT user_id FROM tblAssignCourse where program_id=? and subprogram_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1, program_id);
				            prepStmt.setString(2, sub_program_id);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	rolename = rs.getString(1);
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
			       
			    return rolename;
	    }
	 
	 public ArrayList coursementorlist(String program_id, String sub_program_id)
	    {
	    	 
		 ArrayList rolename= new ArrayList();		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT DISTINCT user_id FROM tblAssignCourse where program_id=? and subprogram_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1, program_id);
				            prepStmt.setString(2, sub_program_id);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            String coursementorid = rs.getString(1);
				            
				            rolename.add(coursementorid);
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
			       
			    return rolename;
	    }
	 
	 public String getrolename(String courseroleid)
	    {
	    	 
	    	String rolename=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT role_name FROM tblUserdetail where user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1, courseroleid);
				            				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	rolename = rs.getString(1);
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
			   			       
			    return rolename;
	    }
	 
	 public ArrayList getbatchlist(String semester)
	    {
	    	 ArrayList useridlist = new ArrayList();		    
			    	  try {
			    		  connection.makeConnection();
			        	 String str="SELECT DISTINCT batch FROM tblbatch where semester=?";
			        	 
					        prepStmt = connection.con.prepareStatement(str);
				          prepStmt.setString(1,semester);	
				          
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String batch = rs.getString(1);	         				                
				                
				                useridlist.add(batch);				                
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
			      
			    return useridlist;
	    }
	 
	 public ArrayList getprogramlist(String user_id)
	    {
	    	 
		 ArrayList rolename= new ArrayList();		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT program_id,sub_program_id FROM tblEnrolldetails where user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1, user_id);
	          				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            String program_id = rs.getString(1);
				            String sub_program_id = rs.getString(2);
				            
				            String strarr[] = {program_id,sub_program_id};
				            rolename.add(strarr);
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
			       
			    return rolename;
	    }	
}
