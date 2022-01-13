package com.budget;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
 * Servlet implementation class addBudget
 */
@WebServlet("/Budget/addBudget")
public class addBudget extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String Type, Amount, student_id, query, Date, Description;
		Type = request.getParameter("Type");
		Amount = request.getParameter("Amount");
		Date = request.getParameter("Date");
		Description = request.getParameter("Description");

		query = "INSERT INTO budget( Date, Amount, Type, Description) VALUES ('" + Date + "','" + Amount + "','" + Type
				+ "','" + Description + "')";
		System.out.print(query);

		try {
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);

			if (count == 1) {				
				out.print("<script> message('Successfully Added','AddBudget.jsp'); </script>");
			} else {
				out.print("<script> message('Fail to add','AddBudget.jsp'); </script>");
			}

		} catch (SQLException e1) {
			out.print("<script> message('Fail to add','AddBudget.jsp'); </script>");
		}

	}

}
