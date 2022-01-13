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
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var name = $("#name").val();
			var Gmail = $("#Gmail").val();
			var password = $("#password").val();

			if (Gmail == '' || password == '' || name == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});

	});
</script>


<title>Account Setting</title>
</head>
<body>


	<jsp:include page="/HeaderContent.jsp" />




	<div class="All-wrapper">
		<form action="AuthorityAccount" method='post' id="form">
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

								<div class="name">New Gmail</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="Gmail"
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





							<div>
								<button type="submit" class="btn btn--radius-2 btn--blue">Update</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>





	<!-- 
	<div class="formcontainer">
		<form action="AuthorityAccount" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Update Profile</label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<div class="group">
								<label for="Gmail" class="label">Gmail</label> <input id="Gmail" name="gmail"
									type="text" class="input"  placeholder="Gmail">
							</div>


							<div class="group">
								<label for="password" class="label">Password</label> <input
									id="password" type="password" class="input" name="password"
									placeholder="Password">
							</div>

						</div>


						<div class="okbutton">
							<div class="group" style="width: 200px; text-align: center;">
								<input type="submit" class="button" value="Update">
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