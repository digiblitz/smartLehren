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

import org.jfree.util.Log;


public class CustomerDB {
	
	private static CustomerDB myInstance = new CustomerDB(); 
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    public static CustomerDB getInstance(){
		return myInstance;    	
    }
    Connectiondb connection = Connectiondb.getInstance();
	 private CustomerDB(){}
	 
	 public String updatecustomer(String firstname, String lastname, String email, String mobileno, String institution, String country, String state, String city, String amount, String cardtype, String cardnumber, String cvvno, String cardholdername, String expirydate, String registerid, String subscriptionid, String subscriptiontype, String orderid, String plantype, String customerid, String customeridold) throws RemoteException
	    {
	    	String status=null;  	
			
	    	try{
	    		connection.makeConnection(); 
	    	
	    	String insertStmt=  "update tblSignupUserdetails SET firstname = ?, lastname = ?, e_mail = ?, mobile_no = ?, institution_name = ?, country = ?, state = ?, city = ?, amount = ?, card_type = ?, card_number = ?, cvv_no = ?, cardholder_name = ?, expiry_date = ?, register_id = ?, subscription_id = ?, subscription_type = ?, order_id = ?, plan_type = ?, customer_id = ? where customer_id = ? ";
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,firstname);
	        prepStmt.setString(2,lastname);
	        prepStmt.setString(3,email);
	        prepStmt.setString(4,mobileno);
	        prepStmt.setString(5,institution);
	        prepStmt.setString(6,country);
	        prepStmt.setString(7,state);
	        prepStmt.setString(8,city);
	        prepStmt.setString(9,amount);
	        prepStmt.setString(10,cardtype);
	        prepStmt.setString(11,cardnumber);
	        prepStmt.setString(12,cvvno);
	        prepStmt.setString(13,cardholdername);
	        prepStmt.setString(14,expirydate);
	        prepStmt.setString(15,registerid);
	        prepStmt.setString(16,subscriptionid);
	        prepStmt.setString(17,subscriptiontype);
	        prepStmt.setString(18,orderid);
	        prepStmt.setString(19,plantype);
	        prepStmt.setString(20,customerid);
	        prepStmt.setString(21,customeridold);
	        
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Customer update successfully";	 
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
	 
	 public String setcreatecoupon(String coupon_code, String coupon_description, String coupon_offer){
		 String status="Insertion of Event Details Failed"; 
		 try {
			 connection.makeConnection();
			 
	String insertEventDetails="insert into tblCouponDetails(coupon_code,coupon_description,coupon_offer) values(?,?,?)";
			prepStmt = connection.con.prepareStatement(insertEventDetails);
			
			    prepStmt.setString(1,coupon_code);
		        prepStmt.setString(2,coupon_description);
		        prepStmt.setString(3,coupon_offer);
		        		        
			int count=prepStmt.executeUpdate();
			
			if(count>0){
				status="Coupon created Successfully";
			}
			prepStmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			connection.releaseConnection();	
		}
		 finally { connection.releaseConnection(); }
		 return status;
	 }
	 
	 public ArrayList<String> getCouponList(){
		 
		 ArrayList couponlist = new ArrayList();
		 
		 try{
			 connection.makeConnection();
		 
		 String fetchProgramid="select coupon_id,coupon_code,coupon_description,coupon_offer from tblCouponDetails where coupon_status='Active'";
		 
		 prepStmt = connection.con.prepareStatement(fetchProgramid);		
		 rs = prepStmt.executeQuery();
		 
		 while(rs.next()){
			 String coupon_id=rs.getString(1);
			 String coupon_code=rs.getString(2);
			 String coupon_description=rs.getString(3);
			 String coupon_offer=rs.getString(4);
			 
			 String strcoupon[] = {coupon_id,coupon_code,coupon_description,coupon_offer};			 
    		 couponlist.add(strcoupon);
		 }
		 	prepStmt.close();
		 	rs.close();
		 
		 }
		 catch(SQLException sqe){
			 connection.releaseConnection();		 
		 }
		 finally { connection.releaseConnection(); }
		 return couponlist;
	 }

public String getCouponOffer(String coupon_code){
	 
	 String couponoffer = null;
	 
	 try{
		 connection.makeConnection();
	 
	 String query="select coupon_offer from tblCouponDetails where coupon_code=? and coupon_status='Active'";
	 
	 prepStmt = connection.con.prepareStatement(query);
	 prepStmt.setString(1,coupon_code);
	 rs = prepStmt.executeQuery();
	 
	 if(rs.next()){
		 couponoffer = rs.getString(1);	
	 }
	 	prepStmt.close();
	 	rs.close();
	 
	 }
	 catch(SQLException sqe){
		 connection.releaseConnection();		 
	 }
	 finally { connection.releaseConnection(); }
	 return couponoffer;
}

	public String deactivateCoupon(String coupon_id) {			
	String status = null;
	try {

		connection.makeConnection();
		String updateStmt = "update tblCouponDetails set coupon_status='DeActive' where coupon_id=?"; 

		prepStmt = connection.con.prepareStatement(updateStmt);			
		prepStmt.setString(1, coupon_id);
		
		int cnt = prepStmt.executeUpdate();
		if (cnt > 0) {

			status = "DeActivated";
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
	
	public String updateCoupon(String coupon_id, String coupon_code, String coupon_description, String coupon_offer) {			
		String status = null;
		try {

			connection.makeConnection();
			String updateStmt = "update tblCouponDetails set coupon_code=?, coupon_description=?, coupon_offer=? where coupon_id=?"; 

			prepStmt = connection.con.prepareStatement(updateStmt);			
			prepStmt.setString(1, coupon_code);
			prepStmt.setString(2, coupon_description);
			prepStmt.setString(3, coupon_offer);
			prepStmt.setString(4, coupon_id);
			
			int cnt = prepStmt.executeUpdate();
			if (cnt > 0) {

				status = "Updated";
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


}
