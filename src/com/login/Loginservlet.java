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
 * Servlet implementation class Loginservlet
 */
@WebServlet("/LoginSystem/Loginservlet")
public class Loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		session.setAttribute("login", false);
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String userReceivedPassword = "", studentid = request.getParameter("studentid");
		String password = request.getParameter("password");
		String student_session;
		
		try {
		 System.out.println(passwordEncrypt
					.byteArrayToHexString(passwordEncrypt.computeHash("1122")));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ResultSet tables = null;

		student_session = "20" + studentid.substring(0, 2) + "_" + (Integer.parseInt(studentid.substring(0, 2)) + 1);

		String query, table_name = student_session + "_student";

		try {

			DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
			tables = dbm.getTables(null, null, table_name, null);
			System.out.println("table_name = " + table_name);

			if (tables.next()) {

				Statement st = connection.createStatement();
				query = "select * from " + table_name + " where studentid = '" + studentid + "'";
				ResultSet rs = st.executeQuery(query);
				if (rs.next()) {

					userReceivedPassword = passwordEncrypt
							.byteArrayToHexString(passwordEncrypt.computeHash(password));
					if (rs.getString("Password").equals(userReceivedPassword)) {

						Statement st1 = connection.createStatement();
						query = "select * from student_year_information where session = '" + student_session + "'";
						ResultSet rs1 = st1.executeQuery(query);
						if (rs1.next()) {
							session.setAttribute("year", rs1.getString("year"));
							session.setAttribute("undergradute", true);
						} else {
							session.setAttribute("undergradute", false);
						}

						session.setAttribute("login", true);
						session.setAttribute("student_session", student_session);
						session.setAttribute("studentid", studentid);

						out.print(
								"<script> message('Successfully login','http://localhost:8080/Project2/Home.jsp'); </script>");
						/*
						 * System.out.println(session.getAttribute("year")); RequestDispatcher rd =
						 * request.getRequestDispatcher("Home.jsp"); rd.forward(request, response);
						 */
					} else {
						out.print(
								"<script> message('Username or password is not correct','StudentLogin.jsp'); </script>");
					}
				} else {
					out.print("<script> message('Username or password is not correct','StudentLogin.jsp'); </script>");
					/*
					 * System.out.println("Username or password is not correct.....");
					 * RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					 * rd.forward(request, response);
					 */

				}
			}

			else {

				out.print("<script> message('No records is found','StudentLogin.jsp'); </script>");
			}

		} catch (Exception e) {
			out.print("<script> message('There is some exception','Login.jsp'); </script>");
		}

	}

}





