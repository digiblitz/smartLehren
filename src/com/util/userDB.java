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

import javax.ejb.EJBException;

import com.util.dAOInterface.UserDBInterface;

public class userDB implements UserDBInterface {


	private static UserDBInterface myInstance = new userDB(); 	
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    baseDB db6 = baseDB.getInstance();
	 
    public static userDB getInstance(){
		return (userDB) myInstance;    	
    }
    Connectiondb connection = Connectiondb.getInstance();
	 private userDB(){
		 
	 }
	 
	 public String savecontact(String name, String emailid, String phoneno, String message, String company ){
		 
		 String status=null;
		 
		 try{
		       
		      connection.makeConnection(); 
		      String savecontacts=  "Insert into tblContactUs(name,emailid,phoneno,message,company) values (?,?,?,?,?)";
		         
		      
		         prepStmt = connection.con.prepareStatement(savecontacts);
		         
		         prepStmt.setString(1,name);
		         prepStmt.setString(2,emailid);		         
		         prepStmt.setString(3,phoneno);		         
		         prepStmt.setString(4,message);
		         prepStmt.setString(5,company);
		         
		         
		         int cnt= prepStmt.executeUpdate();
		         if(cnt>0){
		             
		          status="Message send successfully";  
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
	 
	 public ArrayList getcontactlist(String emailid)
	    {
	    	ArrayList userlist = new ArrayList();
	    	
	    	 try {
	             connection.makeConnection();         
	                
	             String selectStatement =  "select name,emailid,phoneno,message,company from tblContactUs where emailid = ?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,emailid);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	
	 	        	String name1 = rs.getString(1);
	 	        	String emailid1 = rs.getString(2);	 	        	
	 	        	 String phoneno1 = rs.getString(3);
	 	        	String message1 = rs.getString(2);	 	        	
	 	        	 String company1 = rs.getString(3);
	 	        	
	 	        	  String[] temps={name1,emailid1,phoneno1,message1,company1};
	 	        	 userlist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection();  } 
	    	 finally { connection.releaseConnection();  }
	    	
	    	return userlist;
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
	         catch (SQLException sqe) { connection.releaseConnection();  } 
	    	 finally { connection.releaseConnection();  }
	    	
	    	return list1;
	    }
	 
	 public String addbatch(String batch,String graduation,String semester) throws RemoteException
     {
      String status="Batch not created ";         
      try{
       
      connection.makeConnection(); 
      String insertStmt=  "Insert into tblbatch(batch,graduation,semester) values (?,?,?)";
         
      
         prepStmt = connection.con.prepareStatement(insertStmt);
         
         prepStmt.setString(1,batch);
         prepStmt.setString(2,graduation);
         
         prepStmt.setString(3,semester);
         
        
         int cnt= prepStmt.executeUpdate();
         if(cnt>0){
             
          status="Batch Created successfully";  
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
    
	 public String createemployee(String username,String password,String firstname,String lastname,String gender,String e_mail,Date dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode,String roleid,String rolename,String program,String subprogram) throws RemoteException
    {
    	String status="Employee not created ";  	
    	String emp_id=selectemployeeid();
      	try{
    	connection.makeConnection(); 
    	String insertStmt=  "Insert into tblUserdetail(username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode,role_id,role_name,emp_id,program_id,sub_program_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
    	
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,username);
        prepStmt.setString(2,password);
        prepStmt.setString(3,firstname);
        prepStmt.setString(4,lastname);
        prepStmt.setString(5,gender);
        prepStmt.setString(6,e_mail);
        prepStmt.setDate(7,connection.toSQLDate (dob));
        prepStmt.setString(8,mobileno);
        prepStmt.setString(9,fathername);
        prepStmt.setString(10,mothername);
        prepStmt.setString(11,address1);
        prepStmt.setString(12,address2);
        prepStmt.setString(13,city);
        prepStmt.setString(14,state);
        prepStmt.setString(15,country);
        prepStmt.setString(16,pincode);
        prepStmt.setString(17,roleid);
        prepStmt.setString(18,rolename);
        prepStmt.setString(19,emp_id);
        prepStmt.setString(20,program);
        prepStmt.setString(21,subprogram);
        int cnt= prepStmt.executeUpdate();
        if(cnt>0){
           	
      	  status="Employee Created successfully";	 
          }
         prepStmt.close();
      
    } 
    catch (SQLException sqe) {
        connection.releaseConnection(); 
       sqe.printStackTrace();       
    } finally {
        connection.releaseConnection(); 
    }
		return status;
    	
    }
    
    public String usercreate(String username,String password,String firstname,String lastname,String gender,String e_mail,Date dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode,String companyname) throws RemoteException
    {
    	String status=null;  	
    	
    	
    	try{
    	
    	connection.makeConnection(); 
    	
    	String insertStmt=  "Insert into tblUserdetail(username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode,company_name) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            	
        prepStmt = connection.con.prepareStatement(insertStmt);
                
        prepStmt.setString(1,username);
        prepStmt.setString(2,password);
        prepStmt.setString(3,firstname);
        prepStmt.setString(4,lastname);
        prepStmt.setString(5,gender);
        prepStmt.setString(6,e_mail);
        prepStmt.setDate(7,connection.toSQLDate (dob));
        prepStmt.setString(8,mobileno);
        prepStmt.setString(9,fathername);
        prepStmt.setString(10,mothername);
        prepStmt.setString(11,address1);
        prepStmt.setString(12,address2);
        prepStmt.setString(13,city);
        prepStmt.setString(14,state);
        prepStmt.setString(15,country);
        prepStmt.setString(16,pincode);
        prepStmt.setString(17,companyname);
        
        int cnt = prepStmt.executeUpdate();
      
        if(cnt>0){           	
      	  status = "Registered Successfully";	 
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
           
    public ArrayList getuserslist(String username)
    {
    	ArrayList userlist = new ArrayList();
    	
    	 try {
             connection.makeConnection();         
                
             String selectStatement =  "select username,password,e_mail from tblUserdetail where username = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,username);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	
 	        	String username1 = rs.getString(1);
 	        	String password1 = rs.getString(2);	 	        	
 	        	 String e_mail1 = rs.getString(3);
 	        	
 	        	
 	        	  String[] temps={username1,password1,e_mail1};
 	        	 userlist.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
    	 finally { connection.releaseConnection();  }
    	
    	return userlist;
    }
    
    public String addstudentdetails(String user_id,String firstname,String lastname,String gender,String e_mail,String dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode,
    		String category,String program_id,String sub_program_id,String sslc_schoolname,String sslc_mark,String sslc_yop,String hsc_schoolname,String hsc_mark,String hsc_yop,String collegename,String percentage,String yop,String university,String role_id,String rolename,String batch) throws RemoteException
    {
    	String status="Student not approved ";  	
    	String reg=selectregisterno();
    	
    	try{
    	 
    	
    	connection.makeConnection(); 
    	String insertStmt=  "Insert into tblEnrolldetails(user_id,register_no,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode,category,program_id,sub_program_id,batch," +
    			"sslc_schoolname,sslc_mark,sslc_yop,hsc_schoolname,hsc_mark,hsc_yop,college_name,university,percentage,yop,role_id,role_name) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
    	
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,user_id);
        prepStmt.setString(2,reg);
        prepStmt.setString(3,firstname);
        prepStmt.setString(4,lastname);
        prepStmt.setString(5,gender);
        prepStmt.setString(6,e_mail);
        prepStmt.setString(7,dob);
        prepStmt.setString(8,mobileno);
        prepStmt.setString(9,fathername);
        prepStmt.setString(10,mothername);
        prepStmt.setString(11,address1);
        prepStmt.setString(12,address2);
        prepStmt.setString(13,city);
        prepStmt.setString(14,state);
        prepStmt.setString(15,country);
        prepStmt.setString(16,pincode);
        prepStmt.setString(17,category);
        prepStmt.setString(18,program_id);
        prepStmt.setString(19,sub_program_id);
        prepStmt.setString(20,batch);
        prepStmt.setString(21,sslc_schoolname);
        prepStmt.setString(22,sslc_mark);
        prepStmt.setString(23,sslc_yop);
        prepStmt.setString(24,hsc_schoolname);
        prepStmt.setString(25,hsc_mark);
        prepStmt.setString(26,hsc_yop);
        prepStmt.setString(27,collegename);
        prepStmt.setString(28,university);
        prepStmt.setString(29,percentage);
        prepStmt.setString(30,yop);
        prepStmt.setString(31,role_id);
        prepStmt.setString(32,rolename);
      
        
        
        
        int cnt= prepStmt.executeUpdate();
        if(cnt>0){
           	
      	  status="Student Approved successfully";	 
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
    
    
    
    public String addper(String role_id,String entity_id,String per_name,String urllink)
    {    
    	String status="Permission created successfully";
    	try{
    	 
    	
    	connection.makeConnection(); 
    	String insertStmt=  "Insert into tblpermission(role_id,entity_id,per_name,urllink) values (?,?,?,?)";
        
    	
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,role_id);
        prepStmt.setString(2,entity_id);
        prepStmt.setString(3,per_name);
        prepStmt.setString(4,urllink);
                
             
       prepStmt.executeUpdate();
            prepStmt.close();
      
    } 
    catch (SQLException sqe) {
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
    	return status;	
    }
    
    public String addbatch(String batch,String grad,String  sem,Date st,Date ed ) 
    {
     String status="Batch not created ";  
    
            
     try{
      
     connection.makeConnection(); 
     String insertStmt=  "Insert into tblbatch(batch,graduation,semester,startdate,enddate) values (?,?,?,?,?)";
        
     
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,batch);
        prepStmt.setString(2,grad);
        
        //prepStmt.setString(3,semester);
        prepStmt.setString(3,(sem));
        prepStmt.setDate(4,connection.toSQLDate (st));
        prepStmt.setDate(5,connection.toSQLDate (ed));
       
        
        int cnt= prepStmt.executeUpdate();
        if(cnt>0){
            
         status="Batch Created successfully";  
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
    
    public String updateenroll(String roleid,String approval,String user_id)
    {
    	String status="Update successfully"; 
    	try{
    	
    		connection.makeConnection(); 
    	String insertStmt=  "update tblUserdetail SET role_id = ?, approve_status = ? where user_id = ? ";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
       
        prepStmt.setString(1,roleid);
        prepStmt.setString(2,approval);
        prepStmt.setString(3,user_id);
       
       prepStmt.executeUpdate();
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
		return status;
    	
    }
    
    
    
    public ArrayList getrolelist()
    {
    	ArrayList role_list = new ArrayList();
    	String name="course mentor";
    	 try {
             connection.makeConnection();         
                
             String selectStatement =  "select firstname,lastname,course from tbluserdetails where role_name = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,name);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 
 	        	String firstname = rs.getString(1);
 	        	  String lastname = rs.getString(2);
 	        	 
 	        	 String course = rs.getString(3);
 	        	 	        	
 	        	  String[] temps={firstname,lastname,course};
 	        	 role_list.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
    	 finally { connection.releaseConnection();  }
    	
    	return role_list;
    }
    
    public ArrayList getstudentlist()
    {
     ArrayList studentlist1 = new ArrayList();
     String name="student";
      try {
             connection.makeConnection();         
                
             String selectStatement =  "select firstname,lastname,course from tbluserdetails where role_name = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,name);
             rs = prepStmt.executeQuery();
           
            while(rs.next()) {
            
           String firstname = rs.getString(1);
             String lastname = rs.getString(2);
            
            String course = rs.getString(3);
                      
             String[] temps={firstname,lastname,course};
            studentlist1.add(temps);
             
            }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
      finally { connection.releaseConnection();  }
     
     return studentlist1;
    }
    
    public String updateuser(String username,String password,String firstname,String lastname,String gender,String e_mail,String date,String mobile_no,String father_name,String mother_name ,String address1,String address2,String city,String state ,String country,String pincode,String user_id)
    {    
     String result="User update Failed";
     try{
      connection.makeConnection(); 
     String insertStmt=  "update tblUserdetail SET username = ?, password = ?, firstname = ?, lastname = ?, gender=  ?, e_mail = ?, dob = ?, mobile_no = ?,father_name = ?, mother_name = ?, address1 = ?, address2 = ?, city = ?, state = ?, country = ?, pincode = ? where user_id = ? ";
        
     prepStmt = connection.con.prepareStatement(insertStmt);
       
        prepStmt.setString(1,username);
        prepStmt.setString(2,password);
        prepStmt.setString(3,firstname);
        prepStmt.setString(4,lastname);
        prepStmt.setString(5,gender);
        prepStmt.setString(6,e_mail);
        prepStmt.setString(7,date);
        prepStmt.setString(8,mobile_no);
        prepStmt.setString(9,father_name);
        prepStmt.setString(10,mother_name);
        prepStmt.setString(11,address1);
        prepStmt.setString(12,address2);
        prepStmt.setString(13,city);
        prepStmt.setString(14,state);
        prepStmt.setString(15,country);
        prepStmt.setString(16,pincode);
        prepStmt.setString(17,user_id);
      int cnt= prepStmt.executeUpdate();
       if(cnt>0){        
        result ="User update successfully";  
       }
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
  return result;
     
    } 
    
    public String updateprofile(String username,String password,String email,String institutionname, String mail)
    {      	
   
     String result="User update Failed";
     try{
      connection.makeConnection(); 
     String insertStmt=  "update tblSignupUserdetails SET username = ?, password = ?, e_mail = ?, institution_name = ? where e_mail=?";
        
     prepStmt = connection.con.prepareStatement(insertStmt);
       
        prepStmt.setString(1,username);
        prepStmt.setString(2,password);
        prepStmt.setString(3,email);
        prepStmt.setString(4,institutionname);            
        prepStmt.setString(5,mail);
      int cnt= prepStmt.executeUpdate();
       if(cnt>0){        
        result ="User update successfully";  
       }
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
  return result;
     
    } 
    
    public String updateuserprofile(String username,String password,String email, String mail)
    {  	
      
     String result="User update Failed";
     try{
      connection.makeConnection(); 
     String insertStmt=  "update tblUserdetail SET username = ?, password = ?, e_mail = ? where e_mail=?";
        
     prepStmt = connection.con.prepareStatement(insertStmt);
       
        prepStmt.setString(1,username);
        prepStmt.setString(2,password);
        prepStmt.setString(3,email);                
        prepStmt.setString(4,mail);
      int cnt= prepStmt.executeUpdate();
       if(cnt>0){        
        result ="User update successfully";  
       }
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
  return result;
     
    } 
    
    public boolean updatenrolllist(String map_id,String user_id,String courid,Date startdate,Date enddate)
    {    	
    	boolean result = false;
    	try{
    		connection.makeConnection(); 
    	String insertStmt=  "update tblmapenroll SET user_id = ?, course_id = ?, start_date = ?, end_date = ? where map_id = ? ";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
    	prepStmt.setString(1,user_id);
    	prepStmt.setString(2,courid);
        prepStmt.setDate(3,connection.toSQLDate (startdate));
        prepStmt.setDate(4,connection.toSQLDate (enddate));
        prepStmt.setString(5,map_id);
               
      int cnt= prepStmt.executeUpdate();
       if(cnt>0){
       	
    	   result = true;	 
       }
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
		return result;
    	
    }
    
    public String getuser(String username,String password)
    {
    	 
    	String user_id=null;
		    ArrayList userlist= new ArrayList();
		    String fn,ln,add,pn;
		    String ur;
		    String ps;
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT user_id FROM tblUserdetail WHERE Username=? COLLATE SQL_Latin1_General_CP1_CS_AS and Password=? COLLATE SQL_Latin1_General_CP1_CS_AS";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,username);
			            prepStmt.setString(2,password);
			            
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
    
    public String checkusername(String user_name)
    {
    	 
    	String userid=null;
    	
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT user_id FROM tblUserdetail where username = ? ";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
				        prepStmt.setString(1,user_name);		            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
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
   
    public String updateapprove(String approval,String user_id)
    {
    	
    	String status="";
    	try{
    	 
    	
    	connection.makeConnection(); 
    	String insertStmt=  "update tblprovisionenroll SET status = ?  where user_id = ? ";
        
    	
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,approval);
        prepStmt.setString(2,user_id);
       
             
       prepStmt.executeUpdate();

        prepStmt.close();
      
    } 
    catch (SQLException sqe) {
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
    	return status;	
    }
    
    public String updatepaymentapprove(String user_id)
    {
    	String paystatus="StillPending";
    	String status="";
    	try{
    	 
    	
    	connection.makeConnection(); 
    	String insertStmt=  "update tblEnrolldetails SET payment_status = ?  where user_id = ? ";
        
    	
        prepStmt = connection.con.prepareStatement(insertStmt);
        
        prepStmt.setString(1,paystatus);
        prepStmt.setString(2,user_id);
       
             
       prepStmt.executeUpdate();

        prepStmt.close();
      
    } 
    catch (SQLException sqe) {
        connection.releaseConnection(); 
              
    } finally {
        connection.releaseConnection(); 
    }
    	return status;	
    }
    
    
    public String getroleid(String role_name)
    {
    	 
    	String role_id=null;
		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT role_id FROM tblrole WHERE role_name=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,role_name);
			            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	role_id = rs.getString(1);
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
		       
		    return role_id;
    }
    
    public String getrolename(String role_id)
    {
    	 
    	String role_name=null;
		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT role_name FROM tblrole WHERE role_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,role_id);
			            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	role_name = rs.getString(1);
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
		       
		    return role_name;
    }
    
    public ArrayList getuserlist(String user_id)
    {
    	ArrayList userlist = new ArrayList();
    	
    	 try {
             connection.makeConnection();         
                
             String selectStatement =  "select username,password,firstname,lastname,e_mail,city,country,course,role_name from tbluserdetails where user_id = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,user_id);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 String username = rs.getString(1);
 	        	String password = rs.getString(2);
 	        	String firstname = rs.getString(3);
 	        	  String lastname = rs.getString(4);
 	        	 String e_mail = rs.getString(5);
 	        	 String city = rs.getString(6);
 	        	 String country = rs.getString(7);
 	        	 String course = rs.getString(8);
 	        	String role_name = rs.getString(9);
 	        	
 	        	  String[] temps={username,password,firstname,lastname,e_mail,city,country,course,role_name};
 	        	 userlist.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
    	 finally { connection.releaseConnection();  }
    	
    	return userlist;
    }
    
    public ArrayList getallcoursebyuserid(String user_id)
    {
    	ArrayList clist = new ArrayList();
    	
    	 try {
             connection.makeConnection();         
                
             String selectStatement =  "select distinct a.program_id,a.sub_program_id,b.course_code,b.course_name from tblEnrolldetails a,tblMapProgram b,tblbatch c where a.batch=c.batch and a.program_id=b.program_id and a.sub_program_id=b.sub_program_id and a.user_id = ? ";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,user_id);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 String program_name = rs.getString(1);
 	        	String subprogram_name = rs.getString(2);
 	        	String course_code = rs.getString(3);
 	        	  String course_name = rs.getString(4);
 	        	
 	        	
 	        	  String[] temps={program_name,subprogram_name,course_code,course_name};
 	        	 clist.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
    	 finally { connection.releaseConnection();  }
    	
    	return clist;
    }
    
    public ArrayList getenrolledcourse(String user_id)
    {    	 
    	ArrayList clist = new ArrayList();
    	clist.add(user_id);
    	 try {
             connection.makeConnection();         
                
             String selectStatement =  "select distinct a.program_id,a.sub_program_id,b.course_code,b.course_name from tblEnrolldetails a,tblMapProgram b,tblbatch c where a.batch=c.batch and a.program_id=b.program_id and a.sub_program_id=b.sub_program_id and a.user_id = ? ";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,user_id);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 String program_name = rs.getString(1);
 	        	String subprogram_name = rs.getString(2);
 	        	String course_code = rs.getString(3);
 	        	  String course_name = rs.getString(4);
 	        	
 	        	
 	        	  String[] temps={program_name,subprogram_name,course_code,course_name};
 	        	 clist.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
    	 finally { connection.releaseConnection();  }
    	
    	return clist;
    }
    
    public ArrayList getprogramnamebyuserid(String user_id)
    {
    	ArrayList plist = new ArrayList();
    	
    	 try {
             connection.makeConnection();         
                
             String selectStatement =  "select a.course_name,b.subcourse_name from tblcourse a,tblsubcourse b,tblUserdetail c where a.course_id=c.program_id and b.sub_id=c.sub_program_id and  c.user_id = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,user_id);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 String course_name = rs.getString(1);
 	        	String subcourse_name = rs.getString(2);
 	        	
 	        	
 	        	  String[] temps={course_name,subcourse_name};
 	        	 plist.add(temps);
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
    	 finally { connection.releaseConnection();  }
    	
    	return plist;
    }
    
    public String getrole_id(String user_id)
    {
    	 
    	String role_id=null;
		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT role_id FROM tblUserdetail WHERE user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,user_id);
			            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	role_id = rs.getString(1);
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
		       
		    return role_id;
    }
    
    
    public ArrayList display(){
   	  
   	    ArrayList list= new ArrayList();
   	    PreparedStatement prepStmt2=null;
   	    ResultSet rs2=null;
   	   String firstname,lastname,username,password,age,address,rollno;
   	  
   	        try {
   	        	connection.makeConnection();
   	        	 String str="SELECT * from tblstudent";
   			     				     
   			        prepStmt2 = connection.con.prepareStatement(str);
   		                     
   		            
   		            rs2 = prepStmt2.executeQuery();
   		            while(rs2.next()){
   		            	firstname = rs2.getString(1);
   		            	lastname = rs2.getString(2);
   		            	username = rs2.getString(3);
   		            	password = rs2.getString(4);
   		            	age = rs2.getString(5);
   		            	address = rs2.getString(6);
   		            	rollno = rs2.getString(7);
   		               
   		            	String[] temp={firstname,lastname,username,password,age,address,rollno};
   		            			
   		            	list.add(temp);
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
   	        return list;
     }
    
    public ArrayList getcourseforcoursementor(String user_id){
    	
   	    ArrayList cmlist= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   
	        try {
	        	connection.makeConnection();
	        	 String str="SELECT course_code,course_name from tblAssignCourse where user_id=?";
			     				     
			        prepStmt2 = connection.con.prepareStatement(str);
			       prepStmt2.setString(1,user_id);         
		            
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String course_code = rs2.getString(1);
		            	String course_name = rs2.getString(2);		               
		            	String[] temp={course_code,course_name};
		            			
		            	cmlist.add(temp);
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
	        return cmlist;
}
    
    public ArrayList getperdata(String roleid){
    	
   	    	    ArrayList s= new ArrayList();
     	    PreparedStatement prepStmt2=null;
     	    ResultSet rs2=null;
     	   
     	        try {
     	        	connection.makeConnection();
     	        	 String str="SELECT entity_id,per_name,urllink from tblpermission where role_id=?";
     			     				     
     			        prepStmt2 = connection.con.prepareStatement(str);
     			       prepStmt2.setString(1,roleid);         
     		            
     		            rs2 = prepStmt2.executeQuery();
     		            while(rs2.next()){
     		            	String entity_id = rs2.getString(1);
     		            	String per_name = rs2.getString(2);
     		            	String urllink = rs2.getString(3);
     		            	
     		               
     		            	String[] temp={entity_id,per_name,urllink};
     		            			
     		            	s.add(temp);
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
     	        return s;
       }
    
    public String addrole(String role_name) {
    	String status="Rolename created Failed";
    	try{
	    	 
	    	
	    	connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblrole(role_name) values (?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,role_name);
	                     
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Rolename created successfully";	 
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
	
		 public String getmapid(String user_id,String programid,String courid)
		    {
		    	 
		    	String map_id=null;
				    
				    	  
				        try {
				        	connection.makeConnection();
				        	 String str="SELECT map_id FROM tblmapenroll WHERE user_id=? and pro_id=? and subpro_id=?";
						     				     
						        prepStmt = connection.con.prepareStatement(str);
					            prepStmt.setString(1,user_id);
					            prepStmt.setString(2,programid);
					            prepStmt.setString(3,courid);
					            
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
		
		 public String getmapid(String user_id)
		    {
		    	 
		    	String map_id=null;
				    
				    	  
				        try {
				        	connection.makeConnection();
				        	 String str="SELECT map_id FROM tblmapenroll WHERE user_id=?";
						     				     
						        prepStmt = connection.con.prepareStatement(str);
					            prepStmt.setString(1,user_id);
					           
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
		
    public ArrayList getrolelist(String course_name,String role_name)
    {
   
  ArrayList role_list = new ArrayList();
     String role_name1="student";
      try {
    	  connection.makeConnection();         
                
             String selectStatement =  "select firstname,lastname,course from tbluserdetails where course = ? and role_name = ? ";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,course_name);
             prepStmt.setString(2,role_name1);
             rs = prepStmt.executeQuery();
           
            while(rs.next()) {
            
           String firstname = rs.getString(1);
             String lastname = rs.getString(2);
            
            String course = rs.getString(3);
                      
             String[] temps={firstname,lastname,course};
            role_list.add(temps);           
            }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();    } 
      finally { connection.releaseConnection();    }
     
     return role_list;
    }
    
    public ArrayList getrolelist1(String course_name,String role_name)
    {  
  ArrayList role_list = new ArrayList();
     String role_name1="course mentor";
      try {
    	  connection.makeConnection();         
                
             String selectStatement =  "select firstname,lastname,course from tbluserdetails where course = ? and role_name = ? ";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,course_name);
             prepStmt.setString(2,role_name1);
             rs = prepStmt.executeQuery();
           
            while(rs.next()) {
            
           String firstname = rs.getString(1);
             String lastname = rs.getString(2);
            
            String course = rs.getString(3);
                      
             String[] temps={firstname,lastname,course};
            role_list.add(temps);           
            }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();    } 
      finally { connection.releaseConnection();    }
     
     return role_list;
    }
    
    public ArrayList gettrainerlist()
    {
    
  ArrayList trainerlist = new ArrayList();
     String rolename="course mentor";
      try {
    	  connection.makeConnection();         
                
             String selectStatement =  "select firstname,lastname,course from tbluserdetails where role_name = ? ";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,rolename);
            
             rs = prepStmt.executeQuery();
           
            while(rs.next()) {
            
           String firstname = rs.getString(1);
             String lastname = rs.getString(2);
            
            String course = rs.getString(3);
                      
             String[] temps={firstname,lastname,course};
             trainerlist.add(temps);
             
            }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();  } 
      finally { connection.releaseConnection();    }
     
     return trainerlist;
    }
    
    
    public boolean mapenroll(String user_id,String programid,String courid,Date startdate,Date enddate) {
    	int cnt = 0;
	       boolean result = false;	
    
    	try{
	    	
    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblmapenroll(user_id,pro_id,subpro_id,start_date,end_date) values (?,?,?,?,?)";
	        
	    	 prepStmt = connection.con.prepareStatement(insertStmt);
	        prepStmt.setString(1,user_id);
	        prepStmt.setString(2,programid);
	        prepStmt.setString(3,courid);
	        prepStmt.setDate(4,connection.toSQLDate (startdate));
	        prepStmt.setDate(5,connection.toSQLDate (enddate));
	                     
	         cnt = prepStmt.executeUpdate();
	        if(cnt>0){
	        	
	        	 result = true;	 
	         }	      
	        prepStmt.close();
	        
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	    	connection.releaseConnection();   
	              
	    } finally {
	    	connection.releaseConnection();   
	    }
    			
		 return result;
	}
    
    public String getcoursename(String user_id)
    {
    	 
    	String course_name=null;
		    
		    	  
		        try {
		        	connection.makeConnection();
		        	 String str="SELECT course FROM tbluserdetails WHERE user_id=?";
				     				     
				        prepStmt = connection.con.prepareStatement(str);
			            prepStmt.setString(1,user_id);
			            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	course_name = rs.getString(1);
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
   
    public void deleterole(String role_name) {
		try{
	    	 
	    	
			connection.makeConnection(); 
	    	String insertStmt=  "delete from tblrole where role_name=?";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,role_name);
	       	             
	       prepStmt.executeUpdate();
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();   
	              
	    } finally {
	    	connection.releaseConnection();   
	    }
	    		
	}    
	
    public String getusername(String user_id)
    {
    	String user_name=null;
    	
    	 try {
    		 connection.makeConnection();         
                
             String selectStatement =  "select username from tbluserdetails where user_id = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,user_id);
             rs = prepStmt.executeQuery();
 	         
             if (rs.next()){
 	        	user_name = rs.getString(1);
 	          
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();    } 
    	 finally { connection.releaseConnection();    }
    	
    	return user_name;
    }
     
    public String getpassword(String user_id)
    {
    	
    	String password=null;
    	 try {
    		 connection.makeConnection();         
                
             String selectStatement =  "select password from tbluserdetails where user_id = ?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,user_id);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	 password = rs.getString(1);
 	        	
 	        	
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection();    } 
    	 finally { connection.releaseConnection();    }
    	
    	return password;
    }
     
    public String updatepassword(String user_id,String currentpassword, String newpass)
    {
    	String status="Current Password wrong, enter correctly";
    	try{
    	
    		connection.makeConnection(); 
    	String insertStmt=  "update tblUserdetail SET password = ? where user_id = ? and password = ? ";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
        prepStmt.setString(1,newpass);
        prepStmt.setString(2,user_id);
        prepStmt.setString(3,currentpassword);
       
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
         	
    	  status="Password update successfully";	 
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
    
    
    public String updatecategory(String courseid,String coursename)
    {
    	String status="Category update Failed";
    	try{
    	
    		connection.makeConnection(); 
    	String insertStmt=  "update tblcourse SET course_name = ? where course_id = ?";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
        prepStmt.setString(1,coursename);
        prepStmt.setString(2,courseid);
              
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
         	
    	  status="Category update successfully";	 
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
     

    public String updateroleinuserdetails(String roleid,String role_name)
    {
    	String status="Update Failed";
    	try{
    	
    		connection.makeConnection(); 
    	String insertStmt=  "update tblUserdetail SET role_name = ? where role_id = ?";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
        prepStmt.setString(1,role_name);
        prepStmt.setString(2,roleid);
              
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
         	
    	  status="Update successfully";	 
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
     
    
    public String updaterole(String roleid,String role_name)
    {
    	String status="Rolename update Failed";
    	try{
    	
    		connection.makeConnection(); 
    	String insertStmt=  "update tblrole SET role_name = ? where role_id = ?";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
        prepStmt.setString(1,role_name);
        prepStmt.setString(2,roleid);
              
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
         	
    	  status="Rolename update successfully";	 
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
    
    
    public String updatesubcourse(String subcourseid,String coursename)
    {
    	String status="Course update Failed";
    	try{
    		
    		connection.makeConnection(); 
    	String insertStmt=  "update tblsubcourse SET subcourse_name = ? where sub_id = ?";
        
    	prepStmt = connection.con.prepareStatement(insertStmt);
        prepStmt.setString(1,coursename);
        prepStmt.setString(2,subcourseid);
              
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
         	
    	  status="Course update successfully";	 
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
    
    
    public String selectregisterno()  throws RemoteException {
      
        String reg_no = null;
        PreparedStatement prepSelect = null;
        connection.makeConnection();
        try {
            String selectStatement = "SELECT max(cast(register_no as int)) from tblEnrolldetails";
            
            prepSelect = connection.con.prepareStatement(selectStatement);
            
            ResultSet rs = prepSelect.executeQuery();
            while (rs.next()) {
            	reg_no = rs.getString(1);
            }
            if (reg_no == null)
            	reg_no = "0";
            
            long nextId = Long.valueOf(reg_no).longValue();
            
            if(nextId==0){
                nextId = 10000;
            } else{
                nextId = nextId+1;
            }
            rs.close();
            prepSelect.close();
            reg_no = Long.toString(nextId);
           
            //prepStmt.close();
            connection.releaseConnection();   
           
        } catch(SQLException sql){
        	connection.releaseConnection();   
                  }
       
        return reg_no;
    }
    
    public String selectemployeeid()  throws RemoteException {
        
        String empid = null;
        PreparedStatement prepSelect = null;
        connection.makeConnection();
        try {
            String selectStatement = "SELECT max(cast(emp_id as int)) from tblUserdetail";
            
            prepSelect = connection.con.prepareStatement(selectStatement);
            
            ResultSet rs = prepSelect.executeQuery();
            while (rs.next()) {
            	empid = rs.getString(1);
            }
            if (empid == null)
            	empid = "0";
            
            long nextId = Long.valueOf(empid).longValue();
            
            if(nextId==0){
                nextId = 1000;
            } else{
                nextId = nextId+1;
            }
            rs.close();
            prepSelect.close();
            empid = Long.toString(nextId);
           
            //prepStmt.close();
            connection.releaseConnection();   
           
        } catch(SQLException sql){
        	connection.releaseConnection();   
                  }
       
        return empid;
    }
    
   	public String addcourse(String course_name) {
		String status=null;
		try{
	    	 
	    	
			connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblcourse(course_name) values (?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_name);
	                     
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Category created successfully";	 
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

	public String addentity(String role_id,String entityname) {
		String status=null;
		try{
	    	 
	    	
			connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblentity(role_id,entity_name) values (?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,role_id);
	        prepStmt.setString(2,entityname);
	                     
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Category created successfully";	 
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
	
	public String deletecourse(String course_name) {
		
		String status=null;
		try{
	    	 
	    	
			connection.makeConnection(); 
	    	String insertStmt=  "delete from tblcourse where course_name=?";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_name);
	       	             
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Category deleted successfully";	 
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
	
	public void deletesubcourse(String course_name) {
		try{
	    	 
	    	
			connection.makeConnection(); 
	    	String insertStmt=  "delete from tblsubcourse where subcourse_name=?";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,course_name);
	       	             
	       prepStmt.executeUpdate();
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	connection.releaseConnection();   
	              
	    } finally {
	    	connection.releaseConnection();   
	    }
	    		
	} 
	
	
	
	  public ArrayList getentityname(String roleid){
	    	
	    	    ArrayList s= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   
	        try {
	        	connection.makeConnection();
	        	 String str="SELECT distinct a.entity_id,a.entity_name,a.url_name from tblentity a,tblMappingEntityDetails b where a.entity_id=b.entity_id and b.role_id=?";
			     				     
			        prepStmt2 = connection.con.prepareStatement(str);
			       prepStmt2.setString(1,roleid);         
		            
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String entity_id = rs2.getString(1);
		            	String entity_name = rs2.getString(2);
		            	String url_name = rs2.getString(3);
		               
		            	String[] temp={entity_id,entity_name,url_name};
		            			
		            	s.add(temp);
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
	        return s;
 }

	  public ArrayList getperdatabycourse(String roleid){
	    	
	    	    ArrayList s= new ArrayList();
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   
	        try {
	        	connection.makeConnection();
	        	 String str="SELECT per_name,urllink from tblpermission where role_id=? and per_name LIKE '%course%'";
			     				     
			        prepStmt2 = connection.con.prepareStatement(str);
			       prepStmt2.setString(1,roleid);         
		            
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	String per_name = rs2.getString(1);
		            	String urllink = rs2.getString(2);
		            	
		               
		            	String[] temp={per_name,urllink};
		            			
		            	s.add(temp);
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
	        return s;
 }
	
	  public String getsemester(String batch){
		  String  semester=null;	
	    
	    PreparedStatement prepStmt2=null;
	    ResultSet rs2=null;
	   
	        try {
	        	connection.makeConnection();
	        	 String str="SELECT semester from tblbatch where getdate() BETWEEN startdate and enddate and batch = ?";
			     				     
			        prepStmt2 = connection.con.prepareStatement(str);
			        prepStmt2.setString(1,batch);     
		            
		            rs2 = prepStmt2.executeQuery();
		            while(rs2.next()){
		            	 semester = rs2.getString(1);
		            	        
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
	        return semester;
 }

	public ArrayList getallcompanyname() {
		ArrayList auto = new ArrayList();
		connection.makeConnection();
	       try {
	    	 
	     	  String selectStmt="select distinct institution_name from tblSignupUserdetails ";          	  
	           
	         System.out.println("==================="+selectStmt);
	           prepStmt = connection.con.prepareStatement(selectStmt);
	          
	           rs=prepStmt.executeQuery();
	         
	           while(rs.next()) {
		          	
		          	String Company = rs.getString(1);
		          	System.out.println("getting data >------>> "+Company);
		          	auto.add(Company);                  
		          }     
		        
	           rs.close();
	           prepStmt.close();
	           connection.releaseConnection();
	          
	    	  
	       }catch(SQLException sql){
	        	connection.releaseConnection();   
	            throw new EJBException("SQL Exception in MemberUpdateDAO getNextUserId:" + sql.getMessage());
	            
	        }finally {
	            connection.releaseConnection();   
	        }
	 	
		return auto;
		
	}
	
	
}
