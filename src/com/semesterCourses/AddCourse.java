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
 * Servlet implementation class addBudget
 */
@WebServlet("/SemesterCourse/AddCourse")
public class AddCourse extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String courseCode, year, query;
		courseCode = request.getParameter("courseCode");
		year = request.getParameter("year");


		query = "INSERT INTO totalclass( year, courseCode, totalClass, presentZero) VALUES ('" + year + "','" + courseCode + "','0','0')";
		//System.out.print(query);

		try {
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);

			if (count == 1) {				
				out.print("<script> message('Successfully Added','AddCourse.jsp'); </script>");
			} else {
				out.print("<script> message('Fail to add','AddCourse.jsp'); </script>");
			}

		} catch (SQLException e1) {
			out.print("<script> message('Fail to add','AddCourse.jsp'); </script>");
		}

	}

}
