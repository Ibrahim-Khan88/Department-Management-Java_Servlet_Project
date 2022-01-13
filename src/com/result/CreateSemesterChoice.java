package com.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class CreateSemesterChoice
 */
@WebServlet("/Result/CreateSemesterChoice")
public class CreateSemesterChoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		boolean exist = false;
		session.setAttribute("createReault", true);
		
		out.println("<script>	\r\n" + "	function fail(){\r\n" + "		alert('You can not create this records.Because there is a records with this name');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		out.println("<script>	\r\n" + "	function forward(){\r\n" +  "		var outString = \"CreateInsertValue.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		String year = request.getParameter("year");
		String semester = request.getParameter("semester");
		int courses = Integer.parseInt((String)request.getParameter("courses"));
		String table_name = year+ "_" + semester+  "_result";
		
		// execute a query to check with this name a table is exists or not
		try {

			

			DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
			ResultSet tables = dbm.getTables(null, null, table_name, null);
			
			if (!tables.next()) {
				
				session.setAttribute("tableName", table_name);
				session.setAttribute("courses", courses);
				out.print("<script> forward(); </script>");
			}
			else
			{
				//System.out.println("problem " );
				out.print("<script> fail(); </script>");
				
			}
			
		}
		catch(Exception e){
			System.out.println("problem " + e.getMessage());
			out.print("<script> fail(); </script>");
		}
		
		
		
		
	}

}
