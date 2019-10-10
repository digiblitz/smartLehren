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

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class mysqlDB {
	public Connection con = null;
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
	 
	  public String getcategoryid(String couName) throws Exception {
		  String categoryid=null;
		  try {
	      
			  Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost/moodle?user=root&password=root");
	         Statement statement = con.createStatement();
	    
	    String str="select id from mdl_course_categories where name=?";
	    
	     prepStmt = con.prepareStatement(str);
	     prepStmt.setString(1,couName);
	     
	     rs = prepStmt.executeQuery();
	     while (rs.next()){
	   	  categoryid = rs.getString(1);
	   		                   }	   
	     	 rs.close();
     prepStmt.close();
   } 
  catch (Exception ex) {
      	ex.printStackTrace();
      	 releaseConnection();  
      }
 
return categoryid;
	          
	    }
	  
	  public String getuserid(String username) throws Exception {
		  String userid=null;
		  
		  try {
	      
		   Class.forName("com.mysql.jdbc.Driver");
		       con = DriverManager.getConnection("jdbc:mysql://localhost/moodle?user=root&password=root");
	          Statement statement = con.createStatement();
	     
         String str="select id from mdl_user where username=?";
         
          prepStmt = con.prepareStatement(str);
          prepStmt.setString(1,username);
          
          rs = prepStmt.executeQuery();
          if (rs.next()){
        	  userid = rs.getString(1);
                        }
	     	 rs.close();
     prepStmt.close();
   } 
  catch (Exception ex) {
      	ex.printStackTrace();
      	 releaseConnection();   
      }
 
return userid;
	          
	    }
	    
	  
	  public String getcourseid(String subcourse_name) throws Exception {
		  String courseid=null;
		  
		  try {
	      
		   Class.forName("com.mysql.jdbc.Driver");
		       con = DriverManager.getConnection("jdbc:mysql://localhost/moodle?user=root&password=root");
	          Statement statement = con.createStatement();
	     
         String str="select id from mdl_course where fullname=?";
         
          prepStmt = con.prepareStatement(str);
          prepStmt.setString(1,subcourse_name);
          
           rs = prepStmt.executeQuery();
          if (rs.next()){
        	  courseid = rs.getString(1);
                        }
	     	 rs.close();
     prepStmt.close();
   } 
  catch (Exception ex) {
      	ex.printStackTrace();
      	 releaseConnection();   
      }
 
return courseid;
	          
	    }
	  
	  
	  public String getroleid(String role_namee) throws Exception {
		  String roleid=null;
		  
		  try {
	      
		   Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost/moodle?user=root&password=root");
	          Statement statement = con.createStatement();
	     
         String str="select id from mdl_role where name=?";
         
          prepStmt = con.prepareStatement(str);
          prepStmt.setString(1,role_namee);
          
          rs = prepStmt.executeQuery();
          if (rs.next()){
        	  roleid = rs.getString(1);
                        }
	     	 rs.close();
     prepStmt.close();
   } 
  catch (Exception ex) {
      	ex.printStackTrace();
      	 releaseConnection();  
      }
 
return roleid;
	          
	    }
	  public void createassign(String courseid,String assign_name,String question,Long allow_date,Long last_date) throws Exception {
		  String roleid=null;
		  
		  try {
	      
		   Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost/moodle?user=root&password=root");
	          Statement statement = con.createStatement();
	     
	          String insertStmt=  "Insert into moodle.mdl_assign(course,name,intro,allowsubmissionsfromdate,duedate) values (?,?,?,?,?)";
		        		    	
		        prepStmt = con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,courseid);
		        prepStmt.setString(2,assign_name);
		        prepStmt.setString(3,question);
		        prepStmt.setLong(4,allow_date);
		        prepStmt.setLong(5,last_date);
		        prepStmt.executeUpdate();
		        prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		        sqe.printStackTrace();
		    	releaseConnection();
		              
		    } finally {
		        releaseConnection();
		    }
	  
	  }
	  
	  public void createevent(String assign_name,String question,String cour_id,String user_id,String modulename,Long allow_da) throws Exception {
		  String roleid=null;
		  
		  try {
	      
		   Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost/moodle?user=root&password=root");
	          Statement statement = con.createStatement();
	     
	          String insertStmt=  "Insert into moodle.mdl_event(name,description,courseid,userid,modulename,timestart) values (?,?,?,?,?,?)";
		        		    	
		        prepStmt = con.prepareStatement(insertStmt);
		        
		        prepStmt.setString(1,assign_name);
		        prepStmt.setString(2,question);
		        prepStmt.setString(3,cour_id);
		        prepStmt.setString(4,user_id);
		        prepStmt.setString(5,modulename);
		        prepStmt.setLong(6,allow_da);
		        prepStmt.executeUpdate();
		        prepStmt.close();
		      
		    } 
		    catch (SQLException sqe) {
		        sqe.printStackTrace();
		    	releaseConnection();
		              
		    } finally {
		        releaseConnection();
		    }
	  
	  }
	  
	  public void releaseConnection() {
	        try {
	            //prepStmt.close();
	            //rs.close();
	            if(!con.isClosed()){
	                con.close();
	            }
	            //Debug.print(" Closing a connection...");
	        } catch (SQLException ex) {
	            //Debug.print("releaseConnection: " + ex.getMessage());
	        }
	    
	    }
	  
	  /*
		 public static final java.sql.Date toSQLDate(java.util.Date inDate) {
		        return new java.sql.Date(inDate.getTime());
		    } 
	  
	  */
	  

	  }

	

