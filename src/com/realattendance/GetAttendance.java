package com.realattendance;

import java.io.BufferedReader;
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
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import com.connection.GetConnection;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/GetAttendance")
public class GetAttendance extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String student_session = "Yes";
		String name = null, allvalue, id, password, day, date, datestring, sessionId, query, stu_year = null;
		int total_stu = 0, hour = 0, firstTime, lastTime, totalClass;
		String courseCount, tableName, am = "AM";
		/*
		 * student_session = (String) request.getAttribute("name");
		 * out.println(student_session); System.out.println("This is the value " +
		 * student_session);
		 */

		/// Id and password section
		StringBuilder sb = new StringBuilder();
		BufferedReader br = request.getReader();
		String str = null;
		while ((str = br.readLine()) != null) {
			sb.append(str);
		}

		allvalue = sb.toString();
		allvalue = "7e42ad7201aaContent-Disposition: form-data; name=\"login_user\"{\"id\":\"16CSE036\","
				+ "\"password\":\"12345\"}7e42ad7201aa--";

		/// id section
		int firstindex = allvalue.indexOf("\"id\"");
		firstindex += 6;
		int lastindex = allvalue.indexOf('"', firstindex);
		id = allvalue.substring(firstindex, lastindex);

		/// Password section
		firstindex = allvalue.indexOf("\"password\"");
		firstindex += 12;
		lastindex = allvalue.indexOf('"', firstindex);
		password = allvalue.substring(firstindex, lastindex);
		// System.out.println(id + " " + password+ " full " + allvalue);
		/// End password and Id section

		/// Getting current time and date
		java.util.Date alldate = new java.util.Date();
		datestring = alldate.toString();
		day = datestring.substring(0, 3);
		hour = Integer.parseInt(datestring.substring(11, 13));
		date = datestring.substring(4, 10) + " " + datestring.substring(24, 28);
		if (hour > 12) {
			hour -= 12;
			am = "PM";
		}
		/// End current time and date section

		/// Getting student year and total Student
		sessionId = id.substring(0, 2);
		sessionId += "_";
		try {

			query = "select * from student_year_information";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				if (rs.getString("session").toString().contains(sessionId)) {
					stu_year = rs.getString("year").toString();
					total_stu = Integer.parseInt(rs.getString("total_student"));
					break;
				}
			}

		} catch (Exception e) {
			out.println(e.getMessage());
		}

		/// End of student year and total Student section

		if (stu_year.equals("1st"))
			tableName = "attendance1st";
		else if (stu_year.equals("2nd"))
			tableName = "attendance2nd";
		else if (stu_year.equals("3rd"))
			tableName = "attendance3rd";
		else
			tableName = "attendance4th";

		System.out.println("year= " + stu_year + " sessionID = " + sessionId + " toalStd= " + tableName);

		/// Inserting attendance into database
		courseCount = mainwork(stu_year, tableName, day, id, date, hour, am);
		String[] parts = courseCount.split("-");
		int count = Integer.parseInt(parts[0]);
		if (count > 0)
			out.print("added");
		else
			out.print("fail to add");
		// End of insert attendance

		// finding out total attendance of that couse

	}

	GetConnection con = new GetConnection();
	Connection connection = con.getconnection();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String student_session = "Yes";
		String name = null, allvalue, id, password, day, date, datestring, sessionId, query, stu_year = null;
		int total_stu = 0, hour = 0, firstTime, lastTime, presentZero, totalClass, update;
		String courseCount, courseName, tableName, am = "AM", token = "12345", studentID, receiveToken;
		/*
		 * student_session = (String) request.getAttribute("name");
		 * out.println(student_session); System.out.println("This is the value " +
		 * student_session);
		 */

//		String user = "{'studentID':'16CSE019','token':'12345'}";
//		AttendanceReceive attendanceReceive = new ObjectMapper().readValue(user, AttendanceReceive.class);
//		System.out.println("AttendanceReceive=" + attendanceReceive.studentID + " " + attendanceReceive.token);

		/// Id and password section
//		StringBuilder sb = new StringBuilder();
//		BufferedReader br = request.getReader();
//		String str = null;
//		while ((str = br.readLine()) != null) {
//			sb.append(str);
//		}
//
//		allvalue = sb.toString();
//		System.out.println("allvalue = " + allvalue);
//		allvalue = "7e42ad7201aaContent-Disposition: form-data; name=\"login_user\"{\"id\":\"16CSE001\","
//				+ "\"password\":\"12345\"}7e42ad7201aa--";

		/// id section
//		int firstindex = allvalue.indexOf("\"id\"");
//		firstindex += 6;
//		int lastindex = allvalue.indexOf('"', firstindex);
//		id = allvalue.substring(firstindex, lastindex);

		/// Password section
