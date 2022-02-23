package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.velociter.hms.database.HospitalDAO;
import com.velociter.hms.model.Patient;

public class AddPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		Patient patientObject = new Patient();
		patientObject.setName(request.getParameter("patientname"));
		patientObject.setAddress(request.getParameter("address"));
		patientObject.setMobileNumber(Long.parseLong(request.getParameter("mobilenumber")));

		HospitalDAO hospitalDaoObject = new HospitalDAO();

		if (hospitalDaoObject.addPatient(patientObject) != 0) {
			
//			RequestDispatcher requestDispaterObject = request.getRequestDispatcher("Welcome.jsp");
//			requestDispaterObject.forward(request, response);

		}else {
			out.println("<h3 style='color: red; text-align:center;'>Add patient  Operation is Faild</h4>");
		}
	}

}