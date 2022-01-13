<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">


<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>




<script src="https://code.jquery.com/jquery-1.10.4.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">


<script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var id = $("#id").val();
			var courseName = $("#courseName").val();
			var datepicker13 = $("#datepicker").val();

			if (id == '' || courseName == '' || datepicker13 == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});

		$("#datepicker").datepicker({dateFormat: 'dd-mm-yy'});

	});
</script>


</head>
<body>

	<%
		session.setAttribute("year", request.getParameter("year"));
	%>
	<jsp:include page="/HeaderContent.jsp" />


	<div class="All-wrapper">
		<form action="DeteleAttendance" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Delete Attendance</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">

								<div class="name">Student Id</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="id" type="text" name="id">
									</div>
								</div>

							</div>


							<div class="form-row">

								<div class="name">Course Name</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="courseName" type="text"
											name="courseName">
									</div>
								</div>

							</div>


							<div class="form-row">

								<div class="name">Date</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="datepicker" type="text"
											name="date">
									</div>
								</div>

							</div>



							<input name='value' value="1" hidden="yes">


							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Delete</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>









	<!-- new  -->
	<!-- 	<form action="DeteleAttendance" method='post'>

		<button type="submit">To delete all the data click here</button>

		<input placeholder="Date" name='value' value="2" hidden="yes">
		<br> <br>

	</form>
 -->

	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>