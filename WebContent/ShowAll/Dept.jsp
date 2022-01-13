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
<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Project2/CSSfile/content.css"
	type="text/css">

<script type="text/javascript">
	function Detaildept(string) {

		var outString;
		outString = "http://localhost:8080/Project2/ShowAll/ViewDetailDept.jsp?Id="
				+ string;
		location.href = outString;
	}
</script>

<style type="text/css">
#DepartmentView {
	margin-top: 60px;
}

.title {
	letter-spacing: 2px;
}

.product-image-wrapper img{
	height: 230px;
}

.product-image-wrapper:hover img{
	height: 235px;
}



</style>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />


	<section id="DepartmentView">



		<!-- section title -->
		<div
			style="width: 90%; margin: auto; text-align: left; margin-bottom: 30px;">
			<div class="section-title">
				<h2 id="title-section">Department Gallery</h2>
			</div>
		</div>


		<div class='container'>
			<div class='row'>

				<%
					int i = 1, total_course;
					GetConnection con = new GetConnection();
					Connection connection = con.getconnection();
					java.sql.Statement st = connection.createStatement();

					String description = "", slider, query = "select * from introduction";
					String des[];
					ResultSet rs = st.executeQuery(query);
					int j = 1;

					while (rs.next()) {

						slider = "slider" + j;
						j++;
						description = "";
						des = rs.getString("Description").split(" ");
						if (des.length > 13) {
							for (int k = 0; k < 13; k++) {
								description += des[k] + " ";
							}
							description += "...";
						} else {
							for (int k = 0; k < des.length; k++) {
								description += des[k] + " ";
							}
						}
				%>
				<div class="col-6" style="margin-bottom: 50px;">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<!-- <img class="productphoto" src='/GetBook/Photo/java1.jpg'> -->

								<div id="contain">
									<!-- <div id="slider4"> -->

									<%
										out.println("<div id=\"" + slider + "\"> ");
									%>
									<figure>

										<%
											out.println(" <img src=\"/Project2/image/Lab/" + i + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/Project2/image/Lab/" + (i + 1) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/Project2/image/Lab/" + (i + 2) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/Project2/image/Lab/" + (i + 3) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/Project2/image/Lab/" + (i) + ".jpg\"> ");
										%>
									</figure>
								</div>
							</div>
							<h6 class="title">
								<%
									out.println(rs.getString("Title"));
								%>
							</h6>

						</div>
					</div>

				</div>
			</div>
			<%
				i += 4;
				}
			%>

		</div>

	</section>

	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>