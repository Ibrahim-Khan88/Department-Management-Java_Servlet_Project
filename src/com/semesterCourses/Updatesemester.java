package com.semesterCourses;

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
 * Servlet implementation class Deletesemester
 */
@WebServlet("/SemesterCourse/Updatesemester")
public class Updatesemester extends HttpServlet {
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st,st1,st2,st3;
		
		String year, courseCode, query;
		int presentZero;
		int count,totalClass;
		
		year = request.getParameter("year");
		courseCode = request.getParameter("courseCode");
		presentZero = Integer.parseInt(request.getParameter("totalClass").toString()) ;
		
		
		try {
			query = "select * from totalclass where year='" + year +"' and courseCode='"+ courseCode + "'";
			st3 = connection.createStatement();
			ResultSet rs3 = st3.executeQuery(query);
			
			// checking record is exists or not
			if(rs3.next()) {
				
				totalClass = rs3.getInt("totalClass");
				totalClass += presentZero;
				query = "UPDATE totalclass SET presentZero='" + presentZero + "', totalClass='" + totalClass + "' WHERE year='" + year +"' and courseCode='"+ courseCode + "'" ;
				st = connection.createStatement();
			    count = st.executeUpdate(query);
			    
			    if (count == 1) {
			    	out.print("seccessfully updated");
			    }
			    else out.print("Fail to add the update");
			    
				
				
			}
			else {
				out.print("no record is found");
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
	
		
	}

}









