package com.attendance;

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

/**
 * Servlet implementation class InsertValueservlet
 */
@WebServlet("/Attendance/InsertValueservlet")
public class InsertValueservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		
		// declaring local variable
		int i,total_student;
		String check = "",query,table_name,year,courseName,temp;
		
		total_student = (int)session.getAttribute("total_student");
		year = (String) session.getAttribute("year"); 
		courseName = (String) session.getAttribute("courseName");
		String date = request.getParameter("date");
		
		table_name = year + "_" + courseName;
        query = "Insert into " + table_name + " values ('" + date + "'," ;
        out.println(year + "_" + courseName.length() +  " " + courseName);
      
		
 
		
		for (i=1; i<=total_student; i++) {
			
			temp = "check" + i;
			check = request.getParameter("check" + i);
			//check += "";
			
			if (check == null) {
				temp = "'0'";
			}
			else {
				temp = "'1'";
			}
			
			out.println(check + "  "+ temp);
			
			//temp = "1";
			
			if (i != total_student) {
				query += (temp + ",");
			}
			else {
				query += (temp + ")");
			}
			
			
		}
		
		out.println("value of query  ==  " + query);
		
		
		try {
			
			Statement st = connection.createStatement();
			int count = st.executeUpdate(query);
			
			if (count == 0)
				out.println("problem detected");  
			
		}
		catch(Exception e) {
			out.println(e.getMessage());
		}
		
		
	}

}
