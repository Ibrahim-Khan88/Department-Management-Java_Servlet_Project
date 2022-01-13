<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.jdbc.DatabaseMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<title>Login</title>
<link rel="stylesheet" href="/Project2/CSSfile/loginUpdate.css"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>

<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!--       <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->


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


<style type="text/css" media="screen">
.formcontainer {
	height: 500px;
}

.login-wrap {
	height: 440px;
	background-color: red;
}
</style>

</head>
<body>

<%-- 	<jsp:include page="/HeaderContent.jsp" />
	<br>
	<br> --%>
	
	
	<div class="container">
		<div class="img">
			<img src="/Project2/image/bg.svg">
		</div>
		<div class="login-content">
			<form action="Teacherlogin" method='post' id="form">
				<img src="/Project2/image/avatar.svg">
				<h2 class="title">Welcome</h2>

				<div class="input-div one">
					<div class="i">
						<i class="fas fa-user"></i>
					</div>
					<div class="div">
						<h5>Email</h5>
						<input id="gmail" type="text" class="input" name="gmail">
					</div>
				</div>


				<div class="input-div pass">
					<div class="i">
						<i class="fas fa-lock"></i>
					</div>
					<div class="div">
						<h5>Password</h5>
						<input id="password" type="password" class="input" name="password" >
					</div>
				</div>

				<input type="submit" class="btn" value="Login"> 
			</form>
		</div>
	</div>
	<script type="text/javascript" src="/Project2/JS/main.js"></script>

<!-- 

	<div class="formcontainer">
		<h1>Please Login</h1>

		<form action="Teacherlogin" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">

					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Fill Require Information </label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<div class="group">
								<label for="gmail" class="label">Gmail Id</label> <input
									id="gmail" type="text" class="input" name="gmail">
							</div>

							<div class="group">
								<label for="password" class="label">Password</label> <input
									id="password" type="password" class="input" name="password">
							</div>

						</div>

						<div class="okbutton">
							<div class="group" style="width: 200px; text-align: center;">
								<input type="submit" class="button" value="Login">
							</div>
						</div>



					</div>
				</div>
			</div>
		</form>

	</div> -->


	<%-- <jsp:include page="/Footer/footer.jsp" /> --%>



</body>
</html>