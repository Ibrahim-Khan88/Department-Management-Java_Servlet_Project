<%@page import="com.connection.GetConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">

<script type="text/javascript">
	function transfer(courseCode, year) {

		var outString = "http://localhost:8080/Project2/RealAttendance/TeacherAttendance.jsp?year="
				+ year + "&&courseCode=" + courseCode;
		location.href = outString;
	}
</script>

<style type="text/css">

    #table-content-container {
        font-family: 'Hind', sans-serif;
        width: 90%;
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

</style>
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />


	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String query, update, delete, teacherID, Attendance;
		//teacherID = "31";
		teacherID = (String) session.getAttribute("teacherid");

		query = "select DISTINCT courseCode, year from routine where teacherId='" + teacherID + "'";
		ResultSet rs = st.executeQuery(query);
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Attendance</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">


				<tr>
					<th>Year</th>
					<th>Course Code</th>
					<th>Attendance</th>
				</tr>

				<%
					while (rs.next()) {

						Attendance = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('" + rs.getString("courseCode") + "','"
								+ rs.getString("year") + "');\"  >Attendance</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("year") + "</td> ");
						out.print("<td> " + rs.getString("courseCode") + "</td> ");
						out.print("<td> " + Attendance + "</td> ");

						out.print("</tr>");

					}
					out.print("</table>");
				%>


			</table>
		</div>

	</div>

	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>