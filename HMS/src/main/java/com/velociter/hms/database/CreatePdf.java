package com.velociter.hms.database;
import java.io.File;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import com.velociter.hms.model.Department;
import com.velociter.hms.model.Employee;
import com.velociter.hms.model.Patient;

public class CreatePdf {
    
	     static DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
		 static LocalDateTime now = LocalDateTime.now();
		 static  String todayDate=dtf.format(now).replace('/', '_');
		 
	
		public static boolean generatedPdf(String PdfCreatedTime) throws FileNotFoundException, DocumentException {
			
		
		
         	System.out.println("PdfCreatedTime"+ PdfCreatedTime);
	    	boolean result;   
	    	
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
	        
	    	Date date = new Date();
	    	String currentTime=formatter.format(date);
	    	
	    	String newFormtcurrentTime=currentTime.replace(':','_');
	    	
	    	System.out.println("Today Date is:"+ todayDate + "CurrentTime is:"+ currentTime
	    			                           +"And pdfGeneratedTime is:"+ PdfCreatedTime );
	    	
	    	
	    	if(PdfCreatedTime.equals(currentTime))
	    	{
	    		String fileName="E:/HospitalInfoPdf/PatientListPdf/ListPatient_.pdf";
		    	
		    	int lastDotIndex = fileName.lastIndexOf('.');
		    	System.out.println("LastIndex of :"+ lastDotIndex);
		    	
		    	String newFileName = fileName.substring(0, lastDotIndex ) + todayDate + "_" +newFormtcurrentTime + fileName.substring(lastDotIndex);
		    	
		    	System.out.println("new Frmt current time:"+newFormtcurrentTime);
		    	System.out.println("subString is:"+ fileName.substring(lastDotIndex));
		    	System.out.println(" New File Name is: "+ newFileName);
		    	
	    		
	    	Document document = new Document();
	    	
	        PdfWriter.getInstance(document, new FileOutputStream(newFileName));
	        
	        document.open();
	        
	        document.add(new Paragraph("PatientList"));
	        
	        
	        DateTimeFormatter dateOrTimeFrmt = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
	   		LocalDateTime todayTimeOrDate = LocalDateTime.now();
	   		
   		    document.add(new Paragraph(dateOrTimeFrmt.format(todayTimeOrDate)));
	    	
	    	 
	            PdfPTable table = new PdfPTable(5);
	           
	          
	            
	            table.setWidthPercentage(100); //Width 100%
	            table.setSpacingBefore(10f); //Space before table
	            table.setSpacingAfter(10f);//Space after table
	            
	           
	     
	            //Set Column widths
	            float[] columnWidths = {1f, 1f,1f,1f,2f};
	            table.setWidths(columnWidths);
	            
  
	            PdfPCell cell = new PdfPCell(new Phrase("Name"));
	            table.addCell(cell);
	            
	            PdfPCell cell1 = new PdfPCell(new Phrase("FIRSTNAME"));
	            table.addCell(cell1);
	            
	            PdfPCell cell2 = new PdfPCell(new Phrase("LASTNAME"));
	            table.addCell(cell2);
	            
	            PdfPCell cell3 = new PdfPCell(new Phrase("ADDRESS"));
	            table.addCell(cell3);
	            
	            PdfPCell cell4 = new PdfPCell(new Phrase("MOBILENUMBER"));
	            table.addCell(cell4);
	         
	            HospitalDAO hospitalDaoObject = new HospitalDAO();
		    	ArrayList<Patient>patientObject = new ArrayList<>(hospitalDaoObject.getPatientList());
		    	
	            
			  for(Patient patientList:patientObject) {
				  
				 table.addCell(patientList.getName());
				 table.addCell(patientList.getFirstName());
				 table.addCell(patientList.getLastName()); 
				 table.addCell(patientList.getAddress());
				 
			     String mobile= Long.toString(patientList.getMobileNumber());
				 table.addCell(mobile);
				  
	             }
            
	           document.add(table);
	         
	        document.close();
	        System.out.println("Done");
	        result=true;
	   }else
	   {
		   System.out.println(" pdf not generated");
		   result=false;
	   }
	    	return result;
	   }
		
	

