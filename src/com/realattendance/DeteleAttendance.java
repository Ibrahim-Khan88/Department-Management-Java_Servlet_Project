package com.realattendance;

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
 * Servlet implementation class DeteleAttendance
 */
@WebServlet("/RealAttendance/DeteleAttendance")
public class DeteleAttendance extends HttpServlet {
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st,st1,st2;
		
		
		out.println(
				"<script>	\r\n" + "	function seccess(){\r\n" + "		alert('Data is successfully deleted');\r\n"
						+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
						+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println("<script>	\r\n" + "	function fail(){\r\n" + "		alert('Data is fail to delete');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		out.println("<script>	\r\n" + "	function exist(){\r\n" + "		alert('Data is not exist');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
		
		String query,value,id,courseCode,date,tableName,year;
		int count = 0,num;
		
		id = request.getParameter("id");
		courseCode = request.getParameter("courseName");
		date = request.getParameter("date");		
		value = request.getParameter("value");
		year = (String) session.getAttribute("year");
		
		
		if (year.equals("1st"))
			tableName = "attendance1st";
		else if (year.equals("2nd"))
			tableName = "attendance2nd";
		else if (year.equals("3rd"))
			tableName = "attendance3rd";
		else
			tableName = "attendance4th";
		
		if (value.equals("1")) {
			
			query = "select COUNT(*) from " + tableName + " where id='" + id + "' and courseCode='" + courseCode + "' and date='" + date +"'" ;
			ResultSet rs2;
			
			try {
				st1 = connection.createStatement();
				rs2 = st1.executeQuery(query);
			    num = 0;
				rs2.next();
				num = rs2.getInt(1);
				
				if (num == 1) {
					query = "DELETE FROM " + tableName + " WHERE id='" + id + "' and courseCode='" + courseCode + "' and date='" + date +"'" ;
					st = connection.createStatement();
				    count = st.executeUpdate(query);
				    
				    if (count == 1) out.print("<script> seccess(); </script>");
				    else out.print("<script> fail(); </script>");
				}
				else {
					out.print("<script> exist(); </script>");
				}
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}		
			
		}
		else if (value.equals("2")) {
			
			count = 0;
			query = "DELETE FROM " + tableName ;
			try {
				
							
				st1 = connection.createStatement();
			    count = st1.executeUpdate(query);
			    
			    if (count >= 1) out.print("seccessfully Deleted All Data");
			    else out.print("Fail to Delete All the data");
			    
				
				
			} catch (SQLException e) {
			
			}
			
			
		}
		
		out.print("\n" + count + " " + value + " " + tableName);
		
	}

}
