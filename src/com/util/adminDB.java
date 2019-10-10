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

import javax.ejb.EJBException;

import org.apache.log4j.PropertyConfigurator;

public class adminDB {
	

	private static adminDB myInstance = new adminDB();     
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    Connectiondb connection = Connectiondb.getInstance();
    
    public static adminDB getInstance(){
		return myInstance;    	
    }
	 
	 private adminDB(){
		 
	 }
	 
	 public boolean getConfirmAdmin(String user_id){
		 
		boolean flag = false;
		 
		 try{
			 connection.makeConnection();
		 
		 String confirmAdmin="select user_id from tblUserdetail where user_id=? and emp_id is null and program_id is null and sub_program_id is null and role_id is not null";
		 
		 prepStmt = connection.con.prepareStatement(confirmAdmin);
		 prepStmt.setString(1,user_id);
		 rs = prepStmt.executeQuery();
		 
		 if(rs.next()){
			flag = true;			
		 }
		 	prepStmt.close();
		 	rs.close();
		 
		 }
		 catch(SQLException sqe){
			 connection.releaseConnection();		 
		 }
		 finally { 
			 connection.releaseConnection();
			 }
		 return flag;
	 }
	 
	 public String addEventDetails(String program_id,String subprogram_id,String course_id,String title,String startdate,String enddate, String description){
		 String status="Insertion of Event Details Failed"; 
		 try {
			 connection.makeConnection();
			 
	String insertEventDetails="insert into tblEventDetails(program_id,subprogram_id,course_code,title,startdate,enddate,description) values(?,?,?,?,?,?,?)";
			prepStmt = connection.con.prepareStatement(insertEventDetails);
			
			    prepStmt.setString(1,program_id);
		        prepStmt.setString(2,subprogram_id);
		        prepStmt.setString(3,course_id);
		        prepStmt.setString(4,title);
		        prepStmt.setString(5,startdate);
		        prepStmt.setString(6,enddate);
		        prepStmt.setString(7,description);
		        
			int count=prepStmt.executeUpdate();
			
			if(count>0){
				status="Event Details Stored Successfully";
			}
			prepStmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			connection.releaseConnection();	
		}
		 finally { connection.releaseConnection(); }
		 return status;
	 }
	 
public ArrayList fetchProgram_id(String user_id){
		 
		 ArrayList pgmList = new ArrayList();
		 
		 try{
			 connection.makeConnection();
		 
		 String fetchProgramid="select program_id, sub_program_id from tblEnrolldetails where user_id=?";
		 
		 prepStmt = connection.con.prepareStatement(fetchProgramid);
		 prepStmt.setString(1,user_id);
		 rs = prepStmt.executeQuery();
		 
		 while(rs.next()){
			 String program_id=rs.getString(1);
			 String sub_program_id=rs.getString(2);
			 String[] temps={program_id, sub_program_id};
			 pgmList.add(temps);
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

public ArrayList getProgram_id(String user_id){
	 
	 ArrayList programList = new ArrayList();
	 
	 try{
		 connection.makeConnection();
	 
	 String selectProgramid="select program_id, subprogram_id from tblAssignCourse where user_id=?";
	 
	 prepStmt = connection.con.prepareStatement(selectProgramid);
	 prepStmt.setString(1,user_id);
	 rs = prepStmt.executeQuery();
	 
	 while(rs.next()){
		 String program_id=rs.getString(1);
		 String subprogram_id=rs.getString(2);
		 String[] temps={program_id, subprogram_id};
		 programList.add(temps);
	 }
	 	prepStmt.close();
	 	rs.close();
	 
	 }
	 catch(SQLException sqe){
		 connection.releaseConnection();		 
	 }
	 finally { connection.releaseConnection(); }
	 return programList;
}

public ArrayList fetchEventDetails(String program_id, String sub_program_id){
	 
	 ArrayList eventList = new ArrayList();
	 
	 try{
		 connection.makeConnection();
	 
	 String fetchProgramid="select title, startdate, enddate,description from tblEventDetails where program_id=? and subprogram_id=?";
	 
	 prepStmt = connection.con.prepareStatement(fetchProgramid);
	 prepStmt.setString(1,program_id);
	 prepStmt.setString(2,sub_program_id);
	 rs = prepStmt.executeQuery();
	 
	 while(rs.next()){
		 String title=rs.getString(1);
		 String startdate=rs.getString(2);
		 String enddate=rs.getString(2);
		 String description=rs.getString(2);
		 String[] temps={title, startdate, enddate, description};
		 eventList.add(temps);
		 
	 }
	 
	
	 	prepStmt.close();
	 	rs.close();
	 
	 }
	 catch(SQLException sqe){
		 connection.releaseConnection();		 
	 }
	 finally { connection.releaseConnection(); }
	 return eventList;
}

	 
	 public ArrayList getcourse()
	    {
	    	ArrayList list = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblcourse";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String course_id = rs.getString(1);
	 	        	 String course_name = rs.getString(2);
	 	        	  String[] temps={course_id,course_name};
	 	        	list.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return list;
	    }
	 public ArrayList getrole()
	    {
	    	ArrayList rolelist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblrole";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String role_id = rs.getString(1);
	 	        	 String role_name = rs.getString(2);
	 	        	  String[] temps={role_id,role_name};
	 	        	rolelist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rolelist;
	    }   
	 
	 public ArrayList getcoursementorlist(String proid,String subproid,String user_id) {
		  ArrayList crsMentrList = new ArrayList();
		  String name="course mentor";
		    		               
		     try {
		    	 connection.makeConnection();

		   String selectStatement =  "select a.user_id,a.firstname,a.lastname,a.e_mail,b.course_name,c.subcourse_name FROM tblUserdetail a, tblcourse b,tblsubcourse c " +
		   		"WHERE b.course_id=? and c.sub_id=? and a.program_id=? and a.sub_program_id=? and a.user_id!=?";
		                
		                prepStmt = connection.con.prepareStatement(selectStatement);
		                prepStmt.setString(1,proid);
		                prepStmt.setString(2,subproid);
		                prepStmt.setString(3,proid);
		                prepStmt.setString(4,subproid);
		                prepStmt.setString(5,user_id);
		                rs = prepStmt.executeQuery();
		              
		               while(rs.next()) {
		                 user_id = rs.getString(1);
		               String firstname = rs.getString(2);
		               String lastname = rs.getString(3);
					   String e_mail = rs.getString(4);
					   String course_name= rs.getString(5);
					   String subcourse_name= rs.getString(6);
		             
					   String[] temps={user_id,firstname,lastname,e_mail,course_name,subcourse_name, proid, subproid};
		               
					   crsMentrList.add(temps);		            
		               }
		                prepStmt.close();
		                rs.close();          
		                
		     } catch (SQLException sqe) {
		    	 connection.releaseConnection();
		     } finally {
		    	 connection.releaseConnection();
		     }

		     return crsMentrList;
		 }
	 
	 public ArrayList getsubcourse()
	    {
	    	ArrayList sublist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblsubcourse";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String sub_id = rs.getString(1);
	 	        	 String course_id = rs.getString(2);
	 	        	 String subcourse_name = rs.getString(3);
	 	        	  String[] temps={sub_id,course_id,subcourse_name};
	 	        	 sublist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return sublist;
	    }
	 
	 public ArrayList getbatch()
	    {
	    	ArrayList batch = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select distinct batch from tblbatch";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String bat = rs.getString(1);
	 	        	
	 	        	  String[] temps={bat};
	 	        	 batch.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return batch;
	    }
	 
	 public ArrayList getentity()
	    {
	    	ArrayList enlist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblentity";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String entity_id = rs.getString(1);
	 	        	 String entity_name = rs.getString(2);
	 	        	 String url_name = rs.getString(3);
	 	        	  String[] temps={entity_id,entity_name,url_name};
	 	        	 enlist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return enlist;
	    }   
	 
	 public ArrayList getprivilege()
	    {
	    	ArrayList privilist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblprivilege";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String privilege_id = rs.getString(1);
	 	        	 String privilege_name = rs.getString(2);
	 	        	
	 	        	  String[] temps={privilege_id,privilege_name};
	 	        	 privilist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return privilist;
	    }   
	 public ArrayList getpermission()
	    {
	    	ArrayList permilist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblpermission";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String permission_id = rs.getString(1);
	 	        	 String permission_name = rs.getString(2);
	 	        	 String url_name = rs.getString(3);
	 	        	  String[] temps={permission_id,permission_name,url_name};
	 	        	 permilist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return permilist;
	    }   
	
	 public ArrayList getuserlist()
	    {
	    	ArrayList userlist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select user_id,username,password,firstname,lastname,e_mail,city,country from tbluserdetails";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String user_id = rs.getString(1);
	 	        	String username = rs.getString(2);
	 	        	String password = rs.getString(3);
	 	        	  String firstname = rs.getString(4);
	 	        	 String lastname = rs.getString(5);
	 	        	 String e_mail = rs.getString(6);
	 	        	 String city = rs.getString(7);
	 	        	 String country = rs.getString(8);
	 	        	  String[] temps={user_id,username,password,firstname,lastname,e_mail,city,country};
	 	        	 userlist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return userlist;
	    }
	 
	 public ArrayList getuserlist(String user_id)
	    {
	    	ArrayList userlist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode from tblUserdetail where user_id = ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	
	 	        	String username = rs.getString(1);
	 	        	String password = rs.getString(2);
	 	        	  String firstname = rs.getString(3);
	 	        	 String lastname = rs.getString(4);
	 	        	 String gender=rs.getString(5);
	 	        	 String e_mail = rs.getString(6);
	 	        	 String dob = rs.getString(7);
	 	        	String mobile_no = rs.getString(8);
	 	        	String father_name = rs.getString(9);
	 	        	String mother_name = rs.getString(10);
	 	        	String address1 = rs.getString(11);
	 	        	String address2 = rs.getString(12);	 	        	
	 	        	String city = rs.getString(13);
	 	        	String state = rs.getString(14);	 	        	
	 	        	 String country = rs.getString(15);
	 	        	String pincode = rs.getString(16);
	 	        	
	 	        	  String[] temps={username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode};
	 	        	 userlist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return userlist;
	    }
	 public ArrayList getuserslist(String usernamee)
	    {
	    	ArrayList userlist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select username,password,e_mail from tblUserdetail where username = ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,usernamee);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	
	 	        	String username = rs.getString(1);
	 	        	String password = rs.getString(2);	 	        	
	 	        	 String e_mail = rs.getString(3);
	 	        	
	 	        	
	 	        	  String[] temps={username,password,e_mail};
	 	        	 userlist.add(temps);	 	        
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return userlist;
	    }

	 public ArrayList getemplist()
	     {
	      ArrayList emplist = new ArrayList();
	      
	       try {
	    	   connection.makeConnection();         
	                 
	              String selectStatement =  "select user_id,emp_id,firstname,lastname,e_mail,city,state,country from tblUserdetail where emp_id is not null";
	              
	              prepStmt = connection.con.prepareStatement(selectStatement);
	              //prepStmt.setString(1,emp_id);
	              rs = prepStmt.executeQuery();
	            
	             while(rs.next()) {
	            	 String user_id  = rs.getString(1);
	             String emp_id  = rs.getString(2);
	              String firstname = rs.getString(3);
	             String lastname = rs.getString(4);
	            String e_mail = rs.getString(5);
	            String city = rs.getString(6);
	            String state = rs.getString(7);
	             String country = rs.getString(8);
	              String[] temps={user_id,emp_id,firstname,lastname,e_mail,city,state,country};
	             emplist.add(temps);
	            
	             
	             }
	              prepStmt.close();
	              rs.close();          
	               } 
	          catch (SQLException sqe) { connection.releaseConnection(); } 
	       finally { connection.releaseConnection(); }
	      
	      return emplist;
	     }
	 
	 public String getcourseid(String course_name)
	    {
	    	 
	    	String course_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT course_id FROM tblcourse WHERE course_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_name);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	course_id = rs.getString(1);
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
			       
			    return course_id;
	    }
	 
	 public String getentityid(String entityname)
	    {
	    	 
	    	String entity_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT entity_id FROM tblentity WHERE entity_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,entityname);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	entity_id = rs.getString(1);
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
			       
			    return entity_id;
	    }
	 
	 
	 public String getuserid(String username)
	    {
	    	 
	    	String user_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT user_id FROM tblUserdetail WHERE username=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,username);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
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
	 public String getusername(String user_id)
	    {
	    	 
	    	String username=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT username FROM tbluserdetail WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	username = rs.getString(1);
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
			       
			    return username;
	    }
	 
