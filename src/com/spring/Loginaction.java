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
package com.spring;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.suitecrm.session.DBCRMSessionBean;
import com.util.ReportDB;
import com.util.adminDB;
import com.util.baseDB;
import com.util.studentDB;
import com.util.trainerDB;
import com.util.userDB;



@Controller
public class Loginaction implements HttpSessionListener{
 
	static Logger log = Logger.getLogger(Loginaction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	//public static final String prop_file = "Log4j.properties";
	
	
	@RequestMapping("/login.html")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
	      Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");    
	            
		String user_id = null;
		String role_id = null;
		String role_name = null;
		String course_name = null;
		
				
		userDB db = userDB.getInstance();
		adminDB db1 = adminDB.getInstance();		
		studentDB db5 = studentDB.getInstance();
		trainerDB db4 = trainerDB.getInstance();
		baseDB db6 = baseDB.getInstance();
		ReportDB db7 = ReportDB.getInstance();
		CommonForAll common = CommonForAll.getInstance();
		DBCRMSessionBean dbcrm = new DBCRMSessionBean();
		 
		 QualificationAction qa = QualificationAction.getInstance();
		 HttpSession session = request.getSession(true); 
		 //get the PrintWriter object to write the html page 
	        PrintWriter writer = response.getWriter(); 
	        response.setContentType("text/xml"); 
	         
	        response.setHeader("Cache-Control", "no-cache"); 
	        
		 String LoginProcess = request.getParameter("LoginProcess");
		 String AdminProcess = request.getParameter("AdminProcess");
		 String InsertProcess = request.getParameter("Insert");
		 String UpdateProcess = request.getParameter("Update");
		 String DisplayProcess = request.getParameter("Display");
		 String Back = request.getParameter("Back");
		 String pro = request.getParameter("cmd");
		 String create = request.getParameter("create");
		 String Update = request.getParameter("Update");
		 String delete = request.getParameter("delete");
		 String appName = request.getParameter("app");
		 
	     if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("Process")){
	    	 	    	 
	     String username=request.getParameter("username");
			 String password=request.getParameter("password");
			 int i = 0; String imageData=null;
			 if(username !=null && password !=null){
				// NewUser nu = new NewUser();
				 // boolean ADchk=false;
				 //   ADchk = nu.active(username,password);
				 
				/* --------------------------ACTIVE DIRECTORY CODE END HERE---------------------------------------------------*/
				 //  if (ADchk == true){
					   user_id=db.getuser(username,password);
				  // } else{				 
				  // }
			  if(user_id !=null){
				 
				  role_id=db.getrole_id(user_id);
				  String rolename=db.getrolename(role_id);
				  session.setAttribute("username", username);
				  session.setAttribute("password", password);
				  
				  //login details starts
					  Date date = new Date();
					  SimpleDateFormat formatter=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");					
					
					  String login=formatter.format(date);
					  String required = "9";
					
					  String status = db7.setlogininsert(login,user_id,role_id,required);	
					  					  
					 //login ends
					  
									  				
				  ArrayList userlist=db1.getuserlist(user_id);
				 
				// ArrayList permission= db.getperdata(role_id);
				ArrayList entitylist= db.getentityname(role_id);
				
				String registerno=db6.getregisterno(user_id); 
				 
				// session.setAttribute("permission", permission); 
				session.setAttribute("entitylist", entitylist); 
				session.setAttribute("rolename", rolename);
				session.setAttribute("role_id", role_id); 
				session.setAttribute("sessionId",session.getId());
				session.setAttribute("userlist", userlist);
				session.setAttribute("user_id", user_id);
				session.setAttribute("registerno", registerno);
				
				 int total=0;	
				
				 ArrayList stucourselist=db5.getstudentcourse(user_id);
				 Iterator itr = stucourselist.iterator();
				
				 while(itr.hasNext()){
				
					 String sr4[] = (String[]) itr.next();
										 
					 String co_code = sr4[0]; 
					 String co=db4.getassignmentcount(co_code);
					 
					 int count = Integer.parseInt(co);
					  total=total+count;
					}
					
					String filepath=db6.getuserpicpath(user_id);
					
					try
					 {
					 FileInputStream inpStream = new FileInputStream(filepath);
					 byte[] bytearr= IOUtils.toByteArray(inpStream);
					 byte byteImageData[]  =com.bea.xbean.util.Base64.encode(bytearr);
					  imageData= new String(byteImageData);					 
					 }
					 catch(Exception e)
					 {					 
					 }
					
					String astotal = String.valueOf(total);
					String user=db4.getassignsubmittedcount(user_id);
					session.setAttribute("user", user);
					session.setAttribute("imageData", imageData);
					session.setAttribute("total", astotal);				
									
				return new ModelAndView("dashboard");
			  }else{
	        		 request.setAttribute("status","User Invalid");
	        		 return new ModelAndView("SLHome");
	        	 }
			 }else{
        		 request.setAttribute("status","User Invalid");
        		 return new ModelAndView("SLHome");
        	 }
	     }
	    
	     
	     else if(AdminProcess!=null && AdminProcess.equalsIgnoreCase("Process")){
	    	 
	    	 if(InsertProcess!=null && InsertProcess.equalsIgnoreCase("Create User")){ 
					return new ModelAndView("insert");
				}else if(UpdateProcess!=null && UpdateProcess.equalsIgnoreCase("Update/Delete")){ 
					return new ModelAndView("update");
				}else if(DisplayProcess!=null && DisplayProcess.equalsIgnoreCase("Display")){ 
					
					ArrayList list=db.display();
					request.setAttribute("list", list);
					return new ModelAndView("display");
				}
	     }
else if(AdminProcess !=null && AdminProcess.equalsIgnoreCase("createEvent")){
			 
			 String program_id=request.getParameter("program_id");
			 String subprogram_id=request.getParameter("subprogram_id");
			 String course_id=request.getParameter("coursecode");
			 String title=request.getParameter("title");
			 String startdate=request.getParameter("startdate");
			 String enddate=request.getParameter("enddate");
			 String description=request.getParameter("description");
			 			 
			 String addEventDetails=db1.addEventDetails(program_id, subprogram_id, course_id, title, startdate, enddate, description);
			 
			 return new ModelAndView("createEvent");
		 }
	    	
	     
	     else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("insert")){
				String status=null;
				if(InsertProcess!=null && InsertProcess.equalsIgnoreCase("Register")){ 
					try {
			String firstname=request.getParameter("firstname");
			String lastname=request.getParameter("lastname");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			String e_mail=request.getParameter("email");
			String gender=request.getParameter("gender");
			String mobileno=request.getParameter("mobileno");
			String date=request.getParameter("date");
			
			
			String companyname=request.getParameter("compamyname");
			//String year=request.getParameter("year");
			//String d=date+"-"+month+"-"+year;
			String fathername=request.getParameter("fathername");
			String mothername=request.getParameter("mothername");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			String city=request.getParameter("city");
			String country=request.getParameter("country");
			 SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String userid=db1.getuserid(username);
			//-------------------------Ldap------------------------
			//  NewUser nu = new NewUser(username, firstname, lastname, password, "SharePoint");
           
          // boolean addUsrStatus = nu.addUser();
         //  boolean addUsrToGroupStatus = nu.addUserToGroup();
    
    // if (addUsrStatus == true && addUsrToGroupStatus == true){
          
			//---------------------------------------------------
			 if (date != null && date.trim().length() != 0) {
				 try {
					Date dob = (Date) sdf.parse(date);
					if(userid != null){
						status="User name already exist";						
					}else{
						status=db.usercreate(username,password,firstname,lastname,gender,e_mail,dob,mobileno,fathername,mothername,address1,address2,city,state,country,pincode,companyname);
						//db6.createuserforlms(username,password,firstname,lastname,gender,e_mail,dob,mobileno,fathername,mothername,address1,address2,city,state,country,pincode);
						qa.mail(username,password,e_mail);
					}
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
            }
    // }	
			
			request.setAttribute("status", status);		
					}catch(Exception e){
						e.printStackTrace();
					}
			return new ModelAndView("frmUserSuccess");
				
					}
				else if(Back!=null && Back.equalsIgnoreCase("Back")){
					return new ModelAndView("admin");	
				}
			}
	     
			else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("createemployee")){
				
			String firstname=request.getParameter("firstname");
			String lastname=request.getParameter("lastname");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String e_mail=request.getParameter("email");
			String gender=request.getParameter("gender");
			String mobileno=request.getParameter("mobileno");
			String date=request.getParameter("date");
			String month=request.getParameter("month");
			String year=request.getParameter("year");
			String d=date+"-"+month+"-"+year;
			String fathername=request.getParameter("fathername");
			String mothername=request.getParameter("mothername");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			String city=request.getParameter("city");
			String country=request.getParameter("country");
			String rolename=request.getParameter("rolename");
			String program=request.getParameter("program");
			String subprogram=request.getParameter("subprogram");
			String roleid=db.getroleid(rolename);
			
			String proid=db1.getcourseid(program);
			String sub_proid=db1.getsubcourseid(subprogram);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			 
			String userid=db1.getuserid(username);
			String status = null;
			 if (d != null && d.trim().length() != 0) {
				 try {
					Date dob = (Date) sdf.parse(date);
					
					if(userid != null){
						 status="User name already exist";
					 }else{
						 status=db.createemployee(username,password,firstname,lastname,gender,e_mail,dob,mobileno,fathername,mothername,address1,address2,city,state,country,pincode,roleid,rolename,proid,sub_proid);		
							
					 
					}
				} catch (ParseException e) {
					
					e.printStackTrace();
				}
               }
			
			 request.setAttribute("status", status);
			 
			return new ModelAndView("insert");
				}
			else if(pro!=null && pro.equalsIgnoreCase("signupdetails")){
				return new ModelAndView("SLHome");
			}
			else if(pro!=null && pro.equalsIgnoreCase("initok")){
				return new ModelAndView("SLHome");
			}
			else if(pro!=null && pro.equalsIgnoreCase("initbatch")){
				 
				 return new ModelAndView("CreateBatch"); 
				}
			else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("Batch")){
			    String status=null;
			    if(InsertProcess!=null && InsertProcess.equalsIgnoreCase("Save")){
			     int i;
			       String batch=request.getParameter("batch");
			       String grad=request.getParameter("grad");
			       SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
			       String value = null;
			       if(grad.equals("UG")){
			        value="8";
			       }
			       else{ value="4";}			       
			      int  v=Integer.parseInt(value);
			       String start_date=null;
			       String end_date=null;
			       Date st=null;
			       Date ed=null;
			       String pgstart_date=null;
			       String pgend_date=null;
			       //Date pgst=null;
			      // Date pged=null;
			       
			      for( i=1;i<=v;i++){
			        
			      String sem=request.getParameter("semester"+i);
			      start_date=request.getParameter("startdate_"+i);
			      end_date=request.getParameter("enddate_"+i);
			      			     
			      pgstart_date=request.getParameter("pgstartdate_"+i);
          	      pgend_date=request.getParameter("pgenddate_"+i);		      
			    
	if (start_date != null && start_date.trim().length() != 0 && end_date != null && end_date.trim().length() != 0) {
	
		try {
			         st = (Date) sdf.parse(start_date);
			         ed = (Date) sdf.parse(end_date);
			         status=db.addbatch(batch,grad,sem,st,ed);
			     
		} catch (ParseException e) {
			        e.printStackTrace();
			       }
		}
	if (pgstart_date != null && pgstart_date.trim().length() != 0 && pgend_date != null && pgend_date.trim().length() != 0) {
			      
		try {
			         st = (Date) sdf.parse(pgstart_date);
			         ed = (Date) sdf.parse(pgend_date);
			         status=db.addbatch(batch,grad,sem,st,ed);
			       } catch (ParseException e) {
			    	   e.printStackTrace();
			}
		}
	}			    // status=db.addbatch(batch,grad,se);
			       request.setAttribute("status", status);
			       
			       return new ModelAndView("CreateBatch");
			      }
			   }
				   
			else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("Permission")){
				
				String rolename=request.getParameter("rolename");
				String per_name=request.getParameter("accessname");
				String urllink=request.getParameter("urllink");
				String entityname=request.getParameter("entityname");
				
				role_id=db.getroleid(rolename);
				String entityid=db1.getentityid(entityname);
				String status=db.addper(role_id,entityid,per_name,urllink);
				request.setAttribute("status", status);
				return new ModelAndView("access");
			}
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("approvenroll")){
	
				 user_id=request.getParameter("user_id");
				 String firstname=request.getParameter("firstname");
				 String lastname=request.getParameter("lastname");
				 String gender=request.getParameter("gender");
				 String e_mail=request.getParameter("e_mail");
				 String dob=request.getParameter("dob");
				 String mobileno=request.getParameter("mobile_no");
				 String fathername=request.getParameter("father_name");
				 String mothername=request.getParameter("mother_name");
				 String address1=request.getParameter("address1");
				 String address2=request.getParameter("address2");
				 String city=request.getParameter("city");
				 String state=request.getParameter("state");
				 String country=request.getParameter("country");
				 String pincode=request.getParameter("pincode");
				 String category=request.getParameter("category");
				 String program_name=request.getParameter("program_name");
				 String subprogram_name=request.getParameter("subprogram_name");
				 String sslc_schoolname=request.getParameter("sslc_schoolname");
				 String sslc_board=request.getParameter("sslc_board");
				 String sslc_mark=request.getParameter("sslc_mark");
				 String sslc_yop=request.getParameter("sslc_yop");
				 String hsc_schoolname=request.getParameter("hsc_schoolname");
				 String hsc_board=request.getParameter("hsc_board");
				 String hsc_mark=request.getParameter("hsc_mark");
				 String hsc_yop=request.getParameter("hsc_yop");
				 String collegename=request.getParameter("collegename");
				 String percentage=request.getParameter("percentage");
				 String yop=request.getParameter("yop");
				 String university=request.getParameter("university");
				 String batch=request.getParameter("batch");
				 
				String rolename=request.getParameter("rolename");
				String approval=request.getParameter("approval");
			
				String name = firstname+" "+lastname;
				
				String proid = db1.getcourseid(program_name);				
				String sub_proid = db1.getsubcourseid(subprogram_name);				
				String roleid = db.getroleid(rolename);	
				
				if(approval != null && approval.equals("Approved")){					
				
				log.info("from approved status");
				
				String s=db.addstudentdetails(user_id,firstname,lastname,gender,e_mail,dob,mobileno,fathername,mothername,
						address1,address2,city,state,country,pincode,category,proid,sub_proid,sslc_schoolname,
						sslc_mark,sslc_yop,hsc_schoolname,hsc_mark,hsc_yop,collegename,percentage,yop,university,roleid,rolename,batch);
				
				String status=db.updateenroll(roleid,approval,user_id);
				db.updateapprove(approval,user_id);
				//db.updatepaymentapprove(user_id);
				//mail(user_id);
				request.setAttribute("s", s);
				request.setAttribute("status", "has been Approved Successfully");
				request.setAttribute("name", name);
				
				}
				else if(approval != null && approval.equals("Pending")){
					
					log.info("from pending status "+approval);
					
					String status=db.updateenroll(roleid,approval,user_id);
					db.updateapprove(approval,user_id);
					
					request.setAttribute("status", "has not yet Approved");
					request.setAttribute("name", name);
					
				}else{
					
					String status=db.updateenroll(roleid,approval,user_id);
					db.updateapprove(approval,user_id);
					
					request.setAttribute("status", "has been Rejected");
					request.setAttribute("name", name);
					log.info("from rejected status "+approval);
					
				}
				
				return new ModelAndView("approvenrollsuccess");
			}
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("approvpayment")){
	
	user_id = request.getParameter("user_id");
	String approval = request.getParameter("approval");
	String status = db5.updatepaymentapprove(user_id,approval);
	
	request.setAttribute("approvePaymentStatus", status);
	
	return new ModelAndView("studentPaymentSuccess");
}
	     
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("category")){
	String status=null;
	if(create!=null && create.equalsIgnoreCase("create")){
		String course_id=null;
				 course_name=request.getParameter("coursename");
				 course_id=db1.getcourseid(course_name);
				if(course_id !=null){			
					 status="Already created";
				}else{
					 status=db.addcourse(course_name);
				}
				  
					ArrayList list=db1.getcourse();
					request.setAttribute("courselist", list);
					request.setAttribute("status", status);
				return new ModelAndView("createcourse");
	}
	
	else if(delete!=null && delete.equalsIgnoreCase("delete")){
		
		 course_name=request.getParameter("coursename");
		 status=db.deletecourse(course_name);
		ArrayList list=db1.getcourse();
		request.setAttribute("courselist", list);
		request.setAttribute("status", status);
		return new ModelAndView("createcourse");
}
	
	else if(Update!=null && Update.equalsIgnoreCase("Update")){
		String courseid=request.getParameter("courseid");
		 course_name=request.getParameter("coursename");
		 
		 status=db.updatecategory(courseid,course_name);
		ArrayList list=db1.getcourse();
		request.setAttribute("courselist", list);
		request.setAttribute("status", status);
		return new ModelAndView("createcourse");
}
			}
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("role")){
	String status=null;
	if(create!=null && create.equalsIgnoreCase("create")){
		String categoryid=null;
				 role_name=request.getParameter("rolename");
				String roleid=db.getroleid(role_name);
				if(roleid !=null){
					status="Already created";
				}else{
					status=db.addrole(role_name);
				}
					
					ArrayList rolelist=db1.getrole();
					request.setAttribute("rolelist", rolelist);
					request.setAttribute("status", status);
				return new ModelAndView("createrole");
	}
	
	else if(delete!=null && delete.equalsIgnoreCase("delete")){
		
		role_name=request.getParameter("rolename");
		db.deleterole(role_name);
		ArrayList rolelist=db1.getrole();
		request.setAttribute("rolelist", rolelist);
		request.setAttribute("status", status);
		return new ModelAndView("createrole");
}
	
else if(Update!=null && Update.equalsIgnoreCase("Update")){
	String roleid=request.getParameter("roleid");
		role_name=request.getParameter("rolename");
		 status=db.updaterole(roleid,role_name);
		 db.updateroleinuserdetails(roleid,role_name);
		ArrayList rolelist=db1.getrole();
		request.setAttribute("rolelist", rolelist);
		request.setAttribute("status", status);
		return new ModelAndView("createrole");
}
			}
	     

	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("course")){
	String status=null;
	if(create!=null && create.equalsIgnoreCase("create")){
		String courseid=null;
		String couName=request.getParameter("couName");		 
		course_name=request.getParameter("coursename");
			String course_id=db1.getcourseid(couName);
				try {
						//categoryid = db3.getcategoryid(couName);
					} catch (Exception e) {
										e.printStackTrace();
					}
				// moodle 	
				//db2.addcourse(course_name,categoryid);
				courseid=db1.getsubcourseid(course_name);
				if(courseid !=null){
					status="Already created";
				}else{
					status=db1.addsubcourse(course_id,course_name);
				}
					
					
					ArrayList list=db1.getcourse();
					ArrayList courselist=db1.getsubcourse();
					request.setAttribute("courselist", courselist);
					request.setAttribute("list", list);
					request.setAttribute("status", status);
				return new ModelAndView("createsubcourse");
}
	
	else if(delete!=null && delete.equalsIgnoreCase("delete")){
		
		 course_name=request.getParameter("coursename");
		db.deletesubcourse(course_name);
		ArrayList list=db1.getcourse();
		ArrayList courselist=db1.getsubcourse();
		request.setAttribute("courselist", courselist);
		request.setAttribute("list", list);
		return new ModelAndView("createsubcourse");
}
	
	else if(Update!=null && Update.equalsIgnoreCase("Update")){
		String subcourseid=request.getParameter("courseid");
		 course_name=request.getParameter("coursename");
		status=db.updatesubcourse(subcourseid,course_name);
		
		if(status != null){
			ArrayList list=db1.getcourse();
			ArrayList courselist=db1.getsubcourse();
			
			request.setAttribute("courseid", subcourseid);
			request.setAttribute("coursename", course_name);
			request.setAttribute("courselist", courselist);
			request.setAttribute("list", list);
			request.setAttribute("status", status);
		}		
		return new ModelAndView("createsubcourse");
}
			}
