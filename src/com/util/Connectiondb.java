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


import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class Connectiondb implements ConnectiondbInterf{
	
	private Connectiondb(){
		
	}
	
	public static final String dbName = "java:/TESTMSSQLDS";
	 public Connection con = null; 
	    
	    private static ConnectiondbInterf myInstance = new Connectiondb();
	    static Logger log = Logger.getLogger(Connectiondb.class.getName());	    
	    
	    public static Connectiondb getInstance(){
	    	return (Connectiondb) myInstance;
	    }	    
	
	
	 public static final java.sql.Date toSQLDate(java.util.Date inDate) {
	        return new java.sql.Date(inDate.getTime());
	    }	 

public void makeConnection() {
     try {    	 
         InitialContext ic = new InitialContext();
         DataSource ds = (DataSource) ic.lookup(dbName);
         con = ds.getConnection();
         // Debug.print(" Opening a connection...");
     } catch (Exception ex) {
         //Debug.print("Unable to connect to database. " + ex.getMessage());
     }
 }
 
 
 public void releaseConnection() {
     try {
         //prepStmt.close();
         //rs.close();
         if(!con.isClosed()){
             con.close();            
         }
         //Debug.print(" Closing a connection...");
     } catch (SQLException ex) {
         //Debug.print("releaseConnection: " + ex.getMessage());
     }
 
 }


@Override
public void toSQLDate() {
	// TODO Auto-generated method stub
	
}

}