	 public String getuserpicture(String user_id)
	    {
	    	 
	    	String pathname=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT path_name FROM tbluserpicture WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	pathname = rs.getString(1);
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
			       
			    return pathname;
	    }
	 
	 public String addsubcourse(String course_id,String course_name)
	 {
	    	
		 String status=null;  	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblsubcourse(course_id,subcourse_name) values (?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_id);
	        prepStmt.setString(2,course_name);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Course created successfully";	 
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
	 
	 public String addprivilege(String privilegename)
	 {
	    	
		 String status=null;  	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblprivilege(privilege_name) values (?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,privilegename);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Privilege created successfully";	 
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
	 
	 public String addpermission(String permissionname,String url_name)
	 {
	    	
		 String status=null;  	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblpermission(permission_name,url_name) values (?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,permissionname);
	        prepStmt.setString(2,url_name);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Permission created successfully";	 
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
	 
	 public String addentity(String entityname,String url_name)
	 {
	    	
		 String status=null;  	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblentity(entity_name,url_name) values (?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,entityname);
	        prepStmt.setString(2,url_name);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Entity created successfully";	 
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
	 
	 public String addmappingentity(String rolename,String entityname,String privname,String permname)
	 {
	    	
		 String status="Already Mapped";  	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblMappingEntityDetails(role_id,entity_id,privilege_id,permission_id) values (?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,rolename);
	        prepStmt.setString(2,entityname);
	        prepStmt.setString(3,privname);
	        prepStmt.setString(4,permname);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Mapped Successfully";	 
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
	 
	 
	 public void insertcoursematerials(String selProg,String selSubProg,String selSemester,String course_code,String course_name,String url)
	    {
		 String status=null;  	
	    	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblcoursematerial(program_id,sub_program_id,sem,course_code,course_name,url_link) values (?,?,?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,selProg);
	        prepStmt.setString(2,selSubProg);
	        prepStmt.setString(3,selSemester);
	        prepStmt.setString(4,course_code);
	        prepStmt.setString(5,course_name);
	        prepStmt.setString(6,url);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Course Material inserted successfully";	      	 
	          }
	        prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    }
	 
	 public void addpdfcoursematerial(String pro,String subpro,String sem,String Course_Code,String Course_Name,String fileename,String saveFile)
	    {
		 String status=null;  	
	    	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblcoursematerial(program_id,sub_program_id,sem,course_code,course_name,file_name,file_path) values (?,?,?,?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,pro);
	        prepStmt.setString(2,subpro);
	        prepStmt.setString(3,sem);
	        prepStmt.setString(4,Course_Code);
	        prepStmt.setString(5,Course_Name);
	        prepStmt.setString(6,fileename);
	        prepStmt.setString(7,saveFile);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Course Pdf Material inserted successfully";	    
	          }
	        prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    }
	 
	 public void adduserpicture(String user_id,String saveFile)
	    {
	
		 String path=saveFile;	
	    	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tbluserpicture(user_id,path_name) values (?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,user_id);
	        prepStmt.setString(2,saveFile);
	        
	        prepStmt.executeUpdate();
	        prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	
	    }
	 public ArrayList getcourselist(String progId, String subprogId,String sem)
	    {
	    	ArrayList list1 = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select course_code, course_name from tblMapProgram where program_id=? and sub_program_id=? and semester=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,progId);
	             prepStmt.setString(2,subprogId);
	             prepStmt.setString(3,sem);
	             
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String course_code = rs.getString(1);
	 	        	String course_name = rs.getString(2);
	 	        	
	 	        	  String[] temps={course_code,course_name};	 	        	
	 	        	 list1.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return list1;
	    }
	 
	 public ArrayList getprivilegelist(String role_id,String entityid){
	    	
 	    ArrayList privlist= new ArrayList();
 PreparedStatement prepStmt2=null;
 ResultSet rs2=null;
 
     try {
    	 connection.makeConnection();
     	 String str="SELECT distinct a.privilege_id,a.privilege_name from tblprivilege a,tblMappingEntityDetails b " +
     	 		"where a.privilege_id = b.privilege_id and b.entity_id = ? and b.role_id = ?";
		     				     
		        prepStmt2 = connection.con.prepareStatement(str);
		      
		       prepStmt2.setString(1,entityid);
		       prepStmt2.setString(2,role_id);  
	            rs2 = prepStmt2.executeQuery();
	            while(rs2.next()){
	            	String p_id = rs2.getString(1);
	            	String p_name = rs2.getString(2);	            
	            	String[] temp={p_id,p_name};
	            			
	            	privlist.add(temp);
	            }		  
		   rs2.close();
	       prepStmt2.close();
	       connection.releaseConnection(); 

     }catch(SQLException sql){
    	 connection.releaseConnection();
         throw new EJBException("SQL Exception in MemberUpdateDAO getNextUserId:" + sql.getMessage());
         
     }finally {
    	 connection.releaseConnection();
     }
     return privlist;
}
	 public ArrayList getpermissionlist(String role_id,String entityid){
	    	
	 	    ArrayList permlist= new ArrayList();
	 PreparedStatement prepStmt2=null;
	 ResultSet rs2=null;
	 
	     try {
	    	 connection.makeConnection();
	     	 String str="SELECT distinct b.privilege_id,a.permission_id,a.permission_name,a.url_name from tblpermission a,tblMappingEntityDetails b where " +
	     	 		"a.permission_id = b.permission_id and b.entity_id = ? and b.role_id = ?";
			     				     
			        prepStmt2 = connection.con.prepareStatement(str);
			        
			       prepStmt2.setString(1,entityid);
			       prepStmt2.setString(2,role_id);
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String pri_id = rs2.getString(1);
		            	String per_id = rs2.getString(2);
		            	String per_name = rs2.getString(3);
		            	String url_name = rs2.getString(4);		            	
		            	String[] temp={pri_id,per_id,per_name,url_name};
		            			
		            	permlist.add(temp);
		            }			   
			   rs2.close();
		       prepStmt2.close();
		       connection.releaseConnection(); 

	     }catch(SQLException sql){
	    	 connection.releaseConnection();
	         
	     }finally {
	    	 connection.releaseConnection();
	     }
	     return permlist;
	}
	 
	 public ArrayList getenrolllistforupload(String user_id)
	    {
	    	ArrayList enlist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select a.role_name,d.course_name,c.subcourse_name,b.start_date,b.end_date from tbluserdetails a , tblmapenroll b , tblsubcourse c , tblcourse d where a.user_id=b.user_id and b.course_id=c.sub_id and c.course_id=d.course_id and a.user_id = ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 
	 	        	String rolename = rs.getString(1);
	 	        	String coursename = rs.getString(2);
	 	        	String subcourse_name = rs.getString(3);
	 	        	String start_date = rs.getString(4);
	 	        	String end_date = rs.getString(5);
	 	        	
	 	        	  String[] temps={rolename,coursename,subcourse_name,start_date,end_date};
	 	        	 enlist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return enlist;
	    }
	 
	
	 
	 public ArrayList studentenrolist()
	    {
		 ArrayList slist=new ArrayList(); 
	    String role="student";	
	    	   
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT a.username,a.firstname,a.lastname,a.e_mail from tbluserdetails a,tblapprove b where a.user_id=b.user_id and status IS NULL and a.role_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1,role);
				            rs = prepStmt.executeQuery();
				            while(rs.next()) {
				 	        	  String username = rs.getString(1);
				 	        	 String firstname = rs.getString(2);
				 	        	 String lastname = rs.getString(3);
				 	        	String e_mail = rs.getString(4);
				 	        	 
				 	        	  String[] temps={username,firstname,lastname,e_mail};
				 	        	
				 	        	 slist.add(temps);
				 	        	 
				 	          }				          
				             prepStmt.close();
				             rs.close();          
				              } 
				         catch (SQLException sqe) { connection.releaseConnection(); } 
				    	 finally { connection.releaseConnection(); }
				    	
