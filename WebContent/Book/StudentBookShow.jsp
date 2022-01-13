<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">

<style type="text/css">
th:first-child, td:first-child {
	text-align: left;
}

th:nth-last-child(2), td:nth-last-child(2) {
	text-align: center;
}

</style>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />



	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String query, update, delete, detail, year;
		//year = (String)session.getAttribute("year");
		year = (String) session.getAttribute("year");

		query = "select * from book where year='" + year + "'";
		ResultSet rs = st.executeQuery(query);
	%>

	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Book List</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">


				<tr>
					<th>Course Code</th>
					<th>Course Name</th>
					<th>Book Name</th>
				</tr>

				<%
					while (rs.next()) {

						out.print("<tr>");

						out.print("<td> " + rs.getString("CourseCode") + "</td> ");
						out.print("<td> " + rs.getString("CourseName") + "</td> ");
						out.print("<td> " + rs.getString("BookName") + "</td> ");

						out.print("</tr>");

					}
				%>


			</table>
		</div>

	</div>


	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>