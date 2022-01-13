<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Achievement</title>
<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Project2/CSSfile/content.css"
	type="text/css">


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />




	<!-- #Achievement section -->
	<section id="#Achievement" style="margin-top: 50px;">

		<div
			style="width: 90%; margin: auto; text-align: left; margin-bottom: 30px;">
			<div class="section-title">
				<h2 id="title-section">Achievement</h2>
			</div>
		</div>



		<%
			int i = 0;
			GetConnection con = new GetConnection();
			Connection connection = con.getconnection();
			java.sql.Statement st = connection.createStatement();

			String query = "select * from achievement";

			ResultSet ache = st.executeQuery(query); 
			
			//UPDATE `routine` SET `teacherId` = '21' WHERE `teacherId` = '34'
		%>


		<div class='container'>
			<div class='row'>

				<%
					while (ache.next()) {
						i++;
				%>
				<div class="col-4">
					<div class="product-image-wrapper text-center">

						<%
							out.println(" <img  src=\"/Project2/image/achievement/" + (i) + ".jpg\"> ");
						%>


						<h4 class="title">
							<%
								out.print(ache.getString("Title"));
							%>
						</h4>
						<p>
							<%
								out.print(ache.getString("Description"));
							%>
						</p>
					</div>

				</div>

				<%
					}
				%>


			</div>
		</div>
	</section>




	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>