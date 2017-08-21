package com.model_and_controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("µ÷ÓÃloginservlet");
		PrintWriter out =response.getWriter();
		if(username.equals("admin") && password.equals("123456")) {
			out.write("{\"result\":\"true\"}");
//			response.sendRedirect("Admin.jsp");
		}
		else {
			out.write("{\"result\":\"false\"}");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
