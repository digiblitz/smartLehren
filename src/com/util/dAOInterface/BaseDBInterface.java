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
package com.util.dAOInterface;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public interface BaseDBInterface {
	
	public ArrayList getcourselist(String user_id);
	
	public String getprogramname(String programid);
	
	public String getsubprogram(String programid, String subprogramid);
	
	public ArrayList getrecordedclass(String course_code);
	
	public ArrayList getapplication();
	
	public String getpath(String appName);
	
	public boolean checkUserNameExist(String loginName) throws SQLException;
	
	public boolean checkemailExist(String email) throws SQLException;
	
	public String getcoursename(String course_code);
	
	public String createuserforlms(String username,String password,String firstname,String lastname,String gender,String e_mail,Date dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode) throws RemoteException;
	
	public String insertsignup(String firstname,String lastname,String e_mail,String mobileno,String city,String state,String country,String companyname,String cardtype,String cardno,String cvvno,String name,String expDat1, String monthYear, String subscription_type, String plan_type, String amount, String transactionId, String couponcode,String couponoffer,String product_type) throws RemoteException;
	
	public String insertsignupUserdetail(String username, String password, String firstname, String lastname, String e_mail, String city, String state, String country) throws RemoteException;
	
	public ArrayList getcustomerlist(String customerid);
	
	public String updateusersignup(String firstname,String lastname,String e_mail,String password,String mobileno,String city,String state,String country,String companyname) throws RemoteException;
	
	public String selectcompany_id()  throws RemoteException;
	
	public String selectcustomer_id();
	
	public String selectsubscription_id() ;
	
	public String selectorder_id();
	
	public String getuseridbyemail(String email);
	
	public ArrayList getprofiledetails(String e_mail);
	
	public String getuserandpass(String e_mail);
	
	public ArrayList getplanpackage(String email);
	
	public String getdate(String email);
	
	public String getuserpicpath(String user_id);
	
	public String selectcompanyid(String email);
	
	public String selectsubscriptionid(String email);
	
	public String selectorderid(String email);
	
	public String selectcustomerid(String email);
	
	public String getprofileid(String user_id);
	
	public String updateuserpicture(String user_id,String filelocation) throws RemoteException;
	
	public String getregisterno(String userid);
	
	public ArrayList getcategoryandcourses(String category);
	
	public String getcouponoffer(String coupon_code);
	
}
