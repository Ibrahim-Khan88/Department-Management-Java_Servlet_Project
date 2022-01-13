package com.Syllabus;

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
 * Servlet implementation class updateBudget
 */
@WebServlet("/Syllabus/UpdateSyllabus")
public class UpdateSyllabus extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String year, courseCode, query,Syllabus, courseName, id;
		id = (String) session.getAttribute("SyllabusId");		
		Syllabus = request.getParameter("Syllabus");
		/*
		 * courseCode = request.getParameter("courseCode"); courseName =
		 * request.getParameter("courseName");
		 */
		year = (String) session.getAttribute("syllabusYear");;

		query = "UPDATE sllabus SET Syllabus='"+ Syllabus +"' WHERE Id='" + id +"'";
		//System.out.print(query);

		try {
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);

			if (count == 1) {				
				out.print("<script> message('Successfully updated','ShowSyllabus.jsp?year="+ year +"'); </script>");
			} else {
				out.print("<script> message('Fail to update','ShowSyllabus.jsp?year="+ year +"'); </script>");
			}

		} catch (SQLException e1) {
			out.print("<script> message('Fail to update','ShowSyllabus.jsp?year="+ year +"'); </script>");
		}
		
		
	}

}
