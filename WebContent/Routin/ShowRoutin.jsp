<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Routine</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">


<script>
	function transfer(id, page, year) {

		var outString;
		
		

		/// froward to the Updatepageinfo.jsp servetl for for taking input
		if (page == 1) {
			outString = "Allworkroutine?id=" + id;
		}
		/// froward to the deleteBudget.java servetl for delete
		else if (page == 2) {
			outString = "UpdateRoutine.jsp?id=" + id + "&&year=" + year;
		}

		location.href = outString;

	}
</script>

<style type="text/css">
#tableContainer {
	margin-top: 10px;
}

th:first-child, td:first-child {
	text-align: left;
}

#table-content-container {
	height: 230px;
}

#tableContainer {
	height: 150px;
}
</style>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />


	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st1, st = connection.createStatement();
		boolean is = true;

		String query, query1, update, delete;
		String[] fullnameday = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday" };
		String[] halfnameday = { "Sun", "Mon", "Tue", "Wed", "Thu" };
		String year = request.getParameter("year");
		int i, j;

		// THis loop for day
		for (i = 0; i < 5; i++) {

			query = "select * from routine where year ='" + year + "' and day='" + halfnameday[i] + "'";
			ResultSet rs = st.executeQuery(query);
	%>



	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				<%
						out.print(fullnameday[i]);
				%>
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Course Code</th>
					<th>Time</th>
					<th>Course Teacher</th>
					<th>Delete</th>
					<th>Update</th>
				</tr>




				<%
					while (rs.next()) {
						
						System.out.print("rs.getString= " + rs.getString("teacherId"));

							// getting teacher name
							query1 = "select * from teacher where Id='" + rs.getString("teacherId") + "'";
							st1 = connection.createStatement();
							ResultSet rs2 = st1.executeQuery(query1);
							rs2.next();

							update = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\"  onclick=\"transfer('"
									+ rs.getString("Id") + "','" + 2 + "','" + year + "');\"  >Update</button>      ";
							delete = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
									+ rs.getString("Id") + "','" + 1 + "','0');\"  >Delete</button>      ";

							out.print("<tr>");
							out.print("<td> " + rs.getString("courseCode") + "</td> ");
							out.print("<td> " + rs.getString("time") + "</td> ");
							out.print("<td> " + rs2.getString("Name") + "</td> ");
							out.print("<td> " + delete + "</td> ");
							out.print("<td> " + update + "</td> ");
							out.print("</tr>");

						}
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