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
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!--       <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->




</head>
<body>

	<%
		session.setAttribute("RoutinId", request.getParameter("id"));
	%>

	<jsp:include page="/HeaderContent.jsp" />



	<div class="All-wrapper">
		<form action="ChangeRoutin" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Change Routine</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">





							<div class="form-row">
								<div class="name">Change Time</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" class="input"
											id="pass"  name="time">

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
								<div class="name">Year</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" class="input"
											id="pass"  name="day">

											<option style="color: black;" value="Sun">Sunday</option>
											<option style="color: black;" value="Mon">Monday</option>
											<option style="color: black;" value="Tue">Tuesday</option>
											<option style="color: black;" value="Wed">Wednesday</option>
											<option style="color: black;" value="Thu">Thursday</option>
											
										</select>


									</div>
								</div>
							</div>







							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Save</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>




	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>