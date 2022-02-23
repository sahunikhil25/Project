package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.hms.database.HospitalDAO;
import com.velociter.hms.database.Operation;
import com.velociter.hms.model.Patient;

public class AddPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected  void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		Patient patientObject = new Patient();
		patientObject.setName(request.getParameter("patientname"));
		patientObject.setAddress(request.getParameter("address"));
		patientObject.setMobileNumber(Long.parseLong(request.getParameter("mobilenumber")));
//		patientObject.setFirstName("jau ");
//		patientObject.setLastName("kalu ");

		//patientObject=Operation.splitAndUpdateNames(patientObject,patientObject.getName());
		
		Operation.getAllNames();
		
		HospitalDAO hospitalDaoObject = new HospitalDAO();
		
		//hospitalDaoObject.createColumns();

		
		if(hospitalDaoObject.checkExistingMobile(patientObject)==false)
		{
			
//			 String data= "Mobile number already Register";
//			 String status ="false";
//			response.setContentType("html/css"); 
//			response.setCharacterEncoding("UTF-8"); 
//			response.getWriter().print(data);
//			response.getWriter().print(status);
//			return;
		
			out.print("False");
			return;
		}
		else
		{
			      if (hospitalDaoObject.addPatient(patientObject) != 0) {
			      // Operation.getAllNames(); 
			   
//			    	 String data="record successfully added";
//			    	 String status1 ="true";
				 // out.println("<h1><span class=text-success>new mobile number</span></h1>");
//			    	    response.setContentType("text/plain"); 
//						response.setCharacterEncoding("UTF-8"); 
//						response.getWriter().print(data);
//						response.getWriter().print(status1);
			    	  
			    	  out.print("True");  
				      return;

				}else {
					
					out.println("<h3 style='color: red; text-align:center;'>Add patient  Operation is Faild</h4>");
				}
			
		}
	}

}