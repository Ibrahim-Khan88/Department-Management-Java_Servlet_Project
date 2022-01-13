package com.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;

/**
 * Servlet implementation class updateBudget
 */
@WebServlet("/Book/UpdateBook")
public class UpdateBook extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String year, courseCode, query,BookName, courseName, id;
		id = (String) session.getAttribute("bookId");
		BookName = request.getParameter("BookName");
		 year = (String) session.getAttribute("Bookyear");
		/*
		 * courseCode = request.getParameter("courseCode"); courseName =
		 * request.getParameter("courseName"); year = (String)
		 * session.getAttribute("Bookyear");
		 */

		query = "UPDATE book SET BookName='"+ BookName +"' WHERE Id='" + id +"'";
		System.out.print(query);

		try {
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);

			if (count == 1) {				
				out.print("<script> message('Successfully updated','ShowBook.jsp?year="+ year +"'); </script>");
			} else {
				out.print("<script> message('Fail to update','ShowBook.jsp?year="+ year +"'); </script>");
			}

		} catch (SQLException e1) {
			out.print("<script> message('Fail to update','ShowBook.jsp?year="+ year + "'); </script>");
		}
		
		
	}

}
