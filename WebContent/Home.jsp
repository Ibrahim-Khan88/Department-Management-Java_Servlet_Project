<%@page import="java.sql.Connection"%>
<%@page import="com.connection.GetConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Blob"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<link rel="stylesheet" href="/Project2/CSSfile/content.css"
	type="text/css">
<link rel="stylesheet" href="/Project2/CSSfile/Home.css" type="text/css">

<script type="text/javascript">
	function send(string) {

		var outString;
		if (string == 1) {
			outString = "http://localhost:8080/Project2/ShowAll/Dept.jsp";
		} else if (string == 2) {
			outString = "http://localhost:8080/Project2/ShowAll/Achievement.jsp";
		} else if (string == 3) {
			outString = "http://localhost:8080/Project2/ShowAll/Teacher.jsp";
		}

		location.href = outString;
	}

	function Detaildept(string) {

		var outString;
		outString = "http://localhost:8080/Project2/ShowAll/ViewDetailDeptF.jsp?Id="
				+ string;
		location.href = outString;
	}

	function Detailachievement(string) {

		var outString;
		outString = "http://localhost:8080/Project2/ShowAll/ViewDetailAchievement.jsp?Id="
				+ string;
		location.href = outString;
	}

	function DetailTeacher(string) {

		var outString;
		outString = "http://localhost:8080/Project2/ShowAll/viewDeatailTacher.jsp?Id="
				+ string;
		location.href = outString;
	}
</script>


<style type="text/css">
img {
	vertical-align: middle;
}

.slideshow-container-welcomePics {
	width: 100%;
	height: 100%;
	position: relative;
	margin: auto;
	position: relative;
}

.slideshow-container-welcomePics img{
width: 100%; 
height: 450px;
}


.dot-contain {
	position: absolute;
	bottom: 3%;
	left: 50%;
	transform: translate(-50%);
}

