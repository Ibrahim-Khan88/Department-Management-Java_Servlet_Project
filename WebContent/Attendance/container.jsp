<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<jsp:include page="../Home.jsp"  ></jsp:include> <br> <br> <br>

<%  



out.println("<script>	\r\n" + 
		"	function seccess(){\r\n" + 
		"		alert('Data is seccessfully deleted');\r\n" + 
		"		var outString = \"Updateinfo.jsp\";\r\n" + 
		"		location.href = outString; \r\n" + 
		"	}\r\n" + 
		"		\r\n" + 
		"</script>");

out.println("<script>	\r\n" + 
		"	function fail(){\r\n" + 
		"		alert('Data is fail to delete');\r\n" + 
		"		var outString = \"Updateinfo.jsp\";\r\n" + 
		"		location.href = outString; \r\n" + 
		"	}\r\n" + 
		"		\r\n" + 
		"</script>");


out.print("<script> seccess(); </script>");
out.print("<script> fail(); </script>");





%>

</body>
</html>