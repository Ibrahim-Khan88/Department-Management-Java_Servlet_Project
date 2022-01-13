<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book</title>

<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">


<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!--       <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->


<script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var courseName = $("#courseName").val();
			var courseCode = $("#courseCode").val();
			var BookName = $("#BookName").val();

			if (courseName == '' || courseCode == '' || BookName == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});

	});
</script>

<style type="text/css" media="screen">
.formcontainer {
	height: 750px;
}

.login-wrap {
	height: 650px;
	background-color: red;
}
</style>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />



	<div class="All-wrapper">
		<form action="AddBook" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Add Book</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">



							<div class="form-row">
								<div class="name">Year</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" class="input"
											id="pass" name="year" name="year">

											<option style="color: black;" value="1st">1st Year</option>
											<option style="color: black;" value="2nd">2nd Year</option>
											<option style="color: black;" value="3rd">3rd Year</option>
											<option style="color: black;" value="4th">4th Year</option>

										</select>


									</div>
								</div>
							</div>




							<div class="form-row">

								<div class="name">Course Name</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input id="courseName" class="input--style-5" type="text" name="courseName">
									</div>
								</div>

							</div>

							<div class="form-row">

								<div class="name">Course Code</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="courseCode" name="courseCode">
									</div>
								</div>

							</div>

							<div class="form-row">

								<div class="name">Book Name</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="BookName" name="BookName">
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



	<!-- 	<div class="formcontainer">
		<h1>Add Book</h1>
		<form action="AddBook" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href=""> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Fill Require Information</label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">


							<div class="group">
								<label for="pass" class="label">Choice Year:</label> <select
									style="" class="input" id="pass" name="year">

									<option style="color: black;" value="1st">1st Year</option>
									<option style="color: black;" value="2nd">2nd Year</option>
									<option style="color: black;" value="3rd">3rd Year</option>
									<option style="color: black;" value="4th">4th Year</option>

								</select>
							</div>

							<div class="group">
								<label for="courseName" class="label">Course Name:</label> <input
									id="courseName" type="text" class="input" name="courseName">
							</div>

							<div class="group">
								<label for="courseCode" class="label">Course Code:</label> <input
									id="courseCode" type="text" class="input" name="courseCode">
							</div>


							<div class="group">
								<label for="BookName" class="label">Book Name:</label> <input
									id="BookName" type="text" class="input" name="BookName">
							</div>



						</div>
						<div class="okbutton">
							<div class="group" style="width: 200px; text-align: center;">
								<input type="submit" class="button" value="OK">
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>

	</div> -->


	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>