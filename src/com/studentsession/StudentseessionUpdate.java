package com.studentsession;

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
 * Servlet implementation class StudentseessionUpdate
 */
@WebServlet("/StudentSession/StudentseessionUpdate")
public class StudentseessionUpdate extends HttpServlet {



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st, st1, st2;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		System.out.println("Query ");
		String query, id, stusession, totalStudent,year,CR;
		int count = 0;

		CR = request.getParameter("CR");
		year = (String) session.getAttribute("year");
		stusession = request.getParameter("session");
		totalStudent = request.getParameter("totalStudent");
		
		query = "UPDATE student_year_information SET CR='"+ CR +  "', session= '"+ stusession + "', total_student='" + totalStudent +"' WHERE year='" + year + "'" ;
		
		try {
			
			st = connection.createStatement();
		    count = st.executeUpdate(query);
		    
		    if (count == 1) out.print("<script> message('Successfully updated','StudentSession.jsp'); </script>");
		    else out.print("<script> message('Fail to update','StudentSession.jsp'); </script>");
		    
			
			
		} catch (SQLException e) {
			out.print("<script> message('Fail to update','StudentSession.jsp'); </script>");
		}

		
	}

}
