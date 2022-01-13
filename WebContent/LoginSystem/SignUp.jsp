<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>

<link rel="stylesheet" href="/Project2/CSSfile/loginUpdate.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>

<script>
	function forward(link) {
		location.href = link;
	}

	$(document).ready(
			function() {

				$("#form").submit(
						function(e) {

							var studentid = $("#studentid").val();
							var name = $("#name").val();
							var Gmail = $("#Gmail").val();
							var password = $("#password").val();

							if (studentid == '' || Gmail == ''
									|| password == '' || name == '') {
								alert("Please Fill All Fields");
								e.preventDefault();
							}

							return true;
						});

			});
</script>

</head>
<body>



	<div class="container">
		<div class="img">
			<img src="/Project2/image/bg.svg">
		</div>
		<div class="login-content">
			<form action="Signupservlet" method='post' id="form">
				<img src="/Project2/image/avatar.svg">
				<h2 style="font-size: 23px; letter-spacing: 2px;" class="title">SignUp</h2>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>StudentId</h5>
						<input id="studentid" type="text" class="input" name="studentid">
					</div>
				</div>


				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Name</h5>
						<input id="name" type="text" class="input" name="name">
					</div>
				</div>


				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Gmail</h5>
						<input id="Gmail" type="text" class="input" name="gmail">
					</div>
				</div>


				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5>Password</h5>
						<input id="password" type="password" class="input" name="password">
					</div>
				</div>

				<input type="submit" class="btn" value="SignUp"> <a>Teacher?
					<span style="cursor: pointer;"
					onclick="forward('TeacherSignUp.jsp')">SignUp</span>
				</a>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="/Project2/JS/main.js"></script>
</body>
</html>