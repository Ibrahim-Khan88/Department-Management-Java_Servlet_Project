package com.semesterCourses;

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
 * Servlet implementation class Deletesemester
 */
@WebServlet("/SemesterCourse/Deletesemester")
public class Deletesemester extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st,st1,st2;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		String year, courseCode, totalClass,query;
		int count;
		
		
		courseCode = request.getParameter("courseCode");
				
		
		query = "DELETE FROM totalclass WHERE courseCode='" + courseCode + "'" ;
		try {
			
			st = connection.createStatement();
		    count = st.executeUpdate(query);
		    
		    if (count == 1) out.print("<script> message('Seccessfully Deleted','Showpage.jsp'); </script>");
		    else out.print("<script> message('Fail to delete','Showpage.jsp'); </script>");
		    
			
			
		} catch (SQLException e) {
			out.print("<script> message('Fail to delete','Showpage.jsp'); </script>");
		}
		
		
	}

}
