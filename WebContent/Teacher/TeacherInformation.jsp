<%@page import="java.util.Base64"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Project2/CSSfile/style.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Project2/CSSfile/login.css"
	type="text/css">
<link rel="stylesheet" href="/Project2/Teacher/teachers.css"
	type="text/css">
	
	
<script type="text/javascript"
	src="/Project2/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>


	
           	
    <jsp:include page="/HeaderContent.jsp" />

    <br> <br>

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter output = response.getWriter();
		Statement st;

		out.println("<div class='container'> ");
		out.println(" <div class='row'>");

		try {

			st = connection.createStatement();
			String query = "select * from teacher where Department='CSE'";
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

				out.println(" <div class='col-3'> ");
				out.println(" <div class='box text-center'> ");
				out.println(" <img style='width: 100%; height: 70%;' src='" + image_encode + "'> ");
				out.println("<div>");

				out.println(" <p style='margin-bottom: 2px;'>  " + Name + " </p> <br>");
				//out.println(" <p style='margin-bottom: 2px;'>  " + Gmail + " </p>");
				
				out.println(" <p style='margin-bottom: 2px;'> " + designation + " </p>");

				out.println("</div>");
				out.println("</div>");
				out.println("<br> <br> </div> ");

			}

		} catch (Exception e) {
			out.println(e.getMessage());
		}

		out.println("  </div> </div> </div> ");
	%>



    <jsp:include page="/Footer/footer.jsp" />






</body>
</html>