<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>


<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" href="/Project2/CSSfile/style.css"
	type="text/css">



<script type="text/javascript">
	function setyearshow(string) {

		var outString = "http://localhost:8080/Project2/RealAttendance/AttendanceShow.jsp?year="
				+ string;
		location.href = outString;
	}
	function setyeardelete(string) {

		var outString = "http://localhost:8080/Project2/RealAttendance/DeleteAttecdance.jsp?year="
				+ string;
		location.href = outString;

	}

	function showbook(year) {
		var outString = "http://localhost:8080/Project2/Book/ShowBook.jsp?year="
				+ year;
		location.href = outString;
	}

	function showSyllabus(year) {

		var outString = "http://localhost:8080/Project2/Syllabus/ShowSyllabus.jsp?year="
				+ year;
		location.href = outString;

	}

	function padding(value) {

		if (value == "student") {
			var outString = "http://localhost:8080/Project2/PaddingRequest.jsp";
		} else if (value == "teacher") {
			var outString = "http://localhost:8080/Project2/LoginSystem/PanddingTeacherRequest.jsp";
		}
		location.href = outString;
	}

	function Courses(value) {
		if (value == "Show") {
			var outString = "http://localhost:8080/Project2/SemesterCourse/Showpage.jsp";
		} else if (value == "Add") {
			var outString = "http://localhost:8080/Project2/SemesterCourse/AddCourse.jsp";
		}
		location.href = outString;
	}

	function Session(value) {
		if (value == "Show") {
			var outString = "http://localhost:8080/Project2/StudentSession/StudentSession.jsp";
		} else if (value == "Update") {
			var outString = "http://localhost:8080/Project2/StudentSession/StudentSessionUpdate.jsp";
		}
		location.href = outString;
	}

	function showRoutine(value) {
		var outString = "http://localhost:8080/Project2/Routin/ShowRoutin.jsp?year="
				+ value;
		location.href = outString;
	}
</script>

<style type="text/css">
.underline {
	height: 2px;
	width: 100%;
	background-color: white;
}

nav {
	font-family: sans-serif;
}

