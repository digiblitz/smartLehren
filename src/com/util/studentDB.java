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


public class studentDB {
	
	static Logger log = Logger.getLogger(studentDB.class.getName());
	private static studentDB myInstance = new studentDB(); 
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
    public String reg_number="";
    public String user_id="";
    
    public static studentDB getInstance(){
		return myInstance;    	
    }
    
	 private studentDB(){}
	 Connectiondb connection = Connectiondb.getInstance();
		 
	 public ArrayList getassignname(String course_code)
	    {
		 ArrayList ass_name= new ArrayList(); 
	    	String assign_name=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT assign_id,assign_name FROM tblassignment WHERE course_code=? and assignment_status='Active'";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String assign_id = rs.getString(1);
				            	assign_name = rs.getString(2);				            	
				            	String[] temp={assign_id,assign_name,course_code};
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
	 
	 public ArrayList getreassignname(String course_code)
	    {
		 ArrayList ass_name= new ArrayList(); 
	    	String assign_name=null;	
	    	String assign_id = null;
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT DISTINCT assign_id,assign_name FROM tblAssignmentParticular WHERE course_code=? and reAssignment_status='Active'";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	assign_id = rs.getString(1);
				            	assign_name = rs.getString(2);				            	
				            	String[] temp={assign_id,assign_name};
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
	 public ArrayList getquizname(String course_code)
	    {
		 ArrayList quizname= new ArrayList(); 
	    	   	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT test_id,test_name,course_code FROM tbltestMaster WHERE course_code=? and test_status='Active'";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String test_id = rs.getString(1);
				            	String quiz_name = rs.getString(2);
				            	String coursecode = rs.getString(3);
				            	String[] temp={test_id,quiz_name,coursecode};
				            	quizname.add(temp);
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
			       
			    return quizname;
	    }
	 public ArrayList getcoursemateriallinklist(String course_code)
     {
   ArrayList urllist= new ArrayList(); 
      
           try {
        	   connection.makeConnection();
             String str="SELECT study_material,reference_material,recorded_class,live_class,pdf_book," +
        "study_guideline,writting_excellance,course_community FROM tblCourseMaterialLink WHERE course_code=?";
                   
             prepStmt = connection.con.prepareStatement(str);
                prepStmt.setString(1,course_code);
                
                
                rs = prepStmt.executeQuery();
                while (rs.next()){
                String sm = rs.getString(1);
                String rm = rs.getString(2);
                String rc = rs.getString(3);
                String lc = rs.getString(4);
                String pb = rs.getString(5);
                String sg = rs.getString(6);
                String we = rs.getString(7);
                String cc = rs.getString(8);
               
                 String[] temp={sm,rm,rc,lc,pb,sg,we,cc};
                 urllist.add(temp);
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
          
       return urllist;
     }
	  public String addprovisionenrolldetails(String user_id,String category,String programname,String subprogramname,String school_10,String board_10,String mark_10,String yop_10,
			  String school_12,String board_12,String mark_12,String yop_12,String collegename,String dept,String university,String ugmark,String yop,String standard)
	    {
	    	String status="Information not saved ";  
	    	
	    	try{	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblprovisionenroll(user_id,category,program_name,subprogram_name,sslc_schoolname,sslc_board,sslc_mark,sslc_yop,hsc_schoolname,hsc_board,hsc_mark,hsc_yop,college_name,department,university,mark,yop,highest_std) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,user_id);
	        prepStmt.setString(2,category);
	        prepStmt.setString(3,programname);
	        prepStmt.setString(4,subprogramname);
	        prepStmt.setString(5,school_10);
	        prepStmt.setString(6,board_10);
	        prepStmt.setString(7,mark_10);
	        prepStmt.setString(8,yop_10);
	        prepStmt.setString(9,school_12);
	        prepStmt.setString(10,board_12);
	        prepStmt.setString(11,mark_12);
	        prepStmt.setString(12,yop_12);
	        prepStmt.setString(13,collegename);
	        prepStmt.setString(14,dept);
	        prepStmt.setString(15,university);
	        prepStmt.setString(16,ugmark);
	        prepStmt.setString(17,yop);
	        prepStmt.setString(18,standard);
	        int cnt= prepStmt.executeUpdate();
	        if(cnt>0){
	           	
	      	  status="Information saved successfully";	 
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
	 
	 public ArrayList getslidematerial(String course_id)
	    {
		 ArrayList slidename= new ArrayList(); 
	    	String slide_name=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT pathname,name FROM tblslidematerial WHERE course_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String pathname = rs.getString(1);
				            	String name = rs.getString(2);
				            	String[] temp={pathname,name};
				            	slidename.add(temp);
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
			       
			    return slidename;
	    }
	 
	 public ArrayList getcoursematerial(String course_code)
	    {
		 ArrayList coursematerial= new ArrayList(); 
	    	
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT file_name,path_name FROM tblcoursematerial WHERE course_code=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,course_code);
				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String filename = rs.getString(1);
				            	String pathname = rs.getString(2);
				            	String[] temp={filename,pathname};
				            	coursematerial.add(temp);
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
			       
			    return coursematerial;
	    }
	 
	 
	 public ArrayList getcoursematerial()
	    {
		 ArrayList coursematerial= new ArrayList(); 
	    	
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT file_name,path_name FROM tblcoursematerial ";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				           		            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String filename = rs.getString(1);
				            	String pathname = rs.getString(2);
				            	String[] temp={filename,pathname};
				            	coursematerial.add(temp);
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
			       
			    return coursematerial;
	    }
	 
	 public ArrayList getdocumentlist(String user_id)
	    {
		 ArrayList flist= new ArrayList(); 
	    	
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT file_name,path_name FROM tblStudentDocuments where user_id = ? ";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1,user_id);	            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String filename = rs.getString(1);
				            	String pathname = rs.getString(2);
				            	String[] temp={filename,pathname};
				            	flist.add(temp);
				            	log.info("filename "+filename+" pathname "+pathname);
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
			       
			    return flist;
	    }
	 
	 
	 public ArrayList getquizquestionname(String quizname_id)
	    {
		 ArrayList question_name= new ArrayList(); 
	    	
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT top 5 q_no,question,a,b,c,d,answer FROM tbltestDetails WHERE test_id=? order by newid()";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,quizname_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String q_no = rs.getString(1);
				            	String question = rs.getString(2);
				            	String a = rs.getString(3);
				            	String b = rs.getString(4);
				            	String c = rs.getString(5);
				            	String d = rs.getString(6);
				            	String answer = rs.getString(7);
				            	
				            	String[] temp={q_no,question,a,b,c,d,answer};
				            	question_name.add(temp);
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
			       
			    return question_name;
	    }
	 
	 public ArrayList getstatus(String assign_name,String user_id)
	    {
		 ArrayList status= new ArrayList(); 
	    	
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT a.status,a.grade,a.comments,b.last_date from tblassignsubmitted a,tblassignment b where a.assign_name = b.assign_name and a.user_id = ? and a.assign_name = ? ";
					     				     
					        prepStmt = connection.con.prepareStatement(str);				            
				            prepStmt.setString(1,user_id);
				            prepStmt.setString(2,assign_name);		            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String statuss = rs.getString(1);
				            	String grade = rs.getString(2);
				            	String comments = rs.getString(3);
				            	String lastdate = rs.getString(4);				            	
				            	String[] temp={statuss,grade,comments,lastdate};
				            	status.add(temp);
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
			       
			    return status;
	    }
	 public ArrayList getrestatus(String assign_name,String user_id)
	    {
		 ArrayList status= new ArrayList(); 
	    	
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT a.status,a.grade,a.comments,b.last_date from tblReassignsubmit a,tblAssignmentParticular b where a.assign_name = b.assign_name and a.student_user_id = ? and a.assign_name = ? ";
					     				     
					        prepStmt = connection.con.prepareStatement(str);				            
				            prepStmt.setString(1,user_id);
				            prepStmt.setString(2,assign_name);		            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String statuss = rs.getString(1);
				            	String grade = rs.getString(2);
				            	String comments = rs.getString(3);
				            	String lastdate = rs.getString(4);				            	
				            	String[] temp={statuss,grade,comments,lastdate};
				            	status.add(temp);
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
			       
			    return status;
	    }
	 
	 public ArrayList getpaidstudentlist(String user_id)
	    {
		 ArrayList plist= new ArrayList(); 
	    	
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT a.user_id,a.register_no,a.firstname,a.lastname,a.e_mail,b.payment_type,b.dd_number,b.dd_date,b.bank_name,b.bank_branch,b.amount from tblEnrolldetails a,tblPaymentDetails b where a.user_id = b.user_id and a.user_id = ?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1,user_id);
				           
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	
				            	String userid = rs.getString(1);
				            	String register_no = rs.getString(2);
				            	String firstname = rs.getString(3);
				            	String lastname = rs.getString(4);
				            	String email = rs.getString(5);
				            	String paymenttype = rs.getString(6);
				            	String ddno = rs.getString(7);
				            	String dddate = rs.getString(8);
				            	String bankname = rs.getString(9);
				            	String bankbranch = rs.getString(10);
				            	String amount = rs.getString(11);
				            	
				            	String[] temp={userid,register_no,firstname,lastname,email,paymenttype,ddno,dddate,bankname,bankbranch,amount};
				            	plist.add(temp);
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
			       
			    return plist;
	    }
	 
	 
	 public ArrayList getallpaidstudentlist()
	    {
		 ArrayList plist= new ArrayList(); 
	    	String pstatus="StillPending ";
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT user_id,register_no,firstname,lastname,e_mail from tblEnrolldetails where payment_status = ? ";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1,pstatus);
				           
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String user_id = rs.getString(1);
				            	String reg_no = rs.getString(2);
				            	String firstname = rs.getString(3);
				            	String lastname = rs.getString(4);
				            	String email = rs.getString(5);
				            	
				            	
				            	
				            	String[] temp={user_id,reg_no,firstname,lastname,email};
				            	plist.add(temp);
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
			       
			    return plist;
	    }
	 
	 public String updatepaymentapprove(String user_id,String approval)
	    {
	    	
	    	String status = null;
	    	try{
	    	 
	    	
	    		connection.makeConnection(); 
	    	String insertStmt=  "update tblEnrolldetails SET payment_status = ?  where user_id = ? ";
	        
	    	
	        prepStmt = connection.con.prepareStatement(insertStmt);
	        
	        prepStmt.setString(1,approval);
	        prepStmt.setString(2,user_id);      
	             
	        int cnt = prepStmt.executeUpdate();
	       
	        if(cnt > 0){
	        	status = "Payment Approved";
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
	    
	 public ArrayList getstudentlist(String proid,String subproid)
	    {
	    	ArrayList list1 = new ArrayList();
	    	
	    	 try {
	    		 connection.makeConnection();         
	                
	             String selectStatement =  "select c.user_id,c.firstname,c.lastname,c.e_mail,c.category,c.batch,c.program_id,c.sub_program_id, a.course_name, b.subcourse_name from tblcourse a,tblsubcourse b,tblEnrolldetails c where " +
	             		"a.course_id=c.program_id and b.sub_id=c.sub_program_id and c.program_id = ? and c.sub_program_id = ? and c.payment_status='Approved'";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,proid);
	             prepStmt.setString(2,subproid);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	 String user_id = rs.getString(1);
	 	        	 String firstname = rs.getString(2);
	 	        	String lastname = rs.getString(3);
	 	        	String e_mail = rs.getString(4);
	 	        	String category = rs.getString(5);
	 	        	String batch = rs.getString(6);
	 	        	String programid = rs.getString(7);
	 	        	String subproramid = rs.getString(8);
	 	        	String course_name = rs.getString(9);
	 	        	String subcourse_name = rs.getString(10);
	 	        	
	 	        	
	 	        	  String[] temps={user_id,firstname,lastname,e_mail,category,batch,programid,subproramid,course_name,subcourse_name};
	 	        	 
	 	        	 list1.add(temps);
	 	        	  
	 	          }
	             prepStmt.close();
	             rs.close();          
	              } 
	         catch (SQLException sqe) { connection.releaseConnection(); } 
	    	 finally { connection.releaseConnection(); }
	    	
	    	return list1;
	    }
	 
	 public String getroleidforstudent(String user_id)
	    {
		  
	    	String role_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT role_id FROM tblEnrolldetails WHERE user_id=?";
					     				     
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
	 
	 public String getbatch(String user_id)
	    {
		  
	    	String batch=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT batch FROM tblEnrolldetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	batch = rs.getString(1);
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
			       
			    return batch;
	    }
	 
	 public String getprogramidforpgmentor(String user_id)
	    {
	    	 
	    	String program_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT program_id FROM tblUserdetail WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	program_id = rs.getString(1);
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
			       
			    return program_id;
	    }
	 
	 public String getuseridforcmentor(String user_id)
	    {
	    	 
	    	String map_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT map_id FROM tblAssignCourse WHERE user_id=?";
					     				     
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
	 
	 public String getprogramid(String user_id)
	    {
	    	 
	    	String programid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT program_id FROM tblUserdetail WHERE user_id=?";
					     				     
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
	 public String getsubprogramid(String user_id)
	    {
	    	 
	    	String subprogramid=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT sub_program_id FROM tblUserdetail WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	subprogramid = rs.getString(1);
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
			       
			    return subprogramid;
	    }
	 
	 public String getquizid(String quiz_name)
	    {
	    	 
	    	String quizname_id=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT test_id FROM tbltestMaster WHERE test_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,quiz_name);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	quizname_id = rs.getString(1);
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
			       
			    return quizname_id;
	    }
	 
	 public String getlastdate(String assign_name)
	    {
	    	 
	    	String lastdate=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT last_date FROM tblassignment WHERE assign_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,assign_name);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	lastdate = rs.getString(1);
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
			       
			    return lastdate;
	    }
	 
	 public ArrayList getassigndate(String assignname)
	    {
		 ArrayList coursematerial= new ArrayList(); 
	    	
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT allow_date,last_date FROM tblAssignmentParticular where assign_name = ? ";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
					        prepStmt.setString(1, assignname);           
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String allow_date = rs.getString(1);
				            	String last_date = rs.getString(2);
				            	String[] temp={allow_date,last_date};
				            	coursematerial.add(temp);
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
			       
			    return coursematerial;
	    }
	 	 
	 public String getprogramforstudent(String user_id)
	    {
	    	 
	    	String programname=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="select a.course_name from tblcourse a,tblEnrolldetails b where a.course_id=b.program_id and b.user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	programname = rs.getString(1);
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
			       
			    return programname;
	    }
	 
	 public String getsubprogramforstudent(String user_id)
	    {
	    	 
	    	String subprogramname=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="select a.subcourse_name from tblsubcourse a,tblEnrolldetails b where a.sub_id=b.sub_program_id and b.user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	subprogramname = rs.getString(1);
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
			       
			    return subprogramname;
	    }
	 
	 
	 public String adddocumentfromstudent(String user_id,String fileename,String saveFile)
	    {	    	 
	    	String allow_date=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="insert into tblStudentDocuments(user_id,file_name,path_name) values (?,?,?)";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            prepStmt.setString(2,fileename);
				            prepStmt.setString(3,saveFile);
				            
				            prepStmt.executeUpdate();

				 	       prepStmt.close();
				       
				 	      connection.releaseConnection(); 
				    } 
			        catch (Exception ex) {
				        	ex.printStackTrace();
				             //Debug.print("Exception:" + ex.getMessage());
				        }finally {
				        	connection.releaseConnection();
				        }
			       
			    return allow_date;
	    }
	 
	 public String insertstudentcourse(String user_id,String cm_id,String course_code,String course_name)
	    {
	    	  String status="";	  
			        try {
			        	connection.makeConnection();
			        	 String str="insert into tblStudentCourseDetails(student_user_id,cm_user_id,course_code,course_name) values (?,?,?,?)";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            prepStmt.setString(2,cm_id);
				            prepStmt.setString(3,course_code);
				            prepStmt.setString(4,course_name);
				            
				            int cnt= prepStmt.executeUpdate();
					        if(cnt>0){
					           	
					      	  status="Course Assigned successfully";	 
					          }
				 	       prepStmt.close();				       
				 	      connection.releaseConnection(); 
				    } 
			        catch (Exception ex) {
				        	ex.printStackTrace();
				             //Debug.print("Exception:" + ex.getMessage());
				        }finally {
				        	connection.releaseConnection();
				        }
			       
			    return status;
	    }
	 
	 public String inserttestmark(String user_id,String quizname_id,String per,String upto1,String totalmark)
	    {
		 int att = 0 ;
			String attm=testattempt(user_id,quizname_id);			
		  if(attm.equals("0")){
			  attm="1";
			  att=Integer.parseInt(attm);
		  }else{
			  att=1+Integer.parseInt(attm);
		  }
		 String status="";	  
			        try {
			        	connection.makeConnection();
			        	 String str="insert into tblStudentTestDetails(user_id,test_id,percent_mark,total_question,answer,attempts) values (?,?,?,?,?,?)";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            prepStmt.setString(2,quizname_id);
				            prepStmt.setString(3,per);
				            prepStmt.setString(4,upto1);
				            prepStmt.setString(5,totalmark);
				            prepStmt.setLong(6,att);
				            				            
				            int cnt= prepStmt.executeUpdate();
					        if(cnt>0){
					           	
					      	  status="Test mark inserted successfully";	 
					          }
				 	       prepStmt.close();			       
				 	      connection.releaseConnection(); 
				    } 
			        catch (Exception ex) {
				        	ex.printStackTrace();
				             //Debug.print("Exception:" + ex.getMessage());
				        }finally {
				        	connection.releaseConnection();
				        }
			       
			    return status;
	    }
	 
	 public String getallowdate(String assign_name)
	    {
	    	 
	    	String allow_date=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT allow_date FROM tblassignment WHERE assign_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,assign_name);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	allow_date = rs.getString(1);
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
			       
			    return allow_date;
	    }
	 
	 public String getquestionname(String assign_id, String assign_name)
	    {	    	 
	    	String question=null;			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT question FROM tblassignment WHERE assign_id=? and assign_name=?";					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,assign_id);			            
				            prepStmt.setString(2,assign_name);
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	question = rs.getString(1);
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
			    return question;
	    } 
	 
	 public String getrequestionname(String assign_id, String assign_name)
	    {
	    	 
	    	String question=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT question FROM tblAssignmentParticular WHERE assign_id=? and assign_name=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,assign_id);			            
				            prepStmt.setString(2,assign_name);
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	question = rs.getString(1);
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
			       
			    return question;
	    }
	 
	 public String gettestquestionname(String quizname_id)
	    {
	    	 
	    	String question=null;
			    
			    	  
			        try {
			        	connection.makeConnection();
			        	 String str="SELECT question FROM tblDescriptivetest WHERE test_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,quizname_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	question = rs.getString(1);
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
			       
			    return question;
	    }
	 
	 public String addassignsubmit(String user_id,String answer,String grade_status,String assign_status,String assign_name,String filelocation,String filename, String batch, String semester, String course_code)
	    {
		 String status=null;	
		 try{
			 connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblassignsubmitted(user_id,answer_text,grade,status,assign_name,file_location,file_name,batch,semester,course_code) values (?,?,?,?,?,?,?,?,?,?)";
	        prepStmt = connection.con.prepareStatement(insertStmt);	        
	        prepStmt.setString(1,user_id);
	        prepStmt.setString(2,answer);
	        prepStmt.setString(3,grade_status);
	        prepStmt.setString(4,assign_status);
	        prepStmt.setString(5,assign_name);   
	        prepStmt.setString(6,filelocation); 
	        prepStmt.setString(7,filename);
	        prepStmt.setString(8,batch);
	        prepStmt.setString(9,semester);
	        prepStmt.setString(10,course_code);
	       prepStmt.executeUpdate();

	       prepStmt.close();
	      status="Assignment submitted successfully";
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	return status;	
	    }
	 
	 public ArrayList getBatchList(String currdate){
	    	
	 	    ArrayList ulist= new ArrayList();
		    PreparedStatement prepStmt2=null;
		    ResultSet rs2=null;
		    try {
		    	connection.makeConnection();
		    	String str="SELECT batch, semester from tblbatch where ? between startdate and enddate"; 				     
				       
		        	
		        	prepStmt2 = connection.con.prepareStatement(str);
				       prepStmt2.setString(1,currdate);  
				    
				         rs2 = prepStmt2.executeQuery();
			            while(rs2.next()){
			            	String batch = rs2.getString(1);
			            	String semester = rs2.getString(2);
			            	log.info("batch "+batch+" semester "+semester);
			            	String[] temp={batch,semester};		            		
			            	ulist.add(temp);			            	
			            }			     
				   rs2.close();
			       prepStmt2.close();
			       connection.releaseConnection(); 

		        }catch (SQLException sqe) {
			    	sqe.printStackTrace();
			    	connection.releaseConnection();
			              
			    } finally {
			    	connection.releaseConnection();
		        }
		        return ulist;
	}	
	
	 
	 public String addreassignsubmit(String user_id,String answer,String grade_status,String assign_status,String assign_name,String filelocation,String filename, String course_code, String batch, String semester)
	    {
		 String status=null;	
		 try{
			 connection.makeConnection(); 
	    	String insertStmt=  "Insert into tblReassignsubmit(student_user_id,answer_text,grade,status,assign_name,file_location,file_name,course_code,batch,semester) values (?,?,?,?,?,?,?,?,?,?)";
	        prepStmt = connection.con.prepareStatement(insertStmt);	        
	        prepStmt.setString(1,user_id);
	        prepStmt.setString(2,answer);
	        prepStmt.setString(3,grade_status);
	        prepStmt.setString(4,assign_status);
	        prepStmt.setString(5,assign_name);   
	        prepStmt.setString(6,filelocation); 
	        prepStmt.setString(7,filename);
	        prepStmt.setString(8,course_code);
	        prepStmt.setString(9,batch);
	        prepStmt.setString(10,semester);
	       prepStmt.executeUpdate();

	       prepStmt.close();
	      status="Re-Assignment Submitted Successfully";
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	    	connection.releaseConnection();
	              
	    } finally {
	    	connection.releaseConnection();
	    }
	    	return status;	
	    }
	 
	 
	 
	 public String getcoursebyuserid(String user_id)
	    {
	    	 
	    	String course=null;
			   try {
				   connection.makeConnection();
			        	 String str="SELECT course FROM tbluserdetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	course = rs.getString(1);
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
			       
			    return course;
	    }
	 
	 public String updateapprovestatus(String user_id) {
			
			String status ="StillPending";
			try {

				connection.makeConnection();
				String updateStmt = "update tblUserdetail set approve_status=? where user_id=?"; 

				prepStmt = connection.con.prepareStatement(updateStmt);			
				prepStmt.setString(1, status);
				prepStmt.setString(2, user_id);
				

				int cnt = prepStmt.executeUpdate();
				
				prepStmt.close();
				connection.releaseConnection();
			} catch (SQLException sql) {
				connection.releaseConnection();				
			} catch (Exception e) {
				connection.releaseConnection();				
			}
			return status;
		}
		
	 public String getapprovestatus(String user_id)
	    {
	    	 
	    	String status=null;
			   try {
				   connection.makeConnection();
			        	 String str="SELECT approve_status FROM tblUserdetail WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	status = rs.getString(1);
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
			       
			    return status;
	    }
	 
	 
	 public String getpaymentstatus(String user_id)
	    {		  
	    	String status=null;
			   try {
				   connection.makeConnection();
			        	 String str="SELECT payment_status FROM tblEnrolldetails WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	status = rs.getString(1);
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
			       
			    return status;
	    }
	 
	 public String getempid(String user_id)
	    {		  
	    	String empid = null;
			   try {
				   connection.makeConnection();
			        	 String str="SELECT emp_id FROM tblUserdetail WHERE user_id=?";
					     				     
					        prepStmt = connection.con.prepareStatement(str);
				            prepStmt.setString(1,user_id);
				            
				            
				            rs = prepStmt.executeQuery();
				            if (rs.next()){
				            	empid = rs.getString(1);
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
			       
			    return empid;
	    }
	 
	 
	 public ArrayList getassignname11(String course_code)
     {
   ArrayList ass_name= new ArrayList();           
           try {
        	   connection.makeConnection();
             String str="SELECT assign_name,allow_date,last_date FROM tblassignment WHERE course_code=?";
                   
             prepStmt = connection.con.prepareStatement(str);
                prepStmt.setString(1,course_code);
                
                
                rs = prepStmt.executeQuery();
                while (rs.next()){
                 String assign_name = rs.getString(1);
                 String allow_date = rs.getString(2);
                 String last_date = rs.getString(3);
                 String[] temp={assign_name,allow_date,last_date};
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
	 
	 public ArrayList getstudentcourse(String user_id)
     {
   ArrayList course_namelist= new ArrayList(); 
      
   
          
           try {
        	   connection.makeConnection();
             String str="SELECT course_code,course_name FROM tblStudentCourseDetails WHERE student_user_id=?";
                   
             prepStmt = connection.con.prepareStatement(str);
                prepStmt.setString(1,user_id);
                
                
                rs = prepStmt.executeQuery();
                while (rs.next()){
                 String course_code = rs.getString(1);
                 String course_name = rs.getString(2);
                
                 String[] temp={course_code,course_name};
                 course_namelist.add(temp);                 
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
          
       return course_namelist;
     } 
	 
	 
	 public ArrayList getCourseMent(String proid,String subproid,String user_id) {
			ArrayList crsMentrList = new ArrayList();
String name="course mentor";			          
			try {
				connection.makeConnection();
 String selectStatement =  "select user_id,firstname,lastname FROM tblUserdetail WHERE program_id=? and sub_program_id=? and user_id!=?";
	             
	             prepStmt = connection.con.prepareStatement(selectStatement);
	             prepStmt.setString(1,proid);
	             prepStmt.setString(2,subproid);
	             prepStmt.setString(3,user_id);
	             rs = prepStmt.executeQuery();
	 	         
	 	          while(rs.next()) {
	 	        	   user_id = rs.getString(1);
	 	        	 String firstname = rs.getString(2);
	 	        	 String lastname = rs.getString(3);
	 	        	  String[] temps={user_id,firstname,lastname};
	 	        	 crsMentrList.add(temps);	 	        	
	 	          }
	             prepStmt.close();
	             rs.close();          
	             
			} catch (SQLException sqe) {
				connection.releaseConnection();
			} finally {
				connection.releaseConnection();
			}

			return crsMentrList;
		}

	      
		 public String testattempt(String user_id,String quizname_id)
		    {
		    	 
		    	String count=null;
				    
				  //SELECT COUNT(CustomerID) AS OrdersFromCustomerID7 FROM Orders
		    	//WHERE CustomerID=7;  	  
				        try {
				        	connection.makeConnection();
				        	 String str="SELECT COUNT(user_id) FROM tblStudentTestDetails where user_id=? and test_id=?";
						     				     
						        prepStmt = connection.con.prepareStatement(str);
					            prepStmt.setString(1,user_id);
					            prepStmt.setString(2,quizname_id);
					            
					            rs = prepStmt.executeQuery();
					            if (rs.next()){
					            	count = rs.getString(1);
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
				       
				    return count;
		    }
		 
		 public ArrayList getassignmentgrade(String assignname)
		    {
			 ArrayList assign_grade= new ArrayList(); 
		    	
				    
				    	  
				        try {
				        	connection.makeConnection();
				        	 String str="SELECT a.register_no,a.firstname,a.lastname,a.e_mail,b.assign_name,b.grade FROM tblEnrolldetails a,tblassignsubmitted b WHERE a.user_id=b.user_id and b.assign_name=?";
						     				     
						        prepStmt = connection.con.prepareStatement(str);
					            prepStmt.setString(1,assignname);
					            
					            
					            rs = prepStmt.executeQuery();
					            while (rs.next()){
					            	String regno = rs.getString(1);
					            	String firstname = rs.getString(2);
					            	String lastname = rs.getString(3);
					            	String email = rs.getString(4);
					            	String assname = rs.getString(5);
					            	String grade = rs.getString(6);
					            	String[] temp={regno,firstname,lastname,email,assname,grade};
					            	assign_grade.add(temp);
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
				       
				    return assign_grade;
		    }

}
