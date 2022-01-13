<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Budget</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<link rel="stylesheet" href="/Project2/CSSfile/DetailUpdate.css"
	type="text/css">

<script type="text/javascript" src="/Project2/bootstrap/js/jquery.js"></script>


<style type="text/css">
#btn {
	padding: 0 25px;
}
</style>

<script>
	function transfer(x1, x2) {

		var outString;

		/// froward to the deleteBudget.java servetl for delete
		if (x2 == 2) {
			outString = "deleteBudget?x1=" + x1;
		} else if (x2 == 3) {
			outString = "UpdateBudget.jsp?x1=" + x1;
		}

		location.href = outString;

	}
</script>



<script type="text/javascript">
	function detail(Type, Date, Amount, description) {
		/* 	alert(Name + "  " + department + "  " + designation + "  " + interested
					+ "  " + Gmail); */

		$("#Type").html(Type);
		$("#Date").html(Date);
		$("#Amount").html(Amount +  " Tk");
		$("#description").html(description);

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
</script>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />



	<%
		boolean authority = session.getAttribute("authority") != null
				&& (boolean) session.getAttribute("authority");

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		String query, update, delete, detail;

		query = "select * from budget ";
		ResultSet rs = st.executeQuery(query);
	%>

	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Budget Information</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Type</th>
					<th>Date</th>
					<th>Amount</th>
					<th>Description</th>
					<th>Detail</th>
					<%
						if (authority) {
							out.print("<th>Delete</th> ");
						//	out.print("<th>Update</th> ");
						}
					%>
				</tr>


				<%
					while (rs.next()) {

						String description;
						String[] parts = rs.getString("Description").split(" ");
						if (parts.length >= 2) {
							description = parts[0] + " " + parts[1] + ".....";
						} else {
							description = parts[0] + ".....";
						}

						update = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
								+ rs.getString("Id") + "','" + 3 + "');\"  >Update</button>      ";
						delete = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
								+ rs.getString("Id") + "','" + 2 + "');\"  >Delete</button>      ";
/* 						detail = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"transfer('"
								+ rs.getString("Id") + "','" + 1 + "');\"  >Detail</button>      "; */

						detail = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"detail('" + rs.getString("Type") + "','"
								+ rs.getString("Date") + "','" + rs.getString("Amount") + "','" + rs.getString("Description")
								+ "');\"  >Detail</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("Type") + "</td> ");
						out.print("<td> " + rs.getString("Date") + "</td> ");
						out.print("<td> " + rs.getString("Amount") + " tk</td> ");
						out.print("<td> " + description + "</td> ");
						out.print("<td> " + detail + "</td> ");
						if (authority) {
							out.print("<td> " + delete + "</td> ");
							
						}

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
					<h2  class="title">Budget Detail</h2>
				</div>

				<div class="card-body">
					<form>

						<div class="form-row">

							<div class="name">Type</div>
							<div class="value">
								<div id="Type" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Date</div>
							<div class="value">
								<div id="Date" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Amount</div>
							<div class="value">
								<div id="Amount" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Description</div>
							<div class="value">
								<div id="description" style="font-size: 15px;"></div>
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