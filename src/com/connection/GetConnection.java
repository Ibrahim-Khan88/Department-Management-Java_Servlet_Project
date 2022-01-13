package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class GetConnection {
	
	public Connection getconnection() {
		Connection con = null;
		try {
			String url = "jdbc:mysql://localhost:3306/servlet";
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(url, "root", "");
		}
		catch(Exception e)
		{
			
		}
		return con;
	}
	
	public float grade_to_point(String s){

		if (s.equals("A+"))
			return 4;
		else if (s.equals("A"))
			return (float) 3.75;
		else if (s.equals("A-"))
			return (float) 3.50;
		else if (s.equals("B+"))
			return (float) 3.25;
		else if (s.equals("B"))
			return (float) 3.00;
		else if (s.equals("B-"))
			return (float) 2.75;
		else if (s.equals("C+"))
			return (float) 2.50;
		else if (s.equals("C"))
			return (float) 2.25;
		else if (s.equals("D"))
			return (float) 2.00;
		else
			return (float) 0.00;

	}
	
	
	

}
