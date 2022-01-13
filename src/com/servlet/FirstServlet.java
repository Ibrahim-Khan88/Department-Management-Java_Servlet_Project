package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.mysql.jdbc.DatabaseMetaData;


@WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet{
	
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		
		
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		HttpSession session = request.getSession();
		PrintWriter out = null;
		try {
			 out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query;
		ResultSet tables = null;
		
		
		String year = "2016";
		String semester = "17";
		String table_name = "2016_17_3_1_result";
		
		
		// execute a query to check with this name a table is exists or not
		try {

			DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
		    tables = dbm.getTables(null, null, table_name, null);
		    		    

			if (tables.next()) {
				
				Statement st = connection.createStatement();
				query = "select * from " + table_name;
				ResultSet rs = st.executeQuery(query);
				rs.next();
				out.print(rs.getString(1));
			}
		}
		catch(Exception e){
			out.println("exception " + e.getMessage() + " exception exception");
		}
		
		
		
	}
	
}
