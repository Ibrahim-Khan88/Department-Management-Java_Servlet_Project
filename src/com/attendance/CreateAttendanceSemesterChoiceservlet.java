package com.attendance;

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
 * Servlet implementation class CreateAttendanceSemesterChoiceservlet
 */
@WebServlet("/Attendance/CreateAttendanceSemesterChoiceservlet")
public class CreateAttendanceSemesterChoiceservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st,st1,st2;
		
		
		String year = request.getParameter("year");
		String courseName = request.getParameter("courseName");
		String query,id,query1 = "", tableName,student_id,query2;
		
		tableName = year+ "_" + courseName; 
		int total_student;
		
		query = "select * from student_year_information where year = '" + year + "'"; 
		query2 = "insert into course_information values('" + year + "','" +  courseName + "')";
		
		try
		{
			
			// finding out total student of that year
			st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);
			rs.next();
			total_student = rs.getInt("total_student");
			student_id = rs.getString("session").substring(2, 4) + "CSE0";		
			
			
			// generation query for create the table
			query1 = "create table " + tableName + " ( Date varchar(15), " ;			
			for (int i = 1; i<=total_student; i++) {
				
				id = student_id;
				if (i <= 9 ) {
					id += ("0" + Integer.toString(i) + " varchar(5), ");
				}
				else if (total_student == i){
					id += Integer.toString(i) + " varchar(5), PRIMARY KEY (Date) )";
				}
				else {
					id += Integer.toString(i) + " varchar(5), ";
				}
			
			query1 += id;
				
			}
			
			
			
			out.println(query1);
			
			
			
			/// crating table
			st1 = connection.createStatement();
			int create = st1.executeUpdate(query1);
			
			
			// inserting into course_informations
			st2 = connection.createStatement();
			st2.executeUpdate(query2);
			
			
			if (create != 0) {
				out.println("table created");
			}
			
		}
		catch(Exception e)
		{
			
		}
		
		
	}

}
