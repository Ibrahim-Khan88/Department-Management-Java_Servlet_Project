package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.mysql.jdbc.DatabaseMetaData;

/**
 * Servlet implementation class Teacherlogin
 */
@WebServlet("/LoginSystem/Teacherlogin")
public class Teacherlogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		session.setAttribute("teacherLogin", false);
		Statement st;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String query, userReceivedEncryptedPassword = "", password, gmail = request.getParameter("gmail");
		password = request.getParameter("password");

		try {

			st = connection.createStatement();
			query = "select * from teacher where Gmail = '" + gmail + "'";
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {

				userReceivedEncryptedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));
				if (rs.getString("Password").equals(userReceivedEncryptedPassword)) {

					session.setAttribute("teacherid", rs.getString("Id"));
					session.setAttribute("teacherLogin", true);
					out.print(
							"<script> message('Successfully login','http://localhost:8080/Project2/Home.jsp'); </script>");
				} else {
					out.print(
							"<script> message('Username or password is not correct.Please try again.','TeacherLogin.jsp'); </script>");
				}
			} else {
				out.print(
						"<script> message('Username or password is not correct.Please try again.','TeacherLogin.jsp'); </script>");
			}

		} catch (

		Exception e) {
			out.print(
					"<script> message('Username or password is not correct.Please try again.','TeacherLogin.jsp'); </script>");
		}

	}

}