		//.........................DoctorListPdf....................//
		
		
		public static boolean CreateDoctorListPdf(String PdfCreatedTime) throws FileNotFoundException, DocumentException
		{
			
	    	boolean result;   
	    	   
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
	    	Date date = new Date();
	    	String currentTime=formatter.format(date);
	    	
	    	String newFormtcurrentTime=currentTime.replace(':','_');
	    	
  	
	    	HospitalDAO hospitalDaoObject = new HospitalDAO();
	    	ArrayList<Employee>doctorObject = new ArrayList<>(hospitalDaoObject.getDoctorList());
	    	
	    	
	    	System.out.println("CurrentTime is:"+ currentTime +"And DoctorListpdfGenerated Time is:"+ PdfCreatedTime );
	    
	    	if(PdfCreatedTime.equals(currentTime))
	    	{
	    		String fileName="E:/HospitalInfoPdf/DoctorListPdf/DoctorList_.pdf";
		    	
		    	int lastDotIndex = fileName.lastIndexOf('.');
		    	System.out.println("LastIndex of :"+ lastDotIndex);
		    	
		    	String newFileName = fileName.substring(0, lastDotIndex ) + todayDate + "_" +newFormtcurrentTime + fileName.substring(lastDotIndex);
		    	
		    	System.out.println("new Frmt current time:"+newFormtcurrentTime);
		    	System.out.println("subString is:"+ fileName.substring(lastDotIndex));
		    	System.out.println(" New File Name is: "+ newFileName);
		    	
	    		
	    	Document document = new Document();
	    	
	        PdfWriter.getInstance(document, new FileOutputStream(newFileName));
	        
	        document.open();
	        
	        document.add(new Paragraph("DoctorList"));
	        
	        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
   		    LocalDateTime now = LocalDateTime.now(); 	
   		    
   		    document.add(new Paragraph(dtf.format(now)));
	    	
	    	 
	            PdfPTable table = new PdfPTable(5);
	           
	          
	            
	            table.setWidthPercentage(100); //Width 100%
	            table.setSpacingBefore(10f); //Space before table
	            table.setSpacingAfter(10f);//Space after table
	            
	           
	     
	            //Set Column widths
	            float[] columnWidths = {2f, 1f,1f,2f,1.5f};
	            table.setWidths(columnWidths);
	            
  
	            PdfPCell cell = new PdfPCell(new Phrase("EMOPLOYEE NAME"));
	            table.addCell(cell);
	            
	            PdfPCell cell1 = new PdfPCell(new Phrase("JOIN DATE"));
	            table.addCell(cell1);
	            
	            PdfPCell cell2 = new PdfPCell(new Phrase("SSN"));
	            table.addCell(cell2);
	            
	            PdfPCell cell3 = new PdfPCell(new Phrase("DESIGNATION NAME"));
	            table.addCell(cell3);
	            
	            PdfPCell cell4 = new PdfPCell(new Phrase("SPECIALITY"));
	            table.addCell(cell4);
	         
	            		            
			  for(Employee doctorList:doctorObject) {
				  
				 table.addCell(doctorList.getEmployeeName());
				 table.addCell(doctorList.getJoinDate());
				
				 String ssn= Long.toString(doctorList.getSsn());
				 table.addCell(ssn);
				 
				 table.addCell(doctorList.getDesignation().getDesignationName());
				 table.addCell(doctorList.getSpecialties().getSpecialityName());
				
	             }
            
	           document.add(table);
	         
	        document.close();
	        System.out.println("Done");
	        result=true;
	   }else
	   {
		   result=false;
		
	   }
	    	return result;
	   }
		
		//........................NurseListPdf....................//
		

