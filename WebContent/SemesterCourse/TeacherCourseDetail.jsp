<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<link rel="stylesheet" href="/Project2/CSSfile/DetailUpdate.css"
	type="text/css">

<script type="text/javascript" src="/Project2/bootstrap/js/jquery.js"></script>
<script>
	function transfer(x1, x2) {

		var outString;

		outString = "http://localhost:8080/Project2/Syllabus/DetailSyllabus.jsp?x1="
				+ x1;
		location.href = outString;

	}
	
	function zeroPresent(courseCode, year) {
		
		outString = "ZeroPresent.jsp?courseCode=" + courseCode + "&&year=" + year;
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


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Semester Course</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<th>Year</th>
					<th>Course Code</th>
					<th>Course Name</th>
					<th>BookName</th>
					<th>Syllabus</th>
					<th>Total Class</th>
					<th>Zero Present</th>
					<th>New Zero Present</th>

				</tr>


				<%
					GetConnection con = new GetConnection();
					Connection connection = con.getconnection();
					Statement st, st1, st2, st3;
					ResultSet rs, rs1, rs2, rs3;
					String totalClass, zeroClass, year, CourseName, Syllabus, BookName, courseCode, Detail, zeroPresent;

					String query, update, delete, teacherID;
					//teacherID = "30";
					teacherID = (String) session.getAttribute("teacherid");

					query = "select DISTINCT courseCode,year from routine where teacherId='" + teacherID + "'";
					st = connection.createStatement();
					rs = st.executeQuery(query);

					while (rs.next()) {

						year = rs.getString("year");
						courseCode = rs.getString("courseCode");
						totalClass = "Null";
						zeroClass = "Null";
						CourseName = "Not set";
						Syllabus = "Not set";
						BookName = "Not set";
						Detail = "Not set";
						query = "select * from totalclass where courseCode='" + courseCode + "'";
						st1 = connection.createStatement();
						rs1 = st1.executeQuery(query);
						if (rs1.next()) {
							totalClass = rs1.getString("totalClass");
							zeroClass = rs1.getString("presentZero");
						}
						else{
							totalClass = "0";
							zeroClass = "0";
						}

						query = "select * from sllabus where CourseCode='" + rs.getString("courseCode") + "'";
						st2 = connection.createStatement();
						rs2 = st2.executeQuery(query);
						if (rs2.next()) {
							CourseName = rs2.getString("CourseName");
							Syllabus = rs2.getString("Syllabus");
							Detail = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"detail('" + year + "','"
									+ courseCode + "','" + CourseName + "','" + Syllabus + "');\"  >Detail</button>      ";

						}

						query = "select * from book where CourseCode='" + rs.getString("courseCode") + "'";
						st3 = connection.createStatement();
						rs3 = st3.executeQuery(query);
						if (rs3.next()) {
							BookName = rs3.getString("BookName");
						}
						
						
						zeroPresent = "  <button id=\"btn\" class=\"btn--radius-2 btn--blue\"  onclick=\"zeroPresent('" + courseCode 
								+ "','" + year + "');\"  >Add</button>      ";
				%>

				<tr>
					<%
						out.print("<td> " + year + "</td> ");
							out.print("<td> " + courseCode + "</td> ");
							out.print("<td> " + CourseName + "</td> ");
							out.print("<td> " + BookName + "</td> ");
							out.print("<td> " + Detail + "</td> ");
							out.print("<td> " + totalClass + "</td> ");
							out.print("<td> " + zeroClass + "</td> ");
							out.print("<td> " + zeroPresent + "</td> ");
					%>

				</tr>



				<%
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