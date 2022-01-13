<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book</title>

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

			var courseName = $("#courseName").val();
			var courseCode = $("#courseCode").val();
			var BookName = $("#BookName").val();

			if (courseName == '' || courseCode == '' || BookName == '') {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			return true;
		});

	});
</script>

<style type="text/css" media="screen">
.formcontainer {
	height: 630px;
}

.login-wrap {
	height: 530px;
	background-color: red;
}
</style>


</head>
<body>

	<%
		session.setAttribute("bookId", request.getParameter("x1"));
	session.setAttribute("Bookyear", request.getParameter("year"));
	%>
	<jsp:include page="/HeaderContent.jsp" />
	
	
	<div class="All-wrapper">
		<form action="UpdateBook" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Update Book</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">

								<div class="name">Book Name</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input class="input--style-5" id="BookName" 
										type="text" class="input" name="BookName">
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