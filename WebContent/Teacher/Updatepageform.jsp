<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher</title>
<link rel="stylesheet" href="/Project2/CSSfile/commomformcontent.css"
	type="text/css">
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script> 
       <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
<!--       <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> --> 	
      

<script>

$(document).ready(function(){
	
   $("#form").submit(function(e){	   
	   
 	   var name = $("#name").val();
	   var gmail = $("#gmail").val();
	   var designation = $("#designation").val();
	   var Information = $("#Information").val();
	   var photo = $("#photo").val();
	   
	   if (name == '' || gmail == '' || designation == ''|| Information == '' || photo == ''){
		   alert("Please Fill All Fields");
		   e.preventDefault();
	   } 
	   
	    return true;
	  }); 
  
});
</script>


<script>
	$(document).ready(function() {

		$(".formcontainer").height("1100px");
		$(".login-wrap").height("950px");

		//alert("Height of div: " + $(".login-wrap").height() + " " +  $(".formcontainer").height());

	});
</script>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" /> <br> <br>


	<%
		session.setAttribute("photoid", request.getParameter("x1"));
	System.out.println(session.getAttribute("photoid"));
	%>

	<div class="formcontainer">
		<form action="Update" method='post' enctype="multipart/form-data" id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Update Teacher Information </label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<div class="group">
								<label for="name" class="label">Name</label> <input id="name"
									type="text" class="input" name="name">
							</div>

							<div class="group">
								<label for="gmail" class="label">Gmail</label> <input id="gmail"
									type="text" class="input" name="gmail">
							</div>

							<div class="group">
								<label for="designation" class="label">Designation</label> <input
									id="designation" type="text" class="input" name="designation">
							</div>

							<div class="group">
								<label for="pass" class="label">Department:</label> <select
									style="" class="input" id="pass" name="dept">

									<option style="color: black;" value="CSE">Computer
										Science and Engineering</option>
									<option style="color: black;" value="EEE">Electrical
										and Electronic Engineering</option>
									<option style="color: black;" value="ETE">Electronics
										and Telecommunication Engineering</option>
									<option style="color: black;" value="ACCE">Applied
										Chemistry and Chemical Engineering</option>
									<option style="color: black;" value="CE">Civil
										Engineering</option>
									<option style="color: black;" value="MAT">Mathematics</option>
									<option style="color: black;" value="STA">Statistics</option>
									<option style="color: black;" value="ENG">English</option>
									<option style="color: black;" value="AIS">Accounting
										and Information Systems</option>
									<option style="color: black;" value="LAW">Law</option>
									<option style="color: black;" value=""></option>
									<option style="color: black;" value=""></option>
									<option style="color: black;" value=""></option>

								</select>
							</div>


							<div class="group">
								<label for="Information" class="label">Information</label>
								<!-- <input id="pass" type="text" class="input" name="info"> -->
								<textarea id="Information" class="input" name="info" rows="5" cols="20"></textarea>
							</div>

							<br>

							<div class="group">
								<label for="photo" class="label">Photo</label> <input id="photo"
									type="file" class="input" name="photo">
							</div>

						</div>

						<div class="okbutton">
							<div class="group" style="width: 200px; text-align: center;">
								<input type="submit" class="button" value="OK">
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