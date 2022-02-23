package com.velociter.hms.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.hms.database.CreatePdf;
import javax.servlet.*;  

public class GneratePdfServlet extends HttpServlet  {
private static final long serialVersionUID = 1L;

public void init() throws ServletException
{
	 ServletContext context=getServletContext(); 
	 String fileName=context.getInitParameter("propfile");
	 
    System.out.println("fileName is:"+ fileName);

	 
	 CreatePdf createPdfObj=new CreatePdf();
	 String PdfCreatedTime=createPdfObj.doSomeOperation(fileName);
	 System.out.println("pdf Time is:"+ PdfCreatedTime); 
	  try
	     {
//		   if(CreatePdf.generatedPdf(PdfCreatedTime)==true)
//		     {
//		    	System.out.println(" Pdf Generated"); 
//		     }else
//		     {
//		    System.out.println("Not Generated");	 
//		     }
//		   
//		   if(CreatePdf.CreateDepartmentListPdf(PdfCreatedTime)==true)
//		     {
//		    	System.out.println(" Pdf Generated"); 
//		     }else
//		     {
//		    System.out.println("Not Generated");	 
//		     }
//		   
//	     if(CreatePdf.CreateDoctorListPdf(PdfCreatedTime)==true)
//	     {
//	    	System.out.println(" Pdf Generated");
//	    	
//	     }else
//	     {
//	    	 
//	    System.out.println("Pdf Not Generated");
//	    
//	     } 
	    if(CreatePdf.CreateNurseListPdf(PdfCreatedTime)==true)
	     {
	    	
	    	System.out.println(" Pdf Generated");
	    	
	     }else{
	    	 
	    System.out.println("Pdf Not Generated");
	    
	     }
	    if(CreatePdf.CreateEmployeeListPdf(PdfCreatedTime)==true)
	     {
	    	
	    	System.out.println(" Pdf Generated");
	    	
	     }else
	     {
	    	 
	    System.out.println("Pdf Not Generated");
	    
	     }
	     
	     }catch(Exception e)
	     {
	    	 System.out.println("Exception occures:"+ e.getMessage());
	     }
	  
		}  

}
