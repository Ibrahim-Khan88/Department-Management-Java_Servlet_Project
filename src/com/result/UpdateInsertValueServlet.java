package com.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;

/**
 * Servlet implementation class UpdateInsertValueServlet
 */
@WebServlet("/Result/UpdateInsertValueServlet")
public class UpdateInsertValueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String course;

		out.println("<script>	\r\n" + "	function fail(){\r\n" + "		alert('Data is fail to update');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println(
				"<script>	\r\n" + "	function seccess(){\r\n" + "		alert('Data is successfully updated');\r\n"
						+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
						+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println("<script>	\r\n" + "	function exist(){\r\n"
				+ "		alert('No records Found with this id.You should first create this record');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		

		String table_name = (String) session.getAttribute("tableName");
		String student_id = request.getParameter("studentid");
		String courseName = request.getParameter("course");
		String result = request.getParameter("result");
		String query;
		boolean exist = false;
		int total_course;

		
		
		// execute a query to check whether a record with this Id and Course is exists or not
		// if find then exist variable value will be true
		query = "select * from " + table_name + " where studentid='" + student_id + "'";
		try {
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(query);
			if (rs1.next()) {
				query = "select * from " + table_name;
				Statement st2 = connection.createStatement();
				ResultSet rs2 = st2.executeQuery(query);
				rs2.next();
				rs2.next();
				total_course = rs2.getInt(1) * -1;
				for (int i = 2; i <= total_course + 1; i++) {
					if (rs2.getString(i).equals(courseName)) {
						exist = true;
						break;
					}
					// System.out.println(" courses1[i-2] " + courses1[i-2] + " ");
				}
			} 

		} catch (Exception e) {
			out.print("<script> fail(); </script>");
		}
		
		
		
		

		// here is the update section
		if (exist) {

			query = "  UPDATE   " + table_name + " SET " + courseName + "='" + result + "' WHERE studentid = '"
					+ student_id + "'";

			try {

				Statement st = connection.createStatement();
				int update = st.executeUpdate(query);

				if (update != 0) {
					out.print("<script> seccess(); </script>");
				} else {
					out.print("<script> fail(); </script>");
				}

			} catch (Exception e) {
				out.print("<script> fail(); </script>");
			}
		}else {
			out.print("<script> exist(); </script>");
		}

	}

}
