package com.accountsetting;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
import com.login.PasswordEncrypt;

/**
 * Servlet implementation class UploadTeacherInformationsevlet
 */
@WebServlet("/AccountSetting/TeahcerAccount")
@MultipartConfig(maxFileSize = 16177216)
public class TeahcerAccount extends HttpServlet {

    // for update teacher information. Request coming from Updatepageform,jsp
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		PasswordEncrypt passwordEncrypt = new PasswordEncrypt();
		

		String userReceivedEncryptedPassword="";
		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String info = request.getParameter("info");
		String dept = request.getParameter("dept");
		String designation = request.getParameter("designation");  
		String password = request.getParameter("password"); 
		Part part = request.getPart("photo");
		InputStream inputstream = part.getInputStream();

		String header = part.getHeader("content-disposition");
		String filename = header.substring(header.indexOf("filename=\"")).split("\"")[1];

		
		
		
		out.println("<script>	\r\n" + 
				"	function seccess(){\r\n" + 
				"		alert('Data is successfully updated');\r\n" + 
				"		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n" + 
				"		location.href = outString; \r\n" + 
				"	}\r\n" + 
				"		\r\n" + 
				"</script>");
		
		out.println("<script>	\r\n" + 
				"	function fail(){\r\n" + 
				"		alert('Data is fail to update');\r\n" + 
				"		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n" + 
				"		location.href = outString; \r\n" + 
				"	}\r\n" + 
				"		\r\n" + 
				"</script>");
		

		// MultipartFile file
		

		String query = "UPDATE teacher SET Name=?,Gmail=?,Information=?,Photo=?,Filename=?,Designation=?,Department=?,Password=?  WHERE Id=?";
		
		System.out.println("query " + query);
		try {
			
			userReceivedEncryptedPassword = passwordEncrypt.byteArrayToHexString(passwordEncrypt.computeHash(password));

			PreparedStatement st = connection.prepareStatement(query);
			st.setString(1, name);
			st.setString(2, gmail);
			st.setString(3, info);

			if (inputstream != null) {

				st.setBinaryStream(4, inputstream, (int) part.getSize());

			} else {
				st.setBinaryStream(4, null);
			}
			st.setString(5, filename);
			st.setString(6, designation);
			st.setString(7, dept);
			st.setString(8, userReceivedEncryptedPassword);
			st.setString(9, (String) session.getAttribute("teacherid"));
			//System.out.println("session.getAttribute(\"teacherid\") " + session.getAttribute("teacherid"));
			
			
			int insert = st.executeUpdate();
			
			if (insert == 1) {
				out.print("<script> seccess(); </script>");

			} else {
				out.print("<script> fail(); </script>");
			}
			
			

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
		
	

}
