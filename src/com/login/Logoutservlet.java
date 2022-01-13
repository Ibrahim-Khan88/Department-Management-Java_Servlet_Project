package com.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logoutservlet
 */
@WebServlet("/Logoutservlet")
public class Logoutservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("login", false);
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		
		out.print("<script> forward('Home.jsp'); </script>");
		
	}

}