else if(pro!=null && pro.equalsIgnoreCase("initshowcourselist")){
	String categoryid = request.getParameter("categoryid");
	
	ArrayList colist=db1.getsubcourse(categoryid);
	  course_name = request.getParameter("course_name");
	 request.setAttribute("course_name", course_name);
	 request.setAttribute("colist", colist);
	
		return new ModelAndView("showcourselist");	
	}
else if(pro!=null && pro.equalsIgnoreCase("initshowwork")){
	  course_name = request.getParameter("course_name");	
		String course_id=db1.getsubcourseid(course_name);	
	 request.setAttribute("course_name", course_name);
	 ArrayList assign_name=db5.getassignname(course_id);
	 
	 request.setAttribute("assign_name", assign_name);
	 ArrayList quiz_name=db5.getquizname(course_id);
	 request.setAttribute("quiz_name", quiz_name);
	 
	 ArrayList coursematerial=db5.getcoursematerial(course_id);
	 request.setAttribute("coursematerial", coursematerial);
	 
		return new ModelAndView("traishowwork");
	}
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("ForgetProcess")){
	String usernamee = request.getParameter("username");
	//String userid=db1.getuserid(username);		
	//mail(userid);
	
	log.info("usernamee "+usernamee);
	
	String username = null;
	String password = null;
	 String e_mail = null;
	ArrayList userlist=db1.getuserslist(usernamee);
	if(userlist != null){
	Iterator itr = userlist.iterator();
	if(itr.hasNext()){
	 String sr[] = (String[]) itr.next();
	
	 username = sr[0];
	 password = sr[1];	
	 e_mail = sr[2]; 	
	}
	}
	request.setAttribute("username", username);
	request.setAttribute("password", password);
	request.setAttribute("e_mail", e_mail);	
	return new ModelAndView("forgotpassuccess");
}
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("Entity")){
	String rolename = request.getParameter("rolename");
	String roleid=db.getroleid(rolename);
	String entityname = request.getParameter("entityname");
	String status=db.addentity(roleid,entityname);
	return new ModelAndView("createentity");	
}
	     
	     
			else if(pro!=null && pro.equalsIgnoreCase("initcreate")){
				ArrayList rolelist=db1.getrole();
				ArrayList list=db1.getcourse();
				ArrayList sublist=db1.getsubcourse();
				request.setAttribute("rolelist", rolelist);
				request.setAttribute("list", list);
				request.setAttribute("sublist", sublist);
				return new ModelAndView("insert");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initcreaterole")){
				ArrayList rolelist=db1.getrole();
				request.setAttribute("rolelist", rolelist);
				return new ModelAndView("createrole");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initpermission")){
				ArrayList rolelist=db1.getrole();
				ArrayList enlist=db1.getentity();
				request.setAttribute("rolelist", rolelist);
				request.setAttribute("enlist", enlist);
				return new ModelAndView("frmCreatePermission");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initcheckusername")){
				String user_name = request.getParameter("username");				
				String user=db.checkusername(user_name);
				request.setAttribute("userstatus", user);
				
				return new ModelAndView("insert");	
			}
	     
			else if(pro!=null && pro.equalsIgnoreCase("initcreatecourse")){
				ArrayList list=db1.getcourse();
				ArrayList courselist=db1.getsubcourse();
				request.setAttribute("list", list);
				request.setAttribute("courselist", courselist);
				
				return new ModelAndView("createsubcourse");										
				
			}
			else if(pro!=null && pro.equalsIgnoreCase("subcourselist")){
							
				ArrayList list=db1.getcourse();
				String coursename=request.getParameter("subcoursenamee");
				//String course=request.getParameter("course");
							
					String course_id=db1.getcourseid(coursename);			
					ArrayList subcourselist=db1.getsubcourse(course_id);
					//request.setAttribute("coursename",coursename);								
					request.setAttribute("list", list);
					request.setAttribute("subcourselist", subcourselist);	
					request.setAttribute("coursenamee", coursename);
									
				return new ModelAndView("createsubcourse");	
			}
	     
	     
			else if(pro!=null && pro.equalsIgnoreCase("initcreatecategory")){
				ArrayList list=db1.getcourse();
				request.setAttribute("courselist", list);
				return new ModelAndView("createcourse");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initenroll")){
				//ArrayList elist=db1.giveapproval();
				
				//request.setAttribute("elist", elist);
				
				return new ModelAndView("enroll");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initcourselist")){
				ArrayList courselist=db1.getcourse();
				 String course_id = null;
				ArrayList list=db1.getcourselist(course_id);
				 session.setAttribute("list",list);
				 request.setAttribute("list", list);
				request.setAttribute("courselist", courselist);
				return new ModelAndView("courselist");	
			}
	     
			else if(pro!=null && pro.equalsIgnoreCase("initforgetpassword")){
				
				
				return new ModelAndView("forgetpassword");	
			}