/* .dropdown a {
	font-family: inherit;
}

.dropdown a:hover{
	font-family: inherit;
} */
</style>
</head>
<body>

	<div class="heading">

		<img class="headingpic" alt="no pic" src="/Project2/image/Header.jpg">
		<div class="logo">
			<img alt="" class="logopic" src="/Project2/image/CSE logo.jpg">
		</div>
		<div id="dept">
			<p>Department of Computer Science and Engineering</p>
		</div>
		<p id="varsity">Bangabandhu Sheikh Mujibur Rahman Science and
			Technology University, Gopalganj</p>

	</div>




	<%
		boolean is = session.getAttribute("authority") != null && (boolean) session.getAttribute("authority");
		request.setAttribute("is", is);
		session.setAttribute("showalert", false);
		boolean alllogin = (session.getAttribute("login") == null || !(boolean) session.getAttribute("login"))
				&& (session.getAttribute("authority") == null || !(boolean) session.getAttribute("authority"))
				&& (session.getAttribute("teacherLogin") == null
						|| !(boolean) session.getAttribute("teacherLogin"));
		boolean Teacher_or_student = (session.getAttribute("login") != null
				&& (boolean) session.getAttribute("login"))
				|| (session.getAttribute("teacherLogin") != null && (boolean) session.getAttribute("teacherLogin"));

		if (alllogin) {

			out.println("<div class='Login'>");
			/* 			out.println(" <a href='http://localhost:8080/Project2/Login.jsp'>Login</a> "); */
			out.println(" <a href='http://localhost:8080/Project2/LoginSystem/StudentLogin.jsp'>Login</a> ");
			out.println(" </div> ");

		} else if (session.getAttribute("login") != null && (boolean) session.getAttribute("login")) {
			out.println("<div class='Login'>");
			out.println(" <a href='http://localhost:8080/Project2/Logoutservlet'>Logout</a> ");
			out.println(" </div> ");
		} else if (session.getAttribute("teacherLogin") != null && (boolean) session.getAttribute("teacherLogin")) {
			out.println("<div class='Login'>");
			out.println(" <a href='http://localhost:8080/Project2/TeacherLogOut'>Logout</a> ");
			out.println(" </div> ");
		} else {
			out.println("<div class='Login'>");
			out.println(" <a href='http://localhost:8080/Project2/AuthorityLogoutServlet'>Logout</a> ");
			out.println(" </div> ");
		}
	%>



	<nav>
		<div class="menu-icon">
			<i class="fa fa-bars fa-2x"></i>
		</div>
		<ul>
			<div class='dropdown'>
				<li><a href="http://localhost:8080/Project2/Home.jsp">Home</a></li>
			</div>

			<%
				if (session.getAttribute("login") != null && (boolean) session.getAttribute("login") == true
						&& session.getAttribute("undergradute") != null
						&& (boolean) session.getAttribute("undergradute") == true) {
			%>
			<div class='dropdown'>
				<li><a href="http://localhost:8080/Project2/IndivitualResult">Result</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/RealAttendance/IndevidualshowAtt.jsp">Attendance</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Routin/StudentRoutin.jsp">Routine</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Syllabus/StudentSyllabusShow.jsp">Syllabus</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Book/StudentBookShow.jsp">Book</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Budget/Budgetshow.jsp">Budget</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/AccountSetting/Student.jsp">Account
						Setting</a></li>
			</div>
			<%
				} else if (session.getAttribute("login") != null && (boolean) session.getAttribute("login") == true
						&& session.getAttribute("undergradute") != null
						&& (boolean) session.getAttribute("undergradute") == false) {
			%>

			<div class='dropdown'>
				<li><a href="http://localhost:8080/Project2/IndivitualResult">Result</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Budget/Budgetshow.jsp">Budget</a></li>
			</div>

			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/AccountSetting/Student.jsp">Account
						Setting</a></li>
			</div>

			<%
				} else if (session.getAttribute("teacherLogin") != null
						&& (boolean) session.getAttribute("teacherLogin") == true) {
			%>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Routin/TeacherRoutine.jsp">Routine</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/SemesterCourse/TeacherCourseDetail.jsp">
						Semester Course </a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/RealAttendance/TeacherAttendanceList.jsp">Attendance</a></li>
			</div>
			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/AccountSetting/Teacher.jsp">Account
						Setting</a></li>
			</div>
			<%
				}
			%>

			<%
				if (Teacher_or_student) {
			%>

			<div class='dropdown'>
				<li><a href="">Others</a></li>

				<div class="dropdown-content">
					<a href="http://localhost:8080/Project2/ShowAll/Dept.jsp">Department
						View</a>
					<div class="underline"></div>
					<a href="http://localhost:8080/Project2/ShowAll/Achievement.jsp">Achievement</a>
					<div class="underline1"></div>
					<a href='http://localhost:8080/Project2/ShowAll/Teacher.jsp'>Faculty
						Member</a>
					<div class="underline1"></div>
					<a href="http://localhost:8080/Project2/Contact/Contact.jsp">Contact
						Us</a>
				</div>
			</div>

			<%
				}
			%>



			<c:if test="${is}">

				<div class='dropdown'>
					<li><a href="">Result</a></li>

					<div class="dropdown-content">
						<a
							href="http://localhost:8080/Project2/Result/CreateSemesterChoice.jsp">Create
							New Sheet</a>
						<div class="underline"></div>
						<a
							href="http://localhost:8080/Project2/Result/AddValuesemesterchoice.jsp">Insert
							Value</a>
						<div class="underline1"></div>
						<a
							href='http://localhost:8080/Project2/Result/RetriveSessionChoice.jsp'>Show
							Result</a>
						<div class="underline1"></div>
						<a
							href='http://localhost:8080/Project2/Result/UpdateSessionChoice.jsp'>Update
							Value</a>
					</div>
				</div>

				<div class='dropdown'>
					<li><a href="">Attendance</a></li>
					<div class="dropdown-content">
						<div class="hover-me-show">
							<a href="">Show Attendance</a>

							<div class="subb-option-2">
								<ul>
									<li onclick="setyearshow('1st');">1st Year</li>
									<div class="underline"></div>
									<li onclick="setyearshow('2nd');">2nd Year</li>
									<div class="underline"></div>
									<li onclick="setyearshow('3rd');">3rd Year</li>
									<div class="underline"></div>
									<li onclick="setyearshow('4th');">4th Year</li>
								</ul>
							</div>
						</div>

						<div class="underline"></div>


						<div class="hover-me-delete">
							<a href="">Delete Attendance</a>
							<div class="subb-option-3">
								<ul>
									<li onclick="setyeardelete('1st');">1st Year</li>
									<div class="underline"></div>
									<li onclick="setyeardelete('2nd');">2nd Year</li>
									<div class="underline"></div>
									<li onclick="setyeardelete('3rd');">3rd Year</li>
									<div class="underline"></div>
									<li onclick="setyeardelete('4th');">4th Year</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class='dropdown'>
					<li><a href="">Routine</a></li>
					<div class="dropdown-content">
						<!-- <a href="http://localhost:8080/Project2/Routin/ShowRoutin.jsp"></a> -->

						<div class="hover-me-show">
							<a href="">Show Routine</a>

							<div class="subb-option-2">
								<ul>
									<li onclick="showRoutine('1st');">1st Year</li>
									<div class="underline"></div>
									<li onclick="showRoutine('2nd');">2nd Year</li>
									<div class="underline"></div>
									<li onclick="showRoutine('3rd');">3rd Year</li>
									<div class="underline"></div>
									<li onclick="showRoutine('4th');">4th Year</li>
								</ul>
							</div>
						</div>




						<div class="underline"></div>
						<a href="http://localhost:8080/Project2/Routin/AddRoutin.jsp">Add
							Routine</a>
					</div>
				</div>

				<div class='dropdown'>
					<li><a href="">Book list</a></li>
					<div class="dropdown-content">
						<div class="hover-me-show">
							<a href="">Show List</a>

							<div class="subb-option-2">
								<ul>
									<li onclick="showbook('1st');">1st Year</li>
									<div class="underline1"></div>
									<li onclick="showbook('2nd');">2nd Year</li>
									<div class="underline1"></div>
									<li onclick="showbook('3rd');">3rd Year</li>
									<div class="underline1"></div>
									<li onclick="showbook('4th');">4th Year</li>
								</ul>
							</div>
						</div>

						<div class="underline"></div>

						<a href="http://localhost:8080/Project2/Book/AddBook.jsp">Add
							Book</a>

					</div>
				</div>

				<div class='dropdown'>
					<li><a href="">Syllabus</a></li>
					<div class="dropdown-content">

						<div class="hover-me-show">
							<a href="">Show Syllabus</a>

							<div class="subb-option-2">
								<ul>
									<li onclick="showSyllabus('1st');">1st Year</li>
									<div class="underline"></div>
									<li onclick="showSyllabus('2nd');">2nd Year</li>
									<div class="underline"></div>
									<li onclick="showSyllabus('3rd');">3rd Year</li>
									<div class="underline"></div>
									<li onclick="showSyllabus('4th');">4th Year</li>
								</ul>
							</div>
						</div>

						<div class="underline"></div>

						<a href="http://localhost:8080/Project2/Syllabus/AddSyllabus.jsp">Add
							Syllabus</a>


					</div>
				</div>

				<div class='dropdown'>
					<li><a href="">Budget</a></li>
					<div class="dropdown-content">

						<a href="http://localhost:8080/Project2/Budget/Budgetshow.jsp">Show
							Budget</a>

						<div class="underline"></div>

						<a href="http://localhost:8080/Project2/Budget/AddBudget.jsp">Add
							Budget</a>

					</div>
				</div>

				<div class='dropdown'>
					<li><a href="">Others</a></li>
					<div class="dropdown-content">


						<div class="hover-me-show">
							<a href="">Padding Request</a>

							<div style="margin-left: -100px;" class="subb-option-2">
								<ul>
									<li onclick="padding('student');">Student</li>
									<div class="underline"></div>
									<li onclick="padding('teacher');">Teacher</li>
								</ul>
							</div>
						</div>

						<div class="underline"></div>

						<div class="hover-me-show">
							<a href="">Semester Courses</a>

							<div style="margin-left: -100px;" class="subb-option-2">
								<ul>
									<li onclick="Courses('Show');">Show Courses</li>
									<div class="underline1"></div>
									<li onclick="Courses('Add');">Add Courses</li>
								</ul>
							</div>
						</div>

						<div class="underline"></div>


						<div class="hover-me-show">
							<a style="cursor: pointer;" onclick="Session('Show');">Student
								Session</a>

							<!-- 						<div class="subb-option-2">
								<ul>
									<li onclick="Session('Show');">Show Session</li>
									<div class="underline"></div>
									<li onclick="Session('Update');">Update Session</li>
								</ul>
							</div> -->
						</div>

						<div class="underline"></div>

						<!-- 						<a href='http://localhost:8080/Project2/Teacher/Updateinfo.jsp'>Update
							Teacher Information</a>
						<div class="underline"></div> -->
						<a
							href='http://localhost:8080/Project2/StudentInformation/StudentInfoSelect.jsp'>Student
							Information</a>
						<div class="underline"></div>
						<a
							href='http://localhost:8080/Project2/AccountSetting/Authority.jsp'>Account
							Setting</a>
						<div class="underline"></div>
						<a href='http://localhost:8080/Project2/Contact/ContactShow.jsp'>User
							Message</a>
					</div>
				</div>


			</c:if>



			<%
				if (alllogin) {
			%>

			<div class='dropdown'>

				<li><a href='http://localhost:8080/Project2/ShowAll/Dept.jsp'>Department
						Gallery</a></li>
			</div>

			<div class='dropdown'>

				<li><a
					href='http://localhost:8080/Project2/ShowAll/Achievement.jsp'>Achievement</a></li>
			</div>

			<div class='dropdown'>

				<li><a
					href='http://localhost:8080/Project2/ShowAll/Teacher.jsp'>Faculty
						Member </a></li>
			</div>

			<div class='dropdown'>
				<li><a
					href="http://localhost:8080/Project2/Contact/Contact.jsp">Contact
						Us</a></li>
			</div>


			<%
				}
			%>

		</ul>
	</nav>





</body>



</html>