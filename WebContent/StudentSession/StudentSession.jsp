<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
</head>

<script>
	function transfer(year) {
		location.href = "http://localhost:8080/Project2/StudentSession/StudentSessionUpdate.jsp?year="
			+ year;
	}
</script>	

<style>
#table-content-container {
	height: 350px;
}

#tableContainer {
	height: 250px;
	overflow: hidden;
}

th:first-child, td:first-child {
	text-align: left;
}
</style>

<body>



	<jsp:include page="/HeaderContent.jsp" />

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();
		String query;

		query = "select * from student_year_information";
		ResultSet rs = st.executeQuery(query);
	%>

	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Student Session Information</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Year</th>
					<th>Session</th>
					<th>Total Student</th>
					<th>CR Id</th>
					<th>Update</th>
				</tr>

				<%
					while (rs.next()) {
						
						String update = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('" + rs.getString("year") +  "');\"  >Update</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("year") + "</td> ");
						out.print("<td> " + rs.getString("session") + "</td> ");
						out.print("<td> " + rs.getString("total_student") + "</td> ");
						out.print("<td> " + rs.getString("CR") + "</td> ");
						out.print("<td> " + update + "</td> "); 
						out.print("</tr>");

					}
				%>


			</table>
		</div>

	</div>


	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>