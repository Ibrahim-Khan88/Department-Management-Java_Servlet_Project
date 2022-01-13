<%@page import="java.sql.Statement"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
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

<style type="text/css">
#contain img {
height: 350px;
width: 100%;
}

</style>
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st;

		String id;
		id = request.getParameter("Id");
		//id = "31";
		System.out.println("id= " + id);

		try {

			st = connection.createStatement();
			String query = "select * from teacher where Department='CSE' and Id='" + id + "'";
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {

				String Name = rs.getString("Name");
				String Gmail = rs.getString("Gmail");
				String info = rs.getString("Information");

				String designation = rs.getString("Designation");
				String filename = rs.getString("Filename");
				Blob blob = rs.getBlob("Photo");
				byte bytearray[] = blob.getBytes(1, (int) blob.length());
				String extension = "";

				int i = filename.lastIndexOf('.');
				if (i > 0) {
					extension = filename.substring(i + 1);
				}

				String encodeBase64 = Base64.getEncoder().encodeToString(bytearray);
				String image_encode = "data:image/" + extension + ";base64," + encodeBase64;
	%>

	<div id="Allcontain">

		<div id="piccontain">
			<div id="contain">

				<%
					out.println(" <img src='" + image_encode + "'> ");
				%>
			</div>

		</div>




		<div id="info">
			<p id="heading">
				<%
					out.print(rs.getString("Name"));
				%>
			</p>
			<p style="margin-top: -15px;" id="description"> 
				<%
					out.print(rs.getString("Designation"));
				%>
			</p>
			<p id="description"> <span > <strong>Email : </strong> </span>
				<%
					out.print(rs.getString("Gmail"));
				%>
			</p>
			<p id="description"> <span > <strong>Research Interests : </strong> </span>
				<%
					out.print(rs.getString("Information"));
				%>
			</p>
		</div>
	</div>
	<%
		}
		} catch (Exception e) {

		}
	%>
	<jsp:include page="/Footer/footer.jsp" />

</body>

</html>