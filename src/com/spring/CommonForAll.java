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

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.util.adminDB;
import com.util.studentDB;

public class CommonForAll implements CommonInter{
	
	private CommonForAll() {		
	}
	
	private static CommonInter myInstance = new CommonForAll();
	
	public static CommonForAll getInstance(){
    	return (CommonForAll) myInstance;
    }	    
	
	
	public void mail(String user_id){
		adminDB db1=adminDB.getInstance();
		ArrayList userlist=db1.getuserlist(user_id);
			Iterator itr = userlist.iterator();
			if(itr.hasNext()){
			 String sr[] = (String[]) itr.next();
			
			 String usernamee = sr[0];
			 String passwords = sr[1];
			 String firstname = sr[2]; 
			 String lastname = sr[3]; 
			 String e_mail = sr[4]; 										   	
								
		final String username = "parasu87@gmail.com";
		final String password = "javaparasu@001";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("parasu87@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(e_mail));
			message.setSubject("Your Account Details");
			message.setText("Dear"+""+firstname+"."+lastname
					+"\n\n\nYour username:"+usernamee+"\n\n"
					+"Your password:"+passwords+"\n\n"+
					"Thanks and regards\nparasu.A"); 
			Transport.send(message);
 			
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
			}

	public String getage(String dob)
	{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calobj = Calendar.getInstance();
		String days=null;
		String currdate=df.format(calobj.getTime());
				
		//SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		 
		Date d1 = null;
		Date d2 = null;
 
		try {
			d1 = df.parse(currdate);
			d2 = df.parse(dob);
 
			//in milliseconds
			long diff = d2.getTime() - d1.getTime();
 
			long diffSeconds = Math.abs(diff / 1000 % 60);
			long diffMinutes = Math.abs(diff / (60 * 1000) % 60);
			long diffHours = Math.abs(diff / (60 * 60 * 1000) % 24);
			long diffDays = Math.abs(diff / (24 * 60 * 60 * 1000));
 
			String sec=Long.toString(diffSeconds);
			String min=Long.toString(diffMinutes);
			String hour=Long.toString(diffHours);
			String day=Long.toString(diffDays);
            days=day;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return days;
 
	}
	
	public String getdate(String lastdate)
	{
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calobj = Calendar.getInstance();
		String days=null;
		String dateStart=df.format(calobj.getTime());		
		
		//SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		 
		Date d1 = null;
		Date d2 = null;
 
		try {
			d1 = df.parse(dateStart);
			d2 = df.parse(lastdate);
 
			//in milliseconds
			long diff = d2.getTime() - d1.getTime();
 
			long diffSeconds = Math.abs(diff / 1000 % 60);
			long diffMinutes = Math.abs(diff / (60 * 1000) % 60);
			long diffHours = Math.abs(diff / (60 * 60 * 1000) % 24);
			long diffDays = Math.abs(diff / (24 * 60 * 60 * 1000));
 
			String sec=Long.toString(diffSeconds);
			String min=Long.toString(diffMinutes);
			String hour=Long.toString(diffHours);
			String day=Long.toString(diffDays);
            days=day+"days"+hour+"hours"+min+"minutes";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return days;
 
	}
	
	 public String getcurrentdate()
		{
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar calobj = Calendar.getInstance();
			
			String dateStart=df.format(calobj.getTime());
			
			return dateStart;
	 		}
	 
	 ArrayList getanswerlist(String quizname_id)
		{
		 studentDB db5=studentDB.getInstance();
		 ArrayList ans=new ArrayList();
		 ArrayList question_name=db5.getquizquestionname(quizname_id);
		 if(question_name!=null && question_name.size()!=0){
			 Iterator itr = question_name.iterator();
			 int i=0;
			 while(itr.hasNext()){
			  String sr[] = (String[]) itr.next();
			  String q_no = sr[0];
			  String question = sr[1];
			  String a = sr[2];
			  String b = sr[3];
			  String c = sr[4];
			  String d = sr[5];
			  String answer = sr[6];
			  
			ans.add(answer);
			 }
			 }
		 
		 return ans;
		}
	

}
