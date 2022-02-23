package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.hms.database.HospitalDAO;
import com.velociter.hms.model.Appointment;
import com.velociter.hms.model.Designation;
import com.velociter.hms.model.Employee;



public class AddAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		Employee employee1 =new Employee();
		
		Appointment appointmentObject = new Appointment();
		
		appointmentObject.setPatientName(request.getParameter("patientappointmentname"));
		appointmentObject.setCity(request.getParameter("cityname"));
		appointmentObject.setMobileNumber(Long.parseLong(request.getParameter("appointmentmobilenumber")));
		appointmentObject.setAppointmentDate(request.getParameter("appointmentdate"));
		
		 System.out.println("EMP ID  IS:" + request.getParameter("empId"));
		 
		 int  empId = Integer.parseInt(request.getParameter("empId"));
	//	 appointmentObject.set
		
    	 employee1.setEmployeeId(empId);
	
    	 String doctorName = request.getParameter("doctorname");
	    
	   
	    
	    employee1.setEmployeeName(doctorName);
	  	employee1.setJoinDate(request.getParameter("docdate"));
	  	
		appointmentObject.setEmployee(employee1);
		

		HospitalDAO hospitalDaoObject = new HospitalDAO();
		
		if(hospitalDaoObject.isPatientAppointmentMobileNumberExist(appointmentObject)==false)
		{
			out.print("False");
			System.out.println("EMPID is :"+ empId);
			System.out.println("Doctor Name from getparameter is:" + request.getParameter("doctorname"));
			System.out.println("Join date comming is:" + request.getParameter("docdate"));
			return;
		}else
		{
		
		if(hospitalDaoObject.addAppointment(appointmentObject)==1)
		{
			System.out.println("EMPID is :"+ empId);
			System.out.println("Doctor Name from getparameter is:" + request.getParameter("doctorname"));
			System.out.println("Join date comming is:" + request.getParameter("docdate"));
			out.print("True");
		}
		else
		{
			out.println("Unable to add Appointment record ");
		}
	   }
	}

}
