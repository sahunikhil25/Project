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
    	System.out.println(request.getParameter("name2"));
    	
    	nurseObject.setPosition(request.getParameter("position2"));
    	System.out.println(request.getParameter("position2"));
    	
    	System.out.println(request.getParameter("ssn2"));
    	nurseObject.setSsn(Long.parseLong(request.getParameter("ssn2")));
    	
    	nurseObject.setJoinDate(request.getParameter("joindate2"));
    	System.out.println(request.getParameter("joindate2"));
    	HospitalDAO hospitalDaoObject=new HospitalDAO();
    	
//    	if("yes".equals(registerYes))
//    	{
    	if(hospitalDaoObject.addNurse(nurseObject)!=0)
    	{
//    		RequestDispatcher requestDispaterObject = request.getRequestDispatcher("SuccessMessage.jsp");
//			requestDispaterObject.include(request, response);
	
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


