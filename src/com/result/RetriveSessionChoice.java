package com.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.mysql.jdbc.DatabaseMetaData;

/**
 * Servlet implementation class RetriveSessionChoice
 */
@WebServlet("/Result/RetriveSessionChoice")
public class RetriveSessionChoice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ResultSet tables = null;
		
		out.println("<script>	\r\n" + "	function exist(){\r\n" + "		alert('No records Found with this name.You should first create this record');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		out.println("<script>	\r\n" + "	function forward(){\r\n" +  "		var outString = \"RetriveResult.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		String year = request.getParameter("year");
		String semester = request.getParameter("semester");
		String table_name = year + "_" + semester + "_result";
		session.setAttribute("tableName", table_name);

		// execute a query to check with this name a table is exists or not
		try {

			DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
			tables = dbm.getTables(null, null, table_name, null);

			if (tables.next()) {
				out.print("<script> forward(); </script>");
				/*
				 * RequestDispatcher rd = request.getRequestDispatcher("RetriveResulr.jsp");
				 * rd.forward(request, response);
				 */

			}
			else
			{
				session.setAttribute("showalert", true);
				out.print("<script> exist(); </script>");
				/*
				 * RequestDispatcher rd =
				 * request.getRequestDispatcher("RetriveSessionChoice.jsp"); rd.forward(request,
				 * response);
				 */
				//System.out.println("You can create this records.Because there is a records with this name");
			}

		} catch (Exception e) {
			out.println("exception " + e.getMessage() + " exception exception");
		}

	}

}
