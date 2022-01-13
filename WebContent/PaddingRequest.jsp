<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<script>
	function transfer(id, accept) {

		var outString = "PaddingServlet?x1=" + id + "&x2=" + accept;
		//document.write(id + " "  + accept);
		location.href = outString;

	}
</script>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />


	<%
		int i, total_course;
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String table_name = "panddingtabel";
		String query = "select * from " + table_name;
		ResultSet rs = st.executeQuery(query);
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Student Login Request</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">


				<tr>
					<th>Session</th>
					<th>Student Id</th>
					<th>Name</th>
					<th>Gmail</th>
					<th>Accept</th>
					<th>Reject</th>
				</tr>


				<%
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString("Session") + "</td>");
						out.println("<td>" + rs.getString("StudentId") + "</td>");
						out.println("<td>" + rs.getString("Name") + "</td>");
						out.println("<td>" + rs.getString("Gmail") + "</td>");

						String accept = "   <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
								+ rs.getString("Id") + "','1');\"  >Accept</button>      ";

						String reject = "    <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
								+ rs.getString("Id") + "','0');\"  >Reject</button>      ";

						out.println("<td>" + accept + "</td>");
						out.println("<td>" + reject + "</td>");
						out.println("</tr>");

					}
				%>


			</table>
		</div>

   </div>


		<jsp:include page="/Footer/footer.jsp" />
</body>
</html>