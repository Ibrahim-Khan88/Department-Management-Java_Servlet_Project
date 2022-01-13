<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.connection.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher</title>
<link rel="stylesheet" href="/Project2/CSSfile/detail.css"
	type="text/css">

<script type="text/javascript"> 
	
	function save(id,accept) {
		//alert(id + " " + accept);
		 var outString = "TeachePadding?id=" + id + "&&accept=" + accept;
		location.href = outString; 
	}
	
	</script>

</head>
<body>

		 <jsp:include page="/HeaderContent.jsp" />  <br> <br>

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		PrintWriter output = response.getWriter();
		Statement st, st1;

		int visit;
		String phone_number_one, author, date, gmail, title, price, filename, image_encode = "", query,
				encodeBase64, id;
		id = request.getParameter("id");
		System.out.print(id);
		//id = "1";
		try {

			st = connection.createStatement();
			query = "select * from panddingteacher where id ='" + id + "'";
			ResultSet rs = st.executeQuery(query);
			rs.next();

			filename = rs.getString("Filename");
			Blob blob = rs.getBlob("Photo");
			byte bytearray[] = blob.getBytes(1, (int) blob.length());
			String extension = "";

			int i = filename.lastIndexOf('.');
			if (i > 0) {
				extension = filename.substring(i + 1);
			}

			encodeBase64 = Base64.getEncoder().encodeToString(bytearray);
			image_encode = "data:image/" + extension + ";base64," + encodeBase64;
	%>


	<div class="detailContainer">

		<div class="pricingdiv">
			<ul class="theplan" style="background-color: #7c3ac9;">
				<li class="title" style="margin-top: 40px;"><b>Teacher
						Photo</b></li>
				<br>
				<%
					out.println(" <img class=\"detailphoto\" src='" + image_encode + "'> ");
				%>
			</ul>

			<ul class="theplan" style="background-color: #7c3ac9;">
				<li class="title"><b>Teacher Information</b></li>
				<li><b>Name: </b> <%
 	out.print(rs.getString("Name"));
 %></li>
				<li><b>Gmail:</b> <%
 	out.print(rs.getString("Gmail"));
 %></li>
				<li><b>Designation:</b> <%
 	out.print(rs.getString("Designation"));
 %></li>
				<li><b></b></li>
			</ul>

			<ul class="theplan" style="background-color: #7c3ac9;">
				<li class="title"><span class="icon-trophy"
					style="color: yellow"></span> <b>Teacher's Message</b></li>
				<li><b>Message:</b> <%
 	out.print(rs.getString("Information"));
 %></li>
				<li><b></b></li>
			</ul>

		</div>

		<div class="cartcontaineradd">
			<div onclick="save('<%out.print(rs.getString("id"));%>','1')"
				class="button button-1">ACCEPT</div>
		</div>

		<div class="cartcontainerreject">
			<div onclick="save('<%out.print(rs.getString("id"));%>','0')"
				class="button button-1">REJECT</div>
		</div>

	</div>

	<%
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>


<br> <br>
	<jsp:include page="/Footer/footer.jsp" />


</body>
</html>