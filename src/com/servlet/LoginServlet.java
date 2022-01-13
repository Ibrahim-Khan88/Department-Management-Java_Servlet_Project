package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("name");
		String password = request.getParameter("password");
	    PrintWriter out = response.getWriter();
		
		LoginDao logindao = new LoginDao();
		
		if (logindao.check(name, password)) {
			
			out.println("u login sess");
			
		}
		
		else {
			out.println("sorry");
		}
		
		
	}

}
