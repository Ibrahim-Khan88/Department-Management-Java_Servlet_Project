<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<script>
	function transfer(x1) {

		outString = "Deletesemester?courseCode=" + x1;

		location.href = outString;

	}
</script>

<style type="text/css">

  th:first-child, td:first-child {
    text-align: left;
}

    #tableContainer {
        margin-top: 30px;
    }

</style>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st, st1, st2, st3;
		st = connection.createStatement();
		st1 = connection.createStatement();
		st2 = connection.createStatement();
		st3 = connection.createStatement();
		String query, delete;
		String year[] = { "1st", "2nd", "3rd", "4th" };

		for (int i = 0; i < 4; i++) {
			//Printin 1st year Courses 

			query = "select * from totalclass where year ='" + year[i] + "'";
			ResultSet rs = st.executeQuery(query);
	%>

	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				<%
					out.println(year[i]);
				%>Year Course List
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>

					<th>Course Code</th>
					<th>Total Class</th>
					<th>Zero Present</th>
					<th>Delete</th>

				</tr>


				<%
					while (rs.next()) {

							delete = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('" + rs.getString("courseCode")
									+ "');\"  >Delete</button>      ";
							out.print("<tr>");
							out.print("<td> " + rs.getString("courseCode") + " </td>");
							out.print("<td> " + rs.getInt("totalClass") + " </td>");
							out.print("<td> " + rs.getInt("presentZero") + " </td>");
							out.print("<td> " + delete + "</td> ");
							out.print("</tr>");

						}

						// End 1st Year section
				%>



			</table>
		</div>

	</div>
	<%
		}
	%>


	

	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>