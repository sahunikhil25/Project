package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.hms.database.HospitalDAO;
import com.velociter.hms.database.Operation;
import com.velociter.hms.model.Department;

public class DepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		Department departmentObj = new Department();

		departmentObj.setDepartmentName(request.getParameter("departmentname"));
		departmentObj.setHeadOfDepartment(request.getParameter("headofdepartment"));

		HospitalDAO hospitalObject = new HospitalDAO();

		if (hospitalObject.addDepartment(departmentObj) != 0) {
             
			RequestDispatcher requestDispaterObject = request.getRequestDispatcher("Welcome.jsp");
			requestDispaterObject.include(request, response);
		} else {
			out.println("<h3 style='color: red;'>Add Department  Operation is Faild</h3>");
		}

	}
}
