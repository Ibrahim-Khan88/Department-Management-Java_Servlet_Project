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
 * Servlet implementation class deleteBudget
 */
@WebServlet("/Book/deleteBook")
public class deleteBook extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		int count;
		String query;
		query = "DELETE FROM book WHERE Id='" + request.getParameter("x1") + "'";
		String year = (String) session.getAttribute("student_year");


		try {

			st = connection.createStatement();
			count = st.executeUpdate(query);

			if (count == 1) {
				out.print("<script> message('Successfully deleted','ShowBook.jsp?year="+ year +"'); </script>");
			}
			    
			else
				out.print("<script> message('Fail to delete','ShowBook.jsp?year="+ year +"'); </script>");

		} catch (SQLException e) {
			out.print("<script> message('Fail to delete','ShowBook.jsp?year="+ year +"'); </script>");
		}
		
	}



}
