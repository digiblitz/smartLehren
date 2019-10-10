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
package com.services;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.Date;

import com.spring.CommonForAll;
import com.util.adminDB;
import com.util.baseDB;
import com.util.examDB;
import com.util.studentDB;
import com.util.userDB;

public class StudentService {
	
	userDB db = userDB.getInstance();
	studentDB db5 = studentDB.getInstance();
	adminDB db1 = adminDB.getInstance();		
	baseDB db6 = baseDB.getInstance();
	examDB db8 = examDB.getInstance();
	CommonForAll common = CommonForAll.getInstance();
	
	static StudentService myInstance = new StudentService();
	public static StudentService getInstance(){
		return myInstance;
	}
	
	public String studentRegistartion(String username, String password, String firstname, String lastname, 
			String gender, String e_mail, Date dob, String mobileno, String fathername, 
			String mothername, String address1, String address2, String city, String state, 
			String country, String pincode ,String companyname) {
		
		System.out.println("welcme to student service registration method ");
		
String status = null;		
		
		try {
			System.out.println("started ");
			
			 boolean usrStat = db6.checkUserNameExist(username);
			System.out.println("user status "+usrStat);
			
			 if(usrStat){
				 System.out.println("user already exists ");
				 status = "User name already Registered, please give anyother username";
			 }else{				 
				 System.out.println("new user ");
			status = db.usercreate(username,password,firstname,lastname,gender,e_mail,
							dob,mobileno,fathername,mothername,address1,address2,city,state,country,pincode,companyname);
			 }
			 
			System.out.println("from student service "+username+" === "+password+" === "+firstname+" === "+lastname+" === "+gender+" === "+e_mail+" === "+
			dob+" === "+mobileno+" === "+fathername+" === "+mothername+" === "+address1+" === "+address2+" === "+city+" === "+state+" === "+country+" === "+pincode);
			
			
			
			System.out.println("registartion ended status "+status);
			
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return status;
	}

}
