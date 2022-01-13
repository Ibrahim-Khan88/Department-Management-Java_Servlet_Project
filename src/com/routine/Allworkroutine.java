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

/**
 * Servlet implementation class Allworkroutine
 */
@WebServlet("/Routin/Allworkroutine")
public class Allworkroutine extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st, st1, st2, st4;

		String query, id, courseCode, date, year, common, time, day, teahcer, routineId;
		int count = 0;
		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		year = request.getParameter("year");
		courseCode = request.getParameter("courseCode");
		time = request.getParameter("time");
		day = request.getParameter("day");
		common = request.getParameter("common");
		teahcer = request.getParameter("teahcer");
		routineId = (String) session.getAttribute("RoutineId");

		System.out.println(" common =" + common + " " + day + " " + time + "  routineId=" + routineId);

		if (common.equals("2")) {

			System.out.println(" common " + teahcer + " " + day + " " + time + "  " + year + " " + courseCode);

			try {

				query = "select * from routine where year='" + year + "' and day='" + day + "' and time='" + time
						+ "' and courseCode='" + courseCode + "'";

				st4 = connection.createStatement();
				ResultSet rs = st4.executeQuery(query);

				if (!rs.next()) {

					query = "INSERT INTO routine( `year`, `courseCode`, `day`, `time`, `teacherId`, `changeAble`) VALUES ('"
							+ year + "','" + courseCode + "','" + day + "','" + time + "','" + teahcer + "','0')";

					System.out.print(" query=" + count);
					st = connection.createStatement();
					count = st.executeUpdate(query);
					System.out.print(" query=" + count);

					if (count == 1)
						out.print(
								"<script> message('Successfully save','http://localhost:8080/Project2/Routin/AddRoutin.jsp'); </script>");

					else
						out.print(
								"<script> message('An error is occured','http://localhost:8080/Project2/Routin/AddRoutin.jsp'); </script>");
				}
				

				else
					out.print(
							"<script> message('Duplicate Value','http://localhost:8080/Project2/Routin/AddRoutin.jsp'); </script>");
				
				
			} catch (SQLException e) {
				out.print(
						"<script> message('An error is occured','http://localhost:8080/Project2/Routin/AddRoutin.jsp'); </script>");

			}
		} else if (common.equals("3")) {

			query = "UPDATE routine SET time='" + time + "',day='" + day + "'  WHERE Id='" + routineId + "'";
			System.out.print(" query=" + query);
			try {

				st = connection.createStatement();
				count = st.executeUpdate(query);

				if (count == 1) {

					year = (String) session.getAttribute("year");
					out.print(
							"<script> message('Successfully updated','http://localhost:8080/Project2/Routin/ShowRoutin.jsp?year="
									+ year + "'); </script>");
				} else
					out.print(
							"<script> message('An error is occured','http://localhost:8080/Project2/Routin/ShowRoutin.jsp?year="
									+ year + "');  </script>");

			} catch (SQLException e) {

			}
		} else {
			System.out.print(" else=");
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Statement st;

		out.print("<script type=\"text/javascript\" src=\"/Project2/Script/message.js\"></script>");

		out.println(
				"<script>	\r\n" + "	function seccess(){\r\n" + "		alert('Data is seccessfully added');\r\n"
						+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
						+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println("<script>	\r\n" + "	function fail(){\r\n" + "		alert('Data is fail to add');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		out.println("<script>	\r\n" + "	function exist(){\r\n"
				+ "		alert('You can not insert value with this id.Because there is a records with this name.');\r\n"
				+ "		var outString = \"http://localhost:8080/Project2/Home.jsp\";\r\n"
				+ "		location.href = outString; \r\n" + "	}\r\n" + "		\r\n" + "</script>");

		String query, routineId;
		int count = 0;

		routineId = request.getParameter("id");

		query = "DELETE FROM routine WHERE Id='" + routineId + "'";
		try {

			st = connection.createStatement();
			count = st.executeUpdate(query);

			if (count == 1)
				out.print(
						"<script> message('Successfully deleted','http://localhost:8080/Project2/Home.jsp'); </script>");

			else
				out.print(
						"<script> message('An error is occured','http://localhost:8080/Project2/Home.jsp'); </script>");

		} catch (SQLException e) {
			out.print("<script> message('An error is occured','http://localhost:8080/Project2/Home.jsp'); </script>");
		}

	}

}
