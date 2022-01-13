<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
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

			var courses = $("#courses").val();

			if (courses == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			} else if (courses <= 0) {
				alert("Please Enter A Valid Number");
				e.preventDefault();
			}

			return true;
		});

	});
</script>

<style type="text/css" media="screen">

</style>
</head>
<body>



	<jsp:include page="/HeaderContent.jsp" />

	<div class="All-wrapper">
		<form action="CreateSemesterChoice" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section"> Create Result Sheet  </h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">



							<div class="form-row">
								<div class="name">Session</div>
								<div class="value">
									<div class="input-group input-border-under-class">


										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" class="input"
											id="pass" name="year">

											<option style="color: black;" value="2014_15">2014-15</option>
											<option style="color: black;" value="2015_16">2015-16</option>
											<option style="color: black;" value="2016_17">2016-17</option>
											<option style="color: black;" value="2017_18">2017-18</option>
											<option style="color: black;" value="2018_19">2018-19</option>
											<option style="color: black;" value="2019_20">2019-19</option>
											<option style="color: black;" value="2020_21">2020-19</option>
											<option style="color: black;" value="2021_22">2021-22</option>
											<option style="color: black;" value="2022_23">2022-23</option>
											<option style="color: black;" value="2023_24">2023-24</option>
											<option style="color: black;" value="2024_25">2024-25</option>

										</select>


									</div>
								</div>
							</div>


							<div class="form-row">
								<div class="name">Semester</div>
								<div class="value">
									<div class="input-group input-border-under-class">



										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" class="input"
											id="pass" name="semester">

											<option style="color: black;" value="1_1">1-1</option>
											<option style="color: black;" value="1_2">1-2</option>
											<option style="color: black;" value="2_1">2-1</option>
											<option style="color: black;" value="2_2">2-2</option>
											<option style="color: black;" value="3_1">3-1</option>
											<option style="color: black;" value="3_2">3-2</option>
											<option style="color: black;" value="4_1">4-1</option>
											<option style="color: black;" value="4_2">4-2</option>

										</select>


									</div>
								</div>
							</div>

							<div class="form-row">

								<div class="name">Number Of Courses</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input id="courses" type="number" name="courses"
											class="input--style-5">
									</div>
								</div>

							</div>





							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Next</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>

	<!-- <div class="formcontainer">
	<h1>Create Result Sheet </h1> 
			<form action="CreateSemesterChoice" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">New Result Sheet </label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">
						
						
						
							<div class="group">
								<label for="pass" class="label">Session</label> <select style=""
									class="input" id="pass" name="year">

									<option style="color: black;" value="2014_15">2014-15</option>
									<option style="color: black;" value="2015_16">2015-16</option>
									<option style="color: black;" value="2016_17">2016-17</option>
									<option style="color: black;" value="2017_18">2017-18</option>
									<option style="color: black;" value="2018_19">2018-19</option>
									<option style="color: black;" value="2019_20">2019-19</option>
									<option style="color: black;" value="2020_21">2020-19</option>
									<option style="color: black;" value="2021_22">2021-22</option>
									<option style="color: black;" value="2022_23">2022-23</option>
									<option style="color: black;" value="2023_24">2023-24</option>
									<option style="color: black;" value="2024_25">2024-25</option>

								</select>
							</div>


							<div class="group">
								<label for="pass" class="label">Choice semester:</label> <select
									style="" class="input" id="pass" name="semester">

									<option style="color: black;" value="1_1">1-1</option>
									<option style="color: black;" value="1_2">1-2</option>
									<option style="color: black;" value="2_1">2-1</option>
									<option style="color: black;" value="2_2">2-2</option>
									<option style="color: black;" value="3_1">3-1</option>
									<option style="color: black;" value="3_2">3-2</option>
									<option style="color: black;" value="4_1">4-1</option>
									<option style="color: black;" value="4_2">4-2</option>

								</select>
							</div>
							
							
							<div class="group">
								<label for="courses" class="label">Number Of Courses</label> <input id="courses"
									type="number" class="input" name="courses">
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