<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
<style type="text/css">

    #table-content-container {
        height: 250px;
         margin-top: 40px;
    }


    #tableContainer {
        height: 150px;
        overflow: hidden;
         margin-top: 30px;
    }
    
    
th:first-child, td:first-child {
    text-align: left;
}


</style>
</head>
<body>


	<jsp:include page="/HeaderContent.jsp" />



	<%
		String point_session, student_session = (String) session.getAttribute("student_session");
		String studentid = (String) session.getAttribute("studentid");
		String result[] = { student_session + "_1_1_result", student_session + "_1_2_result",
				student_session + "_2_1_result", student_session + "_2_2_result", student_session + "_3_1_result",
				student_session + "_3_2_result", student_session + "_4_1_result", student_session + "_4_2_result" };
		String semester_array[] = { "_1_1", "_1_2", "_2_1", "_2_2", "_3_1", "_3_2", "_4_1", "_4_2" };

		int i, j;

		for (i = 0; i < 8; i++) {

			if (session.getAttribute((result[i] + studentid)) != null
					&& (boolean) session.getAttribute((result[i] + studentid))) {
				String[] courses_name = (String[]) session.getAttribute("courses_name" + semester_array[i]);
				String[] courses_result = (String[]) session.getAttribute("courses_result" + semester_array[i]);
				point_session = "point" + semester_array[i];
	%>


	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">Result of <% out.println(semester_array[i].substring(1,2) + "-" +
					semester_array[i].substring(3,4));%> Semester </h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">

				<tr>
					<%
						for (j = 0; j < courses_name.length; j++) {
									out.println("<th> " + courses_name[j] + "</th>");
								}
					%>
					<th>Point</th>
				</tr>

				<tr>

					<%
						for (j = 0; j < courses_result.length; j++) {
									out.println("<td> " + courses_result[j] + "</td>");
								}
					%>
					<td>
						<%
							out.print(session.getAttribute(point_session));
						%>
					</td>
				<tr>
			</table>
		</div>
		
		

	</div>


	<%
		}

		}
	%>



<h1 style="width: 100%; color: black; letter-spacing: 1px; "> CGPA <% out.println(session.getAttribute("avarage_point"));%></h1>



	<h1>
		Total CGPA
		<%
		out.println(session.getAttribute("avarage_point"));
	%>
	</h1>



	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>