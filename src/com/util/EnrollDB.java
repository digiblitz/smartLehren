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

import org.apache.log4j.Logger;
import com.spring.EnrollmentAction;

public class EnrollDB {
	static Logger log = Logger.getLogger(EnrollmentAction.class.getName());

	private static EnrollDB myInstance = new EnrollDB(); 
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    public static EnrollDB getInstance(){
		return myInstance;    	
    }
    Connectiondb connection = Connectiondb.getInstance();
    private EnrollDB(){
    	
    }
    
    public ArrayList getprogramlist()
    {
    	 ArrayList programlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT * FROM tblcourse";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			        			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String programid = rs.getString(1);
			            	String programname= rs.getString(2);
			            	
			                String userlist[] = {programid, programname};
			                programlist.add(userlist);
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
		      return programlist;
    }
    
    public ArrayList getsubprogramlist()
    {
    	 ArrayList programlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT sub_id,subcourse_name FROM tblsubcourse";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			        			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String subprogramid = rs.getString(1);
			            	String subprogramname= rs.getString(2);
			            	
			                String userlist[] = {subprogramid, subprogramname};
			                programlist.add(userlist);
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
		      return programlist;
    }
    
    
    public ArrayList getsubprogram(String programid)
    {
    	 ArrayList subprogramlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT sub_id,subcourse_name FROM tblsubcourse where course_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			        	prepStmt.setString(1, programid);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String subprogramid = rs.getString(1);
			            	String subprogramname= rs.getString(2);
			            	
			                String userlist[] = {subprogramid, subprogramname};
			                subprogramlist.add(userlist);			                
			             }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();			  
			        }finally {
			        	connection.releaseConnection();
			        }
		      return subprogramlist;
    }
    
    public ArrayList getadmissionlist()
    {
    	 ArrayList subprogramlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		
 String str="SELECT register_no,firstname,lastname,e_mail,mobile_no,address1,address2,city,state,country,pincode,category,batch,payment_status FROM tblEnrolldetails";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			        				            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	
			               	String register_no = rs.getString(1);
			            	String firstname= rs.getString(2);
			            	String lastname= rs.getString(3);
			            	String e_mail= rs.getString(4);			            
			            	String mobile_no= rs.getString(5);
			            	String address1= rs.getString(6);
			            	String address2= rs.getString(7);
			            	String city= rs.getString(8);
			            	String state= rs.getString(9);
			            	String country= rs.getString(10);
			            	String pincode= rs.getString(11);
			            	String category= rs.getString(12);
			            	String batch= rs.getString(13);	
			            	String paymentstatus= rs.getString(14);	
			            	
			                String userlist[] = {register_no,firstname,lastname,e_mail,mobile_no,address1,address2,city,state,country,pincode,category,batch,paymentstatus};
			                subprogramlist.add(userlist);			                
			             }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();			  
			        }finally {
			        	connection.releaseConnection();
			        }
		      return subprogramlist;
    }
    
    public ArrayList getcourseuserlist()
    {
    	 ArrayList subprogramlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		
		        		String str="SELECT user_id FROM tblAssignCourse";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			        				            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	
			               	String user_id = rs.getString(1);			            
			            
			                subprogramlist.add(user_id);			                
			             }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();			  
			        }finally {
			        	connection.releaseConnection();
			        }
		      return subprogramlist;
    }
    
   
    public String getcourseroleid(String struserid)
    {
    	 
    	String rolename=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT role_id FROM tblUserdetail where user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, struserid);
			        
			            
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
    
    public ArrayList getprogrammentorlist(String courseroleid)
    {
    	 ArrayList subprogramlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		
		        		String str="SELECT firstname,lastname,program_id,sub_program_id,user_id FROM tblUserdetail where role_id <> ? and emp_id IS NOT NULL and program_id IS NOT NULL";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
				        prepStmt.setString(1, courseroleid);
			        				            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	
			               	String firstname = rs.getString(1);		
			            	String lastname = rs.getString(2);
			            	String programid = rs.getString(3);
			            	String subprogramid = rs.getString(4);
			            	String user_id = rs.getString(5);
			            	
			            String strarr[] ={firstname,lastname,programid,subprogramid,user_id};
			                subprogramlist.add(strarr);			                
			             }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();			  
			        }finally {
			        	connection.releaseConnection();
			        }
		      return subprogramlist;
    }
    
    public String getprogramname(String programid)
    {
    	 
    	String coursename=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_name FROM tblcourse where course_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, programid);
			        
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
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
    
    public String getsubprogramnamesub(String subprogramid)
    {
    	 
    	String coursename=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT subcourse_name FROM tblsubcourse where sub_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, subprogramid);
			        
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
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
    
    public ArrayList getsubprogramname(String subprogramid)
    {
    	 
    	ArrayList coursename = new ArrayList();		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT subcourse_name FROM tblsubcourse where course_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, subprogramid);
			        
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String subcoursename = rs.getString(1);
			            	
			            	coursename.add(subcoursename);
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
    
    public String setassignemployee(String userid,String programid,String subprogramid)
    {
    	 
    	String status=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="update tblUserdetail set program_id=? , sub_program_id=? where user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, programid);
			            prepStmt.setString(2, subprogramid);
			            prepStmt.setString(3, userid);
			        
			            int cnt= prepStmt.executeUpdate();
				        if(cnt>0){
				           	
				      	  status="Employee Course Reassigned successfully";	 
				          }
				         prepStmt.close();
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	connection.releaseConnection();
			        }
		    return status;
    }
    
    public String getprogramid(String programnamee)
    {
    	 
    	String coursename=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course_id FROM tblcourse where course_name=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, programnamee);			        
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
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
    
    public String getsubprogramid(String subprogramnamee)
    {
    	 
    	String coursename=null;		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT sub_id FROM tblsubcourse where subcourse_name=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1, subprogramnamee);			        
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
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
    
    public String setCertificatedetails(String userid,String logolocation,  String universityname, String address, String signlocation)
    {
 	 String status=null;	
    	
    	try{
    	 
    	
    		connection.makeConnection(); 
    	String insertStmt=  "Insert into tblCertificateDetails(user_id,university_name,university_addr,logo_path,sign_path) values (?,?,?,?,?)";
        
    	
        prepStmt = connection.con.prepareStatement(insertStmt);  
        prepStmt.setString(1,userid);
        prepStmt.setString(2,universityname);
        prepStmt.setString(3,address);
        prepStmt.setString(4,logolocation);
        prepStmt.setString(5,signlocation);
        
        int count = prepStmt.executeUpdate();
        if(count>0){
        	status = "Saved successfully";
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
    
    public ArrayList getadmissionletterlist()
    {
    	 ArrayList subprogramlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		
 String str="SELECT university_name,university_addr,logo_path,sign_path FROM tblCertificateDetails";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
				        			        				            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	
			               	String university_name = rs.getString(1);
			            	String university_addr= rs.getString(2);
			            	String logo_path= rs.getString(3);
			            	String sign_path= rs.getString(4);			            
			            				            	
			                String userlist[] = {university_name,university_addr,logo_path,sign_path};
			                subprogramlist.add(userlist);			                
			             }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();			  
			        }finally {
			        	connection.releaseConnection();
			        }
		      return subprogramlist;
    }
    
    public ArrayList getstudentlist(String user_id)
    {
    	 ArrayList studentlist = new ArrayList();		    
		    	
		        try {
		        	connection.makeConnection();
		
 String str="SELECT firstname,lastname,program_id,sub_program_id FROM tblEnrolldetails where user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
				        prepStmt.setString(1, user_id);
				        			        				            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){			            	
			            	
			               	String firstname = rs.getString(1);
			            	String lastname= rs.getString(2);
			            	String program_id= rs.getString(3);
			            	String sub_program_id= rs.getString(4);	
			            	String name = firstname+" "+lastname;
			            				            	
			                String userlist[] = {name,program_id,sub_program_id};
			                studentlist.add(userlist);			                
			             }
			            rs.close();
			       prepStmt.close();
			       
			       connection.releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();			  
			        }finally {
			        	connection.releaseConnection();
			        }
		      return studentlist;
    }
    
    public ArrayList getcourselist(String programid, String subprogramid)
    {
    	ArrayList list1 = new ArrayList();
    	
    	 try {
    		 connection.makeConnection();         
                
             String selectStatement =  "select a.course_name, b.subcourse_name from tblcourse a,tblsubcourse b where a.course_id=? and b.subcourse_id=?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,programid);
             prepStmt.setString(2,subprogramid);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 String course_name = rs.getString(1);
 	        	String subcourse_name = rs.getString(2);
 	        	
 	        	  String[] temps={course_name,subcourse_name};
 	        	log.info("program details "+course_name+" "+subcourse_name);

 	        	 list1.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection(); } 
    	 finally { connection.releaseConnection(); }
    	
    	return list1;
    }   
}
