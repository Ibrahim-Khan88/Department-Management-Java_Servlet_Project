<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Budget</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">



<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-1.10.4.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">


<script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var Amount = $("#Amount").val();
			var datepicker13 = $("#datepicker").val();
			var Description = $("#Description").val();

			if (Amount == '' || datepicker13 == '' || Description == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});
		
		$("#datepicker").datepicker({dateFormat: 'dd-mm-yy'});

	});
</script>



<style type="text/css" media="screen">
.formcontainer {
	height: 840px;
}

.login-wrap {
	height: 740px;
	background-color: red;
}
</style>

<script>
	$(document).ready(function() {
		$("p").click(function() {
			$(this).hide();
		});

		$("#datepicker-13").datepicker({
			dateFormat : 'dd-mm-yy'
		});

	});
</script>

</head>
<body>

	<%
		session.setAttribute("year", request.getParameter("year"));
	%>
	<jsp:include page="/HeaderContent.jsp" />





	<div class="All-wrapper">
		<form action="addBudget" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Add Budget</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">
								<div class="name">Type</div>
								<div class="value">
									<div class="input-group input-border-under-class">

										<select class="input-border-under-class input--style-5"
											style="height: 35px; width: 100%; border: 0px;" class="input"
											id="Type" name="Type">

											<option style="color: black;" value="Revenue">Revenue</option>
											<option style="color: black;" value="Expense">Expense</option>

										</select>


									</div>
								</div>
							</div>


							<div class="form-row">

								<div class="name">Amount</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="text" id="Amount"  name="Amount">
									</div>
								</div>

							</div>



							<div class="form-row">

								<div class="name">Date</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="datepicker" type="text"
										  name="Date">
									</div>
								</div>

							</div>



							<div class="form-row">

								<div class="name">Description</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<textarea id="Description" class="input" name="Description" rows="5"
									cols="20"></textarea>
									</div>
								</div>

							</div>





							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Save</button>
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