else if(pro!=null && pro.equalsIgnoreCase("initmycourse")){
	
	 // String sem=db.getsemester(); 	
	 		return new ModelAndView("student");	
			}
	     

			else if(pro!=null && pro.equalsIgnoreCase("initsubcourselist")){
				String course_id=request.getParameter("course_id");
				ArrayList subcourselist=db1.getsubcourse(course_id);
				request.setAttribute("subcourselist", subcourselist);
				return new ModelAndView("subcourselist");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initApprovEnroll")){
				
				String userid=request.getParameter("user_id");
				
				ArrayList selflist=db1.getlistforselfenroll(userid);
				ArrayList flist=db5.getdocumentlist(userid);
				ArrayList rolist=db1.getrole();
				ArrayList batchlist=db1.getbatch();
				
				request.setAttribute("selflist", selflist);
				request.setAttribute("flist", flist);
				request.setAttribute("rolist", rolist);
				request.setAttribute("batchlist", batchlist);
				request.setAttribute("userid", userid);
				
				
				int  Currentage=0;
				int stustd=0;
				String dob = "";
				 String std = "";
				 String category = "";
				if(selflist!=null && selflist.size()!=0){
					Iterator itr4 = selflist.iterator();
					if(itr4.hasNext()){
					 String sr3[] = (String[]) itr4.next();
					  dob = sr3[6];
					  category = sr3[16];
					  std = sr3[27];
					 request.setAttribute("dob", dob);
					 request.setAttribute("category", category);
					 request.setAttribute("std", std);					 
					}
				}
					 if(category.equals("UG")){
				String age = common.getage(dob);
				int CA = Integer.parseInt(age);
				//stustd=Integer.parseInt(std);
				int a=365;
				  Currentage=CA/a;
				//String StudentAge=String.valueOf(Currentage);}
									
				//String map_id=db1.getqualmapid();
				ArrayList ugqualificationdetails=db1.getugqualificationdetails();
				if(ugqualificationdetails!=null && ugqualificationdetails.size()!=0){
					Iterator itrs = ugqualificationdetails.iterator();
					if(itrs.hasNext()){
					 String sr[] = (String[]) itrs.next();
					 String mapid = sr[0];
					 String minAge = sr[1];
					 String Standard = sr[2]; 
					 String document=sr[3];
					 request.setAttribute("mapid", mapid);
					 request.setAttribute("minAge", minAge);
					 request.setAttribute("Standard", Standard);
					 request.setAttribute("document", document);
					 					 
					 int minage=Integer.parseInt(minAge);
					//int standard=Integer.parseInt(Standard);
					// int doc=Integer.parseInt(document);
					 String StuStatus=null;
				if(Currentage >= minage){
					StuStatus="Eligible Student";					
				}
				else 
				{
					StuStatus="NOT Eligible Student";					
				}
				request.setAttribute("StuStatus", StuStatus);
				String StuStatus1=null;
					
					if (Standard.equals("10") || Standard.equals("12")){
						 StuStatus1="Eligible Student";						 
					 }
					 else{
						 StuStatus1="Not Eligible Student";						
					 }
					 request.setAttribute("StuStatus1", StuStatus1);					 						
							 String StuStatus2=null;
							 if (flist!=null){								 
								 StuStatus2="Eligible Student";								 
							 }
							 else {
								 StuStatus2="Not Eligible Student";								
							 }
							 request.setAttribute("StuStatus2", StuStatus2);			
				}
			}
				}
				else{			
				
				ArrayList pgqualificationdetails=db1.getpgqualificationdetails();
				if(pgqualificationdetails!=null && pgqualificationdetails.size()!=0){
					Iterator itrs = pgqualificationdetails.iterator();
					if(itrs.hasNext()){
					 String sr[] = (String[]) itrs.next();
					
					 
					 String Standard = sr[0]; 
					 String document=sr[1];
					// request.setAttribute("mapid", mapid);


					 request.setAttribute("Standard", Standard);
					 request.setAttribute("document", document);
					 					 
					// int minage=Integer.parseInt(minAge);
					//int standard=Integer.parseInt(Standard);
					 //int CA=Integer.parseInt(age);


				String StuStatus3=null;
					
					if (std.equals("UG")){
						StuStatus3="Eligible Student";						
					 }
					 else{
						 StuStatus3="Not Eligible Student";						
					 }
					 request.setAttribute("StuStatus3", StuStatus3);
					 
						if(flist!=null && flist.size()!=0){
							Iterator itr2 = flist.iterator();
							if(itr2.hasNext()){
							 String sr2[] = (String[]) itr2.next();
							 String doc = sr2[0];
							 //String minAge = sr1[1];
							 request.setAttribute("doc", doc);
							 String StuStatus4=null;
							 if (doc!=null){								 
								 StuStatus4="Eligible Student";								 
							 }
							 else{
								 StuStatus4="Not Eligible Student";								
							 }
							 request.setAttribute("StuStatus4", StuStatus4);
							}				
						}
					}
				}
			}
				return new ModelAndView("approvenroll");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initpgmentorApprovEnroll")){
				String userid=request.getParameter("user_id");
				ArrayList list=db1.getcourse();
				ArrayList courselist=db1.getsubcourse();
				request.setAttribute("list", list);
				request.setAttribute("courselist", courselist);
				request.setAttribute("userid", userid);
				return new ModelAndView("programmentorenroll");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initupdateApprovEnroll")){
				String username=request.getParameter("username");
				user_id=db1.getuserid(username);
				ArrayList enlist=db1.getenrolllistforupload(user_id);
				if(enlist!=null && enlist.size()!=0){
					Iterator itrs = enlist.iterator();
					if(itrs.hasNext()){
					 String sr[] = (String[]) itrs.next();
					 String rolename = sr[0];
					 String category = sr[1];
					 String subcourse = sr[2]; 
					 String startdate = sr[3]; 
					 String enddate = sr[4]; 
					 request.setAttribute("rolename", rolename);
					 request.setAttribute("category", category);
					 request.setAttribute("subcourse", subcourse);
					 request.setAttribute("startdate", startdate);
					 request.setAttribute("enddate", enddate);
					}
				}
				ArrayList list=db1.getcourse();
				ArrayList sublist=db1.getsubcourse();
				request.setAttribute("courselist", list);
				request.setAttribute("sublist", sublist);	 
				request.setAttribute("username", username);
				request.setAttribute("enlist", enlist);
				return new ModelAndView("updateenroll");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("initlogout")){
				
				user_id = (String)session.getAttribute("user_id");
				
				/*if(user_id == null){
					String userid = request.getParameter("user_id");
					log.info("userid "+userid);
				}*/
				
				log.info("user id out "+user_id);
      			
				if(user_id != null){
					
					log.info("user id "+user_id);
										
						Date date = new Date();
						SimpleDateFormat formatter=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");					
						String logout=formatter.format(date);
												
						String status = db7.setlogouttime(logout,user_id);
						
						ArrayList logtimelist = null;
						String logintime = null;
						String logouttime = null;
						String required = null;
						String userlogid = null;
						
						if(status != null){ 
							logtimelist = db7.getlogtimelist(user_id);
							
							log.info("status is not null ");
							
							if(logtimelist != null){
								Iterator itr = logtimelist.iterator();
								while(itr.hasNext()){
									String strarr[] = (String[])itr.next();
									userlogid = strarr[0];
									logintime = strarr[1];
									logouttime = strarr[2];
									required = strarr[3];
								}
							}
						
					
					String outputtime = null;
					int workingint = 0;
					int outtime = 0;
					int difftime = 0;	
					
						try {
							Date datelogin = formatter.parse(logintime);
							Date datelogout = formatter.parse(logouttime);
							long diff = datelogout.getTime() - datelogin.getTime();														
							//long diffSeconds = diff / 1000 % 60;
					        //long diffMinutes = diff / (60 * 1000) % 60;
					        long diffHours = diff / (60 * 60 * 1000);					        					        
	   // int diffInDays = (int) ((datelogin.getTime() - datelogout.getTime()) / (1000 * 60 * 60 * 24));					    					        
					        outputtime = String.valueOf(diffHours);		        
					        							
							if(outputtime != null){
								workingint = Integer.parseInt(required);
								outtime = Integer.parseInt(outputtime);
								if(workingint < outtime){
									difftime = outtime - workingint;									
								}
								else if(workingint < outtime){
									difftime = workingint - outtime;									
								}
							}						        
						} catch (ParseException e) {
							e.printStackTrace();
						}								
							
				int prorate = 100/workingint*difftime;											
				String proratestr = Integer.toString(prorate);
				String workinghours = Integer.toString(difftime);						
			
				String statusprorate = db7.setprorate(proratestr,userlogid,workinghours);	
			
			log.info("statusprorate "+statusprorate);
			log.info("proratestr "+proratestr+" userlogid "+userlogid+" workinghours "+workinghours);
			
						}
				}
																									
				 	session.removeAttribute("firstname");
		            session.removeAttribute("lastname");
		            session.removeAttribute("e_mail");
		            session.removeAttribute("role_nam");
		            session.removeAttribute("sessionId");
		            session.removeAttribute("user_id");
		            session.removeAttribute("course_name");
		            session.invalidate();
		                 
		           /*String onProcess = request.getParameter("onProcess");       
		                 
		                  request.setAttribute("statusforLogin", onProcess);
		                  
		                  log.info("session after closing "+session);*/
		                  
		           
				return new ModelAndView("logout");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("Logout")){
				
				/*String statusforLogin = request.getParameter("statusforLogin"); 
				
				log.info("statusforLogin after closing "+statusforLogin);
				
				if(statusforLogin == null){
				request.setAttribute("status", "Please Login");
				log.info("statusforLogin "+statusforLogin);
				}*/
				
				user_id = (String)session.getAttribute("user_id");
				
				/*if(user_id == null){
					
					log.info("user id "+user_id);
										
						Date date = new Date();
						SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");					
						String logout = formatter.format(date);
												
						String status = db7.setlogouttime(logout,user_id);
						
						ArrayList logtimelist = null;
						String logintime = null;
						String logouttime = null;
						String required = null;
						String userlogid = null;
						
						if(status != null){ 
							logtimelist = db7.getlogtimelist(user_id);
							
							log.info("status is not null ");
							
							if(logtimelist != null){
								Iterator itr = logtimelist.iterator();
								while(itr.hasNext()){
									String strarr[] = (String[])itr.next();
									userlogid = strarr[0];
									logintime = strarr[1];
									logouttime = strarr[2];
									required = strarr[3];
								}
							}
						
					
					String outputtime = null;
					int workingint = 0;
					int outtime = 0;
					int difftime = 0;	
					
						try {
							Date datelogin = formatter.parse(logintime);
							Date datelogout = formatter.parse(logouttime);
							long diff = datelogout.getTime() - datelogin.getTime();														
							//long diffSeconds = diff / 1000 % 60;
					        //long diffMinutes = diff / (60 * 1000) % 60;
					        long diffHours = diff / (60 * 60 * 1000);					        					        
	   // int diffInDays = (int) ((datelogin.getTime() - datelogout.getTime()) / (1000 * 60 * 60 * 24));					    					        
					        outputtime = String.valueOf(diffHours);		        
					        							
							if(outputtime != null){
								workingint = Integer.parseInt(required);
								outtime = Integer.parseInt(outputtime);
								if(workingint < outtime){
									difftime = outtime - workingint;									
								}
								else if(workingint < outtime){
									difftime = workingint - outtime;									
								}
							}						        
						} catch (ParseException e) {
							e.printStackTrace();
						}								
							
				int prorate = 100/workingint*difftime;											
				String proratestr = Integer.toString(prorate);
				String workinghours = Integer.toString(difftime);						
			
				String statusprorate = db7.setprorate(proratestr,userlogid,workinghours);	
			
			log.info("statusprorate "+statusprorate);
			log.info("proratestr "+proratestr+" userlogid "+userlogid+" workinghours "+workinghours);
			
						}									
				}*/
								
				return new ModelAndView("SLHome");
			}
			else if(pro!=null && pro.equalsIgnoreCase("initshowcourselist")){
				
				return new ModelAndView("showcourselist");	
			}
			else if(pro!=null && pro.equalsIgnoreCase("inituserlist")){
			    String emp_id=null;
			    //ArrayList userlist=db1.getuserlist();
			    ArrayList emplist=db1.getemplist();
			    //request.setAttribute("userlist", userlist);
			    request.setAttribute("emplist", emplist);
			    return new ModelAndView("EmpList"); 
			   }
			else if(pro!=null && pro.equalsIgnoreCase("initdeleteuser")){
				 user_id=request.getParameter("user_id");
				String username=db1.getusername(user_id);
				db1.deleteuser(user_id);
				try {
					//String userid=db3.getuserid(username);
					//db2.deleteuser(userid);
				} catch (Exception e) {
					
					e.printStackTrace();
				}
				
				ArrayList userlist=db1.getuserlist();
				request.setAttribute("userlist", userlist);
				return new ModelAndView("userlist");	
			}
	     
			else if(pro!=null && pro.equalsIgnoreCase("initlogin")){
				
				return new ModelAndView("login");	
			}
	else if(pro!=null && pro.equalsIgnoreCase("initdashboard")){
				
				return new ModelAndView("Login-new");	
				
			}
	
	else if(pro!=null && pro.equalsIgnoreCase("initcalendar")){
		
		return new ModelAndView("Calender");	
		
	}
	else if(pro!=null && pro.equalsIgnoreCase("initmainindex")){
		
		String course_name1=(String)session.getAttribute("course_name");
		ArrayList categorylist=(ArrayList) session.getAttribute("categorylist");
		ArrayList courselist=(ArrayList) session.getAttribute("courselist");
		ArrayList s=(ArrayList) session.getAttribute("s");
		String user_id1=(String)session.getAttribute("user_id");
		String role_nam1=(String)session.getAttribute("role_nam");
		ArrayList userlist=(ArrayList) session.getAttribute("userlist");
		
		session.setAttribute("userlist", userlist);
		 session.setAttribute("categorylist", categorylist);
		 session.setAttribute("courselist", courselist);
		 session.setAttribute("course_name", course_name1);
		 session.setAttribute("role_name", role_nam1);
		 session.setAttribute("user_id", user_id1);
		 session.setAttribute("s", s);
	     
	    return new ModelAndView("dashboard"); 
	   }
	     
	     
	     
