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
 * Servlet implementation class ContactSubmit
 */
@WebServlet("/Contact/ContactSubmit")
public class ContactSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String year, comment, query,name, gmail;
		name = request.getParameter("name");
		gmail = request.getParameter("gmail");
		comment = request.getParameter("comment");

		query = "INSERT INTO comment(Name, Gamil, Comment, Seen) VALUES ('" + name 
				+ "','" + gmail + "','" + comment + "','0')";
		System.out.print(query);

		try {
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);

			if (count == 1) {				
				out.print("<script> message('We will give you feedback as soon as possible','http://localhost:8080/Project2/Home.jsp'); </script>");
			} else {
				out.print("<script> message('Fail to send','http://localhost:8080/Project2/Contact/Contact.jsp'); </script>");
			}

		} catch (SQLException e1) {
			out.print("<script> message('Fail to send','http://localhost:8080/Project2/Contact/Contact.jsp'); </script>");
		}
		
		
	}

}
