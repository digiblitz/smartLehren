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
import java.util.ArrayList;
import java.util.Date;

public interface UserDBInterface {
	
			 public String savecontact(String name, String emailid, String phoneno, String message, String company );
			
			 public ArrayList getcontactlist(String emailid);
			
			 public ArrayList getugprogramlist();
			
			 public String addbatch(String batch,String graduation,String semester)throws RemoteException;
			 
			 public String createemployee(String username,String password,String firstname,String lastname,String gender,String e_mail,Date dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode,String roleid,String rolename,String program,String subprogram) throws RemoteException;
			 
			 public String usercreate(String username,String password,String firstname,String lastname,String gender,String e_mail,Date dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode,String companyname) throws RemoteException;
			 
			 public ArrayList getuserslist(String username);
			 
			 public String addstudentdetails(String user_id,String firstname,String lastname,String gender,String e_mail,String dob,String mobileno,String fathername,String mothername,String address1,String address2,String city,String state,String country,String pincode,
			    		String category,String program_id,String sub_program_id,String sslc_schoolname,String sslc_mark,String sslc_yop,String hsc_schoolname,String hsc_mark,String hsc_yop,String collegename,String percentage,String yop,String university,String role_id,String rolename,String batch) throws RemoteException;
			 
			 public String addper(String role_id,String entity_id,String per_name,String urllink);
			 
			 public String addbatch(String batch,String grad,String  sem,Date st,Date ed );
			 
			 public String updateenroll(String roleid,String approval,String user_id);
			 
			 public ArrayList getrolelist();
			 
			 public ArrayList getstudentlist();
			 
			 public String updateuser(String username,String password,String firstname,String lastname,String gender,String e_mail,String date,String mobile_no,String father_name,String mother_name ,String address1,String address2,String city,String state ,String country,String pincode,String user_id);
			 
			 public String updateprofile(String username,String password,String email,String institutionname, String mail);
			 
			 public String updateuserprofile(String username,String password,String email, String mail);
			 
			 public boolean updatenrolllist(String map_id,String user_id,String courid,Date startdate,Date enddate);
			 
			 public String getuser(String username,String password);
			 
			 public String checkusername(String user_name);
			 
			 public String updateapprove(String approval,String user_id);
			 
			 public String updatepaymentapprove(String user_id);
			 
			 public String getroleid(String role_name);
			 
			 public String getrolename(String role_id);
			 
			 public ArrayList getuserlist(String user_id);
			 
			 public ArrayList getallcoursebyuserid(String user_id);
			 
			 public ArrayList getenrolledcourse(String user_id);
			 
			 public ArrayList getprogramnamebyuserid(String user_id);
			 
			 public String getrole_id(String user_id);
			 
			 public ArrayList display();
			 
			 public ArrayList getcourseforcoursementor(String user_id);
			 
			 public ArrayList getperdata(String roleid);
			 
			 public String addrole(String role_name);
			 
			 public String getmapid(String user_id,String programid,String courid);
			 
			 public String getmapid(String user_id);
			 
			 public ArrayList getrolelist(String course_name,String role_name);
			 
			 public ArrayList getrolelist1(String course_name,String role_name);
			 
			 public ArrayList gettrainerlist();
			 
			 public boolean mapenroll(String user_id,String programid,String courid,Date startdate,Date enddate);
			 
			 public String getcoursename(String user_id);
			 
			 public void deleterole(String role_name);
			 
			 public String getusername(String user_id);
			 
			 public String getpassword(String user_id);
			 
			 public String updatepassword(String user_id,String currentpassword, String newpass);
			 
			 public String updatecategory(String courseid,String coursename);
			 
			 public String updateroleinuserdetails(String roleid,String role_name);
			 
			 public String updaterole(String roleid,String role_name);
			 
			 public String updatesubcourse(String subcourseid,String coursename);
			 
			 public String selectregisterno()  throws RemoteException;
			 
			 public String selectemployeeid()  throws RemoteException;
			 
			 public String addcourse(String course_name);
			 
			 public String addentity(String role_id,String entityname);
			 
			 public String deletecourse(String course_name);
			 
			 public void deletesubcourse(String course_name);
			 
			 public ArrayList getentityname(String roleid);
			 
			 public ArrayList getperdatabycourse(String roleid);
			 
			 public String getsemester(String batch);
			 
			 public ArrayList getallcompanyname();
			 			 

}
