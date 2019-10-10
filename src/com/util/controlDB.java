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

public class controlDB {

	private static controlDB myInstance = new controlDB(); 		
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    //singleton design pattern
    Connectiondb connection = Connectiondb.getInstance();
    public static controlDB getInstance(){
		return myInstance;    	
    }
	 
	 private controlDB(){}
	 		 
	 public ArrayList getcourselist(String pro_id,String subpro_id,String semester)
	    {
		 ArrayList ass_name= new ArrayList(); 
	    	String assign_name=null;
	    	System.out.println("pro_id--------->"+pro_id);System.out.println("subpro_id--------->"+subpro_id);   
	    	System.out.println("semester--------->"+semester);    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT course_name FROM tblMapProgram WHERE program_id=? and sub_program_id=? and semester=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,pro_id);
				            prepStmt.setString(2,subpro_id);
				            prepStmt.setString(3,semester);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	assign_name = rs.getString(1);
				            	System.out.println("course name---------------->"+assign_name);
				            	String[] temp={assign_name};
				            	ass_name.add(temp);
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
			       
			    return ass_name;
	    }
	 
	 public ArrayList getexamdetails(String proid, String subproid,String semester, String batch)
	    {
		 ArrayList ass_name= new ArrayList(); 
	    	        try {
			        	connection.makeConnection();
			        	 String str="SELECT course_name,exam_date,section,start_time,end_time FROM tblExamDetails WHERE program_id=? and sub_program_id=? and semester=? and batch=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,proid);
				            prepStmt.setString(2,subproid);
				            prepStmt.setString(3,semester);
				            prepStmt.setString(4,batch);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String cou_name = rs.getString(1);
				            	String examdate = rs.getString(2);
				            	String section = rs.getString(3);
				            	String start_time = rs.getString(4);
				            	String end_time = rs.getString(5);
				            	
				            	String[] temp={cou_name,examdate,section,start_time,end_time};
				            	ass_name.add(temp);
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
			       
			    return ass_name;
	    }
	 
	 public ArrayList getfeedetails(String proid, String subproid,String testbatch,String semester)
	    {
		 ArrayList ass_name= new ArrayList(); 
		 	    	    	  
			        try {
			        	connection.makeConnection();
			        	 String str="select b.firstname,b.lastname,b.e_mail,a.payment_type,a.amount,a.dd_number,a.dd_date,a.bank_name,a.bank_branch from tblPaymentDetails a,tblEnrolldetails b " +
			        	 		"where b.program_id=? and b.sub_program_id=? and b.batch=? and a.user_id=b.user_id";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            //prepStmt.setString(1,user_id);
				            prepStmt.setString(1,proid);
				            prepStmt.setString(2,subproid);
				            prepStmt.setString(3,testbatch);
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String firstname = rs.getString(1);
				            	String lastname = rs.getString(2);
				            	String e_mail = rs.getString(3);
				            	String payment_type = rs.getString(4);
				            	String amount = rs.getString(5);
				            	String dd_number = rs.getString(6);
				            	String dd_date = rs.getString(7);
				            	String bank_name = rs.getString(8);
				            	String bank_branch = rs.getString(9);
				            	
				            	String[] temp={firstname,lastname,e_mail,payment_type,amount,dd_number,dd_date,bank_name,bank_branch};
				            	ass_name.add(temp);
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
			       
			    return ass_name;
	    }
	 
	 
	 public String createExams(String pro_id,String subpro_id,String testbatch,String semester,String coursenamess,String coursecode,String date,String section,String starttime,String starttimemethod,String endtime,String endtimemethod)
	    {
		 System.out.println("inside database to create exams");
		    String status="Information not saved ";  	
	    	String start=starttime+" "+starttimemethod;
	    	String end=endtime+" "+endtimemethod;
	    	
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblExamDetails(program_id,sub_program_id,batch,semester,course_name,course_code,exam_date,section,start_time,end_time) values (?,?,?,?,?,?,?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,pro_id);
	        prepStmt.setString(2,subpro_id);
	        prepStmt.setString(3,testbatch);
	        prepStmt.setString(4,semester);
	        prepStmt.setString(5,coursenamess);
	        prepStmt.setString(6,coursecode);
	        prepStmt.setString(7,date);
	        prepStmt.setString(8,section);
	        prepStmt.setString(9,start);
	        prepStmt.setString(10,end);
	       
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Exam details saved Successfully";	 
	          }
	         prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {sqe.printStackTrace();
	    connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
			return status;
	    	
	    }
	 public String getbatch(String user_id)
	    {
	    	 
	    	String programid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT batch FROM tblEnrolldetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	programid = rs.getString(1);
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
			       
			    return programid;
	    }
	 public String getstudent_programid(String user_id)
	    {
	    	 
	    	String programid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT program_id FROM tblEnrolldetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	programid = rs.getString(1);
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
			       
			    return programid;
	    }
	 public String getstudent_subprogramid(String user_id)
	    {
	    	 
	    	String programid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT sub_program_id FROM tblEnrolldetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	programid = rs.getString(1);
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
			       
			    return programid;
	    }
	 
	 public ArrayList getstudentlist(String user_id)
	    {
		 ArrayList ass_name= new ArrayList(); 
		 	    	    	  
			        try {
			        	connection.makeConnection();
	String str="select register_no,firstname,lastname,program_id,sub_program_id,batch from tblEnrolldetails where user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            //prepStmt.setString(1,user_id);
				            prepStmt.setString(1,user_id);
				           
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	
				            	String register_no = rs.getString(1);
				            	String firstname = rs.getString(2);
				            	String lastname = rs.getString(3);
				            	String program_id = rs.getString(4);
				            	String sub_program_id = rs.getString(5);
				            	String batch = rs.getString(6);
				            	
				            	
				            	String[] temp={register_no,firstname,lastname,program_id,sub_program_id,batch};
				            	ass_name.add(temp);
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
			       
			    return ass_name;
	    }
	 
	 public String getsubprogname(String sub_program_id)
	    {
	    	 
	    	String sub_programid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT subcourse_name FROM tblsubcourse WHERE sub_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,sub_program_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	sub_programid = rs.getString(1);
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
			       
			    return sub_programid;
	    }
	 
	 public String getprogname(String program_id)
	    {
	    	 
	    	String programid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT course_name FROM tblcourse WHERE course_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,program_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	programid = rs.getString(1);
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
			       
			    return programid;
	    }
	 
}
