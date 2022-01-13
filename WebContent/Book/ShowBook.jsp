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
<script>
	function transfer(x1, x2, year) {

		var outString;

		/// froward to the Updatepageinfo.jsp servetl for for taking input
		if (x2 == 1) {
			outString = "deleteBook?x1=" + x1;
		}
		/// froward to the deleteBudget.java servetl for delete
		else if (x2 == 2) {
			outString = "UpdateBook.jsp?x1=" + x1 + "&&year=" + year;
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

		String query, update, delete, detail, year;

		year = request.getParameter("year");
		session.setAttribute("student_year", year);

		query = "select * from book where year='" + year + "'";
		ResultSet rs = st.executeQuery(query);
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				<%
					out.println(year);
				%>Year Book List
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">


				<tr>
					<th>Year</th>
					<th>Course Code</th>
					<th>Course Name</th>
					<th>Book Name</th>
					<th>Delete</th>
					<th>Update</th>
				</tr>


				<%
					while (rs.next()) {

						update = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\"  onclick=\"transfer('" + rs.getString("Id") + "','" + 2 + "','"
								+ rs.getString("year") + "');\"  >Update</button>      ";
						delete = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('" + rs.getString("Id") + "','" + 1
								+ "','0');\"  >Delete</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("year") + "</td> ");
						out.print("<td> " + rs.getString("CourseCode") + "</td> ");
						out.print("<td> " + rs.getString("CourseName") + "</td> ");
						out.print("<td> " + rs.getString("BookName") + "</td> ");

						out.print("<td> " + delete + "</td> ");
						out.print("<td> " + update + "</td> "); 
/* 						out.print(" <td><button id=\"btn\" class=\"btn--radius-2 btn--blue\" >update</button></td> ");

						out.print(" <td><button id=\"btn\" class=\"btn--radius-2 btn--blue\" >update</button></td> "); */

						out.print("</tr>");

					}
				%>


			</table>
		</div>

	</div>

	

	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>