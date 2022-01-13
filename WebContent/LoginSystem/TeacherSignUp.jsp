<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>

<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<link rel="stylesheet" href="/Project2/CSSfile/loginUpdate.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">


<script>
	$(document).ready(
			function() {

				$("#form").submit(
						function(e) {

							var Information = $("#Information").val();
							var name = $("#name").val();
							var Gmail = $("#gmail").val();
							var password = $("#password").val();
							var Department = $("#Department").val();
							var photo = $("#photo").val();
							var designation = $("#designation").val();

							if (Gmail == '' || password == '' || name == ''
									|| Information == '' || Department == ''
									|| photo == '' || designation == '') {
								alert("Please Fill All Fields");
								e.preventDefault();
							}

							return true;
						});

			});
</script>

<style type="text/css" media="screen">
#h5-heading {
	font-family: sans-serif;
	font-size: 18px;
}
</style>


</head>
<body>





	<div class="container">
		<div class="img">
			<img src="/Project2/image/bg.svg">
		</div>
		<div class="login-content">
			<form action="TeacherSingIn" method='post'
				enctype="multipart/form-data" id="form">
				<img src="/Project2/image/avatar.svg">
				<h2 style="font-size: 23px; letter-spacing: 2px;" class="title">SignUp</h2>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5 id="h5-heading">Name</h5>
						<input id="name" type="text" class="input" name="name">
					</div>
				</div>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-envelope"></i>
					</div>
					<div class="div">
						<h5 id="h5-heading" style="">Email</h5>
						<input id="gmail" type="text" class="input" name="gmail">
					</div>
				</div>


				<div class="input-div one">
					<div class="i">
						<i class="fas fa-arrow-right"></i>
					</div>
					<div class="div">
						<h5 id="h5-heading" >Research Interests</h5>
						<input type="text" id="Information" class="input" name="info">
					</div>
				</div>


				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5 id="h5-heading">Password</h5>
						<input id="password" type="password" class="input" name="password">
					</div>
				</div>


				<div style="margin-top: 20px;" class="input-div one">
					<div class="i">
						<i class="fas fa-arrow-right"></i>
					</div>
					<div class="div">

						<select
							style="width: 100%; border: none; font-size: 18px; color: #999; margin-top: 13px; margin-left: 5px; font-weight: 500;"
							style="color: red;" class="input" id="designation"
							name="designation">

							<option value="Professor">Professor</option>
							<option style="color: black;" value="Assistant Professor">
								Assistant Professor</option>
							<option style="color: black;" value="Lecturer">Lecturer</option>
						</select>


					</div>
				</div>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-arrow-right"></i>
					</div>
					<div class="div">

						<select class="input" id="Department" name="dept"
							style="width: 100%; border: none; margin-left: 5px; font-size: 18px; color: #999; margin-top: 13px; font-weight: 500;">

							<option style="color: black;" value="CSE">Computer
								Science and Engineering</option>
							<option style="color: black;" value="EEE">Electrical and
								Electronic Engineering</option>
							<option style="color: black;" value="ETE">Electronics
								and Telecommunication Engineering</option>
							<option style="color: black;" value="ACCE">Applied
								Chemistry and Chemical Engineering</option>
							<option style="color: black;" value="CE">Civil
								Engineering</option>
							<option style="color: black;" value="MAT">Mathematics</option>
							<option style="color: black;" value="STA">Statistics</option>
							<option style="color: black;" value="ENG">English</option>
							<option style="color: black;" value="AIS">Accounting and
								Information Systems</option>
							<option style="color: black;" value="LAW">Law</option>
							<option style="color: black;" value="FAE">Food and
								Agroprocess Engineering</option>
							<option style="color: black;" value="Architecture">Architecture</option>
							<option style="color: black;" value="CHE">Chemistry</option>

						</select>

					</div>
				</div>


				<div class="input-div one">
					<div class="i">
						<i class="fas fa-image"></i>
					</div>
					<div class="div">
						<h5 id="h5-heading" style="top: -5px; font-size: 15px;">Profile Image</h5>
						<input value="SingUp" id="photo" type="file" class="input"
							name="photo">
					</div>
				</div>




				<input type="submit" class="btn" value="SingUp">
			</form>
		</div>
	</div>
	<script type="text/javascript" src="/Project2/JS/main.js"></script>








	<%-- 	<jsp:include page="/HeaderContent.jsp" />

	<div class="formcontainer">

		<h1 style="color: #4d0066; display: hide"></h1>
		<form action="TeacherSingIn" method='post'
			enctype="multipart/form-data" id="form">

			<h1 style="color: #4d0066;">Please SignUp</h1>

			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Fill Require Information</label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">


							<div class="group">
								<label for="name" class="label">Name</label> <input id="name"
									type="text" class="input" name="name">
							</div>

							<div class="group">
								<label for="password" class="label">Password</label> <input
									id="password" type="text" class="input" name="password">
							</div>

							<div class="group">
								<label for="gmail" class="label">Gmail</label> <input id="gmail"
									type="text" class="input" name="gmail">
							</div>



							<div class="group">
								<label for="designation" class="label">Designation:</label> <select
									style="" class="input" id="designation" name="designation">

									<option style="color: black;" value="Professor">Professor</option>
									<option style="color: black;" value="Assistant Professor"> Assistant Professor</option>
									<option style="color: black;" value="Lecturer">Lecturer</option>

								</select>
							</div>

							<div class="group">
								<label for="Department" class="label">Department:</label> <select
									style="" class="input" id="Department" name="dept">

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
									<option style="color: black;" value="FAE">Food and
										Agroprocess Engineering</option>
									<option style="color: black;" value="Architecture">Architecture</option>
									<option style="color: black;" value="CHE">Chemistry</option>

								</select>
							</div>


							<div class="group">
								<label for="Information" class="label">Information</label>
								<!-- <input id="pass" type="text" class="input" name="info"> -->
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
								<input type="submit" class="button" value="Sign Up">
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>

	</div>

	<jsp:include page="/Footer/footer.jsp" /> --%>

</body>
</html>