.mySlides-welcomePics {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 20px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 25px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a grey background color */
.prev:hover, .next:hover {
	background-color: #f1f1f1;
	color: black;
	text-decoration: none;
}

/* The dots/bullets/indicators */
.dot-welcomePics {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #4d0066;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active-welcomePics {
	background-color: white;
}

/* Fading animation */
.fade-welcomePics {
	-webkit-animation-name: fade-welcomePics;
	-webkit-animation-duration: 1.5s;
	animation-name: fade-welcomePics;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade-welcomePics {
	from {opacity: .1
}

to {
	opacity: 1
}

}
@
keyframes fade-welcomePics {
	from {opacity: .1
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}
</style>

</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<div class="slideshow-container-welcomePics">

		<div class="mySlides-welcomePics fade-welcomePics">

			<img src="/Project2/image/HeaderPic/1.jpg" >

		</div>

		<div class="mySlides-welcomePics fade-welcomePics">

			<img src="/Project2/image/HeaderPic/2.jpg" >

		</div>

		<div class="mySlides-welcomePics fade-welcomePics">

			<img src="/Project2/image/HeaderPic/3.jpg" >

		</div>

		<div class="mySlides-welcomePics fade-welcomePics">

			<img src="/Project2/image/HeaderPic/4.jpg" >

		</div>

		<div class="mySlides-welcomePics fade-welcomePics">

			<img src="/Project2/image/HeaderPic/5.jpg" >

		</div>

		<a class="prev" onclick="previous()">&#10094;</a> <a class="next"
			onclick="next()">&#10095;</a>

		<div class="dot-contain" style="text-align: center">
			<span class="dot-welcomePics"></span> <span class="dot-welcomePics"></span>
			<span class="dot-welcomePics"></span> <span class="dot-welcomePics"></span>
			<span class="dot-welcomePics"></span>
		</div>

	</div>



	<script>
		var slideIndex = 0;
		next();
		setInterval(next, 4000); // Change image every 2 seconds

		function previous() {
			var i;
			var slides = document
					.getElementsByClassName("mySlides-welcomePics");
			var dots = document.getElementsByClassName("dot-welcomePics");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex--;
			if (slideIndex == 0) {
				slideIndex = slides.length;
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(
						" active-welcomePics", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active-welcomePics";
		}

		function next() {
			//alert("i am the show off");
			var i;
			var slides = document
					.getElementsByClassName("mySlides-welcomePics");
			var dots = document.getElementsByClassName("dot-welcomePics");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(
						" active-welcomePics", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active-welcomePics";
			//alert("i am the show off");

		}
	</script>

<!--   style="background-color: red; margin: auto; line-height: 35px;" -->

	<div id="welcomeparent">
		<div  id="welcomeChild">
		
		<marquee behavior="alternate" direction="right">Welcome to Department of Computer Science
			and Engineering (BSMRSTU)</marquee>
		
			
			</div>
	</div>
	<br>
	<br>
	<br>


	<div id="welcomeDescription">

		<div id="welcomeDescriptionHeading">
			<p
				style="padding-top: 20px; font-family: Copperplate, Copperplate Gothic Light, fantasy;">Welcome
				to Department of Computer Science and Engineering</p>
		</div>
		<p id="welcomeDescriptionssage">Welcome to the department of
			Computer Science and Engineering. The department was established with
			the objective of imparting quality education in the field of Computer
			Science. The department has modern facilities for teaching, learning
			and research. The department offers a wide array of research
			opportunities and programs of study at undergraduate and postgraduate
			level.This is a leading academic department in the country due to the
			outstanding graduates it is producing, its various research
			activities and its extensive involvements in countless important
			national development projects. With rapidly evolving technology and
			the continuous need for innovation, the department has produced
			quality professionals holding important positions in the IT industry
			in home and abroad.</p>

	</div>

	<br>
	<br>
	<div id="underlinePart"></div>
	<br>
	<br>


	<div id="chairmanMessage">

		<div id="chairmapic">
			<img src="/Project2/image/salah.jpg" alt="">
		</div>
		<div id="messageContainer">
			<h3 id="chairmaHeading">Message from the Chairman of the
				Department</h3>
			<p id="chairmaQualifiaction">Assistant Professor and Chairman</p>
			<p id="chairmaName">Dr. Salah Ahmad</p>
			<p id="chairmadept">Department of CSE, BSMRSTU Gopalganj-8100,
				Bangladesh</p>
			<p id="chairmaMessage">Our department boasts of highly qualified,
				passionate professors who not only guide students towards an
				illustrious career, but also take up innovative research work in the
				emerging new fields . The enthusiasm and dedication of our teachers
				is truly a blessing to the institution and the end results can be
				seen when students from our department get paid handsomely during
				the placements. students of our department are among the highest, if
				not the highest paid in the industry today, thanks to the guidance
				and innovative projects provided by our faculty.</p>
		</div>


	</div>

	<br>
	<br>
	<div id="underlinePart"></div>
	<br>
	<br>




	<section id="DepartmentView">
		<!-- <h3 style="font-family: Roboto;">Department</h3> -->

		
			<!-- section title -->
			<div
				style="width: 90%; margin: auto; text-align: left; margin-bottom: 30px;">
				<div class="section-title">
					<h2 id="title-section">Department Gallery</h2>
				</div>
			</div>



		<div class='container'>
			<div class='row '>

				<%
					int i = 1, total_course;
					GetConnection con = new GetConnection();
					Connection connection = con.getconnection();
					java.sql.Statement st = connection.createStatement();

					String description = "", slider, query = "select * from introduction";
					String des[];
					ResultSet rs = st.executeQuery(query);
					int j = 1, show = 0;

					while (rs.next()) {

						if (show == 3)
							break;
						show++;

						slider = "slider" + j;
						j++;
						description = "";
						des = rs.getString("Description").split(" ");
						if (des.length > 13) {
							for (int k = 0; k < 13; k++) {
								description += des[k] + " ";
							}
							description += "...";
						} else {
							for (int k = 0; k < des.length; k++) {
								description += des[k] + " ";
							}
						}
				%>


				<div class="col-4 ">
					<div class=" product-image-wrapper">
						<div class="single-products">
							<div class="productinfo text-center">
								<!-- <img class="productphoto" src='/GetBook/Photo/java1.jpg'> -->

								<div>
									<!-- <div id="slider4"> -->

									<%
										out.println("<div id=\"" + slider + "\"> ");
									%>
									<figure>

										<%
											out.println(" <img id=\"mee\" src=\"/Project2/image/Lab/" + i + ".jpg\"> ");
										%>
										<%
											out.println(" <img id=\"mee\"  src=\"/Project2/image/Lab/" + (i + 1) + ".jpg\"> ");
										%>
										<%
											out.println(" <img id=\"mee\"  src=\"/Project2/image/Lab/" + (i + 2) + ".jpg\"> ");
										%>
										<%
											out.println(" <img id=\"mee\"  src=\"/Project2/image/Lab/" + (i + 3) + ".jpg\"> ");
										%>
										<%
											out.println(" <img id=\"mee\"  src=\"/Project2/image/Lab/" + (i) + ".jpg\"> ");
										%>
									</figure>
								</div>
							</div>
							<h6 class="title">
								<%
									out.println(rs.getString("Title"));
								%>
							</h6>

						</div>
					</div>

				</div>
			</div>
			<%
				i += 4;
				}
			%>

		</div>


		<div class="cartcontainer">
			<div onclick="send('1')" class="button button-1">See All</div>
		</div>

	</section>

	<br>
	<br>
	<div id="underlinePart"></div>
	<br>
	<br>






	<!-- #Achievement section -->
	<section id="#Achievement">



			<div
				style="width: 90%; margin: auto; text-align: left; margin-bottom: 30px;">
				<div class="section-title">
					<h2 id="title-section">Achievement</h2>
				</div>
			</div>


		<%
			i = 0;
			java.sql.Statement st1 = connection.createStatement();

			description = "";
			query = "select * from achievement";

			ResultSet ache = st.executeQuery(query);
		%>


		<div class='container'>
			<div class='row'>

				<%
					while (ache.next()) {
						
						if(i == 3) break;
						i++;
				%>
				<div class="col-4">
					<div class="product-image-wrapper text-center">

						<%
								out.println(" <img  src=\"/Project2/image/achievement/" + (i) + ".jpg\"> ");
						%>


						<h4  class="title">
							<%
								out.print(ache.getString("Title"));
							%>
						</h4>
						<p>
							<%
								out.print(ache.getString("Description"));
							%>
						</p>
					</div>

				</div>

				<%
					}
				%>


			</div>
		</div>


		<div class="cartcontainer">
			<div onclick="send('2')" class="button button-1">See All</div>
		</div>
	</section>










	<br>
	<br>
	<div id="underlinePart"></div>
	<br>
	<br>



	<!-- Teacher section -->
	<section id="Teacher">

			<div
				style="width: 90%; margin: auto; text-align: left; margin-bottom: 30px;">
				<div class="section-title">
					<h2 id="title-section">Faculty Member </h2>
				</div>
			</div>
	

		<div class='container'>
			<div class='row'>

				<%
					Statement st2;

					try {

						st2 = connection.createStatement();
						query = "select * from teacher where Department='CSE'";
						ResultSet rs2 = st2.executeQuery(query);
						show = 0;

						while (rs2.next()) {
							if (show == 3)
								break;
							show++;

							String Name = rs2.getString("Name");
							String Gmail = rs2.getString("Gmail");
							String info = rs2.getString("Information");

							String designation = rs2.getString("Designation");
							String filename = rs2.getString("Filename");
							Blob blob = rs2.getBlob("Photo");
							byte bytearray[] = blob.getBytes(1, (int) blob.length());
							String extension = "";

							i = filename.lastIndexOf('.');
							if (i > 0) {
								extension = filename.substring(i + 1);
							}

							String encodeBase64 = Base64.getEncoder().encodeToString(bytearray);
							String image_encode = "data:image/" + extension + ";base64," + encodeBase64;
				%>

				<% out.print(" <div onclick=DetailTeacher('" + rs2.getString("Id") + "') class=\"col-4\"> "); %>
					<div onclick="" class="product-image-wrapper text-center">

						<%
							out.println(" <img class='productphoto'  src='" + image_encode + "'> ");
						%>
						<h4>
							<%
								out.print(rs2.getString("Name"));
							%>
						</h4>
						<p>
							<%
								out.print(rs2.getString("Designation"));
							%>
						</p>
					</div>

				</div>

				<%
					}

					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>
			</div>
		</div>


		<div class="cartcontainer">
			<div onclick="send('3')" class="button button-1">See All</div>
		</div>
	</section>











	<jsp:include page="/Footer/footer.jsp" />



</body>


<link rel="stylesheet" type="text/css"
	href="/Project2/bootstrap/css/bootstrap.min.css">

</html>