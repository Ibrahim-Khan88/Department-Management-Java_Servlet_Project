package com.routine;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.GetConnection;
import com.sendemail.SendMail;

/**
 * Servlet implementation class ChangeRoutin
 */
@WebServlet("/Routin/ChangeRoutin")
public class ChangeRoutine extends HttpServlet {

	static GetConnection con = new GetConnection();
	static Connection connection = con.getconnection();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		SendMail send = new SendMail();
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		String time, day, id, query, year = "", courseCode = "", teacherId="" ,crId, crgmail, student_table, subject, Message;
		int changevalue = 0;
		time = request.getParameter("time");
		day = request.getParameter("day");
		id = (String) session.getAttribute("RoutinId");
		
		subject = "Routine change message from CSE department of BSMRSTU";
		System.out.println("day=" + day + "  " + time);


		try {

			// getting year and course name
			query = "SELECT * FROM routine WHERE Id='" + id + "'";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);
			System.out.println(query);

			if (rs.next()) {
				year = rs.getString("year");
				courseCode = rs.getString("courseCode");
				teacherId = rs.getString("teacherId");
				changevalue = rs.getInt("changeAble");
			}
			
			System.out.println("year=" + year + "  courseCode=" + courseCode + "  " + day + "  " + time);

			// checking this records is already present in changeroutine table or not
			query = "SELECT * FROM changeroutine WHERE Id='" + id + "'";
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(query);
			// if not present then insert it
			if (rs1.next()) {				
				out.print("<script> message('You can not change this routine now.Beacuse this routine is already change in this week.You can change this routine in next week.','http://localhost:8080/Project2/Routin/TeacherRoutine.jsp'); </script>");

			}
			else if(changevalue >= 6) {
				out.print("<script> message('You can not change this routine now.Beacuse you change it 6 times','http://localhost:8080/Project2/Routin/TeacherRoutine.jsp'); </script>");

			}
			else {
				
				Message = "For some reason the class of " + courseCode + " of " + dayConveter(rs.getString("day")) + "  will be held in " + dayConveter(day) + " at " + time 
						+ ".Thank you." ;
				
				System.out.println("inside change routine " + query);
				
				
				crgmail = getCrGmail(year);
				send.sendemail(crgmail, Message, subject);
				
				// inserting 
				query = "INSERT INTO changeroutine(Id, year, courseCode, day, time,teacherId) VALUES ('" + id + "','" + year
						+ "','" + courseCode + "','" + day + "','" + time + "','" + teacherId +"')";

				Statement st4 = connection.createStatement();
				int count = st4.executeUpdate(query);

				if (count == 1) {
					
					// updating changeable value
					changevalue++;
					query = "UPDATE routine SET changeAble='"+ changevalue +"' WHERE courseCode='" + courseCode + "'";
					Statement st5 = connection.createStatement();
					st5.executeUpdate(query);
					
					
					
					out.print("<script> message('Successfully Changed','http://localhost:8080/Project2/Routin/TeacherRoutine.jsp'); </script>");
				} else {
					out.print("<script> message('Fail to change','http://localhost:8080/Project2/Routin/TeacherRoutine.jsp'); </script>");
				}

			}  

		} catch (SQLException e1) {
			out.print("<script> message('Fail to change','http://localhost:8080/Project2/Routin/TeacherRoutine.jsp'); </script>");
			System.out.println( e1.getMessage());
		}

	}

	public static String getCrGmail(String year) throws SQLException {

		String query, crId, student_table;
		Statement st, st1;
		st = connection.createStatement();
		st1 = connection.createStatement();
		ResultSet rs, rs1;

		// getting CR id
		query = "SELECT * FROM student_year_information WHERE year='" + year + "'";
		rs = st.executeQuery(query);
		rs.next();
		crId = rs.getString("CR");
		student_table = rs.getString("session") + "_student";

		// getting CR gmail
		query = "SELECT Email FROM " + student_table + " WHERE studentid='" + crId + "'";
		rs1 = st1.executeQuery(query);
		rs1.next();
		//System.out.println(" CR Email " + rs1.getString("Email"));

		return rs1.getString("Email");

	}

	public static String dayConveter(String day) {
		
		if (day.equals("Sun")) return "Sunday";
		else if (day.equals("Mon")) return "Monday";
		else if (day.equals("Tue")) return "Tuesday";
		else if (day.equals("Wed")) return "Wednesday";
		else return "Thursday";
		 
		
	}

}
