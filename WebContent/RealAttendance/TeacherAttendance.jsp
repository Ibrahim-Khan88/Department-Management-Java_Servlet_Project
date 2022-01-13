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
        font-family: 'Hind', sans-serif;
        width: 70%;
        height: 550px;
        /* background-image: url(/assets/image/background.png); */
        position: relative;
        z-index: 0;
        margin: auto;
        margin-top: 40px;
    }


th:first-child, td:first-child {
    text-align: left;
}

th:last-child, td:last-child {
    text-align: center;
}

</style>
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />
	<%
		String query, year, CourseCode, tableName, id, studentId;
		String[] totalCourse = new String[15];
		int i, j, total_student, k, l, count, total_course = 0, totalClass = 1;
		float num, totalAttendance = 0;

		year = request.getParameter("year");
		CourseCode = request.getParameter("courseCode");
		//year = "4th";
		//CourseCode = "CSE421";

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		// Getting totalClass of that course
		query = "select * from totalclass where year ='" + year + "' and courseCode='" + CourseCode + "'";
		ResultSet rs = st.executeQuery(query);
		if (rs.next()) {
			totalClass = rs.getInt("totalClass");
		}

		//Getting total_student and Id
		query = "select * from student_year_information where year ='" + year + "'";
		ResultSet rs1 = st.executeQuery(query);
		rs1.next();

		total_student = Integer.parseInt(rs1.getString("total_student").toString());
		id = rs1.getString("session").toString().substring(2, 4);
		//End total_student and Id

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

		System.out.println(
				totalClass + "  " + tableName + " " + total_student + " " + id + " " + CourseCode + " " + year);
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				Attendance List of
				<%
				out.println(year);
			%>
				Year
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Student Id</th>
					<%
						out.print("<th>" + CourseCode + "</th>");
					%>
				</tr>


				<%
					for (j = 1; j <= total_student; j++) {
						if (j < 10)
							studentId = id + "CSE00" + j;
						else
							studentId = id + "CSE0" + j;
						out.print("<tr>");
						out.print("<td>");
						out.print(studentId);
						out.print("</td>");
						totalAttendance = 0;

						query = "select COUNT(*) from " + tableName + " where courseCode='" + CourseCode + "' and id='"
								+ studentId + "'";
						ResultSet rs2 = st.executeQuery(query);
						num = 0;
						if (rs2.next()) {

							num = rs2.getInt(1);
							num = Math.round((num / totalClass) * 100); // percentage of each class 
						}

						out.print("<td>");
						out.print(num + "%");
						out.print("</td>");

						out.print("</tr>");
					}
					/// End Printing value
				%>



			</table>
		</div>
	</div>



	<%-- 	<section>
		
		<h1>
			Attendance List of
			<%
			out.println(year);
		%>
			Year
		</h1>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th>Student Id</th>
					<%
						out.print("<th>" + CourseCode + "</th>");
					%>
				</tr>
			</table>
		</div>

		<div class="tbl-content">
			<table cellpadding="0" cellspacing="0" border="0">
				<tbody>

					<%
						for (j = 1; j <= total_student; j++) {
							if (j < 10)
								studentId = id + "CSE00" + j;
							else
								studentId = id + "CSE0" + j;
							out.print("<tr>");
							out.print("<td>");
							out.print(studentId);
							out.print("</td>");
							totalAttendance = 0;

							query = "select COUNT(*) from " + tableName + " where courseCode='" + CourseCode + "' and id='"
									+ studentId + "'";
							ResultSet rs2 = st.executeQuery(query);
							num = 0;
							if (rs2.next()) {

								num = rs2.getInt(1);
								num = Math.round((num / totalClass) * 100); // percentage of each class 
							}

							out.print("<td>");
							out.print(num + "%");
							out.print("</td>");

							out.print("</tr>");
						}
						/// End Printing value
					%>

				</tbody>
			</table>
		</div>
	</section> --%>


	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>