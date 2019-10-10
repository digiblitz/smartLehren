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
import java.util.Date;
import java.util.Random;

import com.util.dAOInterface.BaseDBInterface;

public class baseDB implements BaseDBInterface {
	
	private static BaseDBInterface myInstance = new baseDB();		
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    Connectiondb connection = Connectiondb.getInstance();
    public static baseDB getInstance(){
		return (baseDB) myInstance;    	
    }
    
	 private baseDB(){}
	 
	 // amalesh 23-02-16
	 public ArrayList getcourselist(String user_id)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select program_id,sub_program_id,role_name from tblUserdetail where user_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String program_id = rs.getString(1);
	 	        	String sub_program_id = rs.getString(2);
	 	        	String rolename = rs.getString(3);
	 	        	
	 	         String[] temps={program_id,sub_program_id,rolename};
	 	        
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }
	 
	 public String getprogramname(String programid)
	    {
		
	    	//ArrayList sublist = new ArrayList();
	    	String coursename =null;
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select course_name from tblcourse where course_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,programid);
	             rs = prepStmt.executeQuery();
	             
	 	          while(rs.next()) {
	 	        	 coursename = rs.getString(1);
	 	          
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return coursename;
	    }
	 
	 public String getsubprogram(String programid, String subprogramid)
	    {
		 
	    	//ArrayList sublist = new ArrayList();
	    	String subcoursename =null;
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select subcourse_name from tblsubcourse where course_id=? and sub_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,programid);
	             prepStmt.setString(2,subprogramid);
	             rs = prepStmt.executeQuery();
	                      while(rs.next()) {
	 	        	 subcoursename = rs.getString(1);	 	        	 
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return subcoursename;
	    }
	 
		 
	// amalesh 23-02-16 ends
	 
	 public ArrayList getrecordedclass(String course_code)
	    {
	    	ArrayList rclist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select tittle,video_link from tblRecordedclass where course_code=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,course_code);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String tittle = rs.getString(1);
	 	        	String video_link = rs.getString(2);
	 	        	
	 	         String[] temps={tittle,video_link};
	 	        
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }
	 
	 public ArrayList getapplication()
	    {
	    	ArrayList sublist = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select * from tblExternalApp";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	  String appid = rs.getString(1);
	 	        	 String filename = rs.getString(2);
	 	        	 String pathname = rs.getString(3);
	 	        	  String[] temps={appid,filename,pathname};
	 	        	 sublist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return sublist;
	    }
	 
	 public String getpath(String appName)
	    {		 
	    	//ArrayList sublist = new ArrayList();
	    	String pathname =null;
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select pathname from tblExternalApp where filename=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,appName);
	             rs = prepStmt.executeQuery();	             
	 	          while(rs.next()) {
	 	        	 
	 	        	
	 	        	 pathname = rs.getString(1);
	 	        	  //String temps=pathname;
	 	        	// sublist.add(temps);	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return pathname;
	    }
		
	
	 public boolean checkUserNameExist(String loginName) throws SQLException {	       
	        boolean result = false;
	        try {
	        	connection.makeConnection();
	            
	            String selectStatement = "select user_id from tblUserdetail where username = ? ";
	            
	            prepStmt = connection.con.prepareStatement(selectStatement);
	            prepStmt.setString(1, loginName);
	            
	            rs = prepStmt.executeQuery();
	            if (rs.next()) {
	                result = true;
	            }
	            rs.close();	            
	            prepStmt.close();
	        } catch (SQLException sqe) {
	        	connection.releaseConnection();	           
	            //sqe.printStackTrace();
	        } finally {
	        	connection.releaseConnection();
	        }
	        return result;
	    }
	 
	 public boolean checkemailExist(String email) throws SQLException {	       
	        boolean result = false;
	        try {
	        	connection.makeConnection();
	            
	            String selectStatement = "select user_id from tblUserdetail where e_mail = ? ";
	            
	            prepStmt = connection.con.prepareStatement(selectStatement);
	            prepStmt.setString(1, email);
	            
	            rs = prepStmt.executeQuery();
	            if (rs.next()) {
	                result = true;
	            }
	            rs.close();	            
	            prepStmt.close();
	        } catch (SQLException sqe) {
	        	connection.releaseConnection();	           
	            //sqe.printStackTrace();
	        } finally {
	        	connection.releaseConnection();
	        }
	        return result;
	    }
	 
	 public String getcoursename(String course_code)
	    {
	    	 
	    	String coursecode=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT course_name FROM tblMapProgram WHERE course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	coursecode = rs.getString(1);
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
			       
			    return coursecode;
	    }
	 
	 
	 public String createuserforlms(String username,String password,String firstname,String lastname,String gender,String e_mail,Date dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode) throws RemoteException
	    {
	    	String status="User not created ";  		    	
	    	try{	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblTesting(username,password,firstname,lastname,gender,e_mail,dob,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,password);
	        prepStmt.setString(3,firstname);
	        prepStmt.setString(4,lastname);
	        prepStmt.setString(5,gender);
	        prepStmt.setString(6,e_mail);
	        prepStmt.setDate(7,connection.toSQLDate(dob));
	        prepStmt.setString(8,mobileno);
	        prepStmt.setString(9,fathername);
	        prepStmt.setString(10,mothername);
	        prepStmt.setString(11,address1);
	        prepStmt.setString(12,address2);
	        prepStmt.setString(13,city);
	        prepStmt.setString(14,state);
	        prepStmt.setString(15,country);
	        prepStmt.setString(16,pincode);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="User Created successfully";	 
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
	 
	 public String insertsignup(String firstname,String lastname,String e_mail,String mobileno,String city,String state,String country,String companyname,String cardtype,String cardno,String cvvno,String name,String expDat1, String monthYear, String subscription_type, String plan_type, String amount, String transactionId, String couponcode,String couponoffer,String product_type) throws RemoteException
	    {
	    	String status = null;  	
	    	String reg_id = selectcompany_id();
	    	String counts = selectcustomer_id();
	    	String subscription_id = selectsubscription_id();
	    	String order_id = selectorder_id();
	    	String customer_id = monthYear+counts;
	    		
	    	String username=null;
			
							
			if(lastname.length()>4){
				username=lastname.substring(0, 4);					
			}
			
			else if(lastname.length()!=0 && lastname!=null){
				if(firstname.length()>=4){
					username=firstname.substring(0, 4);						
				}
				else if(firstname.length()<4 && firstname.length()==3){
					username=firstname+lastname.substring(0, 1);						
				}			
			}
			else{
				if(firstname.length()>=4){
					username=firstname.substring(0, 4);						
				}
				else if(firstname.length()<4 && firstname.length()==3){
					username=firstname+'W';						
				}				
			}
			
			int countcmid=reg_id.length()-4;
			  username=username+"SL"+reg_id.substring(countcmid);
			
			  final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
				Random rnd = new Random();
				int len=8;							
				StringBuilder sb = new StringBuilder( len );
				   for( int i = 0; i < len; i++ ) {
				     sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );			
				   }							  
			String password=sb.toString();	    	
	    	try{
	    		connection.makeConnection(); 
String insertStmt="Insert into tblSignupUserdetails(firstname,lastname,e_mail,mobile_no,institution_name,city,state,country,card_type,card_number,cvv_no,cardholder_name,expiry_date, customer_id,register_id,subscription_id, order_id, count, amount, username, password, plan_type, subscription_type, transaction_id,coupon_code,coupon_value,product_type) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,firstname);
	        prepStmt.setString(2,lastname);
	        prepStmt.setString(3,e_mail);
	        prepStmt.setString(4,mobileno);
	        prepStmt.setString(5,companyname);
	        prepStmt.setString(6,city);
	        prepStmt.setString(7,state);
	        prepStmt.setString(8,country);
	        prepStmt.setString(9,cardtype);
	        prepStmt.setString(10,cardno);
	        prepStmt.setString(11,cvvno);
	        prepStmt.setString(12,name);
	        prepStmt.setString(13,expDat1);
	        prepStmt.setString(14,customer_id);
	        prepStmt.setString(15,reg_id);
	        prepStmt.setString(16,subscription_id);
	        prepStmt.setString(17,order_id);
	        prepStmt.setString(18,counts);
	        prepStmt.setString(19,amount);
	        prepStmt.setString(20,username);
	        prepStmt.setString(21,password);
	        prepStmt.setString(22,plan_type);
	        prepStmt.setString(23,subscription_type);
	        prepStmt.setString(24,transactionId);
	        prepStmt.setString(25,couponcode);
	        prepStmt.setString(26,couponoffer);
	        prepStmt.setString(27,product_type);
	       
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	      	String stat = myInstance.insertsignupUserdetail(username,password,firstname,lastname,e_mail,city,state,country);	          
	        if(stat != null){
	        	status="Signed up";
	        }	      	
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
	 
	 
	 public String insertsignupUserdetail(String username, String password, String firstname, String lastname, String e_mail, String city, String state, String country) throws RemoteException
	    {
	    	String status = null;  	
	    	   	
	    	try{
	    		connection.makeConnection(); 
String insertStmt="Insert into tblUserdetail(username,password,firstname,lastname,e_mail,city,state,country,pincode,dob,father_name) values (?,?,?,?,?,?,?,?,?,?,?)";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        Date date = new Date();
	        
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,password);
	        prepStmt.setString(3,firstname);	       
	        prepStmt.setString(4,lastname);
	        prepStmt.setString(5,e_mail);
	        prepStmt.setString(6,city);	       
	        prepStmt.setString(7,state);
	        prepStmt.setString(8,country);
	        prepStmt.setString(9,"sLCust");
	        prepStmt.setDate(10,connection.toSQLDate(date));
	        prepStmt.setString(11,"sLCust");
	       
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="User Inserted";	 
	      	  
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
	 
	 public ArrayList getcustomerlist(String customerid)
	    {
	    	ArrayList sublist = new ArrayList();
	    	  String firstname = null;
	        	 String lastname = null;
	        	 String e_mail = null;
	        	String mobile_no = null;
	        	String institution_name = null;
	        	String city = null;
	        	String state = null;
	        	String country = null;
	        	String card_type = null;
	        	String card_number = null;
	        	String cvv_no = null;
	        	String cardholder_name = null;
	        	String expiry_date = null;
	        	String register_id = null;
	        	String date = null;
	        	String subscription_id = null;
	        	String order_id = null;
	        	String amount = null;
	        	String plan_type = null;
	        	String subscription_type = null;
	    	
	    	 try {
	    		 connection.makeConnection();        	                
	             String selectStatement =  "select firstname, lastname, e_mail, mobile_no, institution_name, city, state, country, card_type, card_number, cvv_no, cardholder_name, expiry_date, register_id, date, subscription_id, order_id, amount, plan_type, subscription_type from tblSignupUserdetails where customer_id=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1, customerid);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	            firstname = rs.getString(1);
	 	        	lastname = rs.getString(2);
	 	        	e_mail = rs.getString(3);
	 	        	mobile_no = rs.getString(4);
	 	        	institution_name = rs.getString(5);
	 	        	city = rs.getString(6);
	 	        	state = rs.getString(7);
	 	        	country = rs.getString(8);
	 	        	card_type = rs.getString(9);
	 	        	card_number = rs.getString(10);
	 	        	cvv_no = rs.getString(11);
	 	        	cardholder_name = rs.getString(12);
	 	        	expiry_date = rs.getString(13);
	 	        	register_id = rs.getString(14);
	 	        	date = rs.getString(15);	 	        	
	 	        	subscription_id = rs.getString(16);
	 	        	order_id = rs.getString(17);
	 	        	amount = rs.getString(18);
	 	        	plan_type = rs.getString(19);
	 	        	subscription_type = rs.getString(20);
	 	        	
	 	        	 
	 	        	  String[] temps={firstname, lastname, e_mail, mobile_no, institution_name, city, state, country, card_type, card_number, cvv_no, cardholder_name, expiry_date, register_id, date, subscription_id, order_id, amount, plan_type, subscription_type};
	 	        	 sublist.add(temps);	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }	    	
	    	return sublist;
	    }
	 
	 public String updateusersignup(String firstname,String lastname,String e_mail,String password,String mobileno,String city,String state,String country,String companyname) throws RemoteException
	    {
	    	String status=null;  	
	    	
			
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	
	    	String insertStmt=  "update tblSignupUserdetails SET firstname = ?, lastname = ?, password = ?, phone = ?, city = ?, state = ?, country = ?, company_name = ? where email_id = ? ";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,firstname);
	        prepStmt.setString(2,lastname);
	        prepStmt.setString(3,password);
	        prepStmt.setString(4,mobileno);
	        prepStmt.setString(5,city);
	        prepStmt.setString(6,state);
	        prepStmt.setString(7,country);
	        prepStmt.setString(8,companyname);
	        prepStmt.setString(9,e_mail);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="User update successfully";	 
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
	 
	 public String selectcompany_id()  throws RemoteException {
	        
	        String empid = null;
	        PreparedStatement prepSelect = null;
	        connection.makeConnection();
	        try {
	    String selectStatement = "SELECT max(cast(register_id as int)) from tblSignupUserdetails";
	            
	            prepSelect = connection.con.prepareStatement(selectStatement);
	            
	            ResultSet rs = prepSelect.executeQuery();
	            while (rs.next()) {
	            	empid = rs.getString(1);
	            }
	            if (empid == null)
	            	empid = "0";
	            
	            long nextId = Long.valueOf(empid).longValue();
	            
	            if(nextId==0){
	                nextId = 10101000;
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
	 
	 public String selectcustomer_id() {
		 String coun=null;   
		 String customerid=null;
		 
		 PreparedStatement prepSelect = null;
		 connection.makeConnection();
		 
	        String selectStatement = "SELECT max(cast(count as int)) from tblSignupUserdetails";
		 
	        try {
				prepSelect = connection.con.prepareStatement(selectStatement);
				  
	            ResultSet rs = prepSelect.executeQuery();
	            while (rs.next()) {
	            	customerid = rs.getString(1);
	            }
	            
	            if (customerid == null)
	            	customerid = "0";
	            int count=Integer.valueOf(customerid).intValue();	            
	            if(count==0){
	            	count=01;
	            }
	            else{
	            	count=count+1;
	            }
	            
	             coun=Integer.toString(count);
	            
	             rs.close();
		            prepSelect.close();       
		           
		            
		            connection.releaseConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
          
	        
			return coun;
    }
	 
	 public String selectsubscription_id()   {
	        
	         StringBuilder sb =null;
	            //=========================alphanumeric random generator========================
	            final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    		Random rnd = new Random();
	    		int len=16;
	    		
	    		sb = new StringBuilder( len );
	    		   for( int i = 0; i < len; i++ ) {
	    		     sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );			
	    		   }	    		   
	    		   
	             //=========================alphanumeric random generator========================
	    		  
	        return sb.toString();
	    }
	 
	 public String selectorder_id() {
	        
         StringBuilder sb =null;
            //=========================alphanumeric random generator========================
            final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    		Random rnd = new Random();
    		int len=8;
    		
    		sb = new StringBuilder( len );
    		   for( int i = 0; i < len; i++ ) {
    		     sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );			
    		   }    		   
    		   
             //=========================alphanumeric random generator========================
    		  
        return sb.toString();
    }
	 
	
	 public String getuseridbyemail(String email)
	    {
	    	 
	    	String userid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT user_id FROM tblSignupUserdetails WHERE e_mail=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,email);
				            
				            
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
	 
	 public String getemailbyuserid(String userid)
	    {
	    	 
	    	String email=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT e_mail FROM tblUserdetail WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,userid);
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	email = rs.getString(1);
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
			       
			    return email;
	    }
	 
	 public ArrayList getprofiledetails(String e_mail)
	    {
	    	ArrayList profiledetails = new ArrayList();
	    	
	         
	      
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select username, password, institution_name, customer_id from tblSignupUserdetails where e_mail=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,e_mail);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String username = rs.getString(1);
	 	        	String password = rs.getString(2);
	 	        	String institution_name = rs.getString(3);
	 	        	String customer_id = rs.getString(4);
	 	        		 	        	
	 	         String[] temps={username, password, institution_name, customer_id};	 	         
	 	          profiledetails.add(temps);	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return profiledetails;
	    }
	 
	 public String getuserandpass(String e_mail)
	    {
	    	String user=null;
	      
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select username, password from tblSignupUserdetails where e_mail=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,e_mail);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String username = rs.getString(1);
	 	        	String password = rs.getString(2);
	 	        	
	 	        	user=username+"/"+password;	 	        	
	 	       	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return user;
	    }
	 
	 
	 public ArrayList getplanpackage(String email)
	    {
	    	ArrayList planpackage = new ArrayList();	    	     
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select amount, plan_type, subscription_type from tblSignupUserdetails where e_mail=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,email);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String amount = rs.getString(1);
	 	        	String plan_type = rs.getString(2);
	 	        	String subscription_type = rs.getString(3);
	 	        	
	 	        		 	        	
	 	         String[] temps={amount, plan_type, subscription_type};	 	         
	 	          planpackage.add(temps);	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return planpackage;
	    }
	 
	 public String getdate(String email)
	    {
	    	 
	    	String date=null;		    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT date FROM tblSignupUserdetails WHERE e_mail=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,email);
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	date = rs.getString(1);
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
			       
			    return date;
	    }
	 
	 public String getuserpicpath(String user_id)
	    {
	    	 
	    	String filepath=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT path_name FROM tbluserpicture WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
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
	 
	 public String selectcompanyid(String email){
	    	 
	    	String map_id=null;
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT register_id FROM tblSignupUserdetails WHERE e_mail=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,email);
				           
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
	 
	 public String selectsubscriptionid(String email){
    	 
	    	String map_id=null;
			        try {
			        	connection.makeConnection();
			    String str="SELECT subscription_id FROM tblSignupUserdetails WHERE e_mail=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,email);
				           
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
	 
	 public String selectorderid(String email){
    	 
	    	String map_id=null;
			        try {
			        	connection.makeConnection();
			    String str="SELECT order_id FROM tblSignupUserdetails WHERE e_mail=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,email);
				           
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
	 
	 public String selectcustomerid(String email){
    	 
	    	String map_id=null;
			        try {
			        	connection.makeConnection();
			    String str="SELECT customer_id FROM tblSignupUserdetails WHERE e_mail=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,email);
				           
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
	 
	 public String getprofileid(String user_id)
	    {
	    	 
	    	String pro_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT pic_id FROM tbluserpicture WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	pro_id = rs.getString(1);
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
			       
			    return pro_id;
	    }
	 
	 public String updateuserpicture(String user_id,String filelocation) throws RemoteException
	    {
	    	String status=null;  	
	    	
			
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	
	    	String insertStmt=  "update tbluserpicture SET path_name = ? where user_id = ? ";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,filelocation);
	        prepStmt.setString(2,user_id);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="User update successfully";	 
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
	 
	 public String getregisterno(String userid)
	    {
	    	 
	    	String registerno=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT register_no FROM tblEnrolldetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,userid);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	registerno = rs.getString(1);
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
			       
			    return registerno;
	    }
	 
	 public ArrayList getcategoryandcourses(String category)
	    {
	    	ArrayList rclist = new ArrayList();
	    	String s="---select---";
	    	 String[] temp={s};
 	         
 	       rclist.add(temp);
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select distinct b.course_name from tblMapProgram a,tblcourse b where a.program_id=b.course_id and a.graduation_category=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,category);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String tittle = rs.getString(1);
	 	        	//String tittle1 = rs.getString(2);
	 	        		 	        	
	 	         String[] temps={tittle};	 	         
	 	       rclist.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return rclist;
	    }

	public String getcouponoffer(String coupon_code) {
		String couponoffer=null;
		 try {
    		 connection.makeConnection();         
                
             String selectStatement =  "select coupon_offer from tblCouponDetails where coupon_code=?";
             
             prepStmt = connection.con.prepareStatement(selectStatement);
             prepStmt.setString(1,coupon_code);
             rs = prepStmt.executeQuery();
 	         
 	          while(rs.next()) {
 	        	  couponoffer = rs.getString(1);
 	        	//String tittle1 = rs.getString(2);
 	        
 	        	  
 	          }
             prepStmt.close();
             rs.close();          
              } 
         catch (SQLException sqe) { connection.releaseConnection(); } 
    	 finally { connection.releaseConnection(); }
    	
    	return couponoffer;
	}
	 
	 }
