package com.teacher;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.GetConnection;

/**
 * Servlet implementation class TeacherInformationServlet
 */
@WebServlet("/Teacher/TeacherInformationServlet")
public class TeacherInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st;
		
		
		try {
			
			st = connection.createStatement();
			String query = "select * from teacher";
			ResultSet rs = st.executeQuery(query);
				
			
			List<String> images = new ArrayList<>();

			while (rs.next()) {

				Blob blob = rs.getBlob("Photo");
				String filename = rs.getString("Filename");
				byte bytearray[] = blob.getBytes(1, (int) blob.length());			
				String extension ="";	
				
				int i = filename.lastIndexOf('.');
				if (i > 0) {
				    extension = filename.substring(i+1);
				}				
							
	    		String encodeBase64 = Base64.getEncoder().encodeToString(bytearray);
	    		String image_encode = "data:image/" + extension + ";base64," + encodeBase64 ; 
				


	    		images.add(image_encode);
			    out.println("image_encode " + image_encode);
	    				

				//array.add(output.write(bytearray));
				
			}
			//output.flush();
			//output.close();
			
			session.setAttribute("images", images);	

			
			
			
			
		} catch (SQLException e) {
			out.println(e.getMessage());
		}
		
		
	}

}