				    	return slist;
				    }
	 
	 public ArrayList getlistforselfenroll()
	    {
		 ArrayList selist=new ArrayList(); 
	    String statusvalue="Pending";	
	    	   
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT a.user_id,a.username,a.password,a.firstname,a.lastname,a.gender,a.e_mail,a.dob,a.mobile_no,a.father_name,a.mother_name," +
			        	 		"a.address1,a.address2,a.city,a.state,a.country,a.pincode,b.category,b.program_name,b.subprogram_name,b.sslc_schoolname,b.sslc_board,b.sslc_mark,b.sslc_yop," +
			        	 		"b.hsc_schoolname,b.hsc_board,b.hsc_mark,b.hsc_yop from tblUserdetail a,tblprovisionenroll b where a.user_id=b.user_id and b.status = ?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1,statusvalue);
				            rs = prepStmt.executeQuery();
				            while(rs.next()) {
				            	String user_id = rs.getString(1);
				 	        	String username = rs.getString(2);
				 	        	String password = rs.getString(3);
				 	        	String firstname = rs.getString(4);
				 	        	String lastname = rs.getString(5);
				 	        	String gender = rs.getString(6);
				 	        	String e_mail = rs.getString(7);
				 	        	String dob = rs.getString(8);
				 	        	String mobile_no = rs.getString(9);
				 	        	String father_name = rs.getString(10);
				 	        	String mother_name = rs.getString(11);
				 	        	String address1 = rs.getString(12);
				 	        	String address2 = rs.getString(13);
				 	        	String city = rs.getString(14);
				 	        	String state = rs.getString(15);
				 	        	String country = rs.getString(16);
				 	        	String pincode = rs.getString(17);
				 	        	String category = rs.getString(18);
				 	        	String program_name = rs.getString(19);
				 	        	String subprogram_name = rs.getString(20);
				 	        	String sslc_schoolname = rs.getString(21);
				 	        	String sslc_board = rs.getString(22);
				 	        	String sslc_mark = rs.getString(23);
				 	        	String sslc_yop = rs.getString(24);
				 	        	String hsc_schoolname = rs.getString(25);
				 	        	String hsc_board = rs.getString(26);
				 	        	String hsc_mark = rs.getString(27);
				 	        	String hsc_yop = rs.getString(28);
				 	        	 
				 	        	  String[] temps={user_id,username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode,
				 	        			 category,program_name,subprogram_name,sslc_schoolname,sslc_board,sslc_mark,sslc_yop,hsc_schoolname,hsc_board,hsc_mark,hsc_yop};
				 	        	
				 	        	 selist.add(temps);
				 	        	 
				 	          }				          
				             prepStmt.close();
				             rs.close();          
				              } 
				         catch (SQLException sqe) { connection.releaseConnection(); } 
				    	 finally { connection.releaseConnection(); }
				    	
				    	return selist;
				    }
	
	 public ArrayList getlistforselfenroll(String user_id)
	    {
		 ArrayList selist=new ArrayList(); 
	    	    	   
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT a.username,a.password,a.firstname,a.lastname,a.gender,a.e_mail,a.dob,a.mobile_no,a.father_name,a.mother_name," +
			        	 		"a.address1,a.address2,a.city,a.state,a.country,a.pincode,b.category,b.program_name,b.subprogram_name,b.sslc_schoolname,b.sslc_board,b.sslc_mark,b.sslc_yop," +
			        	 		"b.hsc_schoolname,b.hsc_board,b.hsc_mark,b.hsc_yop,b.highest_std from tblUserdetail a,tblprovisionenroll b where a.user_id=b.user_id and a.user_id = ?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1,user_id);
				            rs = prepStmt.executeQuery();
				            while(rs.next()) {
				            	
				 	        	String username = rs.getString(1);
				 	        	String password = rs.getString(2);
				 	        	String firstname = rs.getString(3);
				 	        	String lastname = rs.getString(4);
				 	        	String gender = rs.getString(5);
				 	        	String e_mail = rs.getString(6);
				 	        	String dob = rs.getString(7);
				 	        	String mobile_no = rs.getString(8);
				 	        	String father_name = rs.getString(9);
				 	        	String mother_name = rs.getString(10);
				 	        	String address1 = rs.getString(11);
				 	        	String address2 = rs.getString(12);
				 	        	String city = rs.getString(13);
				 	        	String state = rs.getString(14);
				 	        	String country = rs.getString(15);
				 	        	String pincode = rs.getString(16);
				 	        	String category = rs.getString(17);
				 	        	String program_name = rs.getString(18);
				 	        	String subprogram_name = rs.getString(19);
				 	        	String sslc_schoolname = rs.getString(20);
				 	        	String sslc_board = rs.getString(21);
				 	        	String sslc_mark = rs.getString(22);
				 	        	String sslc_yop = rs.getString(23);
				 	        	String hsc_schoolname = rs.getString(24);
				 	        	String hsc_board = rs.getString(25);
				 	        	String hsc_mark = rs.getString(26);
				 	        	String hsc_yop = rs.getString(27);
				 	        	String std = rs.getString(28);
				 	        	  String[] temps={username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode,
				 	        			 category,program_name,subprogram_name,sslc_schoolname,sslc_board,sslc_mark,sslc_yop,hsc_schoolname,hsc_board,hsc_mark,hsc_yop,std};
				 	        	
				 	        	 selist.add(temps);				 	        	 
				            }				          
				             prepStmt.close();
				             rs.close();          
				              } 
				         catch (SQLException sqe) { connection.releaseConnection(); } 
				    	 finally { connection.releaseConnection(); }
				    	
				    	return selist;
				    }
	 
	 
	 public ArrayList getsubcourse1(String course_id)
	    {
	    	ArrayList sublist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select subcourse_name from tblsubcourse where course_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,course_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  
	 	        	 String subcourse_name = rs.getString(1);
	 	        	  String[] temps={subcourse_name};
	 	        	sublist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return sublist;
	    }
	 
	 
	 
	 
	 public String getstartdate(String user_id,String course_id)
	    {
	    	String startdate =null ;	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select start_date from tblmapenroll where user_id=? and course_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             prepStmt.setString(2,course_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  
	 	        	  startdate = rs.getString(1);
	 	        	
	 	        	  	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return startdate;
	    }
	 
	 public ArrayList getcoursecodeandcoursename()
     {
      ArrayList list1 = new ArrayList();
      
       try {
    	   connection.makeConnection();         
                 
              String selectStatement =  "select course_code,course_name from tblMapProgram";
               
              
              prepStmt = connection.con.prepareStatement(selectStatement);
             // prepStmt.setString(1,course_id);
              rs = prepStmt.executeQuery();
            
             while(rs.next()) {
             String course_code = rs.getString(1);
             String course_name = rs.getString(2);
            
            
            
              String[] temps={course_code,course_name};          
             list1.add(temps);
              
             }
              prepStmt.close();
              rs.close();          
               } 
          catch (SQLException sqe) { connection.releaseConnection(); } 
       finally { connection.releaseConnection(); }
      
      return list1;
     }
	 
	 public ArrayList getstudentcourses(String user_id)
     {
      ArrayList list1 = new ArrayList();
      
       try {
    	   connection.makeConnection();         
                 
              String selectStatement =  "select a.course_code,a.course_name,b.url_link,b.file_path,b.file_name from tblStudentCourseDetails a,tblcoursematerial b where a.course_code=b.course_code and a.student_user_id=?";
               
              
              prepStmt = connection.con.prepareStatement(selectStatement);
              prepStmt.setString(1,user_id);
              rs = prepStmt.executeQuery();
            
             while(rs.next()) {
             String course_code = rs.getString(1);
             String course_name = rs.getString(2);
             String urllink = rs.getString(3);
             String filepath = rs.getString(4);
             String filename = rs.getString(4);
            
              String[] temps={course_code,course_name,urllink,filepath,filename};
           
             list1.add(temps);
              
             }
              prepStmt.close();
              rs.close();          
               } 
          catch (SQLException sqe) { connection.releaseConnection(); } 
       finally { connection.releaseConnection(); }
      
      return list1;
     }
	 
  public ArrayList getcoursename()
     {
      ArrayList list2 = new ArrayList();
      
       try {
    	   connection.makeConnection();         
                 
              String selectStatement =  "select course_name from tblMapProgram";
               
              
              prepStmt = connection.con.prepareStatement(selectStatement);
             // prepStmt.setString(1,course_id);
              rs = prepStmt.executeQuery();
            
             while(rs.next()) {
            
            String course_name = rs.getString(1);
            
              String[] temps={course_name};          
             list2.add(temps);
              
             }
              prepStmt.close();
              rs.close();          
               } 
          catch (SQLException sqe) { connection.releaseConnection(); } 
       finally { connection.releaseConnection(); }
      
      return list2;
     }
	 
	 public ArrayList getemplist(String emp_id)
     {
      ArrayList emplist = new ArrayList();
      
       try {
    	   connection.makeConnection();         
                 
              String selectStatement =  "select firstname,lastname,e_mail,city,state,country from tblUserdetail where emp_id <> ? ";
              
              prepStmt = connection.con.prepareStatement(selectStatement);
              prepStmt.setString(1,emp_id);
              rs = prepStmt.executeQuery();
            
             while(rs.next()) {
            
            // String  = rs.getString(1);
              String firstname = rs.getString(1);
             String lastname = rs.getString(2);
             String e_mail = rs.getString(3);
             String city = rs.getString(4);
             String state = rs.getString(5);
             String country = rs.getString(6);
              String[] temps={firstname,lastname,e_mail,city,state,country};
             emplist.add(temps);
              
             }
              prepStmt.close();
              rs.close();          
               } 
          catch (SQLException sqe) { connection.releaseConnection(); } 
       finally { connection.releaseConnection(); }
      
      return emplist;
     }
	 
	 public String getsubcourseid(String course_name)
	    {
	    	 
	    	String course_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT sub_id FROM tblsubcourse WHERE subcourse_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_name);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	course_id = rs.getString(1);
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
			       
			    return course_id;
	    }
	 
	 public String getmapentityid(String rolename,String entityname,String privname,String permname)
	    {
	    	 
	    	String map_id=null;
			    
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT map_id FROM tblMappingEntityDetails WHERE role_id=? and entity_id=? and privilege_id=? and permission_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,rolename);
				            prepStmt.setString(2,entityname);
				            prepStmt.setString(3,privname);
				            prepStmt.setString(4,permname);				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	map_id = rs.getString(1);
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
			       
			    return map_id;
	    }
	 
	 public ArrayList getcoursetopicname()
	    {
	    	ArrayList list1 = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblCMTopicLink";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	            
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String topic_id = rs.getString(1);
	 	        	String course_code = rs.getString(2);
	 	        	String topic_name = rs.getString(3);
	 	         String[] temps={topic_id,course_code,topic_name};
	 	        	
	 	        	 list1.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return list1;
	    }
	 
	 public ArrayList getcoursetopicname(String course_code)
	    {
	    	ArrayList list1 = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblCMTopicLink where course_code=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,course_code);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String topic_id = rs.getString(1);
	 	        	String coursecode = rs.getString(2);
	 	        	String topic_name = rs.getString(3);
	 	         String[] temps={topic_id,coursecode,topic_name};
	 	        	
	 	        	 list1.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return list1;
	    }
	 
	 public ArrayList getcoursesubtopicname(String course_code)
	    {
	    	ArrayList list1 = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblCMSubtopicLink where course_code=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,course_code);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String subtopic_id = rs.getString(1);
	 	        	String coursecode = rs.getString(2);
	 	        	String topic_id = rs.getString(3);
	 	        	String subtopic_name = rs.getString(4);
	 	        	String url = rs.getString(5);
	 	         String[] temps={subtopic_id,coursecode,topic_id,subtopic_name,url};	 	       
	 	        	 list1.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return list1;
	    }
	 


	 
	 public void insertcoursematerials(String course_code,String sm,String rm,String rc,String lc,String pb,String sg,String we,String cc)
	    {
		 String status=null;  				
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblCourseMaterialLink(course_code,study_material,reference_material,recorded_class,live_class,pdf_book," +
	    			"study_guideline,writting_excellance,course_community) values (?,?,?,?,?,?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_code);
	        prepStmt.setString(2,sm);
	        prepStmt.setString(3,rm);
	        prepStmt.setString(4,rc);
	        prepStmt.setString(5,lc);
	        prepStmt.setString(6,pb);
	        prepStmt.setString(7,sg);
	        prepStmt.setString(8,we);
	        prepStmt.setString(9,cc);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Course Material inserted successfully";	      
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
	 
	 public String insertcoursematerialtopic(String course_code,String topicname)
	    {
		 String status=null;  	
	    	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblCMTopicLink(course_code,topic_name) values (?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_code);
	        prepStmt.setString(2,topicname);
	       
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Inserted successfully";	     
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
	 
	 public String insertcoursematerialsubtopic(String course_code,String topicid,String subtopicname,String urllink)
	    {
		 String status=null;  	
	    	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblCMSubtopicLink(course_code,topic_id,subtopic_name,url_link) values (?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_code);
	        prepStmt.setString(2,topicid);
	        prepStmt.setString(3,subtopicname);
	        prepStmt.setString(4,urllink);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Inserted successfully";	      	
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
	 
	 public String getmaterial_id(String course_code)
	    {
	    	 
	    	String mat_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT material_id FROM tblcoursematerial WHERE course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	mat_id = rs.getString(1);
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
			       
			    return mat_id;
	    }
	
	 public String getexistfilename(String course_code)
	    {
	    	 
	    	String filename=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT file_name FROM tblcoursematerial WHERE course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	filename = rs.getString(1);
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
			       
			    return filename;
	    }
	
	 public String getexistfilepath(String course_code)
	    {
	    	 
	    	String filepath=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT file_path FROM tblcoursematerial WHERE course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	filepath = rs.getString(1);
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
			       
			    return filepath;
	    }
	
	 public ArrayList getcoursementor(String role_name)
     {
      ArrayList list1 = new ArrayList();
      
       try {
    	   connection.makeConnection();         
                 
              String selectStatement =  "select user_id,firstname,lastname from tblUserdetail where role_name = ? ";
               
              
              prepStmt = connection.con.prepareStatement(selectStatement);
              prepStmt.setString(1,role_name);
              rs = prepStmt.executeQuery();
            
             while(rs.next()) {
             String user_id = rs.getString(1);
             String firstname = rs.getString(2);
            
             String lastname = rs.getString(3);

            
            
              String[] temps={user_id,firstname,lastname};        
             list1.add(temps);
              
             }
              prepStmt.close();
              rs.close();          
               } 
          catch (SQLException sqe) { connection.releaseConnection(); } 
       finally { connection.releaseConnection(); }
      
      return list1;
     }
	 
	 public void deleteuser(String user_id)
	    {
	    try{
	    	connection.makeConnection(); 
	    	String insertStmt=  "delete from tbluserdetails  where user_id = ? ";
	       prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,user_id);
	        prepStmt.executeUpdate();
	        prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    }
	 

	//===================Updated method=========================================
	 public String assigncourse(String mentor,String programname,String subprogramname,String Sem,String CourseCode,String CourseName)
	  {
	   String status="AssignCourse not created ";  	  
	   try{
	    
		   connection.makeConnection(); 
	   String insertStmt=  "Insert into tblAssignCourse(user_id,program_id,subprogram_id,semester,course_code,course_name) values (?,?,?,?,?,?)";
	      
	   
	      prepStmt = connection.con.prepareStatement(insertStmt);
	      
	      prepStmt.setString(1,mentor);
	      prepStmt.setString(2,programname);
	      prepStmt.setString(3,subprogramname);
	      prepStmt.setString(4,Sem);
	      prepStmt.setString(5,CourseCode);
	      prepStmt.setString(6,CourseName);
	     
	     
	      int cnt= prepStmt.executeUpdate();
	      if(cnt>0){
	          
	       status="Course Assigned Successfully";  
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

	 public String paymentdetails(String user_id,String paymenttype,String ddno,Date dddate,String nobank,String nobranch,String amount)
	  {
	   String status="Payment not success "; 	      
	   try{
	    
		   connection.makeConnection(); 
	   String insertStmt=  "Insert into tblPaymentDetails(user_id,payment_type,dd_number,dd_date,bank_name,bank_branch,amount) values (?,?,?,?,?,?,?)";
	      
	   
	      prepStmt = connection.con.prepareStatement(insertStmt);
	      
	      prepStmt.setString(1,user_id);
	      prepStmt.setString(2,paymenttype);
	      prepStmt.setString(3,ddno);
	      prepStmt.setDate(4,connection.toSQLDate(dddate));
	      prepStmt.setString(5,nobank);
	      prepStmt.setString(6,nobranch);
	      prepStmt.setString(7,amount);
	     // payment_id, payment_type, dd_number, dd_date, bank_name, bank_branch
	     
	      int cnt= prepStmt.executeUpdate();
	      if(cnt>0){	          
	       status="Paid successfully"; 	     
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
	 
	public ArrayList getsubcoursee(String course_id) {
			ArrayList sublist = new ArrayList();

			try {
				connection.makeConnection();

				//String selectStatement = "select sub_id, subcourse_name from tblsubcourse where course_id=?";
				String selectStatement = "select subcourse_name from tblsubcourse where course_id=?";

				prepStmt = connection.con.prepareStatement(selectStatement);
				prepStmt.setString(1, course_id);
				rs = prepStmt.executeQuery();

				while (rs.next()) {

					String subProg_name = rs.getString(1);
					//String subProg_name = rs.getString(2);
					String[] temps = {subProg_name };
					sublist.add(temps);			
					
				}
				prepStmt.close();
				rs.close();
			} catch (SQLException sqe) {
				connection.releaseConnection();
			} finally {
				connection.releaseConnection();
			}

			return sublist;
		}
	
	public ArrayList getsubcourse(String course_id) {
		ArrayList sublist = new ArrayList();

		try {
			connection.makeConnection();

			String selectStatement = "select sub_id, subcourse_name from tblsubcourse where course_id=?";
			

			prepStmt = connection.con.prepareStatement(selectStatement);
			prepStmt.setString(1, course_id);
			rs = prepStmt.executeQuery();

			while (rs.next()) {

				String subProg_id = rs.getString(1);
				String subProg_name = rs.getString(2);
				String[] temps = {subProg_id,subProg_name };
				sublist.add(temps);				
			}
			prepStmt.close();
			rs.close();
		} catch (SQLException sqe) {
			connection.releaseConnection();
		} finally {
			connection.releaseConnection();
		}

		return sublist;
	}
	
	public ArrayList getcourselist(String course_id) {
		ArrayList sublist = new ArrayList();

		try {
			connection.makeConnection();

			String selectStatement = "select sub_id, subcourse_name from tblsubcourse where course_id=?";
			

			prepStmt = connection.con.prepareStatement(selectStatement);
			prepStmt.setString(1, course_id);
			rs = prepStmt.executeQuery();

			while (rs.next()) {

				String subProg_id = rs.getString(1);
				String subProg_name = rs.getString(2);
				String[] temps = {subProg_id,subProg_name };
				sublist.add(temps);				
			}
			prepStmt.close();
			rs.close();
		} catch (SQLException sqe) {
			connection.releaseConnection();
		} finally {
			connection.releaseConnection();
		}

		return sublist;
	}

	public ArrayList getsubcourselist(String course_id) {
		ArrayList sublist = new ArrayList();

		try {
			connection.makeConnection();

			String selectStatement = "select subcourse_name from tblsubcourse where course_id=?";
			

			prepStmt = connection.con.prepareStatement(selectStatement);
			prepStmt.setString(1, course_id);
			rs = prepStmt.executeQuery();

			while (rs.next()) {

				//String subProg_id = rs.getString(1);
				String subProg_name = rs.getString(1);
				String[] temps = {subProg_name };
				sublist.add(temps);				
			}
			prepStmt.close();
			rs.close();
		} catch (SQLException sqe) {
			connection.releaseConnection();
		} finally {
			connection.releaseConnection();
		}

		return sublist;
	}

	
		public ArrayList getcourseforstudent(String category,String semester,String pro_id,String subpro_id) {
		ArrayList sublist = new ArrayList();
		
		
		connection.makeConnection();
		try {			
			String selectStatement = "select course_code,course_name from tblMapProgram where graduation_category=? and program_id=? and sub_program_id=? and semester=? ";
			prepStmt = connection.con.prepareStatement(selectStatement);
			prepStmt.setString(1, category);
			prepStmt.setString(2, pro_id);
			prepStmt.setString(3, subpro_id);
			prepStmt.setString(4, semester);
			
			
			rs = prepStmt.executeQuery();
			
			while (rs.next()) {
			
				String course_code = rs.getString(1);
				String course_name = rs.getString(2);
				String[] temps = { course_code, course_name };
				sublist.add(temps);
			}
			
		
			rs.close();
			prepStmt.close();
			connection.releaseConnection();
			
		} catch (SQLException sql) {
			connection.releaseConnection();
		} catch (Exception e) {
			connection.releaseConnection();			
		}
		return sublist;
	}
	
	

	//========================Dhivya Here: Mapping Program (New)===========================================

	public String insertexternalapp(String filename, String pathname) {
		
		String status = null;
		try {

			connection.makeConnection();
			String insertStmt = "insert into tblExternalApp(filename,pathname) "
					+ "values (?,?)";

			prepStmt = connection.con.prepareStatement(insertStmt);

			prepStmt.setString(1, filename);
			prepStmt.setString(2, pathname);
			

			int cnt = prepStmt.executeUpdate();
			if (cnt > 0) {

				status = "Successfully Inserted";
			}			
			prepStmt.close();
			connection.releaseConnection();
		} catch (SQLException sql) {
			connection.releaseConnection();			
		} catch (Exception e) {
			connection.releaseConnection();			
		}
		return status;
	}



	public String insertMapDetails(String progId, String subProgId, String sem,
				String graduation, String courseCd, String courseName) {			
			String status = null;
			try {

				connection.makeConnection();
				String insertStmt = "insert into tblMapProgram(graduation_category,program_id,sub_program_id,semester,course_code,course_name) "
						+ "values (?,?,?,?,?,?)";

				prepStmt = connection.con.prepareStatement(insertStmt);

				prepStmt.setString(1, graduation);
				prepStmt.setString(2, progId);
				prepStmt.setString(3, subProgId);
				prepStmt.setString(4, sem);
				prepStmt.setString(5, courseCd);
				prepStmt.setString(6, courseName);

				int cnt = prepStmt.executeUpdate();
				if (cnt > 0) {

					status = "Successfully Mapped";
				}				
				prepStmt.close();
				connection.releaseConnection();
			} catch (SQLException sql) {
				connection.releaseConnection();				
			} catch (Exception e) {
				connection.releaseConnection();				
			}
			return status;
		}

		public String getMapDetails(String progId, String subProgId, String sem,String graduation,String courseCd) {
			String mapId = null;			
			connection.makeConnection();
			try {
				String selectStatement = "select map_id from tblMapProgram where graduation_category=? and program_id=? and sub_program_id=? and semester=? and course_code=?";
				prepStmt = connection.con.prepareStatement(selectStatement);
				prepStmt.setString(1, graduation);
				prepStmt.setString(2, progId);
				prepStmt.setString(3, subProgId);
				prepStmt.setString(4, sem);
				prepStmt.setString(5, courseCd);
				
				rs = prepStmt.executeQuery();
				
				while (rs.next()) {
				
					mapId = rs.getString(1);
					
				}				
				rs.close();
				prepStmt.close();
				connection.releaseConnection();
				
			} catch (SQLException sql) {
				connection.releaseConnection();				
			} catch (Exception e) {
				connection.releaseConnection();				
			}
			return mapId;
		}
		
		
		public String getMapIdCourseName(String progId, String subProgId, String sem,String graduation,String courseName) {
			String mapId = null;			
			connection.makeConnection();
			try {
				String selectStatement = "select map_id from tblMapProgram where graduation_category=? and program_id=? and sub_program_id=? and semester=? and course_name=?";
				prepStmt = connection.con.prepareStatement(selectStatement);
				prepStmt.setString(1, graduation);
				prepStmt.setString(2, progId);
				prepStmt.setString(3, subProgId);
				prepStmt.setString(4, sem);			
				prepStmt.setString(5, courseName);
				
				rs = prepStmt.executeQuery();
				
				while (rs.next()) {
				
					mapId = rs.getString(1);
					
				}				
				rs.close();
				prepStmt.close();
				connection.releaseConnection();
				
			} catch (SQLException sql) {
				connection.releaseConnection();				
			} catch (Exception e) {
				connection.releaseConnection();
						}
			return mapId;
		}
		
		
		
		
		
		public String updateMapDetails(String mapId, String courseCd, String courseName) {			
			String status = null;
			try {

				connection.makeConnection();
				String updateStmt = "update tblMapProgram set course_code=?, course_name=? where map_id=?"; 

				prepStmt = connection.con.prepareStatement(updateStmt);			
				prepStmt.setString(1, courseCd);
				prepStmt.setString(2, courseName);
				prepStmt.setString(3, mapId);

				int cnt = prepStmt.executeUpdate();
				if (cnt > 0) {

					status = "Successfully Mapped";
				}				
				prepStmt.close();
				connection.releaseConnection();
			} catch (SQLException sql) {
				connection.releaseConnection();				
			} catch (Exception e) {
				connection.releaseConnection();				
			}
			return status;
		}
		
		public String updateslidematerial(String selProg,String selSubProg,String selSemester,String course_code,String course_name,String url) {
			
			String status = null;
			try {

				connection.makeConnection();
				String updateStmt = "update tblcoursematerial set program_id=?, sub_program_id=?, sem=?, course_name=?, url_link=? where course_code=?"; 

				prepStmt = connection.con.prepareStatement(updateStmt);			
				prepStmt.setString(1, selProg);
				prepStmt.setString(2, selSubProg);
				prepStmt.setString(3, selSemester);
				prepStmt.setString(4, course_name);
				prepStmt.setString(5, url);
				prepStmt.setString(6, course_code);


				int cnt = prepStmt.executeUpdate();
				if (cnt > 0) {

					status = "Successfully Mapped";
				}				
				prepStmt.close();
				connection.releaseConnection();
			} catch (SQLException sql) {
				connection.releaseConnection();				
			} catch (Exception e) {
				connection.releaseConnection();				
			}
			return status;
		}
		
		public String updatepdfmaterial(String course_code,String fileename,String saveFile,String existfilename,String existfilepath) {
			
			String status = null;
			try {

				connection.makeConnection();
				String updateStmt = "insert into tblcoursematerial(file_name,file_path) where course_code=? "; 

				prepStmt = connection.con.prepareStatement(updateStmt);			
				prepStmt.setString(1, ","+fileename);
				prepStmt.setString(2, existfilepath+","+saveFile);
				prepStmt.setString(3, course_code);
				

				int cnt = prepStmt.executeUpdate();
				if (cnt > 0) {

					status = "Successfully Inserted";
				}
				
				prepStmt.close();
				connection.releaseConnection();
			} catch (SQLException sql) {
				connection.releaseConnection();
				
			} catch (Exception e) {
				connection.releaseConnection();
				}
			return status;
		}
		
		
		
		
		 public ArrayList getpgqualificationdetails()
		    {
		    	ArrayList rolelist = new ArrayList();
		    	
		    	 try {
		    		 connection.makeConnection();         
		                
		             String selectStatement =  "select standard,support_doc from tblQualificationDetails where category='PG'";
		             
		             prepStmt = connection.con.prepareStatement(selectStatement);
		           //prepStmt.setString(1,emp_id);
		             rs = prepStmt.executeQuery();
		 	         
		 	          while(rs.next()) {
		 	        	  //String qual_map_id = rs.getString(1);
		 	        	// String category = rs.getString(2);
		 	        	// String min_age = rs.getString(1);
		 	        	String standard = rs.getString(1);
		 	        	String support_doc = rs.getString(2);
		 	        	  String[] temps={standard,support_doc};
		 	        	rolelist.add(temps);
		 	        	  
		 	          }
		             prepStmt.close();
		             rs.close();          
		              } 
		         catch (SQLException sqe) { connection.releaseConnection(); } 
		    	 finally { connection.releaseConnection(); }
		    	
		    	return rolelist;
		    }   
		
		 public ArrayList getugqualificationdetails()
		    {
		    	ArrayList rolelist = new ArrayList();
		    	
		    	 try {
		    		 connection.makeConnection();         
		                
		             String selectStatement =  "select qual_map_id,min_age,standard,support_doc from tblQualificationDetails where category='UG'";
		             
		             prepStmt = connection.con.prepareStatement(selectStatement);
		           //prepStmt.setString(1,category//);
		             rs = prepStmt.executeQuery();
		 	         
		 	          while(rs.next()) {
		 	        	  String qual_map_id = rs.getString(1);


		 	        	 String min_age = rs.getString(2);
		 	        	String standard = rs.getString(3);
		 	        	String support_doc = rs.getString(4);
		 	        	  String[] temps={qual_map_id,min_age,standard,support_doc};
		 	        	rolelist.add(temps);
		 	        	  
		 	          }
		             prepStmt.close();
		             rs.close();          
		              } 
		         catch (SQLException sqe) { connection.releaseConnection(); } 
		    	 finally { connection.releaseConnection(); }
		    	
		    	return rolelist;
		    }   
		public String getqualmapid() {
			String mapid = null;

			try {
				connection.makeConnection();

				String selectStatement = "select qual_map_id from tblQualificationDetails where cagtegory='UG'";

				prepStmt = connection.con.prepareStatement(selectStatement);
				//prepStmt.setString(1, course_id);
				rs = prepStmt.executeQuery();

				while (rs.next()) {

					String qual_id = rs.getString(1);
					//String subProg_name = rs.getString(2);
					//String[] temps = { qual_id};
					

				}
				prepStmt.close();
				rs.close();
			} catch (SQLException sqe) {
				connection.releaseConnection();
			} finally {
				connection.releaseConnection();
			}

			return mapid;
		}

		
		public String insertqualificationdetails(String category,String age,String std,String document) {
		 {
		    	
			 String qualificationstatus=null;  	
		    	try{
		    	 
		    	
		    		connection.makeConnection(); 
		    	String insertStmt=  "insert into tblQualificationDetails(category,min_age,standard,support_doc) values(?,?,?,?)";
		        
		    	
		        prepStmt = connection.con.prepareStatement(insertStmt);
		        
		        
				
		        prepStmt.setString(1,category);
		        prepStmt.setString(2,age);
		        prepStmt.setString(3,std);
		        prepStmt.setString(4,document);
		        //prepStmt.setString(5,mapid);
		       // prepStmt.setString(5,selProg);
		      
		        int cnt= prepStmt.executeUpdate();
		        if(cnt>0){
		           	
		        	qualificationstatus="Qualification Insert successfully";	 
		          }
		        prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		    	connection.releaseConnection();
		              
		    } finally {
		    	connection.releaseConnection();
		    }
		    	 return qualificationstatus;	
		    }
		}
	
	public String Editpgdetails(String category,String std,String document){
			 {
			    	
				 String status="Qualification Update successfully";	 	
			    	try{
			    	 
			    	
			    		connection.makeConnection(); 
			    	String insertStmt=  "update tblQualificationDetails  set standard = ?,set support_doc = ? where category = ? ";
			        
			    	
			        prepStmt = connection.con.prepareStatement(insertStmt);
			        			        		        
			        //prepStmt.setString(1,age);
			        prepStmt.setString(1,std);
			       prepStmt.setString(2,document);  
			       prepStmt.setString(3,category);			     
			        prepStmt.close();
			      
			    } 
			    catch (SQLException sqe) {
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
			    }
			    	 return status;	
			    }
		 }
			 
			 public String Editdetails(String category,String age,String std,String document){
				 {
				    	
					 String status="Qualification Update successfully";	 	
				    	try{
				    	 
				    	
				    		connection.makeConnection(); 
				    	String insertStmt=  "update tblQualificationDetails set min_age = ?, set standard = ?, set support_doc = ? where category = ? ";
				        
				    	
				        prepStmt = connection.con.prepareStatement(insertStmt);
				        
				        
						
				        
				        prepStmt.setString(1,age);
				        prepStmt.setString(2,std);
				       prepStmt.setString(3,document);
				       prepStmt.setString(4,category);
				       
				        prepStmt.close();
				      
				    } 
				    catch (SQLException sqe) {				    	
				    	connection.releaseConnection();				              
				    } finally {
				    	connection.releaseConnection();
				    }
				    	 return status;	
				    }
			 }
				 
			 
	
			 public ArrayList getugprogramlist()
			    {
			    	ArrayList list1 = new ArrayList();
			    	
			    	 try {
			    		 connection.makeConnection();         
			                
			             String selectStatement =  "select distinct b.course_name from tblMapProgram a,tblcourse b where a.program_id=b.course_id  and a.graduation_category='UG'";
			             prepStmt = connection.con.prepareStatement(selectStatement);
			             //prepStmt.setString(1,proid);
			            // prepStmt.setString(2,subproid);
			             rs = prepStmt.executeQuery();
			 	         
			 	          while(rs.next()) {
			 	        	 String ugprogram_name = rs.getString(1);
			 	        	 //String ugsubprogram_name = rs.getString(2);
			 	        	//String course_code = rs.getString(3);
			 	        	//String course_name = rs.getString(4);
			 	        	//String category = rs.getString(5);
			 	        	//String batch = rs.getString(6);
			 	        	//String course_name = rs.getString(7);
			 	        	//String subcourse_name = rs.getString(8);			 	        	
			 	        	  String[] temps={ugprogram_name};			 	        	 
			 	        	 list1.add(temps);
			 	        	  
			 	          }
			             prepStmt.close();
			             rs.close();          
			              } 
			         catch (SQLException sqe) { connection.releaseConnection(); } 
			    	 finally { connection.releaseConnection(); }
			    	
			    	return list1;
			    }
			 public ArrayList getpgprogramlist()
			    {
			    	ArrayList list1 = new ArrayList();
			    	
			    	 try {
			    		 connection.makeConnection();         
			                
			             String selectStatement =  "select distinct b.course_name from tblMapProgram a,tblcourse b where a.program_id=b.course_id and a.graduation_category='PG'";
			             prepStmt = connection.con.prepareStatement(selectStatement);
			             //prepStmt.setString(1,proid);
			            // prepStmt.setString(2,subproid);
			             rs = prepStmt.executeQuery();
			 	         
			 	          while(rs.next()) {
			 	        	 String pgprogram_name = rs.getString(1);
			 	        	 //String pgsubcourse_name = rs.getString(2);
			 	        	//String course_code = rs.getString(3);
			 	        	//String course_name = rs.getString(4);
			 	        	//String category = rs.getString(5);
			 	        	//String batch = rs.getString(6);
			 	        	//String course_name = rs.getString(7);
			 	        	//String subcourse_name = rs.getString(8);			 	        				 	        	
			 	        	  String[] temps={pgprogram_name};
			 	        	 list1.add(temps);
			 	        	  
			 	          }
			             prepStmt.close();
			             rs.close();          
			              } 
			         catch (SQLException sqe) { connection.releaseConnection(); } 
			    	 finally { 
			    		 connection.releaseConnection(); 
			    		 }
			    	
			    	return list1;
			    } 
			 
			 
			 public String getcouponoffer(String coupon_code)
			    {
			    	 
			    	String filepath=null;
					    
					    	  
					        try {
					        	connection.makeConnection();
					        	 String str="SELECT coupon_offer FROM tblCouponDetails WHERE coupon_code=? and coupon_status='Active'";
							     				     
							        prepStmt = connection.con.prepareStatement(str);
						            prepStmt.setString(1,coupon_code);
						            
						            
						            rs = prepStmt.executeQuery();
						            if (rs.next()){
						            	filepath = rs.getString(1);
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
					       
					    return filepath;
			    }
			 
			 public void  updatecouponstatus(String couponcode)
			    {
			    	 
			    	String couponstatus="DeActive";
					    
					    	  
					        try {
					        	connection.makeConnection();
					        	 String str="update tblCouponDetails set coupon_status=? WHERE coupon_code=?";
							     				     
							        prepStmt = connection.con.prepareStatement(str);
						            prepStmt.setString(1,couponstatus);
						            prepStmt.setString(2,couponcode);
						            
						            prepStmt.executeUpdate();
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
					       
					    
			    }
	 		
}
