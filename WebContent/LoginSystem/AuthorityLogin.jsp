<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="/Project2/CSSfile/loginUpdate.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>

 <script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var gmail = $("#gmail").val();
			var password = $("#password").val();

 			if (gmail == '' || password == '') {
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
			<form action="AuthorityLoginServlet" method='post' id="form">
				<img src="/Project2/image/avatar.svg">
				<h2 class="title">Welcome</h2>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Email</h5>
						<input id="gmail"
									type="text" class="input" name="gmail">
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

				<input type="submit" class="btn" value="Login"> 
			</form>
		</div>
	</div>
	<script type="text/javascript" src="/Project2/JS/main.js"></script>


</body>
</html>