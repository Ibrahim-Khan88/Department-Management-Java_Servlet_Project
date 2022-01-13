package com.accountsetting;

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
import com.login.PasswordEncrypt;
import com.mysql.jdbc.DatabaseMetaData;

/**
 * Servlet implementation class student
 */
@WebServlet("/AccountSetting/student")
public class student extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String userReceivedEncryptedPassword, name = request.getParameter("name");
		String password = request.getParameter("password");
		String student_session = (String) session.getAttribute("student_session");
		String studentid = (String) session.getAttribute("studentid");
		String email = request.getParameter("gmail");


		// out.println(studentid + " " + name + " " + password + " " + student_session +
		// " " + email);

		String query, table_name = student_session + "_student";

		try {
			
			userReceivedEncryptedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));

			Statement st = connection.createStatement();
			query = "UPDATE "+ table_name +" SET Name='"+ name +"',Password='"+ userReceivedEncryptedPassword +"', Email='"+ email +"' WHERE studentid='"+ studentid +"'";
			int update = st.executeUpdate(query);
			System.out.println("table_name = " + query);
			if (update == 1) {				

				out.print("<script> message('Successfully Updated','http://localhost:8080/Project2/Home.jsp'); </script>");
				
			} else {
				out.print("<script> message('Fail to Update','http://localhost:8080/Project2/Home.jsp'); </script>");
				
			}

		} catch (Exception e) {
			out.print("<script> message('There is some exception','http://localhost:8080/Project2/Home.jsp'); </script>");
		}

	}

}
