package com.login;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.GetConnection;

/**
 * Servlet implementation class TeacherSingIn
 */
@WebServlet("/LoginSystem/TeacherSingIn")
@MultipartConfig(maxFileSize = 16177216)
public class TeacherSingIn extends HttpServlet {
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String info = request.getParameter("info");
		String designation = request.getParameter("designation");
		String dept = "CSE", userReceivedEncryptedPassword="";
		String password = request.getParameter("password");
		Part part = request.getPart("photo");
		InputStream inputstream = part.getInputStream();
		
		String header=part.getHeader("content-disposition");
		String filename = header.substring(header.indexOf("filename=\"")).split("\"")[1];
		System.out.println(filename + " " + name + " " + gmail + " " + info + " " + designation + " " + dept);
		
		//MultipartFile file

		//String query = "INSERT INTO panddingteacher(Name, Gmail, Information, Photo,Filename,Designation,Password,Department) VALUES (?,?,?,?,?,?,?) ";
		String query = "INSERT INTO panddingteacher(Name, Gmail, Information, Photo,Filename,Designation,Password,Department) VALUES (?,?,?,?,?,?,?,?) ";
		try {
			
			userReceivedEncryptedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));

			PreparedStatement st = connection.prepareStatement(query);
			st.setString(1, name);
			st.setString(2, gmail);
			st.setString(3, info);
			
			if (inputstream != null) {
				
				st.setBinaryStream(4, inputstream, (int) part.getSize());
				
			}
			else {
				st.setBinaryStream(4, null);
			}
			st.setString(5, filename);
			st.setString(6, designation);
			st.setString(7, userReceivedEncryptedPassword);
			st.setString(8, dept);
			
			
			int insert = st.executeUpdate();

			if (insert != 0) {
				out.print("<script> message('Your request is successfully accepted.If you are a teacher of this department you can login by your gmail and your password after 24 hour.','http://localhost:8080/Project2/Home.jsp'); </script>");
			} 
			else {
				out.print("<script> message('For some problem your request is not accepted.Please try again','http://localhost:8080/Project2/Home.jsp'); </script>");
			}

		} catch (Exception e) {
			out.print("<script> message('For some problem your request is not accepted.Please try again','http://localhost:8080/Project2/Home.jsp'); </script>");
		}
		
	}

}