/**************	     //-- Drupal Section Starts Here***************************************************************/
	else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("drupalForgetProcess")){
		  String username = request.getParameter("username");
		  String userid=db1.getuserid(username);
		  common.mail(userid);
		  return new ModelAndView("drupalEmailSent");
		 }  
		 else if(pro!=null && pro.equalsIgnoreCase("initnewforgetpassword")){
		     
		     return new ModelAndView("drupalForgetPassword"); 
		    }
		    
		  else if(pro!=null && pro.equalsIgnoreCase("initdashboard")){
		     
		     return new ModelAndView("Login-new"); 
		     
		    }
		       
		  else if(pro!=null && pro.equalsIgnoreCase("initCrsMat")){
			     user_id=(String)session.getAttribute("user_id");
			     ArrayList stucourselist=db5.getstudentcourse(user_id);
			     session.setAttribute("stucourselist", stucourselist);
			     String url_link="http://localhost:8085/index1.html";
			     request.setAttribute("url_link", url_link);
			        return new ModelAndView("studyarea"); 
			       }
		  else if(pro!=null && pro.equalsIgnoreCase("initmarketing")){
		         
		        return new ModelAndView("Marketing study area"); 
		       }
		    else if(pro!=null && pro.equalsIgnoreCase("inittamil")){
		         
		        return new ModelAndView("Tamil"); 
		       }
		    else if(pro!=null && pro.equalsIgnoreCase("initww")){
		         
		        return new ModelAndView("World War"); 
		       }
		    else if(pro!=null && pro.equalsIgnoreCase("initlin")){
		         
		        return new ModelAndView("Linguistics"); 
		       }
		    else if(pro!=null && pro.equalsIgnoreCase("initqur")){
		         
		        return new ModelAndView("Quadratics"); 
		       }
		   
		 else if(pro!=null && pro.equalsIgnoreCase("initHurricanes")){
		           
		          return new ModelAndView("Hurricanes"); 
		         }
		 else if(pro!=null && pro.equalsIgnoreCase("initpayment")){
	           
	          return new ModelAndView("payment"); 
	         }
		  else if(pro!=null && pro.equalsIgnoreCase("initlogoutnew")){
		   session.removeAttribute("firstname");
		   session.removeAttribute("lastname");
		   session.removeAttribute("course");
		   session.removeAttribute("role_name");
		    session.invalidate();
		      return new ModelAndView("Login-new"); 
		     }
		  else if(pro!=null && pro.equalsIgnoreCase("initindex")){
			  
			  String entityid = request.getParameter("entityid");
			  user_id=(String)session.getAttribute("user_id");
			  role_id=(String)session.getAttribute("role_id");
			  
			  ArrayList privlist=db1.getprivilegelist(role_id,entityid);
			  ArrayList permlist=db1.getpermissionlist(role_id,entityid);
			 
			  ArrayList ugprogramlist=db1.getugprogramlist();
			  ArrayList pgprogramlist=db1.getpgprogramlist(); 
			  
			  session.setAttribute("privlist", privlist);
			  session.setAttribute("permlist", permlist);

			  request.setAttribute("ugprogramlist", ugprogramlist);
			  session.setAttribute("ugprogramlist", ugprogramlist);
			  request.setAttribute("pgprogramlist", pgprogramlist);

			  
			  String subproid=db5.getsubprogramid(user_id);
			  String proid=db5.getprogramid(user_id);
			  String roleid1=db5.getroleidforstudent(user_id);			  
			  String program_id=db5.getprogramidforpgmentor(user_id);
			 String cuserid=db5.getuseridforcmentor(user_id);
			  if(role_id == null){
				 
				  ArrayList userlist=db1.getuserlist(user_id);  
				  request.setAttribute("userlist", userlist);
			  }else if(roleid1 != null){
				  ArrayList sclist=db.getenrolledcourse(user_id);
				  String colist=db5.getprogramforstudent(user_id);
				  String subcolist=db5.getsubprogramforstudent(user_id);
				  ArrayList stucourselist=db5.getstudentcourse(user_id);
					 request.setAttribute("stucourselist", stucourselist);
				  request.setAttribute("sclist", sclist);
				  request.setAttribute("colist", colist);
				  request.setAttribute("subcolist", subcolist);
				  session.setAttribute("prog", colist);
				  session.setAttribute("subprog", subcolist);
			  }else if(program_id != null && cuserid == null){
				 ArrayList polist=db.getprogramnamebyuserid(user_id);  
				 ArrayList cmlist=db5.getCourseMent(proid,subproid,user_id);
				 request.setAttribute("polist", polist);
				 request.setAttribute("cmlist", cmlist);
			  } if(cuserid != null && program_id != null){
				  
				ArrayList cmcourselist=db.getcourseforcoursementor(user_id);
				 request.setAttribute("cmcourselist", cmcourselist); 
				 
			  }else if(program_id == null && roleid1==null){
				  
				 ArrayList allprogramlist=db1.getcourse(); 
				 ArrayList subcourselist=db1.getsubcourse();
				 request.setAttribute("allprogramlist", allprogramlist);
				 request.setAttribute("subcourselist", subcourselist);
			  }
			String astatus=db5.getapprovestatus(user_id);
			String pstatus=db5.getpaymentstatus(user_id);
			String emp_id = db5.getempid(user_id);
			
			String enroll = request.getParameter("enroll");
			
			request.setAttribute("emp_id", emp_id);
			request.setAttribute("astatus", astatus);
			request.setAttribute("pstatus", pstatus);
			request.setAttribute("enroll", enroll);
			
		      return new ModelAndView("index"); 
		     }
	     
		  else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("payment")){
			  
			  user_id=(String)session.getAttribute("user_id");
			  SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");    
			  
			  String paymenttype=request.getParameter("paytype");   
			  String ddno=request.getParameter("ddno");
			  String dddate=request.getParameter("dd_date");
			  String nobank=request.getParameter("nobank");
			  String nobranch=request.getParameter("nobranch");
			  String amount=request.getParameter("amount");
			 
			  String status=null;
			  Date dd_date=null;
			    
			     if (dddate != null && dddate.trim().length() != 0) {
					 try {
						  dd_date = (Date) sdf.parse(dddate);
						 status=db1.paymentdetails(user_id,paymenttype,ddno,dd_date,nobank,nobranch,amount);
											
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
	               }			     
			     db.updatepaymentapprove(user_id);
			     request.setAttribute("status", status); 
			    
			     return new ModelAndView("paymentsuccess"); 
			    }
		  else if(pro!=null && pro.equalsIgnoreCase("assigncousuccess")){
			  
			    user_id = request.getParameter("user_id");
			    String progId = request.getParameter("prog");
			  
			    ArrayList coursecode=db1.getcoursecodeandcoursename();			    
			 	ArrayList subProgList=db1.getsubcourse(progId);
			 	ArrayList progList=db1.getcourse();
			 				 	
			 	request.setAttribute("progList", progList);
			 	request.setAttribute("progId", progId);	
			 	request.setAttribute("subProgList", subProgList);	
			      
				ArrayList cmList=db4.getcoursementorcourselist(user_id);
			    
				request.setAttribute("coursecode", coursecode);
			    request.setAttribute("cmList", cmList);
			    request.setAttribute("user_id", user_id);
			    request.setAttribute("assigncousuccess", null);
			  
			  return new ModelAndView("Assigncourse"); 
		  }
		  else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("AssignCourse")){
			  user_id = request.getParameter("user_id");
			     
			  String fromCourseMentor = request.getParameter("fromCourseMentor");
			  
			  	 String progId = request.getParameter("prog");
			     String programname = request.getParameter("selProg");
			     String subprogramname = request.getParameter("selSubProg");
			     String Sem = request.getParameter("Semester");
			     String CourseCode = request.getParameter("courseCode");
			     String[] parts = CourseCode.split("/");
				 String Course_Code = parts[0];
				 String Course_Name = parts[1]; 
				
			     String status=db1.assigncourse(user_id,programname,subprogramname,Sem,Course_Code,Course_Name);
			    
			    /* ArrayList subProgList = db1.getsubcourse(progId);
				 ArrayList progList = db1.getcourse();
			     ArrayList cmList=db4.getcoursementorcourselist(user_id);*/
			     
			    /* request.setAttribute("subProgList", subProgList);
			     request.setAttribute("progList", progList);
			     request.setAttribute("cmList", cmList);*/
			     request.setAttribute("status", status);
			     request.setAttribute("progId", progId);
			     request.setAttribute("user_id", user_id);
			     request.setAttribute("assigncousuccess", "assigncousuccess");
			     
			     request.setAttribute("fromCourseMentor", fromCourseMentor);
			     
			     return new ModelAndView("Assigncourse"); 
			    }
			    else if(pro!=null && pro.equalsIgnoreCase("initassigncourse")){
			    	  user_id=(String)session.getAttribute("user_id");
			    	  String subproid=db5.getsubprogramid(user_id);
					  String proid=db5.getprogramid(user_id);
			    	
			    	ArrayList coursementorlist=db1.getcoursementorlist(proid,subproid,user_id);
			    	 request.setAttribute("coursementorlist", coursementorlist);
			   
			     return new ModelAndView("coursementorenrolist"); 
			    }
			
	     
		 else if(pro!=null && pro.equalsIgnoreCase("initnewdrupal")){
		   user_id=(String)session.getAttribute("user_id");
		   ArrayList userlist=db.getuserlist(user_id);
		    request.setAttribute("userlist", userlist);
		      return new ModelAndView("News-drupal"); 
		     }
		  else if(pro!=null && pro.equalsIgnoreCase("initmyCourse")){
		    ArrayList courselist=db1.getsubcourse();
		    user_id=(String)session.getAttribute("user_id");
		    ArrayList userlist=db.getuserlist(user_id);
		    request.setAttribute("courselist", courselist); 
		     request.setAttribute("userlist", userlist); 
		       return new ModelAndView("myCourse-new"); 
		      }
		   else if(pro!=null && pro.equalsIgnoreCase("initmyDegree")){
		    
		     user_id=(String)session.getAttribute("user_id");
		    ArrayList userlist=db.getuserlist(user_id);
		     request.setAttribute("userlist", userlist); 
		    return new ModelAndView("myDegree-new"); 
		   }
		   else if(pro!=null && pro.equalsIgnoreCase("initinteraction")){
		    user_id=(String)session.getAttribute("user_id");
		    ArrayList userlist=db.getuserlist(user_id);
		     request.setAttribute("userlist", userlist); 
		    return new ModelAndView("interaction_html5"); 
		   }
		   else if(pro!=null && pro.equalsIgnoreCase("initLibrarynew")){
		    user_id=(String)session.getAttribute("user_id");
		    ArrayList userlist=db.getuserlist(user_id);
		     request.setAttribute("userlist", userlist); 
		    return new ModelAndView("Library-new"); 
		   }
		   else if(pro!=null && pro.equalsIgnoreCase("inithelp")){
		    
		      return new ModelAndView("Help"); 
		     }
	     
		   else if(pro!=null && pro.equalsIgnoreCase("initstudentlist")){
			   user_id=(String)session.getAttribute("user_id");
			   
			   log.info("user id "+user_id);
				 
				  String subproid = db5.getsubprogramid(user_id);
				  String proid = db5.getprogramid(user_id);
				  
				  log.info("subproid "+subproid);
				  log.info("proid "+proid);
				 
			   ArrayList studentlist = db5.getstudentlist(proid,subproid);
			   
			   
			   request.setAttribute("studentlist",studentlist);
			  
			     return new ModelAndView("frmstudentlist"); 
			    }       
		   else if(pro!=null && pro.equalsIgnoreCase("initassignstudentcourse")){
			   
			     user_id = request.getParameter("user_id");
			     String category = request.getParameter("category");
			    
			     String batch = request.getParameter("batch");
			     String semester = db.getsemester(batch); 
			     
			     String pro_id = request.getParameter("pro_id");
			     String subpro_id = request.getParameter("subpro_id");
			     String firstname = request.getParameter("firstname");
			     String lastname = request.getParameter("lastname");
			     
			     //ArrayList student= db1.getcourseforstudent(category,semester,pro_id,subpro_id);			     
			     ArrayList courselist = db1.getcourseforstudent(category, semester, pro_id, subpro_id);
			     ArrayList cmlist = db5.getCourseMent(pro_id,subpro_id,user_id);			     
			     ArrayList corslist = db4.getalreadyassignedcourse(user_id);	
			     
			     request.setAttribute("student",courselist);
			     request.setAttribute("cmlist",cmlist);
			     request.setAttribute("corslist",corslist);
			     request.setAttribute("user_id",user_id);
			     request.setAttribute("firstname",firstname);
			     request.setAttribute("lastname",lastname);	
			     
			     request.setAttribute("category",category);	
			     request.setAttribute("semester",semester);	
			     request.setAttribute("pro_id",pro_id);	
			     request.setAttribute("subpro_id",subpro_id);	
			     
			      return new ModelAndView("stuassigncourse"); 
			     }

		   else if(pro!=null && pro.equalsIgnoreCase("initresourse")){
			   
			      return new ModelAndView("Resources"); 
			     }
		   else if(pro!=null && pro.equalsIgnoreCase("initpmindex")){
			   
			      return new ModelAndView("pm_index"); 
			     }
		   else if(pro!=null && pro.equalsIgnoreCase("initfmindex")){
			   
			      return new ModelAndView("fm_index"); 
			     }
		   else if(pro!=null && pro.equalsIgnoreCase("initlibrary")){
			   
				String extapp=db6.getpath(appName);
				request.setAttribute("extapp",extapp);
				request.setAttribute("appName",appName);				 
			      return new ModelAndView("Library"); 
			     }
		   else if(pro!=null && pro.equalsIgnoreCase("initcheckList")){
		      
		     return new ModelAndView("check List"); 
		    }
		   else if(pro!=null && pro.equalsIgnoreCase("inittroubleTicket")){
			   String name=request.getParameter("name");
			   String subject=request.getParameter("subject");
			   String mobile=request.getParameter("mobile");
			   String email=request.getParameter("email");
			   String description=request.getParameter("description");
			   String category=request.getParameter("category");
			   String priority=request.getParameter("priority");
			   String file=request.getParameter("file");
			   
		     return new ModelAndView("troubleTicket"); 
		    }
		       


