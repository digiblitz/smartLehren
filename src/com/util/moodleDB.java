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

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import java.io.IOException;
import java.net.ProtocolException;
import javax.xml.parsers.ParserConfigurationException;


//import net.beaconhillcott.moodlerest.MoodleCallRestWebService;
//import net.beaconhillcott.moodlerest.MoodleRestException;
//import net.beaconhillcott.moodlerest.MoodleServices;

import org.xml.sax.SAXException;


public class moodleDB {

	final String domainName = "http://localhost:8088/";
	
	 public void createuser(String username,String password,String firstname,String lastname,String e_mail,String city,String country)throws ProtocolException,
		IOException, ParserConfigurationException, SAXException
	 {
		
			 String functionName = "moodle_user_create_users";
			    String urlParameters =
			    "users[0][username]=" + URLEncoder.encode(username, "UTF-8") +
			    "&users[0][password]=" + URLEncoder.encode(password, "UTF-8") +
			    "&users[0][firstname]=" + URLEncoder.encode(firstname, "UTF-8") +
			    "&users[0][lastname]=" + URLEncoder.encode(lastname, "UTF-8") +
			    "&users[0][email]=" + URLEncoder.encode(e_mail, "UTF-8")+
			    "&users[0][auth]=" + URLEncoder.encode("manual", "UTF-8")+
			    "&users[0][city]=" + URLEncoder.encode(city, "UTF-8")+
			    "&users[0][country]=" + URLEncoder.encode("IN", "UTF-8");
			    
			 digiblitz(functionName,urlParameters);  
		}

	 public void updateusermoodle(String userid,String password,String firstname,String lastname,String e_mail,String city,String country)throws ProtocolException,
		IOException, ParserConfigurationException, SAXException
	 {
		
			 String functionName = "moodle_user_update_users";
			    String urlParameters =
			    "users[0][id]=" + URLEncoder.encode(userid, "UTF-8") +
			    "&users[0][password]=" + URLEncoder.encode(password, "UTF-8") +
			    "&users[0][firstname]=" + URLEncoder.encode(firstname, "UTF-8") +
			    "&users[0][lastname]=" + URLEncoder.encode(lastname, "UTF-8") +
			    "&users[0][email]=" + URLEncoder.encode(e_mail, "UTF-8")+
			    "&users[0][auth]=" + URLEncoder.encode("manual", "UTF-8")+
			    "&users[0][city]=" + URLEncoder.encode(city, "UTF-8")+
			    "&users[0][country]=" + URLEncoder.encode("IN", "UTF-8");
			    
			 digiblitz(functionName,urlParameters);  
		}
	 
	 public void addcategories(String course_name)throws ProtocolException,
		IOException, ParserConfigurationException, SAXException
	 {

		 String functionName = "core_course_create_categories";
		    String urlParameters =
		    "categories[0][name]=" + URLEncoder.encode(course_name, "UTF-8")+
		    "&categories[0][description]=" + URLEncoder.encode("", "UTF-8");
		    
		    digiblitz(functionName,urlParameters);		
	 }
	 
	 
	 public void addcourse(String course_name,String categoryid)throws ProtocolException,
		IOException, ParserConfigurationException, SAXException
	 {
		 String functionName = "core_course_create_courses";
		    String urlParameters =
		    "courses[0][fullname]=" + URLEncoder.encode(course_name, "UTF-8")+
		    "&courses[0][shortname]=" + URLEncoder.encode(course_name, "UTF-8")+
		    "&courses[0][categoryid]=" + URLEncoder.encode(categoryid, "UTF-8");
		    digiblitz(functionName,urlParameters);
	 }

	 
	 public void deleteuser(String userid)throws ProtocolException,
		IOException, ParserConfigurationException, SAXException
	 {
		 String functionName = "moodle_user_delete_users";
		    String urlParameters =
		    "userids[0]=" + URLEncoder.encode(userid, "UTF-8");
		   
		    digiblitz(functionName,urlParameters);
	 }
	 
	 public void enrolluser(String roleid,String courseid,String userid)throws ProtocolException,
		IOException, ParserConfigurationException, SAXException
	 {
		 
		 String functionName = "moodle_enrol_manual_enrol_users";
		    String urlParameters =
		    "enrolments[0][roleid]=" + URLEncoder.encode(roleid, "UTF-8")+
		    "&enrolments[0][courseid]=" + URLEncoder.encode(courseid, "UTF-8")+
		    "&enrolments[0][userid]=" + URLEncoder.encode(userid, "UTF-8");
		    digiblitz(functionName,urlParameters);
	 }
	
		 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
public String digiblitz(String functionName,String urlParameters)throws ProtocolException,
IOException, ParserConfigurationException, SAXException
{
	    
    String serverurl = domainName + "/webservice/rest/server.php" + "?wstoken=" + "ff73ec8e1a961520cb138a10fa991bca" + "&wsfunction=" + functionName;
    HttpURLConnection con = (HttpURLConnection) new URL(serverurl).openConnection();

con.setRequestMethod("POST");
con.setRequestProperty("Content-Type",
"application/x-www-form-urlencoded");
con.setRequestProperty("Content-Language", "en-US");
con.setDoOutput(true);
con.setUseCaches(false);
con.setDoInput(true);
DataOutputStream wr = new DataOutputStream(con.getOutputStream());
wr.writeBytes(urlParameters);
wr.flush();
wr.close();
InputStream is = con.getInputStream();
BufferedReader rd = new BufferedReader(new InputStreamReader(is));
String line;
StringBuilder response = new StringBuilder();
while ((line = rd.readLine()) != null) {
response.append(line);
response.append('\r');

}
rd.close();

return null;
}

}



