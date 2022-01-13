<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Routine</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>



<script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var courseCode = $("#courseCode").val();

			if (courseCode == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});

	});
</script>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />
	<br>
	<br>


	<%
		class Contain {
			public String techername;
			public int id;
		}

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st;
		String query;
		int[] id;
		List<Contain> teacherlist = new ArrayList<Contain>();

		query = "select * from teacher";
		st = connection.createStatement();
		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {
			Contain c = new Contain();
			c.id = rs.getInt("Id");
			c.techername = rs.getString("Name");
			teacherlist.add(c);
		}

		for (int i = 0; i < teacherlist.size(); i++) {
			System.out.println("tahceer " + teacherlist.get(i).techername);
		}
	%>



	<div  class="All-wrapper">
		<form action="Allworkroutine" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Add Routine</h2>
					</div>
				</div>
			</div>

			<div>
				<div   class="wrapper wrapper--w960">
					<div   class="card card-5">

						<div   class="card-body">


							<div class="form-row">
								<div class="name"> Year</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select id="pass" name="year"
											class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;">

											<option style="color: black;" value="1st">1st Year</option>
											<option style="color: black;" value="2nd">2nd Year</option>
											<option style="color: black;" value="3rd">3rd Year</option>
											<option style="color: black;" value="4th">4th Year</option>

										</select>
									</div>
								</div>
							</div>



							<div class="form-row">
								<div class="name"> Time</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select id="pass" name="time"
											class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;">

											<option style="color: black;" value="9-10 AM">9-10</option>
											<option style="color: black;" value="9-11 AM">9-11</option>
											<option style="color: black;" value="9-12 AM">9-12</option>

											<option style="color: black;" value="10-11 AM">10-11</option>
											<option style="color: black;" value="10-12 AM">10-12</option>
											<option style="color: black;" value="10-1 PM">10-1</option>

											<option style="color: black;" value="11-12 AM">11-12</option>
											<option style="color: black;" value="11-1 PM">11-1</option>

											<option style="color: black;" value="12-1 PM">12-1</option>

											<option style="color: black;" value="2-3 PM">2-3</option>
											<option style="color: black;" value="2-4 PM">2-4</option>
											<option style="color: black;" value="2-5 PM">2-5</option>

											<option style="color: black;" value="3-4 PM">3-4</option>
											<option style="color: black;" value="3-5 PM">3-5</option>
											<option style="color: black;" value="4-5 PM">4-5</option>

										</select>


									</div>
								</div>
							</div>


							<div class="form-row">
								<div class="name"> Day</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select id="pass" name="day"
											class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;">

											<option style="color: black;" value="Sun">Sunday</option>
											<option style="color: black;" value="Mon">Monday</option>
											<option style="color: black;" value="Tue">Tuesday</option>
											<option style="color: black;" value="Wed">Wednesday</option>
											<option style="color: black;" value="Thu">Thursday</option>

										</select>
									</div>
								</div>
							</div>


							<div class="form-row">
								<div class="name">Teacher</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select id="pass" name="teahcer"
											class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;">

											<%
												for (int i = 0; i < teacherlist.size(); i++) {
													//System.out.println("tahceer " + teacherlist.get(i).techername);

													out.println("  <option style=\"color: black;\" value='" + teacherlist.get(i).id + "'>"
															+ teacherlist.get(i).techername + "</option>   ");

												}
											%>


										</select>
									</div>
								</div>
							</div>


							<div class="form-row">

								<div class="name">CourseCode</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input id="courseCode" name="courseCode" class="input--style-5" type="text">
									</div>
								</div>

							</div>





							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Add</button>
							</div>
							<input name='common' value="2" hidden="yes">

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>




	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>