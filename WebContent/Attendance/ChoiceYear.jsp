<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script src="/Project2/bootstrap/js/jquery-ui.js"></script>
<script src="/Project2/bootstrap/js/jquery.js"></script>


<script>
	function setyear(string) {
		
		var outString = "ShowAttendance.jsp?year=" + string;
		location.href = outString;
			
	}
</script>


</head>
<body>

<div> 

<button onclick="setyear('1st');"  >1st year</button>  <br>
<button onclick="setyear('2nd');"  >2nd year</button>  <br>
<button onclick="setyear('3rd');"  >3rd year</button>  <br>
<button onclick="setyear('4th');"  >4th year</button>  <br>

</div>


</body>
</html>