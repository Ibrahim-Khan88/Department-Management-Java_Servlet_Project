package com.result;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;

/**
 * Servlet implementation class CreateInsertValue
 */
@WebServlet("/Result/CreateInsertValue")
public class CreateInsertValue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String course,credit,table_query;
		
		
		out.println(
				"<script>	\r\n" + "	function seccess(){\r\n" + "		alert('Data is successfully created');\r\n"
						+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
						+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println("<script>	\r\n" + "	function fail(){\r\n" + "		alert('An error is occured');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		 
		
		int subjects = (int) session.getAttribute("courses") * -1;
		String table_name = (String) session.getAttribute("tableName");
		String insert_query = "INSERT INTO " + table_name + " VALUES ( '-1',";
		String insert_course_query = "INSERT INTO " + table_name + " VALUES ( '" + subjects + "',";
		table_query = "create table " + table_name + " ( studentid varchar(12),";
	    subjects = subjects*-1;
		
		
		for (int i=1; i<=subjects; i++) {		
			
			course = request.getParameter("Course_" + i);
			credit = request.getParameter("Credit_" + i); 
			if (i != subjects) {
				table_query += course + " varchar(20),";
				insert_course_query += "'" + course + "',";
				insert_query += "'" + credit + "',";
			}
			else {
				table_query += course + " varchar(20), primary key (studentid) );";
				insert_query += "'" + credit + "')";
				insert_course_query += "'" + course + "')";
			}
				
			//table_query += temp;			
		}
		
		//out.println(subjects +  " " + table_query);
		
		
		try {
			
			/*
			 * System.out.println(table_query + " \n");
			 * System.out.println(insert_course_query + " \n");
			 * System.out.println(insert_query + " \n");
			 */

			java.sql.Statement st = connection.createStatement();
			boolean pass = st.execute(table_query);

			int count1 = st.executeUpdate(insert_course_query);
			int count = st.executeUpdate(insert_query);
			
			System.out.println("pass")
			;
			
			
			if (count != 0 && count1 != 0) {
				out.print("<script> seccess(); </script>");
			}
			else {
				out.print("<script> fail(); </script>");
			}
			
			
			out.println(table_query + " " + count +"  " + count1);
			out.println(insert_query);
		}
		catch (Exception e) {
			out.print("<script> fail(); </script>");
		}
		
		//drop table 2016_17_3_1_result
		
		
	}

}
