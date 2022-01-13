<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
	
<style type="text/css" media="screen">

</style>
</head>
<body>

     <jsp:include page="/HeaderContent.jsp" /> <br> <br> 
	
	
	<div class="All-wrapper">
		<form action="RetriveSessionChoice" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section"> Show  Result  </h2>
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
	
	
	
	<jsp:include page="/Footer/footer.jsp" />


</body>
</html>