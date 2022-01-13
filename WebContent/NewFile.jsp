<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/Project2/CSSfile/content.css"
	type="text/css">


<script type="text/javascript">
	function detail(string) {
		var outString = "http://localhost:8080/GetBook/Hide?id=" + string;
		location.href = outString;
	}
</script>

</head>
<body>

	<br>
	<br>
	<section id="introduction">
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
				<div class="col-4">
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
											out.println(" <img src=\"/GetBook/image/" + i + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i + 1) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i + 2) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i + 3) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i) + ".jpg\"> ");
										%>
									</figure>
								</div>
							</div>
							<h6>
								<%
									out.println(rs.getString("Title"));
								%>
							</h6>
							<p>
								<%
									out.println(description);
								%>
							</p>

						</div>
						<div class="product-overlay">
							<div class="overlay-content">

								<a onclick="detail('1')" href="#"
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Detail</a>
							</div>
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




	<br>
	<br>
	<br>
	<br>



	<!-- Achievement  -->
	<section id="Achievement">
		<div class='container'>
			<div class='row'>

				<%
					query = "select * from achievement";
					ResultSet rs1 = st.executeQuery(query);
					j = 1;
					i = 1;
					while (rs1.next()) {

						slider = "slider" + j;
						j++;
						description = "";
						des = rs1.getString("Description").split(" ");
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
				<div class="col-4">
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
											out.println(" <img src=\"/GetBook/image/" + i + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i + 1) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i + 2) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i + 3) + ".jpg\"> ");
										%>
										<%
											out.println(" <img src=\"/GetBook/image/" + (i) + ".jpg\"> ");
										%>
									</figure>
								</div>
							</div>
							<h6>
								<%
									out.println(rs1.getString("Title"));
								%>
							</h6>
							<p>
								<%
									out.println(description);
								%>
							</p>

						</div>
						<div class="product-overlay">
							<div class="overlay-content">

								<a onclick="detail('1')" href="#"
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Detail</a>
							</div>
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












	<!-- Teacher section -->
<section id="Teacher">
		<div class='container'>
			<div class='row'>
			
							<%
					Statement st2;

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
			
				<div class="col-4">
					<div class="product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<!-- <img class="productphoto" src='/Project2/image/2.jpg'> -->
								
								<%out.println(" <img class='productphoto'  src='" + image_encode + "'> "); %>
								<h4><% out.print(rs2.getString("Name")); %></h4>
								<p><%out.print(rs2.getString("Designation")); %></p>
							</div>
							<div class="product-overlay">
								<div class="overlay-content"> 
									<h2><%out.print(rs2.getString("Name")); %></h2>
									
									<a onclick="detail('')" href="#"
										class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Detail</a>
								</div>
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









				




</body>
</html>