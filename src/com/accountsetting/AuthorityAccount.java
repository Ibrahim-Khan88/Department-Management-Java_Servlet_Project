package com.accountsetting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.login.PasswordEncrypt;

/**
 * Servlet implementation class AuthorityAccount
 */
@WebServlet("/AccountSetting/AuthorityAccount")
public class AuthorityAccount extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String userReceivedEncryptedPassword, password = request.getParameter("password");
		String updateemail = request.getParameter("gmail");
		String pastgmail = (String) session.getAttribute("authoritygmail");



		// out.println(studentid + " " + name + " " + password + " " + student_session +
		// " " + email);

		String query;

		try {
			
			userReceivedEncryptedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));

			Statement st = connection.createStatement();
			query = "UPDATE authority SET Password='"+ userReceivedEncryptedPassword +"', Gmail='"+ updateemail +"' WHERE Gmail='"+ pastgmail +"'";
			int update = st.executeUpdate(query);
		
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