else if(pro!=null && pro.equalsIgnoreCase("initselfenrollrequest")){
	ArrayList selfenrolllist=db1.getlistforselfenroll();
	request.setAttribute("selfenrolllist",selfenrolllist);
	return new ModelAndView("selfenrollist");	
}
else if(pro!=null && pro.equalsIgnoreCase("initselfenroll")){
	//String progId=request.getParameter("prog");
	//ArrayList subProgList=db1.getsubcourse(progId);
	//ArrayList progList=db1.getcourse();
	
	//request.setAttribute("progList", progList);
	//request.setAttribute("progId", progId);	
	//request.setAttribute("subProgList", subProgList);	
	ArrayList list=db1.getcourse();
	//ArrayList courselist=db1.getsubcourse();
	request.setAttribute("list", list);
	//request.setAttribute("courselist", courselist);
	return new ModelAndView("enrollrequest");	
}
	     
else if(pro!=null && pro.equalsIgnoreCase("initmyhome")){
	
	
	return new ModelAndView("index");	
}
	     
else if(pro != null && pro.equals("contactUs")){
	   
	   String firstName = request.getParameter("firstName");
	   String emailId = request.getParameter("email");
	   String phone = request.getParameter("phone");
	   String company = request.getParameter("company");
	   String description = request.getParameter("description");
	   
	   log.info("firstName ---> "+firstName+" emailId---> "+emailId+" phone---> "+phone);
	   log.info("company ---> "+company+" description---> "+description);
	 
		String salutation = "";   		
		String last_name = ""; 
		String title = "";
		String department = ""; 
		String phone_home = "";
		String phone_work = ""; 
		String phone_other = "";
		String phone_fax = "";
		String primary_address_street = ""; 
		String primary_address_city = ""; 
		String primary_address_state = "";
		String primary_address_postalcode = ""; 
		String primary_address_country = ""; 
		String alt_address_street = ""; 
		String alt_address_city = ""; 
		String alt_address_state = ""; 
		String alt_address_postalcode = "";
		String alt_address_country = "";
		String assistant = "";
		String assistant_phone = ""; 
		String converted = "";
		String account_name = "smartLehren";
		String contact_id = ""; 
		String account_id = "";
		String opportunity_id = ""; 
		String opportunity_name = ""; 
		String opportunity_amount = "";
		String campaign_id = ""; 
		String birthdate = null; 
		String website = "";
		
		String description_C = "sL-Person";
		
		
		dbcrm.addTargetsToDBCRM(emailId, description_C, salutation, firstName, last_name, title, 
				department, phone_home, phone, phone_work, phone_other, phone_fax, 
				primary_address_street, primary_address_city, primary_address_state, 
				primary_address_postalcode, primary_address_country, alt_address_street, 
				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
				assistant, assistant_phone, birthdate, account_name);
		
		String jjwg_maps_geocode_status_c = "";
		String jjwg_maps_address_c = "";
		String account_description_c = "";
		String website_c = "";
		String lead_source_c = "";
		String company_c = company;
		String employees_c = "";
		String code_c = "";
		String profile_c = "";
		String linkedprofile_c = "";
		String facebook_c = "";
		
		dbcrm.addTargetsCustomToDBCRM(0.0f, 0.0f, jjwg_maps_geocode_status_c, 
				jjwg_maps_address_c, account_description_c, website_c, lead_source_c, company_c, 
				employees_c, code_c, profile_c, linkedprofile_c, facebook_c);
		
		
}
	     
