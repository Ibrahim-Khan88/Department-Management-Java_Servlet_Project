<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Department</title>
<link rel="stylesheet" href="/Project2/CSSfile/viewDetail.css"
	type="text/css">
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<%
		int i = 1, total_course;
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String description = "", slider, id, query;
		id = request.getParameter("Id");
		//id="1";
		i = Integer.parseInt(id) - 1;
		System.out.println(i);
		
		query = "select * from introduction where Id='" + id + "'";
		String des[];
		ResultSet rs = st.executeQuery(query);
		int j = 1, show = 0;

		while (rs.next()) {
			
		
	%>

	<div id="Allcontain">

		<div id="piccontain">
			<div id="contain">

				<div id="slider">
					<figure>

						<%
						out.println(" <img src=\"/Project2/image/" + (i + 1) + ".jpg\"> ");
						out.println(" <img src=\"/Project2/image/" + (i + 2) + ".jpg\"> ");
						out.println(" <img src=\"/Project2/image/" + (i + 3) + ".jpg\"> ");
						out.println(" <img src=\"/Project2/image/" + (i + 4) + ".jpg\"> ");
						out.println(" <img src=\"/Project2/image/" + (i + 1) + ".jpg\"> ");
						%>
					</figure>
				</div>
			</div>

		</div>




		<div id="info">
			<p id="heading"><%out.print(rs.getString("Title")); %></p>
			<p id="description"><%out.print(rs.getString("Description")); %></p>
		</div>
	</div>
	<% 	}
	 %>
<jsp:include page="/Footer/footer.jsp" />

</body>

</html>