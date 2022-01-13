<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">

<style type="text/css">

    #table-content-container {
        height: 230px;
        overflow: hidden;
    }


    #tableContainer {
        height: 100px;
        overflow: hidden;
    }


</style>


</head>
<body>


	<jsp:include page="/HeaderContent.jsp" />

	<%
		String query, year = "", tableName, id, student_session, studentId;
		String[] totalCourse = new String[15];
		int[] totalClass = new int[15];
		int i, j, total_student, k, l, count, total_course = 0;
		float num, totalAttendance = 0;

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		student_session = (String) session.getAttribute("student_session");
		studentId = (String) session.getAttribute("studentid");

		// getting studnet year
		query = "select * from student_year_information";
		ResultSet rs1 = st.executeQuery(query);
		while (rs1.next()) {

			if (rs1.getString("session").contains(student_session)) {
				year = rs1.getString("year");
				break;
			}

		}

		//Getting courseCode and totalClass
		query = "select * from totalclass where year ='" + year + "'";
		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {
			totalCourse[total_course] = rs.getString("courseCode");
			totalClass[total_course++] = rs.getInt("totalClass");
		}

		// Getting table Name
		if (year.equals("1st"))
			tableName = "attendance1st";
		else if (year.equals("2nd"))
			tableName = "attendance2nd";
		else if (year.equals("3rd"))
			tableName = "attendance3rd";
		else
			tableName = "attendance4th";
		// End table Name
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Your Attendance Information</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>

					<%
						for (j = 0; j < total_course; j++) {

							out.print("<th> ");
							out.print(totalCourse[j]);
							out.print("</th> ");

						}
					%>

					<th>Total Attendance</th>
				</tr>



				<%
					out.print("<tr>");
					totalAttendance = 0;
					for (k = 0; k < total_course; k++) {
						query = "select COUNT(*) from " + tableName + " where courseCode='" + totalCourse[k] + "' and id='"
								+ studentId + "'";
						ResultSet rs2 = st.executeQuery(query);
						num = 0;
						rs2.next();
						num = rs2.getInt(1);
						if (totalClass[k] == 0) {
							num = 100;
						} else {
							num = Math.round((num / totalClass[k]) * 100); // percentage of each class
						}

						totalAttendance += num;

						out.print("<td> ");
						out.print(num + "%");
						out.print("</td>");
					}

					out.print("<td> ");
					totalAttendance /= total_course;
					totalAttendance = Math.round(totalAttendance);
					out.print(totalAttendance + "%");
					out.print("</td>");

					out.print("</tr>");
				%>

			</table>
		</div>

	</div>





	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>