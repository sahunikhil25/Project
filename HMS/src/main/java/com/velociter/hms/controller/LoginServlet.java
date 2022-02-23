package com.velociter.hms.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.velociter.hms.database.LoginDAO;
import com.velociter.hms.model.Admin;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		try {

			LoginDAO connection = new LoginDAO();
			Admin admin = connection.loginAdmin(name, password);
			if (admin != null) {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				response.sendRedirect("Welcome.jsp");

			} else {
				response.sendRedirect("InvalidMessage.jsp");
			}

		} catch (Exception e) {
			out.println(
					"<h4 align='center'  style='color: red;'>Unable To Connect With Server ! Please Try Again After Some Time</h4>");
			e.printStackTrace();
		}

	}
}
