package com.result;

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
 * Servlet implementation class AddValueInsert
 */
@WebServlet("/Result/AddValueInsertservlet")
public class AddValueInsertservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		out.println(
				"<script>	\r\n" + "	function seccess(){\r\n" + "		alert('Data is successfully added');\r\n"
						+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
						+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println("<script>	\r\n" + "	function fail(){\r\n" + "		alert('Data is fail to add');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		
		out.println("<script>	\r\n" + "	function exist(){\r\n" + "		alert('You can not insert value with this id.Because there is a records with this name.');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		String course;
		String table_name = (String) session.getAttribute("tableName");
		int total_course = (int) session.getAttribute("totalcourse");
		String student_id = request.getParameter("id");

		String query;
		query = "select * from " + table_name + " where studentid='"+ student_id + "'"; 
		
		System.out.println(query);
		
		try {
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(query);
			
			if (!rs1.next()) {
				
				
				query = "INSERT INTO " + table_name + " VALUES ( '" + student_id + "',";

				for (int i = 1; i <= total_course; i++) {

					course = request.getParameter("course" + i);
					
					if (i != total_course) {
						
						query += "'" + course + "',";
						
					} else {

						query += "'" + course + "')";
						
					}

					// table_query += temp;
				}
				
				
				try {
					
					Statement st = connection.createStatement();
					int insert = st.executeUpdate(query);
					
					if (insert != 0) {
						out.print("<script> seccess(); </script>");
					}
					else {
						out.print("<script> fail(); </script>");
					}
					
				}
				catch (Exception e) {
					out.print("<script> fail(); </script>");
				}
				
				
			}
			else {
				System.out.println("exist");
				out.print("<script> exist(); </script>");
			}
			
			
		} catch (SQLException e1) {
			out.print("<script> fail(); </script>");
		}
			

	}

}
