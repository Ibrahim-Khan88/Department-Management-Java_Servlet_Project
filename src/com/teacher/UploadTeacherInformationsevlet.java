package com.teacher;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class UploadTeacherInformationsevlet
 */
@WebServlet("/Teacher/UploadTeacherInformationsevlet")
@MultipartConfig(maxFileSize = 16177216)
public class UploadTeacherInformationsevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		
		
		out.println("<script>	\r\n" + "	function forward(){\r\n" +  "		var outString = \"TeacherInformation.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");
	

		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String info = request.getParameter("info");
		String designation = request.getParameter("designation");
		String password = request.getParameter("password");
		String dept = request.getParameter("dept");
		Part part = request.getPart("photo");
		InputStream inputstream = part.getInputStream();
		
		
		String header=part.getHeader("content-disposition");
		String filename = header.substring(header.indexOf("filename=\"")).split("\"")[1];
		//System.out.println(filename);
		
		//MultipartFile file

		String query = "INSERT INTO teacher(Name, Gmail, Information, Photo,Filename,Designation,Password,Department) VALUES (?,?,?,?,?,?,?,?) ";

		try {

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
			st.setString(7, password); 
			st.setString(8, dept);
			
			
			int insert = st.executeUpdate();

			if (insert != 0) {
				System.out.println("successfully updated " +  query);
				out.print("<script> forward(); </script>");
				/*
				 * RequestDispatcher rd =
				 * request.getRequestDispatcher("TeacherInformation.jsp"); rd.forward(request,
				 * response);
				 */
			} else {
				out.println("fail to update");
			}

		} catch (Exception e) {
			out.println(e.getMessage());
		}

	}

}
