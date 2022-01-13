<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Project2/CSSfile/commomformcontent.css"
	type="text/css">
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>  

<style type="text/css" media="screen">
.formcontainer {
	height: 900px;
}

.login-wrap {
	height: 800px;
	background-color: red;
}
</style>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<div class="formcontainer">

		<form action="UploadTeacherInformationsevlet" method='post'
			enctype="multipart/form-data">
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
							password

							<div class="group">
								<label for="id" class="label">Name</label> <input id="id"
									type="text" class="input" name="name">
							</div>

							<div class="group">
								<label for="id" class="label">Password</label> <input id="id"
									type="text" class="input" name="password">
							</div>

							<div class="group">
								<label for="pass" class="label">Gmail</label> <input id="pass"
									type="text" class="input" name="gmail">
							</div>

							<div class="group">
								<label for="pass" class="label">Designation</label> <input
									id="pass" type="text" class="input" name="designation">
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
									<option style="color: black;" value="FAE">Food and
										Agroprocess Engineering</option>
									<option style="color: black;" value="Architecture">Architecture</option>
									<option style="color: black;" value="CHE">Chemistry</option>

								</select>
							</div>


							<div class="group">
								<label for="pass" class="label">Information</label>
								<!-- <input id="pass" type="text" class="input" name="info"> -->
								<textarea id="pass" class="input" name="info" rows="5" cols="20"></textarea>
							</div> 

							<br>

							<div class="group">
								<label for="pass" class="label">Photo</label> <input id="pass"
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





	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>