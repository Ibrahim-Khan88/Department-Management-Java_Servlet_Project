package com.studentInformation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;

/**
 * Servlet implementation class DeleteInfo
 */
@WebServlet("/StudentInformation/DeleteStudentInfo")
public class DeleteStudentInfo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		int count;
		String query, tableName, studentId;
		studentId = request.getParameter("studentid");
		tableName = (String) session.getAttribute("studentDeleteInfo"); 
		query = "DELETE FROM "+ tableName +" WHERE studentid='" + studentId + "'";


		try {

			st = connection.createStatement();
			count = st.executeUpdate(query);

			if (count == 1) {

				out.print("<script> message('successfully deleted','http://localhost:8080/Project2/StudentInformation/StudentInfoSelect.jsp'); </script>");				
			}
			    
			else
				out.print("<script> message('Fail to delete',''); </script>");

		} catch (SQLException e) {
			out.print("<script> message('Fail to delete','http://localhost:8080/Project2/StudentInformation/StudentInfoSelect.jsp'); </script>");
		}
		
		
	}

}
