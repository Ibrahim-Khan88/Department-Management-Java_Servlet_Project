<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FeedBack</title>
<!-- <link rel="stylesheet" href="/Project2/CSSfile/commomformcontent.css"
	type="text/css"> -->
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		$("#form").submit(function(e) {

			var Message = $("#Message").val();

			if (Message == '') {
				alert("Please Fill Field");
				e.preventDefault();
			}

			return true;
		});
	

	});
</script>

</head>
<body>


	<%
		session.setAttribute("feedbackgmail", request.getParameter("gmail"));
	%>

	<jsp:include page="/HeaderContent.jsp" />
	
	
	
		<div class="All-wrapper">
		<form action="SendFeedBack"  method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Send Feedback</h2>
					</div>
				</div>
			</div>
			


			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">

								<div class="name">Message</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<textarea id="Message" class="input" name="Message" rows="5"
									cols="20"></textarea>
									</div>
								</div>

							</div>





							<div>
								<button type="submit" value="Next"
									class="btn btn--radius-2 btn--blue">Send</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>

	
	
	

	<!-- <div class="formcontainer">

		<form action="SendFeedBack" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Send Feed Back </label> <input id="tab-2"
						type="button" name="tab" value="sign Up" class="sign-up"><label
						for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<div class="group">
								<label for="studentid" class="label">Message</label>
								<textarea id="pass" class="input" name="Message" rows="5"
									cols="20" placeholder="Message"></textarea>
							</div>


							<div class="okbutton">
								<div class="group" style="width: 200px; text-align: center;">
									<input type="submit" class="button" value="Send">
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</form>

	</div>
	
	<br> <br> <br> -->
	
	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>