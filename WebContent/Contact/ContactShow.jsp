<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<link rel="stylesheet" href="/Project2/CSSfile/DetailUpdate.css"
	type="text/css">

<script type="text/javascript" src="/Project2/bootstrap/js/jquery.js"></script>

<script>
	function detail(Name, email, comment) {
		/* 	alert(Name + "  " + department + "  " + designation + "  " + interested
					+ "  " + Gmail); */

		$("#Type").html(Name);
		$("#Date").html(email);
		$("#comment").html(comment);

		$("#update-book-popup").toggleClass("border-class");
		$("#update-book-popup").css({
			'height' : 300
		});
		$("#update-book-popup").css({
			top : window.pageYOffset + 300
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

	function transfer(x1) {

		var outString;

		outString = "DetailUserMessage.jsp?Id=" + x1;
		location.href = outString;

	}

	function feeback(gmail) {

		var outString;

		outString = "FeedBack.jsp?gmail=" + gmail;
		location.href = outString;

	}
	
	function deleteFun(Id) {

		var outString;

		outString = "DeleteComment?id=" + Id;
		location.href = outString;

	}
</script>

<style type="text/css">
th:first-child, td:first-child {
	text-align: left;
}
</style>
</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />



	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String query, update, delete, detail, Comment, feeddback;

		query = "select * from comment where Seen='0'";
		ResultSet rs = st.executeQuery(query);
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">User Message</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>User Name</th>
					<th>Email Id</th>
					<th>Message</th>
					<th>Detail</th>
					<th>Delete</th>
					<th>Send Feedback</th>
				</tr>

				<%
					while (rs.next()) {

						String[] parts = rs.getString("Comment").split(" ");
						if (parts.length >= 2) {
							Comment = parts[0] + " " + parts[1] + ".....";
						} else {
							Comment = parts[0] + ".....";
						}

						/* 						detail = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
														+ rs.getString("Id") + "');\"  >Detail</button>      "; */

						detail = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"detail('"
								+ rs.getString("Name") + "','" + rs.getString("Gamil") + "','" + rs.getString("Comment")
								+ "');\"  >Detail</button>      ";

						feeddback = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"feeback('"
								+ rs.getString("Gamil") + "');\"  >Feedback</button>      ";

						delete = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"deleteFun('"
								+ rs.getString("Id") + "');\"  >Delete</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("Name") + "</td> ");
						out.print("<td> " + rs.getString("Gamil") + "</td> ");
						out.print("<td> " + Comment + "</td> ");

						out.print("<td> " + detail + "</td> ");
						out.print("<td> " + delete + "</td> ");
						out.print("<td> " + feeddback + "</td> ");

						out.print("</tr>");

					}
				%>



			</table>
		</div>

	</div>





	<div id="update-book-popup">
		<a id="update-book-popup-close">&times;</a>



		<div class="wrapper wrapper--w700">
			<div class="card card-5">


				<div class="card-heading">
					<h2 class="title">Message Detail</h2>
				</div>

				<div class="card-body">
					<form>

						<div class="form-row">

							<div class="name">Name</div>
							<div class="value">
								<div id="Type" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Email Id</div>
							<div class="value">
								<div id="Date" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Description</div>
							<div class="value">
								<div id="comment" style="font-size: 15px;"></div>
							</div>

						</div>


					</form>
				</div>
			</div>
		</div>


	</div>



	<jsp:include page="/Footer/footer.jsp" />

</body>


</html>