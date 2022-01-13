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
<title>Routine</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">


<script>
	function transfer(x1) {

		var outString;

		outString = "http://localhost:8080/Project2/Routin/ChangeRoutine.jsp?id="
				+ x1;
		location.href = outString;

	}
</script>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st, st1, st2;
		st = connection.createStatement();
		st1 = connection.createStatement();
		st2 = connection.createStatement();

		boolean show = false, title = true;;
		String query, Change, delete, teacherID;
		//teacherID = "31";
		teacherID = (String) session.getAttribute("teacherid");
		//System.out.println("teacherID = " + teacherID);

		query = "select * from routine where teacherId='" + teacherID + "'";
		ResultSet rs = st.executeQuery(query);
	%>

	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Routine</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Year</th>
					<th>Course Code</th>
					<th>Day</th>
					<th>Time</th>
					<th>Change Able</th>
					<th>Change Time</th>

				</tr>


				<%
					while (rs.next()) {

						Change = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('" + rs.getString("Id") + "');\"  >Change</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("year") + "</td> ");
						out.print("<td> " + rs.getString("courseCode") + "</td> ");
						out.print("<td> " + rs.getString("day") + "</td> ");
						out.print("<td> " + rs.getString("time") + "</td> ");
						out.print("<td> " + (6 - Integer.parseInt(rs.getString("changeAble"))) + "</td> ");
						out.print("<td> " + Change + "</td> ");

						out.print("</tr>");

					}
					out.print("</table>");
				%>



			</table>
		</div>

	</div>



	<%
		query = "select * from changeroutine where teacherId='" + teacherID + "'";
		ResultSet rs1 = st1.executeQuery(query);
		while (rs1.next()) {

			query = "select * from routine where Id='" + rs1.getString("Id") + "'";
			ResultSet rs2 = st2.executeQuery(query);
			if (rs2.next()) {
	%>


	<section>

		<%
			if (!show) {
						show = true;
		%><h1>Change's Routine</h1>
		<%
			}
		%>
  <div style="height: 200px;" id="table-content-container">

<% if(title) { %>
        <div class="section-title">
            <h2 id="title-section">  Change Routine   </h2>
        </div>
        
   <%  title = false;    }%>

        <div style="height: 150px; overflow: hidden;" id="tableContainer">
            <table cellspacing="0">

				<tr>
					<th>Type</th>
					<th>Year</th>
					<th>Course Code</th>
					<th>Day</th>
					<th>Time</th>
				</tr>

 
					<%
						out.print("<tr>");
								out.print("<td> Routine Time</td> ");
								out.print("<td> " + rs2.getString("year") + "</td> ");
								out.print("<td> " + rs2.getString("courseCode") + "</td> ");
								out.print("<td> " + rs2.getString("day") + "</td> ");
								out.print("<td> " + rs2.getString("time") + "</td> ");

								out.print("</tr>");

								out.print("<tr>");
								out.print("<td> Change's Time</td> ");
								out.print("<td> " + rs1.getString("year") + "</td> ");
								out.print("<td> " + rs1.getString("courseCode") + "</td> ");
								out.print("<td> " + rs1.getString("day") + "</td> ");
								out.print("<td> " + rs1.getString("time") + "</td> ");

								out.print("</tr>");
					%>

	         </table>
        </div>

    </div> 
	<%
		}
		}
	%>



	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>