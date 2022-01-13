package com.teacher;

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

/**
 * Servlet implementation class UploadTeacherInformationsevlet
 */
@WebServlet("/Teacher/Update")
@MultipartConfig(maxFileSize = 16177216)
public class Update extends HttpServlet {

    // for update teacher information. Request coming from Updatepageform,jsp
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String name = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String info = request.getParameter("info");
		String dept = request.getParameter("dept");
		String designation = request.getParameter("designation");
		Part part = request.getPart("photo");
		InputStream inputstream = part.getInputStream();

		String header = part.getHeader("content-disposition");
		String filename = header.substring(header.indexOf("filename=\"")).split("\"")[1];
		
		
		
		out.println("<script>	\r\n" + 
				"	function seccess(){\r\n" + 
				"		alert('Data is seccessfully updated');\r\n" + 
				"		var outString = \"Updateinfo.jsp\";\r\n" + 
				"		location.href = outString; \r\n" + 
				"	}\r\n" + 
				"		\r\n" + 
				"</script>");
		
		out.println("<script>	\r\n" + 
				"	function fail(){\r\n" + 
				"		alert('Data is fail to update');\r\n" + 
				"		var outString = \"Updateinfo.jsp\";\r\n" + 
				"		location.href = outString; \r\n" + 
				"	}\r\n" + 
				"		\r\n" + 
				"</script>");
		

		// MultipartFile file
		

		String query = "UPDATE teacher SET Name=?,Gmail=?,Information=?,Photo=?,Filename=?,Designation=?,Department=? WHERE Id=?";
		try {

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
			st.setString(8, (String) session.getAttribute("photoid"));
			
			
			int insert = st.executeUpdate();
			
			if (insert == 1) {
				out.print("<script> seccess(); </script>");

			} else {
				out.print("<script> fail(); </script>");
			}
			
			

		} catch (SQLException e) {

		}

	}
	
	
	/// for delete request that is coming from Updateinfo.jsp
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		Statement st;
		
		
		out.println("<script>	\r\n" + 
				"	function seccess(){\r\n" + 
				"		alert('Data is seccessfully deleted');\r\n" + 
				"		var outString = \"Updateinfo.jsp\";\r\n" + 
				"		location.href = outString; \r\n" + 
				"	}\r\n" + 
				"		\r\n" + 
				"</script>");
		
		out.println("<script>	\r\n" + 
				"	function fail(){\r\n" + 
				"		alert('Data is fail to delete');\r\n" + 
				"		var outString = \"Updateinfo.jsp\";\r\n" + 
				"		location.href = outString; \r\n" + 
				"	}\r\n" + 
				"		\r\n" + 
				"</script>");
		

		int count;
		String query;
		query = "DELETE FROM teacher WHERE Id='" + request.getParameter("x1") + "'";


		try {

			st = connection.createStatement();
			count = st.executeUpdate(query);

			if (count == 1) {
				out.print("<script> seccess(); </script>");				
			}
			    
			else
				out.print("<script> fail(); </script>");

		} catch (SQLException e) {

		}

	}
	
	
	
	
	

}
