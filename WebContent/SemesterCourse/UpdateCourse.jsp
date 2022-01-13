<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



</head>
<body>


	<h2>Enter the require value</h2>


	<form action="Updatesemester" method='post'>

		<select style="" class="input" id="pass" name="year">

			<option style="color: black;" value="1st">1st Year</option>
			<option style="color: black;" value="2nd">2nd Year</option>
			<option style="color: black;" value="3rd">3rd Year</option>
			<option style="color: black;" value="4th">4th Year</option>

		</select> <br> <br> <input placeholder="Course Code"
			name='courseCode'> <br> <br>
			<input placeholder="Zero Present"
			name='totalClass'> <br> <br>

		<button type="submit">Ok</button>

	</form>


</body>
</html>