package com.contact;

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
 * Servlet implementation class DeleteComment
 */
@WebServlet("/Contact/DeleteComment")
public class DeleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String id, query;
		id = request.getParameter("id");

		try {
			query = "DELETE FROM comment WHERE id='" + id + "'";
			
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);

			if (count != 1) {
				out.print(
						"<script> message('Fail to delete','http://localhost:8080/Project2/Contact/ContactShow.jsp'); </script>");
			}
			else {
				out.print(
						"<script> forward('http://localhost:8080/Project2/Contact/ContactShow.jsp'); </script>");
			
			}

		} catch (SQLException e1) {
			out.print(
					"<script> message('Fail to delete','http://localhost:8080/Project2/Contact/ContactShow.jsp'); </script>");
		}

	}

}
