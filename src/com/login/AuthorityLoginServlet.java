package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;

/**
 * Servlet implementation class AuthorityLoginServlet
 */
@WebServlet("/LoginSystem/AuthorityLoginServlet")
public class AuthorityLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		session.setAttribute("authoritylogin", false);
		String query, userReceivedPassword = "";
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String gmail = request.getParameter("gmail");
		String password = request.getParameter("password");
		ResultSet tables = null;
		session.setAttribute("authoritygmail", gmail);
		session.setAttribute("authority", true);

//		out.print("<script> forward('http://localhost:8080/Project2/Home.jsp'); </script>");

		try {
			userReceivedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash("11"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("the computed hash (hex string) : " + userReceivedPassword);

		Statement st;
		try {
			st = connection.createStatement();

			query = "select * from authority where Gmail = '" + gmail + "'";
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {

				userReceivedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));
				if (rs.getString("Password").equals(userReceivedPassword)) {

					session.setAttribute("authoritygmail", gmail);
					session.setAttribute("authority", true);
					 out.print("<script> message('Successfully login','http://localhost:8080/Project2/Home.jsp'); </script>");
				} else {

					 out.print("<script> message('Username or password is not correct.Please try again.','AuthorityLogin.jsp'); </script>");

				}
			} else {
				 out.print("<script> message('Username or password is not correct.Please try again.','AuthorityLogin.jsp'); </script>");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
