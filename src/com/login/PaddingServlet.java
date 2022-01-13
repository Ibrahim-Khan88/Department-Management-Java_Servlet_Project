package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import com.mysql.jdbc.DatabaseMetaData;
import com.sendemail.EmailUtility;
import com.sendemail.SendMail;

/**
 * Servlet implementation class PaddingServlet
 */
@WebServlet("/PaddingServlet")
public class PaddingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.setAttribute("login", false);
		SendMail send = new SendMail();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String subject,query, query2="", tablename="", table_query, content, resultsend = null,toAddress="";
    	subject = "Account open information";
		int id = Integer.parseInt(request.getParameter("x1"));
		int accept = Integer.parseInt(request.getParameter("x2"));

		
		query = "select * from panddingtabel where Id=" + id;
		Statement st;
		try {
			st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);
			rs.next();
			tablename = rs.getString("Session") + "_student";
			query2 = "insert into " + tablename + " VALUES('" + rs.getString("StudentId") + "','"
					+ rs.getString("Name") + "','" + rs.getString("Password") + "','" + rs.getString("Gmail")
					+ "')";
			toAddress = rs.getString("Gmail");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
       // if request is accept
		if (accept == 1) {

			// Retrieving student data
			try {

				// If table does not exists , then we create the table
				DatabaseMetaData dbm = (DatabaseMetaData) connection.getMetaData();
				ResultSet tables = dbm.getTables(null, null, tablename, null);
				if (!tables.next()) {

					table_query = "create table " + tablename + " ( studentid varchar(12),"
							+ "Name varchar(35), Password varchar(45), Email varchar(70), primary key (studentid))";

					Statement tabel_st = connection.createStatement();
					tabel_st.execute(table_query);

				}

				/// inserting the student records into the table
				Statement insert_record = connection.createStatement();
				int count = insert_record.executeUpdate(query2);

				if (count == 0) {
					out.println("Dectect Problem");
				}

				else {

					// sending email
					content = "Your account is successfully created  in CSE department";
					send.sendemail(toAddress, content, subject);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				out.print("<script> forward('PaddingRequest'); </script>");
			}

		} 
		
		else {

			// sending email that account is not successfully open
			content = "For some reason your request for create account in CSE department of BSMRSTU is rejected";
			send.sendemail(toAddress, content, subject);

		}
		

		/// deleting the student records from panddingtabel the table
		query2 = "delete from panddingtabel where Id=" + id;
		try {
			Statement delete_record = connection.createStatement();
			delete_record.executeUpdate(query2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		out.print("<script> forward('PaddingRequest.jsp'); </script>");

	}

}
