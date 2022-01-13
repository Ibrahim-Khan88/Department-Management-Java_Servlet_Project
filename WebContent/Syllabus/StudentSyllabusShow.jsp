<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Syllabus</title>
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
	function transfer(x1, x2, year) {

		var outString;

		/// froward to the Updatepageinfo.jsp servetl for for taking input
		if (x2 == 1) {
			outString = "DetailSyllabus.jsp?x1=" + x1;
		}
		/// froward to the deleteBudget.java servetl for delete
		else if (x2 == 2) {
			outString = "deleteSyllabus?x1=" + x1;
		} else if (x2 == 3) {
			outString = "UpdateSyllabus.jsp?x1=" + x1 + "&&year=" + year;
		}

		location.href = outString;

	}
</script>


<script type="text/javascript">
	function detail(year, courseCode, courseName, syllabus) {
		/* 	alert(Name + "  " + department + "  " + designation + "  " + interested
					+ "  " + Gmail); */

		$("#year").html(year);
		$("#courseCode").html(courseCode);
		$("#courseName").html(courseName);
		$("#syllabus").html(syllabus);

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
		java.sql.Statement st = connection.createStatement();

		String query, update, delete, detail, Syllabus, year;

		year = (String) session.getAttribute("year");
		query = "select * from sllabus where year='" + year + "'";
		System.out.println(query);
		ResultSet rs = st.executeQuery(query);
	%>



	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				Your Course Syllabus
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Year</th>
					<th>Course Code</th>
					<th>Course Name</th>
					<th>Syllabus</th>
					<th>Detail</th>
				</tr>

				<%
					while (rs.next()) {

						String[] parts = rs.getString("Syllabus").split(" ");
						if (parts.length >= 2) {
							Syllabus = parts[0] + " " + parts[1] + ".....";
						} else {
							Syllabus = parts[0] + ".....";
						}


						detail = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"detail('" + rs.getString("year") + "','"
								+ rs.getString("CourseCode") + "','" + rs.getString("CourseName") + "','" + rs.getString("Syllabus") + "');\"  >Detail</button>      ";

						out.print("<tr>");
						out.print("<td> " + rs.getString("year") + "</td> ");
						out.print("<td> " + rs.getString("CourseCode") + "</td> ");
						out.print("<td> " + rs.getString("CourseName") + "</td> ");
						out.print("<td> " + Syllabus + "</td> ");

						out.print("<td> " + detail + "</td> ");
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
					<h2 class="title">Detail</h2>
				</div>

				<div class="card-body">
					<form>

						<div class="form-row">

							<div class="name">Year</div>
							<div class="value">
								<div id="year" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">CourseName</div>
							<div class="value">
								<div id="courseName" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">CourseCode</div>
							<div class="value">
								<div id="courseCode" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Syllabus</div>
							<div class="value">
								<div id="syllabus" style="font-size: 15px;"></div>
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