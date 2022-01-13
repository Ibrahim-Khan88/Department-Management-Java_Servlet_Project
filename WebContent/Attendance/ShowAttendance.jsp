<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Project2/CSSfile/attendance.css"
	type="text/css">

<script src="/Project2/bootstrap/js/jquery-ui.js"></script>
<script src="/Project2/bootstrap/js/jquery.js"></script>

<script>
	function transfer(string) {
		
		var outString = "InsertValue.jsp?x1=" + string;
		location.href = outString;
		
	}
</script>



<style type="text/css">
.first {
	background-color: red;
	font-size: 15px;
	margin: 0px;
	cursor: pointer;
	padding-bottom: 5px;
}
</style>
</head>
<body>


	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		String courseName, tableName, query2;
		int i, total_student, total_class, j = 0;
		String temp, student_id;

		
		String year = request.getParameter("year");
		session.setAttribute("year", year);
		
		String query = "select * from course_information where year = '" + year + "'";
		Statement st = connection.createStatement();
		ResultSet rs = st.executeQuery(query);


		// finding out total Student
		query = "select * from student_year_information where year = '" + year + "'";
		Statement statement = connection.createStatement();
		ResultSet resultset = statement.executeQuery(query);
		resultset.next();
		total_student = resultset.getInt("total_student");
		student_id = resultset.getString("session").substring(2, 4) + "CSE0";
		session.setAttribute("total_student", total_student);

		// declaring some local varialble
		float[] total_result = new float[total_student];
		String[] studentId = new String[total_student];

		/// generating Student Id
		for (i = 1; i <= total_student; i++) {

			if (i <= 9) {
				studentId[i - 1] = student_id + "0" + i;
			} else {
				studentId[i - 1] = student_id + i;
			}

		}		
		session.setAttribute("studentId", studentId);

		/// finding all courses related to year
		while (rs.next()) {


			// accessingthe table
			courseName = rs.getString("courseName");
			tableName = year + "_" + courseName;
			query2 = "select * from " + tableName;
			Statement sta = connection.createStatement();
			ResultSet rset = sta.executeQuery(query2);
			float[] percentage = new float[total_student];
			total_class = 0;
			j++;

			out.println(" <div class='margin'> This is " + courseName + " course attendance </div>");
			out.println("<table border='1' width='80%' >");

			// writing studentId
			out.println("<tr>");
			out.println("<th> Date </th> ");
			for (i = 0; i < total_student; i++) {
				out.println("<th>" + studentId[i] + "</th> ");
			}
			out.println("</tr>");
			session.setAttribute("studentId", studentId);

			// going all the row
			while (rset.next()) {

				total_class++;
				out.println("<tr>");
				// going all the colum 
				for (i = 1; i <= total_student + 1; i++) {

					temp = rset.getString(i);
					out.println("<td>" + temp + "</td> ");

					if (temp.equals("1") && i != 1) {
						percentage[i - 2]++;
					}

				}
				out.println("</tr>");

			}

			// printing attendance percentage 
			if (total_class != 0) {
				out.println("<tr>");
				out.println("<td> </td> ");
				for (i = 0; i < total_student; i++) {
					percentage[i] = ((percentage[i] / total_class) * 100);
					total_result[i] += percentage[i];
					out.println("<td>" + percentage[i] + "</td> ");
				}
				out.println("</tr>");
			}

			out.println("</table>");
			
			
			
			String add = " <br>   <button onclick=\"transfer('" + courseName + "');\"  >Add attendance</button>      ";
			out.println(add);

		}

		// this table for total percentage

		if (j != 0) {
			out.println("<br><br>This is total attendance ");
			out.println("<table border='1' width='80%' >");
			//writing studentId
			out.println("<tr>");
			for (i = 0; i < total_student; i++) {
				out.println("<th>" + studentId[i] + "</th> ");
			}
			out.println("</tr>");

			// printing total percentage 
			out.println("<tr>");
			for (i = 0; i < total_student; i++) {
				out.println("<td>" + total_result[i] / j + "</td> ");
			}
			out.println("</tr>");

			out.println("</table>");
		} else {
			out.println("There is no records");
		}
	%>


</body>
</html>
















<!-- 	$(document).ready(function() { -->

<!-- 		// 		$(".four").click(function() { -->
<!-- 		// 			alert(" Sorry these section is not yet complete.. "); -->
<!-- 		// 		}); -->

<!-- 		// 		$(".button").click(function() { -->
<!-- 		// 			alert(" Sorry these section is not yet complete...... "); -->
<!-- 		// 			window.location.href = "InsertValue.jsp"; -->
<!-- 		// 		}); -->

<!-- 	}); -->