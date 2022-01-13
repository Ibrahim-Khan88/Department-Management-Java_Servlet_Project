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
	<br>
	<br>




	<div class="All-wrapper">
		<form action="student" method='post' id="form">
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
										<input class="input--style-5" id="name" name="name">
									</div>
								</div>

							</div>


							<div class="form-row">

								<div class="name">Email</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="gmail" name="gmail">
									</div>
								</div>

							</div>



							<div class="form-row">

								<div class="name">Password</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="password" id="password" name="password">
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





	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>