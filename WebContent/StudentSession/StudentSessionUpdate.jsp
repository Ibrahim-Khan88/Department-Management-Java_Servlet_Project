<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Session</title>

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

			var totalStudent = $("#totalStudent").val();
			var CR = $("#CR").val();

			if (totalStudent == '' || CR == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});

	});
</script>




</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />
	<br>
	<br>

	<%
		session.setAttribute("year", request.getParameter("year"));
	%>




	<div class="All-wrapper">
		<form action="StudentseessionUpdate" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section"> Update Student Session</h2>
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
											style="height: 35px; width: 100%; border: 0px;" id="pass"
											name="session">

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

								<div class="name">Total Student</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="totalStudent"
											name="totalStudent">
									</div>
								</div>

							</div>



							<div class="form-row">

								<div class="name">CR Id</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="CR"
											name="CR">
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