<%@page import="com.connection.GetConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course</title>
<link rel="stylesheet" href="/Project2/CSSfile/table.css"
	type="text/css">
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />


	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String query, update, delete, teacherID;
		//teacherID = "31";
		teacherID = (String)session.getAttribute("teacherid");
		System.out.println("teacherID = " + teacherID);

		query = "select * from routine where teacherId='" + teacherID + "'";
		ResultSet rs = st.executeQuery(query);
	%>

	<section>
		<h1>Routine</h1>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th>Year</th>
					<th>Course Code</th>
					<th>Day</th>
					<th>Time</th>
					<th>Change Able</th>
					<th>Change Time</th>

				</tr>
			</table>
		</div>

		<div class="tbl-content">
			<table cellpadding="0" cellspacing="0" border="0">
				<tbody>


					<%
						while (rs.next()) {

							update = "  <button onclick=\"transfer('" + rs.getString("courseCode")
									+ "');\"  >Change</button>      ";

							out.print("<tr>");
							out.print("<td> " + rs.getString("year") + "</td> ");
							out.print("<td> " + rs.getString("courseCode") + "</td> ");
							out.print("<td> " + rs.getString("day") + "</td> ");
							out.print("<td> " + rs.getString("time") + "</td> ");
							out.print("<td> " + (6 - Integer.parseInt(rs.getString("changeAble"))) + "</td> ");
							out.print("<td> " + update + "</td> ");

							out.print("</tr>");

						}
						out.print("</table>");
					%>
				</tbody>
			</table>
		</div>
	</section>
	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>