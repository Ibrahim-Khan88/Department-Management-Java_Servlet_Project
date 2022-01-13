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
<!-- <link rel="stylesheet" href="/Project2/CSSfile/style.css"
	type="text/css"> -->

<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">

<style type="text/css">
.dropdown-content a:hover {
	background-color: #399077;
	color: black;
}
</style>


<link rel="stylesheet" href="/Project2/CSSfile/DetailUpdate.css"
	type="text/css">

<script type="text/javascript" src="/Project2/bootstrap/js/jquery.js"></script>

<script type="text/javascript"
	src="/Project2/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function detail(Name, department, designation, interested, gmail, image_encode) {
		/* 	alert(Name + "  " + department + "  " + designation + "  " + interested
					+ "  " + Gmail); */

		$("#name").html(Name);
		$("#Department").html(department);
		$("#designation").html(designation);
		$("#interested").html(interested);
		$("#gmail").html(gmail);
		
		$("#photo").attr("src", image_encode);
		

		$("#update-book-popup").toggleClass("border-class");
		$("#update-book-popup").css({
			'height' : 400
		});
		$("#update-book-popup").css({
			top : window.pageYOffset + 300
		});

		//alert(id)
		/* 		var outString = "http://localhost:8080/Project2/LoginSystem/TeacherDetail.jsp?id="
		 + id;
		 location.href = outString; */
	}
	
	function save(id,accept) {
		//alert(id + " " + accept);
		 var outString = "TeachePadding?id=" + id + "&&accept=" + accept;
		 location.href = outString; 
	}

	function openDetail() {
		$("#update-book-popup").toggleClass("border-class");
		$("#update-book-popup").css({
			'height' : 400
		});
		$("#update-book-popup").css({
			top : window.pageYOffset + 250
		});
	}

	$(document).ready(function() {
		$("#update-book-popup-close").click(function() {
			$("#update-book-popup").css({
				'height' : 0
			});
			$("#update-book-popup").toggleClass("border-class");
		});

	});
</script>

</head>
<body>




	<jsp:include page="/HeaderContent.jsp" />


	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter output = response.getWriter();
		Statement st;
		String Gmail, info, designation, filename, extension, Name, encodeBase64, image_encode, accept, reject,
				department, detail, interested;

		/* 		out.println("<h1>Teacher Login Request</h1> <br> <br> <br>");
		
				out.println("<div class='container'> ");
				out.println(" <div class='row'>"); */

		try {

			st = connection.createStatement();
			String query = "select * from panddingteacher";
			ResultSet rs = st.executeQuery(query);
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Teacher Request Padding</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Name</th>
					<th>Department</th>
					<th>Detail</th>
					<th>Accept</th>
					<th>Reject</th>
				</tr>

				<%
					while (rs.next()) {

							Name = rs.getString("Name");
							Gmail = rs.getString("Gmail");
							interested = rs.getString("Information");
							designation = rs.getString("Designation");
							department = rs.getString("Department");

							filename = rs.getString("Filename");
							Blob blob = rs.getBlob("Photo");
							byte bytearray[] = blob.getBytes(1, (int) blob.length());
							extension = "";

							int i = filename.lastIndexOf('.');
							if (i > 0) {
								extension = filename.substring(i + 1);
							}

							encodeBase64 = Base64.getEncoder().encodeToString(bytearray);
							image_encode = "data:image/" + extension + ";base64," + encodeBase64;

							accept = "  <button onclick=\"save('" + rs.getString("id") + "','1')\"  id=\"btn\" class=\"btn--radius-2 btn--blue\"   >Accept</button>      ";
							
							
							reject = "  <button onclick=\"save('" + rs.getString("id") + "','0')\"  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer();\"  >Reject</button>      ";
							detail = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"detail('" + Name + "','"
									+ department + "','" + designation + "','" + interested + "','" + Gmail
									+ "','"+ image_encode  +"');\"  >Detail</button>      ";

							out.print("<tr>");
							out.print("<td> " + Name + "</td> ");
							out.print("<td> " + department + "</td> ");
							out.print("<td> " + detail + "</td> ");

							out.print("<td> " + accept + "</td> ");
							out.print("<td> " + reject + "</td> ");
							
							//out.println(" <img style='width: 100%; height: 70%;' src='" + image_encode + "'> ");
							
							/* 						out.print(" <td><button id=\"btn\" class=\"btn--radius-2 btn--blue\" >update</button></td> ");
							
													out.print(" <td><button id=\"btn\" class=\"btn--radius-2 btn--blue\" >update</button></td> "); */

							out.print("</tr>");

							/* 							out.println(" <div class='col-3' onclick=\"transfer('" + rs.getString("Id") + "')\"> ");
														out.println(" <div class='box text-center'> ");
														out.println(" <img style='width: 100%; height: 70%;' src='" + image_encode + "'> ");
														out.println("<div>");
							
														out.println(" <p style='margin-bottom: 2px;'>  " + Name + " </p> <br>");
							
														out.println(" <p style='margin-bottom: 2px;'> " + designation + " </p>"); */

						}

					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>



			</table>
		</div>

	</div>







	<!-- update Book class="border-class" -->
	<div id="update-book-popup" >
		<a id="update-book-popup-close">&times;</a>



		<div class="wrapper wrapper--w700">
			<div class="card card-5">


				<!--                 <div class="section-title">
                    <h2 class="title">Latest Products</h2>
                </div> -->

				<div class="card-heading">
					<h2 class="title">Detail</h2>
				</div>

				<div class="card-body">
					<form>

						<div class="form-row">

							<div class="name">Name</div>
							<div class="value">
								<div id="name" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Department</div>
							<div class="value">
								<div id="Department" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Email</div>
							<div class="value">
								<div id="gmail" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Designation</div>
							<div class="value">
								<div id="designation" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Research Interested</div>
							<div class="value">
								<div id="interested" style="font-size: 15px;"></div>
							</div>

						</div>



						<div class="form-row">

							<div class="name">Photo</div>
							<div class="value">
								<img id="photo" style="height: 200px; width: 200px;" src="/Project2/image/1.jpg"
									alt="not found">
								<!-- out.println(" <img src=\"/Project2/image/" + (i + 2) + ".jpg\"> "); -->
							</div>

						</div>

						<!-- 

                        <div>
                            <button type="submit" value="Next" class="btn btn--radius-2 btn--blue">Update</button>
                        </div> -->
					</form>
				</div>
			</div>
		</div>


	</div>




	<jsp:include page="/Footer/footer.jsp" />


</body>



</html>