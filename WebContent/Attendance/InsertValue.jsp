<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>




	<%
	
	
		String id = "16CSE";
		int i;

		String temp = "check";
		String name,courseName;
		
		
		int total_student = (int)session.getAttribute("total_student");
		courseName = request.getParameter("x1");
		session.setAttribute("courseName", courseName);
		
		out.println(courseName.length() +  " " + courseName);
		
	
		out.println(" <form action='InsertValueservlet' method='post'>  ");
		out.println(" Enter Date <input type='text' name='date'> <br> <br>");

		
		String[] studentId =  (String[])session.getAttribute("studentId");


		

		out.println("<table border='1' width='80%' > ");

		// printing student
		out.println("<tr>");
		for (i = 0; i < total_student; i++) {
			out.println("<th> " + studentId[i] + "</th> ");
		}
		out.println("</tr>");

		// printing checkbox
		out.println("<tr>");
		for (i = 1; i <= total_student; i++) {
			name = temp + i;
			out.println("<td>  <input type='checkbox' checked name=" + name + "> </td> ");
		}
		out.println("</tr>");
		out.println("</table>");
		out.println("<br> <input type='submit' value='save' >");
		out.println("</form>");
	%>










</body>
</html>