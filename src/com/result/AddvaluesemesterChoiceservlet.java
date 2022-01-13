package com.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

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
 * Servlet implementation class AddvaluesemesterChoice
 */
@WebServlet("/Result/AddvaluesemesterChoiceservlet")
public class AddvaluesemesterChoiceservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String query;
		int total_course,i;
		ResultSet tables = null;
		
		out.println("<script>	\r\n" + "	function exist(){\r\n" + "		alert('No records f ound with this name.You should first create this record');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		out.println("<script>	\r\n" + "	function forward(){\r\n" +  "		var outString = \"AddValueInsert.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		

;
		String year = request.getParameter("year");
		String semester = request.getParameter("semester");
		String table_name = year+ "_" + semester+  "_result";
		
		
		// execute a query to check with this name a table is exists or not
		try {

			DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
		    tables = dbm.getTables(null, null, table_name, null);
		    		    

			if (tables.next()) {
				
				Statement st = connection.createStatement();
				query = "select * from " + table_name;
				ResultSet rs = st.executeQuery(query);
				rs.next();
				rs.next();
				
				total_course = rs.getInt(1) * -1;
				String[] courses1 = new String[total_course];
				
				for (i=2; i <= total_course+1; i++) {
					courses1[i-2] = rs.getString(i);
					//System.out.println(" courses1[i-2] " + courses1[i-2] + " ");
				}
				
				session.setAttribute("courses", courses1);
				session.setAttribute("totalcourse", total_course);
				session.setAttribute("tableName", table_name);
				
				//System.out.println(" total_course " +  total_course +  " "  + " ");
				out.print("<script> forward(); </script>");
				/*
				 * RequestDispatcher rd = request.getRequestDispatcher("AddValueInsert.jsp");
				 * rd.forward(request, response);
				 */
			}
			else
			{
				out.print("<script> exist(); </script>");
				/*
				 * RequestDispatcher rd =
				 * request.getRequestDispatcher("AddValuesemesterchoice.jsp");
				 * rd.forward(request, response); System.out.println("no record found");
				 */
			}
		    
						
		}
		catch(Exception e){
			out.println("exception " + e.getMessage() + " exception exception");
		}
		
		
		
		
		
		
		
		
		
	}

}
