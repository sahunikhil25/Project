//package com.velociter.hms.model;
//
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.Properties;
//
//public class App {
//
//	   public static String  getPdfCreateTime() {
//		   
//		  String value = null; 
//		try
//		{
//		    Properties prop = readPropertiesFile("resources/config.properties");
//		    value=prop.getProperty("1");
//		    System.out.println("key value  is :"+ prop.getProperty("1"));
//		   System.out.println("method readProperties Time is: "+ value);
//		   
//		}catch(Exception e)
//		{
//			System.out.println("FIle Exception Occurs" + e.getMessage());
//		}
//
//		return value;
//	   }
//
//    	  public static  Properties readPropertiesFile(String fileName) throws IOException {
//	      
//	      
//	    	 FileInputStream fis = new FileInputStream(fileName);
//	    	 Properties prop = new Properties();
//	         prop.load(fis);
//	         fis.close();
//	         
//			return prop;
//	      
//	   }
//    	  
//    	  public static void main(String args[])
//    	  {
//    		  System.out.println("Time is:"+ App.getPdfCreateTime());
//    	  }
//	  
//}