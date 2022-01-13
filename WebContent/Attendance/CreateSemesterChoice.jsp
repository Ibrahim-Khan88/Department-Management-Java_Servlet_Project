<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Project2/CSSfile/login.css"
	type="text/css">

</head>
<body>



<form action="CreateAttendanceSemesterChoiceservlet" method='post'>
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
					for="tab-1" class="tab">Create New Attendance Sheet</label> <input
					id="tab-2" type="radio" name="tab" class="sign-up"><label
					for="tab-2" class="tab"></label>
					
					
				<div class="login-form">
					<div class="sign-in-htm">
					
						<div class="group">
							<label for="year" class="label">Year</label>

							<select style="" class="input" id="year" name="year">

								<option style="color: black;" value="1st">1st year</option>
								<option style="color: black;" value="2nd">2nd year</option>
								<option style="color: black;" value="3rd">3rd year</option>
								<option style="color: black;" value="4th">4th year</option>

							</select>

						</div>

						<div class="group">
							<label for="pass" class="label">Course Name</label> <input id="pass"
								type="text" class="input" name="courseName">
						</div>

						<div class="group">
							<input type="submit" class="button" value="save">
						</div>


					</div>
				</div>
			</div>
		</div>
	</form>



</body>
</html>