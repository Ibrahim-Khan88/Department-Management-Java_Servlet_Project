package com.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	
	String url = "jdbc:mysql://localhost:3306/servlet";
	String sql = "select * from student where Name=? and Password=?";
	
	
	public boolean check(String name, String pass)  {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, pass);
			
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				return true;
			}
			else {
				return false;
			}
			
		}
		catch (Exception e){
			System.out.println(e.getMessage());
		}
		
		return false;
		
		
		
		

		
	}

}
