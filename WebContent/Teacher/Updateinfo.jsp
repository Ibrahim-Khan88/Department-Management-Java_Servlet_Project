<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Update</title>
<link rel="stylesheet" href="/Project2/CSSfile/table.css"
	type="text/css">
<script>
	function transfer(x1, x2) {

		var outString;

		/// froward to the Updatepageinfo.jsp servetl for for taking input
		if (x2 == 1) {
			outString = "Updatepageform.jsp?x1=" + x1;
		}
		/// froward to the Update.java servetl for delete
		else if (x2 == 2) {
			outString = "Update?x1=" + x1;
		}

		location.href = outString;
	}
</script>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />



	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String query, update, delete;

		query = "select * from teacher ";
		ResultSet rs = st.executeQuery(query);
	%>
	<section>
	<h1> Teacher Information </h1>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th>Name</th>
					<th>Gmail</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</table>
		</div>


		<div class="tbl-content">
			<table cellpadding="0" cellspacing="0" border="0">
				<tbody>

					<%
						while (rs.next()) {

							update = "  <button onclick=\"transfer('" + rs.getString("Id") + "','" + 1
									+ "');\"  >Update</button>      ";
							delete = "  <button onclick=\"transfer('" + rs.getString("Id") + "','" + 2
									+ "');\"  >Delete</button>      ";

							out.print("<tr>");
							out.print("<td> " + rs.getString("Name") + "</td> ");
							out.print("<td> " + rs.getString("Gmail") + "</td> ");
							out.print("<td> " + update + "</td> ");
							out.print("<td> " + delete + "</td> ");

							out.print("</tr>");

						}
					%>

				</tbody>
			</table>
		</div>
	</section>

	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>