else if(pro!=null && pro.equalsIgnoreCase("demorequest")){
	
	 String firstname = request.getParameter("firstname");
	   String emailid = request.getParameter("emailid");
	   String phone = request.getParameter("phone");
	   
	   log.info("firstname ---> "+firstname+" emailid---> "+emailid+" phone---> "+phone);
     	 
 		String salutation = "";
 		String lastname = ""; 				
 		String title = "";
 		String department = ""; 
 		String phone_home = ""; 	
 		String phone_work = ""; 
 		String phone_other = "";
 		String phone_fax = "";
 		String primary_address_street = ""; 
 		String primary_address_city = ""; 
 		String primary_address_state = "";
 		String primary_address_postalcode = ""; 
 		String primary_address_country = ""; 
 		String alt_address_street = ""; 
 		String alt_address_city = ""; 
 		String alt_address_state = ""; 
 		String alt_address_postalcode = "";
 		String alt_address_country = "";
 		String assistant = "";
 		String assistant_phone = ""; 
 		String converted = "";
 		String account_name = "smartLehren";
 		String contact_id = ""; 
 		String account_id = "";
 		String opportunity_id = ""; 
 		String opportunity_name = ""; 
 		String opportunity_amount = "";
 		String campaign_id = ""; 
 		String birthdate = null; 
 		String website = "";
 		
 		String description_C = "sL-Person";
 		
 		dbcrm.addTargetsToDBCRM(emailid, description_C, salutation, firstname, lastname, title, 
 				department, phone_home, phone, phone_work, phone_other, phone_fax, 
 				primary_address_street, primary_address_city, primary_address_state, 
 				primary_address_postalcode, primary_address_country, alt_address_street, 
 				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
 				assistant, assistant_phone, birthdate, account_name);
 		
 		String jjwg_maps_geocode_status_c = "";
 		String jjwg_maps_address_c = "";
 		String account_description_c = "";
 		String website_c = "";
 		String lead_source_c = "";
 		String company_c = "";
 		String employees_c = "";
 		String code_c = "";
 		String profile_c = "";
 		String linkedprofile_c = "";
 		String facebook_c = "";
 		
 		dbcrm.addTargetsCustomToDBCRM(0.0f, 0.0f, jjwg_maps_geocode_status_c, 
 				jjwg_maps_address_c, account_description_c, website_c, lead_source_c, company_c, 
 				employees_c, code_c, profile_c, linkedprofile_c, facebook_c);
	   
	   request.setAttribute("firstname",firstname);
	   request.setAttribute("emailid",emailid);
	   request.setAttribute("phone",phone);
	   
	return new ModelAndView("frmDemoRequest");	
}
else if(pro!=null && pro.equalsIgnoreCase("contactSales")){
	
	 String firstname = request.getParameter("firstname");
	 String lastname = request.getParameter("lastname");
	   String emailid = request.getParameter("emailid");
	   String query = request.getParameter("query");
	   
	   
	   log.info("firstname --> "+firstname+" lastname --> "+lastname+" emailid --> "+emailid+" query --> "+query);
	        	 
  		String salutation = "";
  		String title = "";
  		String department = ""; 
  		String phone_home = "";
  		String phone = "";
  		String phone_work = ""; 
  		String phone_other = "";
  		String phone_fax = "";
  		String primary_address_street = ""; 
  		String primary_address_city = ""; 
  		String primary_address_state = "";
  		String primary_address_postalcode = ""; 
  		String primary_address_country = ""; 
  		String alt_address_street = ""; 
  		String alt_address_city = ""; 
  		String alt_address_state = ""; 
  		String alt_address_postalcode = "";
  		String alt_address_country = "";
  		String assistant = "";
  		String assistant_phone = ""; 
  		String converted = "";
  		String account_name = "smartLehren";
  		String contact_id = ""; 
  		String account_id = "";
  		String opportunity_id = ""; 
  		String opportunity_name = ""; 
  		String opportunity_amount = "";
  		String campaign_id = ""; 
  		String birthdate = null; 
  		String website = "";
  		
  		String description_C = "sL-Person";
  		
  		
  		dbcrm.addTargetsToDBCRM(emailid, description_C, salutation, firstname, lastname, title, 
  				department, phone_home, phone, phone_work, phone_other, phone_fax, 
  				primary_address_street, primary_address_city, primary_address_state, 
  				primary_address_postalcode, primary_address_country, alt_address_street, 
  				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
  				assistant, assistant_phone, birthdate, account_name);
  		
  		String jjwg_maps_geocode_status_c = "";
  		String jjwg_maps_address_c = "";
  		String account_description_c = "";
  		String website_c = "";
  		String lead_source_c = "";
  		String company_c = "";
  		String employees_c = "";
  		String code_c = "";
  		String profile_c = "";
  		String linkedprofile_c = "";
  		String facebook_c = "";
  		
  		dbcrm.addTargetsCustomToDBCRM(0.0f, 0.0f, jjwg_maps_geocode_status_c, 
  				jjwg_maps_address_c, account_description_c, website_c, lead_source_c, company_c, 
  				employees_c, code_c, profile_c, linkedprofile_c, facebook_c);
  		

 	   request.setAttribute("fname", firstname);
 	   request.setAttribute("lname", lastname);
 	   request.setAttribute("emailId", emailid);
 	   request.setAttribute("query", query);
	   
	   
	return new ModelAndView("frmContactSales");	
}
else if(pro != null && pro.equals("lavlitaChatCRM")){
	   
	   String fname = request.getParameter("fname");
	   String lname = request.getParameter("lname");
	   String emailId = request.getParameter("email");
	  
	   log.info("fname ---> "+fname+" lname---> "+lname+" emailId---> "+emailId);
	       	 
		String salutation = "";
		String title = "";
		String department = ""; 
		String phone_home = "";
		String phone = "";
		String phone_work = ""; 
		String phone_other = "";
		String phone_fax = "";
		String primary_address_street = ""; 
		String primary_address_city = ""; 
		String primary_address_state = "";
		String primary_address_postalcode = ""; 
		String primary_address_country = ""; 
		String alt_address_street = ""; 
		String alt_address_city = ""; 
		String alt_address_state = ""; 
		String alt_address_postalcode = "";
		String alt_address_country = "";
		String assistant = "";
		String assistant_phone = ""; 
		String converted = "";
		String account_name = "smartLehren";
		String contact_id = ""; 
		String account_id = "";
		String opportunity_id = ""; 
		String opportunity_name = ""; 
		String opportunity_amount = "";
		String campaign_id = ""; 
		String birthdate = null; 
		String website = "";
		
		String description_C = "sL-Person";
				
		dbcrm.addTargetsToDBCRM(emailId, description_C, salutation, fname, lname, title, 
				department, phone_home, phone, phone_work, phone_other, phone_fax, 
				primary_address_street, primary_address_city, primary_address_state, 
				primary_address_postalcode, primary_address_country, alt_address_street, 
				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
				assistant, assistant_phone, birthdate, account_name);
		
		String jjwg_maps_geocode_status_c = "";
		String jjwg_maps_address_c = "";
		String account_description_c = "";
		String website_c = "";
		String lead_source_c = "";
		String company_c = "";
		String employees_c = "";
		String code_c = "";
		String profile_c = "";
		String linkedprofile_c = "";
		String facebook_c = "";
		
		dbcrm.addTargetsCustomToDBCRM(0.0f, 0.0f, jjwg_maps_geocode_status_c, 
				jjwg_maps_address_c, account_description_c, website_c, lead_source_c, company_c, 
				employees_c, code_c, profile_c, linkedprofile_c, facebook_c);
	   
	  
}
else if(pro!=null && pro.equalsIgnoreCase("initentity")){
	
	ArrayList rolist=db1.getrole();
	request.setAttribute("rolist", rolist);
	return new ModelAndView("createentity");	
}
else if(pro!=null && pro.equalsIgnoreCase("initregister")){
	 ArrayList companyname = db.getallcompanyname();
	 // String company_name = null;
	
	 request.setAttribute("company_name", companyname);
	
	return new ModelAndView("frmRegister");	
}
	     
