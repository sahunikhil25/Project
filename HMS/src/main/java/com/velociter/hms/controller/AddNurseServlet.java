package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.velociter.hms.database.HospitalDAO;
import com.velociter.hms.model.Nurse;

public class AddNurseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
    	PrintWriter out=response.getWriter();
    	
    	Nurse nurseObject=new Nurse();
    	
    	
    	String registerYes=request.getParameter("flexRadioDefault");
    	nurseObject.setName(request.getParameter("name2"));
    	
    	nurseObject.setPosition(request.getParameter("position2"));
    	
    	nurseObject.setSsn(Long.parseLong(request.getParameter("ssn2")));
    	
    	nurseObject.setJoinDate(request.getParameter("joindate2"));
    	
    	HospitalDAO hospitalDaoObject=new HospitalDAO();
    	
//    	if("yes".equals(registerYes))
//    	{
    	if(hospitalDaoObject.addNurse(nurseObject)!=0)
    	{
//    		RequestDispatcher requestDispaterObject = request.getRequestDispatcher("SuccessMessage.jsp");
//			requestDispaterObject.include(request, response);
			/*
			 * Document document = new Document(); try { PdfWriter.getInstance(document, new
			 * FileOutputStream("sample1.pdf")); document.open(); document.add(new
			 * Paragraph("Sample 1: Hello, this is Concretepage.com")); }catch(Exception e)
			 * { System.out.println("Error Message From PDFDOCS : "+e.getMessage()); }
			 * document.close(); System.out.println("Done");
			 */
		}else
		{
			out.println("<h4 style='color: red;'>Add patient  Operation is Faild</h4>");
			
		}
    	}
//    	else
//    	{
//    		out.println("<h2 style='color:red;text-align:center;'>unable to Add Nurse</h2>");
//    	}
    
	}


