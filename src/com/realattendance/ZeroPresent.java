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
 * Servlet implementation class ZeroPresent
 */
@WebServlet("/SemesterCourse/ZeroPresent")
public class ZeroPresent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st,st1,st2;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String year, query,BookName, courseCode;
		int zeroPresent, databasePresentZero, totalClass, update;
		zeroPresent = Integer.parseInt(request.getParameter("zeroPresent"));
		courseCode = (String) session.getAttribute("courseCode");
		year = (String) session.getAttribute("year");
		
		
		
		try {
		// IF that course is exist or not
		query = "select * from totalclass where courseCode ='" + courseCode + "'";
		st = connection.createStatement();
		ResultSet rs = st.executeQuery(query);
		databasePresentZero = 0;

		// If exist
		if (rs.next()) {
			databasePresentZero = rs.getInt("presentZero");
			totalClass = rs.getInt("totalClass");
			
			
			// updating zeroPresent
			databasePresentZero += zeroPresent;
			
			// updating totalClass
			totalClass += zeroPresent; 

			query = "UPDATE totalclass SET totalClass='" + totalClass + "', presentZero='" + databasePresentZero + "' WHERE courseCode = '"
					+ courseCode + "'";
			
		    st1 = connection.createStatement();
			update = st1.executeUpdate(query);
			if (update == 1) {
				out.print("Updated");
				out.print("<script> message('Successfully Updated','http://localhost:8080/Project2/SemesterCourse/TeacherCourseDetail.jsp'); </script>");
			} else {
				out.print("<script> message('An error is occured','http://localhost:8080/Project2/SemesterCourse/TeacherCourseDetail.jsp'); </script>");
			}

		}
		// not exist
		else {
			// creating new row with that course name in totalclass table...
			query = "INSERT INTO totalclass VALUES ('" + year + "','" + courseCode + "','" + zeroPresent
					+ "','" + zeroPresent + "')";
			Statement st4 = connection.createStatement();
			update = st4.executeUpdate(query);
			if (update == 1) {
				out.print("<script> message('Successfully Updated','http://localhost:8080/Project2/SemesterCourse/TeacherCourseDetail.jsp'); </script>");
				
			} else {
				out.print("<script> message('An error is occured','http://localhost:8080/Project2/SemesterCourse/TeacherCourseDetail.jsp'); </script>");
			}

		}
		} catch (SQLException e1) {
			out.print("<script> message('An error is occured','http://localhost:8080/Project2/SemesterCourse/TeacherCourseDetail.jsp'); </script>");
		}
		
		
	}

}
