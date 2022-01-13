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
<title>Teacher</title>


<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Project2/CSSfile/Home.css" type="text/css">
<link rel="stylesheet" href="/Project2/CSSfile/content.css"
	type="text/css">

<script type="text/javascript">
	function DetailTeacher(string) {

		var outString;
		outString = "http://localhost:8080/Project2/ShowAll/viewDeatailTacher.jsp?Id="
				+ string;
		location.href = outString;
	}
</script>

<style type="text/css">

h4{

margin-top: 40px;

}

</style>

</head>
<body>




	<jsp:include page="/HeaderContent.jsp" />


	<!-- Teacher section -->
	<section id="Teacher" style="margin-top: 50px;">

		<div
			style="width: 90%; margin: auto; text-align: left; margin-bottom: 30px;">
			<div class="section-title">
				<h2 id="title-section">Faculty Member</h2>
			</div>
		</div>


		<div class='container'>
			<div class='row'>

				<%
					int i = 1, total_course;
					GetConnection con = new GetConnection();
					Connection connection = con.getconnection();
					Statement st2 = connection.createStatement();

					String query;

					try {

						st2 = connection.createStatement();
						query = "select * from teacher where Department='CSE'";
						ResultSet rs2 = st2.executeQuery(query);

						while (rs2.next()) {

							String Name = rs2.getString("Name");
							String Gmail = rs2.getString("Gmail");
							String info = rs2.getString("Information");

							String designation = rs2.getString("Designation");
							String filename = rs2.getString("Filename");
							Blob blob = rs2.getBlob("Photo");
							byte bytearray[] = blob.getBytes(1, (int) blob.length());
							String extension = "";

							i = filename.lastIndexOf('.');
							if (i > 0) {
								extension = filename.substring(i + 1);
							}

							String encodeBase64 = Base64.getEncoder().encodeToString(bytearray);
							String image_encode = "data:image/" + extension + ";base64," + encodeBase64;
				%>

				<% out.print(" <div onclick=DetailTeacher('" + rs2.getString("Id") + "') class=\"col-4\"> "); %>
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<!-- <img class="productphoto" src='/Project2/image/2.jpg'> -->

								<%
									out.println(" <img class='productphoto'  src='" + image_encode + "'> ");
								%>
								<h4 style="margin-top: 15px;">
									<%
										out.print(rs2.getString("Name"));
									%>
								</h4>
								<p>
									<%
										out.print(rs2.getString("Designation"));
									%>
								</p>
							</div>
						</div>

					</div>
				</div>

				<%
					}

					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>
			</div>
		</div>
	</section>





	<jsp:include page="/Footer/footer.jsp" />






</body>
</html>