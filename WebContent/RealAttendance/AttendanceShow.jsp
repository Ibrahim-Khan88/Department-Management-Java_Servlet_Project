<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendance</title>
<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">
</head>

<style>

/* .section-title:after {
  width: 400px;
} */
</style>


<body>

	<jsp:include page="/HeaderContent.jsp" />
	<%
		String query, year = request.getParameter("year"), tableName, id, studentId;
		String[] totalCourse = new String[15];
		int[] totalClass = new int[15];
		int i, j, total_student, k, l, count, total_course = 0;
		float num, totalAttendance = 0;

		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		java.sql.Statement st = connection.createStatement();

		// Getting All courseCode and totalClass
		query = "select * from totalclass where year ='" + year + "'";
		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {
			totalCourse[total_course] = rs.getString("courseCode");
			totalClass[total_course++] = rs.getInt("totalClass");
		}

		//Getting total_student and Id
		query = "select * from student_year_information where year ='" + year + "'";
		ResultSet rs1 = st.executeQuery(query);
		rs1.next();

		total_student = Integer.parseInt(rs1.getString("total_student").toString());
		id = rs1.getString("session").toString().substring(2, 4);
		//End total_student and Id

		// Getting table Name
		if (year.equals("1st"))
			tableName = "attendance1st";
		else if (year.equals("2nd"))
			tableName = "attendance2nd";
		else if (year.equals("3rd"))
			tableName = "attendance3rd";
		else
			tableName = "attendance4th";
		// End table Name
	%>





	<div id="table-content-container">

		<div class="section-title">
			<h2 id="title-section">
				Attendance List of
				<%
				out.println(year);
			%>
				Year
			</h2>
		</div>

		<div id="tableContainer">
			<table cellspacing="0">


				<tr>
					<th>Student Id</th>
					<%
						for (j = 0; j < total_course; j++) {

							out.print("<th> ");
							out.print(totalCourse[j]);
							out.print("</th> ");

						}
					%>
					<th>Total Attendance</th>
				</tr>
				
				
			
				
				
				<%
						for (j = 1; j <= total_student; j++) {
							if (j < 10)
								studentId = id + "CSE00" + j;
							else
								studentId = id + "CSE0" + j;
							out.print("<tr>");
							out.print("<td>");
							out.print(studentId);
							out.print("</td>");
							totalAttendance = 0;
							for (k = 0; k < total_course; k++) {
								query = "select COUNT(*) from " + tableName + " where courseCode='" + totalCourse[k] + "' and id='"+ studentId + "'";
								ResultSet rs2 = st.executeQuery(query);
								num = 0;
								rs2.next();
								num = rs2.getInt(1);
								num = Math.round((num / totalClass[k]) * 100); // percentage of each class 
								totalAttendance +=num; 
								out.print("<td>");
								out.print(num+ "%");
								out.print("</td>");
							}
							out.print("<td>");
							totalAttendance /= total_course;
							totalAttendance = Math.round(totalAttendance);
							out.print(totalAttendance+ "%");
							out.print("</td>");

							out.print("</tr>");
						}
						
					%>
				

			</table>
		</div>

	</div>




	<jsp:include page="/Footer/footer.jsp" />
</body>
</html>




<!-- 


<link rel="stylesheet" href="/Project2/CSSfile/DetailUpdate.css"
	type="text/css">

<script type="text/javascript" src="/Project2/bootstrap/js/jquery.js"></script>

<script type="text/javascript">
	function detail(Name, department, designation, interested, gmail, image_encode) {
		/* 	alert(Name + "  " + department + "  " + designation + "  " + interested
					+ "  " + Gmail); */

		$("#name").html(Name);
		$("#Department").html(department);
		$("#designation").html(designation);
		$("#interested").html(interested);
		$("#gmail").html(gmail);
		
		$("#photo").attr("src", image_encode);
		

		$("#update-book-popup").toggleClass("border-class");
		$("#update-book-popup").css({
			'height' : 400
		});
		$("#update-book-popup").css({
			top : window.pageYOffset + 300
		});

		//alert(id)
		/* 		var outString = "http://localhost:8080/Project2/LoginSystem/TeacherDetail.jsp?id="
		 + id;
		 location.href = outString; */
	}



	$(document).ready(function() {
		$("#update-book-popup-close").click(function() {
			$("#update-book-popup").css({
				'height' : 0
			});
			$("#update-book-popup").toggleClass("border-class");
		});

	});
</script>


	<div id="update-book-popup" >
		<a id="update-book-popup-close">&times;</a>



		<div class="wrapper wrapper--w700">
			<div class="card card-5">


				<div class="card-heading">
					<h2 class="title">Detail</h2>
				</div>

				<div class="card-body">
					<form>

						<div class="form-row">

							<div class="name">Name</div>
							<div class="value">
								<div id="name" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Department</div>
							<div class="value">
								<div id="Department" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Email</div>
							<div class="value">
								<div id="gmail" style="font-size: 15px;"></div>
							</div>

						</div>

						<div class="form-row">

							<div class="name">Designation</div>
							<div class="value">
								<div id="designation" style="font-size: 15px;"></div>
							</div>

						</div>


					</form>
				</div>
			</div>
		</div>


	</div>


detail = "  <button  id=\"btn\" class=\"btn--radius-2 btn--blue\" onclick=\"detail('" + Name + "','"
									+ department + "','" + designation + "','" + interested + "','" + Gmail
									+ "','"+ image_encode  +"');\"  >Detail</button>      ";
















#btn{
padding: 0 25px;
}


id=\"btn\" class=\"btn--radius-2 btn--blue\"

<link rel="stylesheet" href="/Project2/CSSfile/tableNew.css"
	type="text/css">

  <div id="table-content-container">

        <div class="section-title">
            <h2 id="title-section">     </h2>
        </div>

        <div id="tableContainer">
            <table cellspacing="0">





            </table>
        </div>

    </div> 
    
    -->