<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<script>
	function transfer(studentid) {

		var outString;
		outString = "http://localhost:8080/Project2/StudentInformation/DeleteStudentInfo?studentid="
				+ studentid;
		location.href = outString;
	}
</script>

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

		String query, update, delete, table_name, student_session;
		student_session = request.getParameter("session");
		table_name = student_session + "_student";
		session.setAttribute("studentDeleteInfo", table_name);
		System.out.println(table_name);

		query = "select * from " + table_name;
		ResultSet rs = st.executeQuery(query);
	%>

	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section"> Student of 
				<%
					out.println(student_session.substring(0, 4)  + "-" + student_session.substring(5, 7) );
				%> session
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Student Id</th>
					<th>Name</th>
					<th>Gmail</th>
					<th>Delete</th>
				</tr>

				<%
					while (rs.next()) {

						delete = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('" + rs.getString("studentid") + "','" + 2
								+ "');\"  >Delete</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("studentid") + "</td> ");
						out.print("<td> " + rs.getString("Name") + "</td> ");
						out.print("<td> " + rs.getString("Email") + "</td> ");
						out.print("<td> " + delete + "</td> ");

						out.print("</tr>");

					}
				%>



			</table>
		</div>

	</div>



	<%-- 	<section>
		<h1>
			<%
				out.println(student_session);
			%>
			Student Information
		</h1>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th>Student Id</th>
					<th>Name</th>
					<th>Gmail</th>
					<th>Delete</th>
				</tr>
			</table>
		</div>


		<div class="tbl-content">
			<table cellpadding="0" cellspacing="0" border="0">
				<tbody>

					<%
						while (rs.next()) {

							delete = "  <button onclick=\"transfer('" + rs.getString("studentid") + "','" + 2
									+ "');\"  >Delete</button>      ";

							out.print("<tr>");
							out.print("<td> " + rs.getString("studentid") + "</td> ");
							out.print("<td> " + rs.getString("Name") + "</td> ");
							out.print("<td> " + rs.getString("Email") + "</td> ");
							out.print("<td> " + delete + "</td> ");

							out.print("</tr>");

						}
					%>

				</tbody>
			</table>
		</div>
	</section> --%>

	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>