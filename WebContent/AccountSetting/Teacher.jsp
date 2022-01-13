<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!--       <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->


<script>
	$(document).ready(
			function() {

				$("#form").submit(
						function(e) {

							var name = $("#name").val();
							var gmail = $("#gmail").val();
							var designation = $("#designation").val();
							var Information = $("#Information").val();
							var photo = $("#photo").val();
							var password = $("#password").val();

							if (name == '' || gmail == '' || designation == ''
									|| Information == '' || photo == '' || password = '') {
								alert("Please Fill All Fields");
								e.preventDefault();
							}

							return true;
						});

			});
</script>


<script>
	$(document).ready(function() {

		$(".formcontainer").height("1150px");
		$(".login-wrap").height("1000px");

		//alert("Height of div: " + $(".login-wrap").height() + " " +  $(".formcontainer").height());

	});
</script>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />








	<div class="All-wrapper">
		<form action="TeahcerAccount" method='post'
			enctype="multipart/form-data" id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Update Profile</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">

								<div class="name">Name</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="name" type="text"
											name="name">
									</div>
								</div>

							</div>

							<div class="form-row">

								<div class="name">Email</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="gmail"
											name="gmail">
									</div>
								</div>

							</div>

							<div class="form-row">

								<div class="name">New Password</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="password"
											name="password">
									</div>
								</div>

							</div>


							<div class="form-row">
								<div class="name">Designation</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;"
											id="designation" name="designation">


											<option value="Professor">Professor</option>
											<option style="color: black;" value="Assistant Professor">
												Assistant Professor</option>
											<option style="color: black;" value="Lecturer">Lecturer</option>
										</select>


									</div>
								</div>
							</div>


							<div class="form-row">
								<div class="name">Department</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" id="pass"
											name="dept">

											<option style="color: black;" value="CSE">Computer
												Science and Engineering</option>
											<option style="color: black;" value="EEE">Electrical
												and Electronic Engineering</option>
											<option style="color: black;" value="ETE">Electronics
												and Telecommunication Engineering</option>
											<option style="color: black;" value="ACCE">Applied
												Chemistry and Chemical Engineering</option>
											<option style="color: black;" value="CE">Civil
												Engineering</option>
											<option style="color: black;" value="MAT">Mathematics</option>
											<option style="color: black;" value="STA">Statistics</option>
											<option style="color: black;" value="ENG">English</option>
											<option style="color: black;" value="AIS">Accounting
												and Information Systems</option>
											<option style="color: black;" value="LAW">Law</option>

										</select>


									</div>
								</div>
							</div>


							<div class="form-row">

								<div class="name">Research Interests</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<textarea id="Information" class="input" name="info" rows="5"
											cols="20"></textarea>
									</div>
								</div>

							</div>

							<div class="form-row">

								<div class="name">Photo</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="file" id="photo"
											name="photo">
									</div>
								</div>

							</div>





							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Update</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>







	<!-- <div class="formcontainer">
		<h1>Account Setting</h1>
		<form action="TeahcerAccount" method='post'
			enctype="multipart/form-data" id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Fill Require Information </label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<div class="group">
								<label for="name" class="label">Name</label> <input id="name"
									type="text" class="input" name="name">
							</div>

							<div class="group">
								<label for="gmail" class="label">Gmail</label> <input id="gmail"
									type="text" class="input" name="gmail">
							</div>

							<div class="group">
								<label for="designation" class="label">Designation</label> <input
									id="designation" type="text" class="input" name="designation">
							</div>

							<div class="group">
								<label for="pass" class="label">Department:</label> <select
									style="" class="input" id="pass" name="dept">

									<option style="color: black;" value="CSE">Computer
										Science and Engineering</option>
									<option style="color: black;" value="EEE">Electrical
										and Electronic Engineering</option>
									<option style="color: black;" value="ETE">Electronics
										and Telecommunication Engineering</option>
									<option style="color: black;" value="ACCE">Applied
										Chemistry and Chemical Engineering</option>
									<option style="color: black;" value="CE">Civil
										Engineering</option>
									<option style="color: black;" value="MAT">Mathematics</option>
									<option style="color: black;" value="STA">Statistics</option>
									<option style="color: black;" value="ENG">English</option>
									<option style="color: black;" value="AIS">Accounting
										and Information Systems</option>
									<option style="color: black;" value="LAW">Law</option>

								</select>
							</div>


							<div class="group">
								<label for="Information" class="label">Information</label>
								<input id="pass" type="text" class="input" name="info">
								<textarea id="Information" class="input" name="info" rows="5"
									cols="20"></textarea>
							</div>

							<br>

							<div class="group">
								<label for="photo" class="label">Photo</label> <input id="photo"
									type="file" class="input" name="photo">
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

	</div>

 -->




	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>