		public static boolean CreateNurseListPdf(String PdfCreatedTime) throws FileNotFoundException, DocumentException
		{
	    	boolean result;   
	    	   
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
	    	Date date = new Date();
	    	String currentTime=formatter.format(date);
	    	
	    	String newFormtcurrentTime=currentTime.replace(':','_');
	    	
  	
	    	HospitalDAO hospitalDaoObject = new HospitalDAO();
	    	ArrayList<Employee>nurseObject = new ArrayList<>(hospitalDaoObject.getNurseList());
	    	
	    	
	    	System.out.println("CurrentTime is:"+ currentTime +"And NurseListpdfGenerated Time is:"+ PdfCreatedTime );
	    
	    	if(PdfCreatedTime.equals(currentTime))
	    	{
	    		String fileName="E:/HospitalInfoPdf/NurseListPdf/NurseList_.pdf";
		    	
		    	int lastDotIndex = fileName.lastIndexOf('.');
		    	System.out.println("LastIndex of :"+ lastDotIndex);
		    	
		    	String newFileName = fileName.substring(0, lastDotIndex ) + todayDate + "_" +newFormtcurrentTime + fileName.substring(lastDotIndex);
		    	
		    	System.out.println("new Frmt current time:"+newFormtcurrentTime);
		    	System.out.println("subString is:"+ fileName.substring(lastDotIndex));
		    	System.out.println(" New File Name is: "+ newFileName);
		    	
	    		
	    	Document document = new Document();
	    	
	        PdfWriter.getInstance(document, new FileOutputStream(newFileName));
	        
	        document.open();
	        
	        document.add(new Paragraph("NurseList"));
	        
	        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
   		    LocalDateTime now = LocalDateTime.now(); 	
   		    
   		    document.add(new Paragraph(dtf.format(now)));
	    	
	    	 
	            PdfPTable table = new PdfPTable(5);
	           
	          
	            
	            table.setWidthPercentage(100); //Width 100%
	            table.setSpacingBefore(10f); //Space before table
	            table.setSpacingAfter(10f);//Space after table
	            
	           
	     
	            //Set Column widths
	            float[] columnWidths = {2f, 1f,1f,2f,1.5f};
	            table.setWidths(columnWidths);
	            
  
	            PdfPCell cell = new PdfPCell(new Phrase("EMOPLOYEE NAME"));
	            table.addCell(cell);
	            
	            PdfPCell cell1 = new PdfPCell(new Phrase("JOIN DATE"));
	            table.addCell(cell1);
	            
	            PdfPCell cell2 = new PdfPCell(new Phrase("SSN"));
	            table.addCell(cell2);
	            
	            PdfPCell cell3 = new PdfPCell(new Phrase("DESIGNATION NAME"));
	            table.addCell(cell3);
	            
	            PdfPCell cell4 = new PdfPCell(new Phrase("SPECIALITY"));
	            table.addCell(cell4);
	         
	            		            
			  for(Employee nurseList:nurseObject) {
				  
				 table.addCell(nurseList.getEmployeeName());
				 table.addCell(nurseList.getJoinDate());
				
				 String ssn= Long.toString(nurseList.getSsn());
				 table.addCell(ssn);
				 
				 table.addCell(nurseList.getDesignation().getDesignationName());
				 table.addCell(nurseList.getSpecialties().getSpecialityName());
				
	             }
            
	           document.add(table);
	         
	        document.close();
	        System.out.println("Done");
	        result=true;
	   }else
	   {
		   result=false;
		
	   }
	    	return result;
	   }
		
		
		//......................EmployeeListPdf.......................//
		
		public static boolean CreateEmployeeListPdf(String PdfCreatedTime) throws FileNotFoundException, DocumentException
		{
			
	    	boolean result;   
	    	   
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
	    	Date date = new Date();
	    	String currentTime=formatter.format(date);
	    	
	    	String newFormtcurrentTime=currentTime.replace(':','_');
	    	
	    	System.out.println("CurrentTime is:"+ currentTime +"And EmployeeListpdfGenerated Time is:"+ PdfCreatedTime );
	    
	    	if(PdfCreatedTime.equals(currentTime))
	    	{
	    		String fileName="E:/HospitalInfoPdf/EmployeeListPdf/EmployeeList_.pdf";
		    	
		    	int lastDotIndex = fileName.lastIndexOf('.');
		    	System.out.println("LastIndex of :"+ lastDotIndex);
		    	
		    	String newFileName = fileName.substring(0, lastDotIndex ) + todayDate + "_" +newFormtcurrentTime + fileName.substring(lastDotIndex);
		    	
		    	System.out.println("new Frmt current time:"+newFormtcurrentTime);
		    	System.out.println("subString is:"+ fileName.substring(lastDotIndex));
		    	System.out.println(" New File Name is: "+ newFileName);
		    	
	    		
	    	Document document = new Document();
	    	
	        PdfWriter.getInstance(document, new FileOutputStream(newFileName));
	        
	        document.open();
	        
	        document.add(new Paragraph("EmployeeList"));
	        
	        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
   		    LocalDateTime now = LocalDateTime.now(); 	
   		    
   		    document.add(new Paragraph(dtf.format(now)));
	    	
	    	 
	            PdfPTable table = new PdfPTable(5);
	           
	          
	            
	            table.setWidthPercentage(100); //Width 100%
	            table.setSpacingBefore(10f); //Space before table
	            table.setSpacingAfter(10f);//Space after table
	            
	           
	     
	            //Set Column widths
	            float[] columnWidths = {2f, 1f,1f,2f,1.5f};
	            table.setWidths(columnWidths);
	            
  
	            PdfPCell cell = new PdfPCell(new Phrase("EMOPLOYEE NAME"));
	            table.addCell(cell);
	            
	            PdfPCell cell1 = new PdfPCell(new Phrase("JOIN DATE"));
	            table.addCell(cell1);
	            
	            PdfPCell cell2 = new PdfPCell(new Phrase("SSN"));
	            table.addCell(cell2);
	            
	            PdfPCell cell3 = new PdfPCell(new Phrase("DESIGNATION NAME"));
	            table.addCell(cell3);
	            
	            PdfPCell cell4 = new PdfPCell(new Phrase("SPECIALITY"));
	            table.addCell(cell4);
	    
	            
	            HospitalDAO hospitalDaoObject = new HospitalDAO();
		    	ArrayList<Employee>employeeObject = new ArrayList<>(hospitalDaoObject.getEmployeeList());
		    	
	            		            
			  for(Employee employeeList:employeeObject) {
				  
				 table.addCell(employeeList.getEmployeeName());
				 table.addCell(employeeList.getJoinDate());
				
				 String ssn= Long.toString(employeeList.getSsn());
				 table.addCell(ssn);
				 
				 table.addCell(employeeList.getDesignation().getDesignationName());
				 table.addCell(employeeList.getSpecialties().getSpecialityName());
				
	             }
            
	           document.add(table);
	         
	        document.close();
	        System.out.println("Done");
	        result=true;
	   }else
	   {
		   result=false;
		
	   }
	    	return result;
	   }
		
