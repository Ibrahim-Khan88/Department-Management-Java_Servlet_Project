<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Budget</title>
<link rel="stylesheet" href="/Project2/CSSfile/form.css" type="text/css">
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript" src="/Project2/CSSfile/bootstrap.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">
<!--       <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->


<script>

$(document).ready(function(){
	
   $("#form").submit(function(e){	   
	   
 	   var Amount = $("#Amount").val();
	   var datepicker13 = $("#datepicker-13").val();
	   var Description = $("#Description").val();	   
	   
	   if (Amount == '' || datepicker13 == '' || Description == ''){
		   alert("Please Fill All Fields");
		   e.preventDefault();
	   } 
	   
	    return true;
	  }); 
  
});
</script>



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
		session.setAttribute("budgetId", request.getParameter("x1"));
	%>
	<jsp:include page="/HeaderContent.jsp" /> <br> <br>

	<div class="formcontainer">
	

		<form action="updateBudget" method='post' id="form">
			<div class="login-wrap">
				<div class="login-html">
					<div class="signup">
						<a href="SignUp.jsp"> </a>
					</div>
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Update Budget</label> <input
						id="tab-2" type="button" name="tab" value="sign Up"
						class="sign-up"><label for="tab-2" class="tab"></label>



					<div class="login-form">
						<div class="sign-in-htm">

							<div class="group">
								<label for="pass" class="label">Type:</label> <select style=""
									class="input" id="pass" name="Type">

									<option style="color: black;" value="Revenue">Revenue</option>
									<option style="color: black;" value="Expense">Expense</option>

								</select>
							</div>

							<div class="group">
								<label for="Amount" class="label">Amount</label> <input id="Amount"
									type="number" class="input" name="Amount">
							</div>

							<div class="group">
								<label for="datepicker-13" class="label">Date</label> <input
									id="datepicker-13" type="text" class="input" name="Date">
							</div>

							<div class="group">
								<label for="Description" class="label">Description</label>
								<!-- <input id="pass" type="text" class="input" name="info"> -->
								<textarea id="Description" class="input" name="Description" rows="5" cols="20"></textarea>
							</div>


							<div class="okbutton">
								<div class="group" style="width: 200px; text-align: center;">
									<input type="submit" class="button" value="Update">
								</div>
							</div>

							<input name='value' value="1" hidden="yes">

						</div>
					</div>
				</div>
			</div>
		</form>

	</div>

	 	<jsp:include page="/Footer/footer.jsp" /> 

</body>
</html>