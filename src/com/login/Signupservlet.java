package com.login;

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
import com.mysql.jdbc.DatabaseMetaData;

/**
 * Servlet implementation class Signupservlet
 */
@WebServlet("/LoginSystem/Signupservlet")
public class Signupservlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");
		
		
		String studentid = request.getParameter("studentid");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String student_session, userReceivedEncryptedPassword="";
		String email = request.getParameter("gmail");
		ResultSet tables = null;
		String query,tablename;
		boolean is = false;
		
		
		
		student_session = "20" + studentid.substring(0,2) + "_" + (Integer.parseInt(studentid.substring(0,2)) + 1);
		
		try {
			
			
			tablename = student_session +  "_student" ;
			userReceivedEncryptedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));
			
			
			
			// If table does not exists , then we create the table
			DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
			tables = dbm.getTables(null, null, tablename, null);				
			if (tables.next()) {
				
				// checking this id is already present or not
				query = "select * from " + tablename + " where studentid='" + studentid + "'";
				Statement st1 = connection.createStatement();
				ResultSet rs = st1.executeQuery(query);
				// if present
				if(rs.next()) {
					is = true;
				}
			}
			
			if (!is) {
				query = "INSERT INTO panddingtabel( Session, StudentId, Name, Gmail, Password) VALUES ('" + student_session + 
						"','" + studentid  + "','" + name + "','" + email + "','" + userReceivedEncryptedPassword + "')";
				Statement st = connection.createStatement();
				int count = st.executeUpdate(query);
				if (count == 1) {
					out.print("<script> message('Your request is successfully accepted.If you are a student of this department you can login by your name and your password after 24 hour.','http://localhost:8080/Project2/Home.jsp'); </script>");
				}
				else {
					out.print("<script> message('For some problem your request is not accepted.Please try again','http://localhost:8080/Project2/Home.jsp'); </script>");
				}
			}
			else {
				out.print("<script> message('There is already a account with this student Id. Please try with your id.','http://localhost:8080/Project2/Home.jsp'); </script>");
			}

			
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
		
		
	}

}
