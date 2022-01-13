package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.sendemail.EmailUtility;
import com.sendemail.SendMail;

/**
 * Servlet implementation class TeachePadding
 */
@WebServlet("/LoginSystem/TeachePadding")
public class TeachePadding extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("login", false);
		SendMail send = new SendMail();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String query, id, accept, toAddress = "", subject,content;
		subject = "Account open information";
		id = request.getParameter("id");
		accept = request.getParameter("accept");
		// System.out.println("id" + id + " " + accept + "accept ");

		// if request is accepted
		if (accept.equals("1")) {
			try {

				query = "select * from panddingteacher where Id=" + id;
				Statement st1 = connection.createStatement();
				ResultSet rs = st1.executeQuery(query);
				rs.next();
				toAddress = rs.getString("Gmail");
				/*
				 * System.out.println(rs.getString("Name") + " " + rs.getString("Gmail") + " " +
				 * rs.getString("Information") + " " + rs.getBlob("Photo"));
				 */

				query = "INSERT INTO teacher(Name, Gmail, Information, Photo,Filename,Designation,Password,	Department) VALUES (?,?,?,?,?,?,?,?) ";

				PreparedStatement st = connection.prepareStatement(query);
				st.setString(1, rs.getString("Name"));
				st.setString(2, rs.getString("Gmail"));
				st.setString(3, rs.getString("Information"));

				st.setBlob(4, rs.getBlob("Photo"));
				st.setString(5, rs.getString("Filename"));
				st.setString(6, rs.getString("Designation"));
				st.setString(7, rs.getString("Password"));
				st.setString(8, rs.getString("Department"));

				int insert = st.executeUpdate();

				if (insert != 0) {	
					System.out.println("Added");
					content = "Your account is successfully created  in CSE department";
					send.sendemail(toAddress, content, subject);
				} else {
					System.out.println("in side else");
					out.print(
							"<script> message('An error is occured','http://localhost:8080/Project2/LoginSystem/PanddingTeacherRequest.jsp'); </script>");
				}

			} catch (Exception e) {
				System.out.println("in side catch" + e.getMessage());
				out.print(
						"<script> message('Problem ditect','http://localhost:8080/Project2/LoginSystem/PanddingTeacherRequest.jsp'); </script>");
			}
		} 
		// request is not accepted
		else {
			query = "select * from panddingteacher where Id=" + id;
			Statement st1;
			
			try {
				st1 = connection.createStatement();
				ResultSet rs = st1.executeQuery(query);
				rs.next();
				toAddress = rs.getString("Gmail");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			content = "For some reason your request for create account in CSE department of BSMRSTU is rejected";
			send.sendemail(toAddress, content, subject);
			//out.print("send message");

		}
		
		
		
		query = "delete from panddingteacher where Id=" + id;
		Statement delete_record;
		try {
			delete_record = connection.createStatement();
			delete_record.executeUpdate(query); 

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.print("<script> forward('http://localhost:8080/Project2/LoginSystem/PanddingTeacherRequest.jsp'); </script>");


	}

}