		//......................DepartmentListPdf..................//
		
	
		public static boolean CreateDepartmentListPdf(String PdfCreatedTime) throws FileNotFoundException, DocumentException
		{
			 //String PdfCreatedTime=CreatePdf.getPdfCreateTime();
			 
			System.out.println("Contral in department method time is:"+ PdfCreatedTime);
	    	boolean result;   
	    	   
	        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
	    	Date date = new Date();
	    	String currentTime=formatter.format(date);
	    	
	    	String newFormtcurrentTime=currentTime.replace(':','_');
	    	
	    	System.out.println("CurrentTime is:"+ currentTime +"And DepartmentListpdfGenerated Time is:"+ PdfCreatedTime );
	    
	    	if(PdfCreatedTime.equals(currentTime))
	    	{
	    		String fileName="E:/HospitalInfoPdf/DepartmentListPdf/DepartmentList_.pdf";
		    	
		    	int lastDotIndex = fileName.lastIndexOf('.');
		    	System.out.println("LastIndex of :"+ lastDotIndex);
		    	
		    	String newFileName = fileName.substring(0, lastDotIndex ) + todayDate + "_" +newFormtcurrentTime + fileName.substring(lastDotIndex);
		    	
		    	System.out.println("new Frmt current time:"+newFormtcurrentTime);
		    	System.out.println("subString is:"+ fileName.substring(lastDotIndex));
		    	System.out.println(" New File Name is: "+ newFileName);
		    	
	    		
	    	Document document = new Document();
	    	
	        PdfWriter.getInstance(document, new FileOutputStream(newFileName));
	        
	        document.open();
	        
	        document.add(new Paragraph("DepartmentList"));
	        
	        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");  
   		    LocalDateTime now = LocalDateTime.now(); 	
   		    
   		    document.add(new Paragraph(dtf.format(now)));
	    	
	    	 
	            PdfPTable table = new PdfPTable(2);
	           
	          
	            
	            table.setWidthPercentage(80); //Width 100%
	            table.setSpacingBefore(10f); //Space before table
	            table.setSpacingAfter(10f);//Space after table
	            
	           
	     
	            //Set Column widths
	            float[] columnWidths = {1.5f,2f};
	            table.setWidths(columnWidths);
	            
  
	            PdfPCell cell = new PdfPCell(new Phrase("DEPARTMENT NAME"));
	            table.addCell(cell);
	            
	            PdfPCell cell1 = new PdfPCell(new Phrase("HEAD OF DEPARTMENTNAME"));
	            table.addCell(cell1);
	    
	            
	            HospitalDAO hospitalDaoObject = new HospitalDAO();
		    	ArrayList<Department>departmentObject = new ArrayList<>(hospitalDaoObject.getDepartmentList());
		    	
	            		            
			  for(Department departmentList:departmentObject) {
				  
				 table.addCell(departmentList.getDepartmentName());
				 
				 table.addCell(departmentList.getHeadOfDepartment());
				
				
	             }
            
	           document.add(table);
	         
	        document.close();
	        System.out.println("Done");
	        result=true;
	   }else
	   {
		   result=false;
		
	   }
	    	return result;
	   }
		  
	    	  public String doSomeOperation(String propertyFileName) {

	    		  String propValue=""; 
	    		  
	    		  try
	    		  {
	    		InputStream inputStream= getClass().getClassLoader()
	    	                .getResourceAsStream("/"+propertyFileName);
	    		
	    		System.out.println("inputstrem is :" + inputStream );
	    	      
	    		   Properties properties = new Properties(); 
	    	       	
	    	        properties.load(inputStream);
	    	        
	    	       System.out.println("File vlaue is:"+  properties.getProperty("1"));
	    	    
	    	       propValue = properties.getProperty("1");
	    	        
	    	        System.out.println("Property value is: " + propValue);
	    	        
	    	        inputStream.close();
	    	        
	    	  }catch(Exception e)
	    		  {
	    		  System.out.println("Exception generated:"+ e.getMessage());
	    		  }
	    	        return propValue;
	    	    } 

}
			
