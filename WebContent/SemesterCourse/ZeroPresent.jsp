<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ZeroPresent</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var courseCode = $("#zeroPresent").val();

			if (courseCode == '') {
				alert("Please fill the form");
				e.preventDefault();
			}

			return true;
		});

	});
</script>
</head>
<body>


	<jsp:include page="/HeaderContent.jsp" />



	<%
		session.setAttribute("courseCode", request.getParameter("courseCode"));
	session.setAttribute("year", request.getParameter("year"));
	%>
	<div class="All-wrapper">
		<form action="ZeroPresent" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Add Zero Present</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">

								<div class="name">New Zero Present</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" type="number" id="zeroPresent" name="zeroPresent">
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