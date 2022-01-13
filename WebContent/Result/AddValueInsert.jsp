<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script>
	$(document).ready(function() {

		//alert("Height of div: " + $(".login-wrap").height());
		var matched = $(".input--style-5");
		var count = matched.length;
		var h = count * 148;
		$(".formcontainer").height((h + 100) + "px");
		$(".login-wrap").height(h + "px");

		//alert("Height of div: " + $(".login-wrap").height() + " " +  $(".formcontainer").height());

		count--;
		$("#form").submit(function(e) {

			var i = 0;
			var is = false;

			for (i = 1; i <= count; i++) {
				var temp_course = "#course" + i;

				var Course_ = $(temp_course).val();

				//alert("Course_ =" + Course_ + " Credit_=" + Credit_ + "  "+ temp_course + " " + temp_Credit_);
				//e.preventDefault();

				if (Course_ == '') {
					is = true;
				}
			}

			if (is == true) {
				alert("Please Fill All Fields");
				e.preventDefault();
			}

			//e.preventDefault();

			return true;
		});

	});
</script>


</head>
<body>

	<%
		int i = 0;
	%>


	<jsp:include page="/HeaderContent.jsp" />



	<div class="All-wrapper">
		<form action="AddValueInsertservlet" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section"> Result</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">

							<div class="form-row">

								<div class="name">Student Id</div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<input placeholder="Student Id" class="input--style-5" id="id" type="text" name="id">
									</div>
								</div>

							</div>


							<%
								i++;
								String course = "course" + i;
								String Point = "Enter Grade";
								String[] courselist = (String[]) session.getAttribute("courses");

								for (int j = 0; j < courselist.length; j++) {

									course = "course" + (j + 1);
						/* 			out.println("  <div class=\"group\">" + " <label for=\"" + course + "\" class=\"label\">"
											+ courselist[j] + "</label> " + "  : <input id=\"" + course
											+ "\"  class=\"input\" type=\"text\", name=\"" + course + "\", placeholder=\"" + Point
											+ "\">  </div> <br>"); */
									
									String resultInput = "<input id=\"" + course + "\" class=\"input--style-5\" type=\"text\", name=\"" + course
											+ "\", placeholder=\"" + Point + " \"> ";
							%>


							<div class="form-row">

								<div class="name"><% out.print(courselist[j]); %></div>
								<div class="value">
									<div class="input-group input-border-under-class">
										<% out.print(resultInput); %>
									</div>
								</div>

							</div>




							<%
								}
							%>





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





	<%-- <div class="formcontainer">
<h1>Result</h1>
		<form action="AddValueInsertservlet" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Add Result</label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>


                    

					<div class="login-form">
						<div class="sign-in-htm">
							<div class="group">
								<label for="id" class="label">Student Id</label> <input id="id"
									type="text" class="input" name="id">
							</div>

							<%
								i++;
								String course = "course" + i;
								String Point = "Enter Grade";
								String[] courselist = (String[]) session.getAttribute("courses");

								for (int j = 0; j < courselist.length; j++) {

									course = "course" + (j + 1);
									out.println("  <div class=\"group\">" + " <label for=\""+ course +"\" class=\"label\">" + courselist[j]
											+ "</label> " + "  : <input id=\""+ course +"\"  class=\"input\" type=\"text\", name=\"" + course
											+ "\", placeholder=\"" + Point + "\">  </div> <br>");

								}
							%>


						</div>
						<div class="okbutton" id="okbutton1">
							<div class="group" style="width: 200px; text-align: center;">
								<input type="submit" class="button" value="Add">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

	</div>


 --%>


	<jsp:include page="/Footer/footer.jsp" />

</body>
</html>