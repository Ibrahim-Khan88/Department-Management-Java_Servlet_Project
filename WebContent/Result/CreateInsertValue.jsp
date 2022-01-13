<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		//alert("Height of div: " + $(".login-wrap").height());
		var matched = $(".input--style-5");
		
		var count = matched.length;
		
/* 
		if (count == 3) {
			$(".formcontainer").height("600px");
			$(".login-wrap").height("500px");
		} else if (count < 10) {

			//alert(count);
			var h = count * 125;
			$(".formcontainer").height((h + 200) + "px");
			$(".login-wrap").height(h + "px");

		} else if (count > 10) {

			//alert(count);
			var h = count * 117;
			$(".formcontainer").height((h + 220) + "px");
			$(".login-wrap").height(h + "px");

		} */

		count--;
		count /= 2;
		

		$("#form").submit(function(e) {

			var i = 0;
			var is = false;

			for (i = 1; i <= count; i++) {
				var temp_course = "#Course_" + i;
				var temp_Credit_ = "#Credit_" + i;

				var Course_ = $(temp_course).val();
				var Credit_ = $(temp_Credit_).val();

				//alert("Course_ =" + Course_ + " Credit_=" + Credit_ + "  "+ temp_course + " " + temp_Credit_);
				//e.preventDefault();

				if (Course_ == '' || Credit_ == '') {
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

		//alert("Height of div: " + $(".login-wrap").height() + " " +  $(".formcontainer").height());

	});

	function forward() {
		location.href = "http://localhost:8080/Project2/Result/CreateSemesterChoice.jsp";
	}
</script>
</head>
<body>

	<%
		if (session.getAttribute("createReault") != null && !(boolean) session.getAttribute("createReault")) {
			out.print("<script> forward(); </script>");
		} else {
			session.setAttribute("createReault", false);
		}
	%>

	<jsp:include page="/HeaderContent.jsp" />








	<div class="All-wrapper">
		<form action="CreateInsertValue" method='post' id="form">
			<div class="row">
				<!-- section title -->
				<div style="width: 100%;">
					<div class="section-title">
						<h2 id="title-section">Create Result Sheet</h2>
					</div>
				</div>
			</div>

			<div>
				<div class="wrapper wrapper--w960">
					<div class="card card-5">

						<div class="card-body">


							<%
								int i = 0, totalCourse = (int) session.getAttribute("courses");
								String course, credit;
								for (int j = 0; j < totalCourse; j++) {
									i++;
									course = "Course_" + i;
									credit = "Credit_" + i;
									String courseInput = "<input id=\"" + course + "\" class=\"input--style-5\" type=\"text\", name=\"" + course
											+ "\", placeholder=\"" + course + " Name\"> ";
									String creditInput = "<input id=\"" + credit + "\" class=\"input--style-5\" type=\"number\", name=\"" + credit
											+ "\", placeholder=\"" + course + " Credit\"> ";
							%>

							<div class="form-row">

								<div class="name">
								<% out.println(course.substring(0, 6) + "-" + course.substring(6, course.length()));%>
								 Information</div>
								<div class="value">
									<div class="input-group input-border-under-class">
									<% out.print(courseInput); %>
									</div>
									
									<div style="margin-top: 5px;" class="input-group input-border-under-class">
									<% out.print(creditInput); %>
									</div>
								</div>

							</div>


							<%
								}
							%>





							<div>
								<button type="submit" 
									class="btn btn--radius-2 btn--blue">Create</button>
							</div>

						</div>
					</div>
				</div>
			</div>

		</form>

	</div>
















	<%-- <div class="formcontainer">
		<h1>Create Result Sheet</h1>
		<form action="CreateInsertValue" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">

					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">New Result Sheet </label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<br>
							<%
								int i = 0;
								String course, credit;
							%>

							<c:forEach begin="1" end="${courses}" varStatus="loop">


								<%
									i++;
										course = "Course_" + i;
										credit = "Credit_" + i;
										String courseInput = "<input id=\"" + course + "\" class=\"input\" type=\"text\", name=\"" + course
												+ "\", placeholder=\"" + course + " Name\"> ";
										String creditInput = "<input id=\"" + credit + "\" class=\"input\" type=\"number\", name=\"" + credit
												+ "\", placeholder=\"" + course + " Credit\"> ";

										//out.print(courseInput  + " " + creditInput);

										/* 										out.println("     Course: <input class=\"more\" type=\"text\", name=\"" + course + "\", placeholder=\""
																						+ course + "\"> ");
																				out.println("     credit: <input type=\"text\", name=\"" + credit + "\", placeholder=\"" + credit
																						+ "\"> <br><br>"); */
								%>


								<div class="group">
									<label for="id" class="label"> <%
 	out.println(course.substring(0, 6) + "-" + course.substring(6, course.length()));
 %> Information
									</label>
									<%
										out.print(courseInput);
									%>
								</div>

								<div class="group">
									<%
										out.print(creditInput);
									%>
								</div>
								<br>
								<br>

							</c:forEach>

						</div>

						<div class="okbutton">
							<div class="group" style="width: 200px; text-align: center;">
								<input type="submit" class="button" value="Create">
							</div>
						</div>



					</div>
				</div>
			</div>
		</form>

	</div> --%>



	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>