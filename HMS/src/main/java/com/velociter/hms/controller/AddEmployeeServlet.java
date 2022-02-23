package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.velociter.hms.database.HospitalDAO;
import com.velociter.hms.model.Designation;
import com.velociter.hms.model.Employee;
import com.velociter.hms.model.Specialties;



public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Employee  employeeObject = new Employee();

//		String speciality=request.getParameter("specialties");
//		
//		
//		if(speciality=="")
//		{
//			
//		Designation designation = new Designation();
//		Specialties specialties=new Specialties();
//		
//		employeeObject.setEmployeeName(request.getParameter("name"));
//		designation.setDesignationName(request.getParameter("designation"));
//		//specialties.setSpecialityName(request.getParameter("specialties"));
//		//employeeObject.setDesignationName(request.getParameter("designation"));
//	    employeeObject.setSsn(Long.parseLong(request.getParameter("ssn")));
//		employeeObject.setJoinDate(request.getParameter("joindate"));	
//		//employeeObject.setSpeciality("NA");
//		System.out.println("specility is :"+ speciality);
//		
//		int specialityId = Integer.parseInt(request.getParameter("specialityId"));
//		specialties.setSpecialityId(specialityId);
//		String specialityName = request.getParameter("specialties");
//		specialties.setSpecialityName(specialityName);
//		employeeObject.setSpecialties(specialties);
//		
		
//		
//		int did = Integer.parseInt(request.getParameter("d_Id"));
//		designation.setDesignationId(did);
//		String dname = request.getParameter("designation");
//		designation.setDesignationName(dname);
//		employeeObject.setDesignation(designation);
//		
//		}else
		
		Specialties specialties=new Specialties();	
		Designation designation = new Designation();
			
		employeeObject.setEmployeeName(request.getParameter("name"));
		designation.setDesignationName(request.getParameter("designation"));
		//specialties.setSpecialityName(request.getParameter("specialties"));
		employeeObject.setSsn(Long.parseLong(request.getParameter("ssn")));
		employeeObject.setJoinDate(request.getParameter("joindate"));
		//employeeObject.setSpeciality(request.getParameter("specialties"));
		
		int specialityId = Integer.parseInt(request.getParameter("specialityId"));
		specialties.setSpecialityId(specialityId);
		String specialityName = request.getParameter("specialties");
		specialties.setSpecialityName(specialityName);
		employeeObject.setSpecialties(specialties);
		
		
		
		int did = Integer.parseInt(request.getParameter("d_Id"));
		designation.setDesignationId(did);
		String dname = request.getParameter("designation");
		designation.setDesignationName(dname);
		
		employeeObject.setDesignation(designation);
		
		try {
		    	HospitalDAO hospitalDaoObject = new HospitalDAO();
		    	
		    if(hospitalDaoObject.checkSsnExist(employeeObject)==false)
		    {
		    
		    	out.print("False");
		    	return;
		    }
		    else if (hospitalDaoObject.addEmployee(employeeObject) != 0) {
		    	
		    	out.print("True");
				return;

			} else {
				out.println("<h3 style='color: red;'>Add Employee  Operation is Faild</h3>");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}

}