else if(pro!=null && pro.equalsIgnoreCase("initupdateuser")){
	 user_id=request.getParameter("user_id");
	ArrayList courselist=db1.getuserlist(user_id);

		if(courselist!=null && courselist.size()!=0){
		Iterator itr = courselist.iterator();
		if(itr.hasNext()){
		 String sr[] = (String[]) itr.next();
		 
		 String username = sr[0];
		 String password = sr[1];
		 String firstname = sr[2]; 
		 String lastname = sr[3]; 
		 String gender = sr[4]; 
		 String email = sr[5]; 		
		 String dob = sr[6]; 
		 String mobileno=sr[7];
		 String fathername=sr[8];
		 String mothername=sr[9];
		 String address1=sr[10];
		 String address2=sr[11];
		 String city=sr[12];
		 String state=sr[13];
		 String country=sr[14];
		String pincode=sr[15];
			
		request.setAttribute("username", username);
		request.setAttribute("password", password);
			request.setAttribute("firstname", firstname);
			request.setAttribute("lastname", lastname);
			request.setAttribute("gender", gender);
			request.setAttribute("email", email);
			request.setAttribute("dob", dob);
			request.setAttribute("mobileno", mobileno);
			request.setAttribute("fathername", fathername);
			request.setAttribute("mothername", mothername);
			request.setAttribute("address1", address1);
			request.setAttribute("address2", address2);
			request.setAttribute("city", city);
			request.setAttribute("state", state);
			request.setAttribute("country", country);
			request.setAttribute("pincode", pincode);
		}
		}
							
	request.setAttribute("user_id", user_id);
	return new ModelAndView("updateuser");	
}


			else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("update")){
			    
			   user_id=request.getParameter("user_id");
			     //String usernamee=db1.getusername(user_id);
			     String username=request.getParameter("username");
			     String password=request.getParameter("password");
			   String firstname=request.getParameter("firstname");
			   String lastname=request.getParameter("lastname");
			   String gender=request.getParameter("gender");
			   String date=request.getParameter("date");
			   String e_mail=request.getParameter("email");
			   String mobile_no=request.getParameter("mobileno");
			   String father_name=request.getParameter("fathername");
			   String mother_name=request.getParameter("mothername");
			   String address1=request.getParameter("address1");
			   String address2=request.getParameter("address2");
			   
			   String city=request.getParameter("city");
			   String state=request.getParameter("state");
			   String country=request.getParameter("country");
			   String pincode=request.getParameter("pincode");
			   
			   String upstatus=db.updateuser(username,password,firstname,lastname,gender,e_mail,date,mobile_no,father_name,mother_name,address1,address2,city,state,country,pincode,user_id);
			   			   
			   Thread thread = new Thread();
			   try {
				thread.sleep(2000);
				request.setAttribute("upstatus", upstatus);
				   request.setAttribute("username", username);
					request.setAttribute("password", password);
						request.setAttribute("firstname", firstname);
						request.setAttribute("lastname", lastname);
						request.setAttribute("gender", gender);
						request.setAttribute("email", e_mail);
						request.setAttribute("dob", date);
						request.setAttribute("mobileno", mobile_no);
						request.setAttribute("fathername", father_name);
						request.setAttribute("mothername", mother_name);
						request.setAttribute("address1", address1);
						request.setAttribute("address2", address2);
						request.setAttribute("city", city);
						request.setAttribute("state", state);
						request.setAttribute("country", country);
						request.setAttribute("pincode", pincode);
			} catch (InterruptedException e) {				
				e.printStackTrace();
			}
			   
			   return new ModelAndView("updateuser");
			   }
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("updateprofile")){
			    
					     
			   String username=request.getParameter("username");
			   String password=request.getParameter("password");
			   String email=request.getParameter("email");
			   String institutionname=request.getParameter("institutionname");
			   String mail=request.getParameter("mail");
			   String customerid=request.getParameter("customerid");
			  
			   String updateprofile=db.updateprofile(username, password, email, institutionname, mail);
			   			   		   
			   String updateuser=db.updateuserprofile(username, password, email, mail);
			   if(updateprofile != null && updateuser !=null){
				   request.setAttribute("upstatus", updateprofile);
			   }
			   
			   request.setAttribute("username", username);
			   request.setAttribute("password", password);
			   request.setAttribute("email", email);
			   request.setAttribute("institutionname", institutionname);
			   request.setAttribute("customerid", customerid);
			   
			   return new ModelAndView("profiledetails");
			   }
	     
else if(LoginProcess!=null && LoginProcess.equalsIgnoreCase("updateplanpackage")){
        
     user_id=request.getParameter("user_id");
     //String usernamee=db1.getusername(user_id);
     
   String planandbundle=request.getParameter("planandbundle");
   String renew=request.getParameter("renew");
   
   //String customerid=request.getParameter("customerid");
   
  
  // String updateprofile=db.updateprofile(username, password, e_mail, institutionname, user_id); 
   
   //request.setAttribute("upstatus", updateprofile);
   return new ModelAndView("planandpackage");
   }

	     
		return new ModelAndView("SLHome");
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		log.info("session has been created ");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		log.info("session has been destroyed ");
	}
	
		
}
