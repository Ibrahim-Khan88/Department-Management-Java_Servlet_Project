<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.connection.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Project2/CSSfile/detail.css"
	type="text/css">

</head>
<body>

	<jsp:include page="/Home.jsp" /> <br>

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter output = response.getWriter();
		Statement st, st1;

		int visit;
		String Type, Date, Amount, id, query, Description;
		id = request.getParameter("x1");
		System.out.print(id);
		//id = "1";
		try {

			st = connection.createStatement();
			query = "select * from sllabus where id ='" + id + "'";
			ResultSet rs = st.executeQuery(query);
			rs.next();

	%>


	<div class="detailContainer">

		<div class="pricingdiv">

			<ul class="theplan" style="background-color: #7c3ac9;">
				<li class="title"><b>Syllabus Information</b></li>
				<li><b>Year: </b> <%
 	out.print(rs.getString("year"));
 %></li>
				<li><b>Course Code:</b> <%
 	out.print(rs.getString("CourseCode"));
 %></li>
				<li><b>Course Name:</b> <%
 	out.print(rs.getString("CourseName"));
 %></li>
				<li><b></b></li>
			</ul>

			<ul class="theplan" style="background-color: #7c3ac9;">
				<li class="title"><span class="icon-trophy"
					style="color: yellow"></span> <b>Syllabus</b></li>
				<li> <%
 	out.print(rs.getString("Syllabus"));
 %></li>
				<li><b></b></li>
			</ul>

		</div>

	</div>

	<%
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>

</body>
</html>