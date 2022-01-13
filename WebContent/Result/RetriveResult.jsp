
<%@page import="com.result.GradeConveter"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>

<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />


	<%
		int i, total_course, total_credit = 0;
		float total_point = 0;
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st = connection.createStatement();
		GradeConveter gradeconveter = new GradeConveter();
		
		

		double number;
		String table_name = (String) session.getAttribute("tableName");
		String query = "select * from " + table_name;
		ResultSet rs = st.executeQuery(query);
		rs.next();
		rs.next();
		total_course = rs.getInt(1) * -1;

		// getting credit point from database
		Statement st2 = connection.createStatement();
		ResultSet rs2 = st2.executeQuery(query);
		int[] credit = new int[total_course];
		rs2.next();

		for (i = 2; i <= total_course + 1; i++) {
			credit[i - 2] = rs2.getInt(i);
			total_credit += rs2.getInt(i);
		}
	%>



	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				Result of
				<%
				out.println(table_name.substring(0, 4)  + "-" + table_name.substring(5, 7) 
						+ " Batch of " + table_name.substring(8, 9) + "-" + table_name.substring(10, 11));
			%>
				Semester
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Student Id</th>
					<%
						for (i = 2; i <= total_course + 1; i++) {
							out.println("<th>" + rs.getString(i) + "</th> ");

						}
					%>
					<th>Point</th>
				</tr>


				<%
					while (rs.next()) {

						out.println("<tr>");
						total_point = 0;
						out.println("<td>" + rs.getString(1) + "</td> ");

						for (i = 2; i <= total_course + 1; i++) {
							out.println("<td>" + rs.getString(i) + "</td> ");
							total_point += (gradeconveter.grade_to_point(rs.getString(i)) * credit[i - 2]);

						}
						
						number = (int)(Math.round((total_point / total_credit) * 1000))/1000.0;

						out.println("<td>" + number + "</td> ");
						out.println("</tr>");

					}
				%>


			</table>
		</div>

	</div>


	<%-- 	<section>
	
		<h1>
			Result of
			<%
			out.println(table_name.substring(0, 7) + " Batch of " + table_name.substring(8, 11));
		%>
			Semester
		</h1>
		<div class="tbl-header">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th>Student Id</th>
					<%
						for (i = 2; i <= total_course + 1; i++) {
							out.println("<th>" + rs.getString(i) + "</th> ");
							
						}
					%>
					<th>Point</th>
				</tr>
			</table>
		</div>


		<div style="color:black" class="tbl-content">
			<table cellpadding="0" cellspacing="0" border="0">
				<tbody>

					<%
			
						while (rs.next()) {

							out.println("<tr>");
							total_point = 0;
							out.println("<td>" + rs.getString(1) + "</td> ");
							
							
							for (i = 2; i <= total_course + 1; i++) {
								out.println("<td>" + rs.getString(i) + "</td> ");
								total_point += (gradeconveter.grade_to_point(rs.getString(i)) * credit[i-2]); 
								
							}

							out.println("<td>" + total_point/total_credit +"</td> ");
							out.println("</tr>");

						}
					%>
				</tbody>
			</table>
		</div>
	</section> --%>

	<jsp:include page="/Footer/footer.jsp" />





</body>

</html>