//		firstindex = allvalue.indexOf("\"password\"");
//		firstindex += 12;
//		lastindex = allvalue.indexOf('"', firstindex);
//		password = allvalue.substring(firstindex, lastindex);
		/*
		 * System.out.println("Passwor=" + password); System.out.println( "full=" +
		 * allvalue);
		 */
		/// End password and Id section

		id = request.getParameter("studentID");
		receiveToken = request.getParameter("receiveToken");

		if (receiveToken.equals(token)) {
			/// Getting current time and date
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			date = dtf.format(now).toString().substring(0, 10);
			hour = Integer.parseInt(dtf.format(now).toString().substring(11, 13));
			if (hour > 12) {
				hour -= 12;
				am = "PM";
			}

			java.util.Date alldate = new java.util.Date();
			datestring = alldate.toString();
			day = datestring.substring(0, 3);


			/// End current time and date section

			/// Getting student year and total Student
			sessionId = id.substring(0, 2);
			sessionId += "_";
			try {

				query = "select * from student_year_information";
				Statement st = connection.createStatement();
				ResultSet rs = st.executeQuery(query);

				while (rs.next()) {
					if (rs.getString("session").toString().contains(sessionId)) {
						stu_year = rs.getString("year").toString();
						total_stu = Integer.parseInt(rs.getString("total_student"));
						break;
					}
				}

			} catch (Exception e) {
				out.println(e.getMessage());
			}
			// System.out.println(stu_year + " " + sessionId + " " + total_stu);
			/// End of student year and total Student section

			if (stu_year.equals("1st"))
				tableName = "attendance1st";
			else if (stu_year.equals("2nd"))
				tableName = "attendance2nd";
			else if (stu_year.equals("3rd"))
				tableName = "attendance3rd";
			else
				tableName = "attendance4th";

			/// Inserting attendance into database
			courseCount = mainwork(stu_year, tableName, day, id, date, hour, am);
			String[] parts = courseCount.split("-");
			int count = Integer.parseInt(parts[1]);
			courseName = parts[0];

			// updating total attendance value
			if (count == 1) {

				// finding out total attendance of that course
				query = "SELECT COUNT(DISTINCT date) FROM " + tableName + " where courseCode='" + courseName + "'";

				try {

					// finding out total class from attendance table
					Statement st = connection.createStatement();
					ResultSet rs = st.executeQuery(query);
					rs.next();
					totalClass = rs.getInt(1);
					// out.println(" totalClass= " + totalClass);

					// IF that course is exist or not
					query = "select * from totalclass where courseCode ='" + courseName + "'";
					Statement st1 = connection.createStatement();
					ResultSet rs3 = st1.executeQuery(query);
					presentZero = 0;

					// If exist
					if (rs3.next()) {
						presentZero = rs3.getInt("presentZero");
						totalClass += presentZero;

						query = "UPDATE totalclass SET totalClass='" + totalClass + "' WHERE courseCode = '"
								+ courseName + "'";
						Statement st4 = connection.createStatement();
						update = st4.executeUpdate(query);
						if (update == 1) {
							out.print("Updated");
						} else {
							out.print("Fail to updated");
						}

					}
					// not exist
					else {
						// creating new row with that course name in totalclass table...
						query = "INSERT INTO totalclass VALUES ('" + stu_year + "','" + courseName + "',1,0)";
						Statement st4 = connection.createStatement();
						update = st4.executeUpdate(query);
						if (update == 1) {
							out.print("inserted");
						} else {
							out.print("Fail to insert");
						}

					}

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if (count == 2) {
				out.print("No records found");
			} else
				out.print("recodrs is exist");
			// End of insert attendance

		}
		else {
			System.out.println("Password is not correct");
		}

	}

	public String mainwork(String stu_year, String tableName, String day, String id, String date, int hour,
			String current_am) {

		String query;
		int firstTime, lastTime, count = 9;

	//	System.out.println("value " + tableName + " " + day + " " + id + " " + date + " " + hour + " " + current_am);

		// finding Current Course name and return current course and count value
		try {

			/// First checking into changeRoutine table whether routine is exists or not
			query = " select * from changeroutine where year='" + stu_year + "' AND day='" + day + "'";
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(query);
			String courseCount, routine_am = "";

			while (rs1.next()) {

				String[] parts = rs1.getString("time").toString().split("-");
				String[] parts1 = parts[1].split(" ");

				firstTime = Integer.parseInt(parts[0]);
				lastTime = Integer.parseInt(parts1[0]);
				routine_am = parts1[1];

				// An exception case
				if ((firstTime == 10 && lastTime == 1) || (firstTime == 11 && lastTime == 1)) {

					lastTime += 12;
					if ((firstTime <= hour && hour < 12 && current_am.equals("AM"))
							|| (12 <= hour && hour < lastTime && current_am.equals("PM"))) {
						count = insertfun(tableName, id, date, rs1.getString("courseCode").toString());
						courseCount = rs1.getString("courseCode").toString() + "-" + count;
						return courseCount;
					}

				} else {

					if (lastTime == 1)
						lastTime += 12;
					if (firstTime <= hour && lastTime > hour && routine_am.equals(current_am)) {

						count = insertfun(tableName, id, date, rs1.getString("courseCode").toString());
						courseCount = rs1.getString("courseCode").toString() + "-" + count;
						System.out.println("from changeRoutine = " + courseCount);
						return courseCount;

					}

				}

				// System.out.println("time is " + firstTime + ' ' + lastTime + " time=" +
				// rs.getString("time"));

			}

			/// if class not present into changeRoutine then checking into routine_table
			query = " select * from routine where year='" + stu_year + "' AND day='" + day + "'";
			// System.out.println(query);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);
			courseCount = "";
			routine_am = "";

			// System.out.println("firstTime " + firstTime + " " + lastTime + " " +
			// routine_am);
			

			while (rs.next()) {

				String[] parts = rs.getString("time").toString().split("-");
				String[] parts1 = parts[1].split(" ");

				firstTime = Integer.parseInt(parts[0]);
				lastTime = Integer.parseInt(parts1[0]);
				routine_am = parts1[1];

			

				// An exception case
				if ((firstTime == 10 && lastTime == 1) || (firstTime == 11 && lastTime == 1)) {

					lastTime += 12;
					if ((firstTime <= hour && hour < 12 && current_am.equals("AM"))
							|| (12 <= hour && hour < lastTime && current_am.equals("PM"))) {
						count = insertfun(tableName, id, date, rs1.getString("courseCode").toString());
						courseCount = rs1.getString("courseCode").toString() + "-" + count;
						return courseCount;
					}

				} else {

					if (lastTime == 1)
						lastTime += 12;
					if (firstTime <= hour && lastTime > hour && routine_am.equals(current_am)) {	
						count = insertfun(tableName, id, date, rs.getString("courseCode").toString());;
						courseCount = rs.getString("courseCode").toString() + "-" + count;
						return courseCount;

					}

				}

			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "2-2";
	}

	/// inserting to the database
	public int insertfun(String tableName, String Id, String date, String courseCode) {
		String query;
		Statement st, st1;

		
		// Checking this record is exist or not
		// If exist then return 0
		query = "select * from " + tableName + " where id='" + Id + "' and courseCode='" + courseCode + "' and date='"
				+ date + "'";
		try {
			st1 = connection.createStatement();
			ResultSet rs = st1.executeQuery(query);
			

			if (rs.next()) {
				System.out.print("return 0");
				return 0;
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		query = " insert into " + tableName + " VALUES ('" + Id + "','" + courseCode + "','" + date + "')";
		int count = 0;
		try {
			st = connection.createStatement();
			count = st.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	public String givemonth(String s) {

		if (s.equals("Jan"))
			return "01";
		else if (s.equals("Feb"))
			return "02";
		else if (s.equals("Mar"))
			return "03";
		else if (s.equals("Apr"))
			return "04";
		else if (s.equals("May"))
			return "05";
		else if (s.equals("Jun"))
			return "06";
		else if (s.equals("Jul"))
			return "07";
		else if (s.equals("Aug"))
			return "08";
		else if (s.equals("Sep"))
			return "09";
		else if (s.equals("Otc"))
			return "10";
		else if (s.equals("Nov"))
			return "11";
		else
			return "12";

	}

	public int presentClass(int id) {

		String query = "select * from changeroutine where Id='" + id + "'";

		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);

			if (rs.next()) {
				return 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 1;

	}

}

//hour = Integer.parseInt(datestring.substring(11, 13));
//date = datestring.substring(4, 10) + " " + datestring.substring(24, 28);
//if (hour > 12) {
//	hour -= 12;
//	am = "PM";
//}
//
//String formtdate = date.substring(4, 6);
//formtdate += ("-" + givemonth(datestring.substring(4, 7)) + "-" + date.substring(7, date.length()));
//date = formtdate;

//System.out.println(day + " " + hour);
//System.out.println(date + "  " + id + " " + datestring +  " \n" + givemonth(datestring.substring(4, 7)) + " " + date.substring(4, 7));
//System.out.println(datestring + "=" + datestring.substring(4, 7));
