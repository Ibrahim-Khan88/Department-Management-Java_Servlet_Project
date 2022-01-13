package com.budget;

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

import com.connection.GetConnection;

/**
 * Servlet implementation class deleteBudget
 */
@WebServlet("/Budget/deleteBudget")
public class deleteBudget extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		Statement st;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		int count;
		String query;
		query = "DELETE FROM budget WHERE Id='" + request.getParameter("x1") + "'";


		try {

			st = connection.createStatement();
			count = st.executeUpdate(query);

			if (count == 1) {

				out.print("<script> message('Successfully deleted','Budgetshow.jsp'); </script>");				
			}
			    
			else
				out.print("<script> message('Fail to delete','Budgetshow.jsp'); </script>");

		} catch (SQLException e) {
			out.print("<script> message('Fail to delete','Budgetshow.jsp'); </script>");
		}
		
	}



}
