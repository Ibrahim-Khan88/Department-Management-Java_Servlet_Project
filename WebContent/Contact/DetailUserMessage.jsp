<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="com.connection.GetConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message</title>
<link rel="stylesheet" href="/Project2/CSSfile/viewDetail.css"
	type="text/css">
<link rel="stylesheet" href="/Project2/CSSfile/commomformcontent.css"
	type="text/css">
	
<script>
	function transfer(gmail) {

		var outString;

		outString = "FeedBack.jsp?gmail=" + gmail;
		location.href = outString;

	}
</script>


</head>
<body>

	<jsp:include page="/HeaderContent.jsp" />

	<%
		GetConnection con = new GetConnection();
		Connection connection = con.getconnection();
		Statement st;

		String id;
		id = request.getParameter("Id");
		//id = "31";
		System.out.println("id= " + id);



			st = connection.createStatement();
			String query = "select * from comment where  Id='" + id + "'";
			ResultSet rs = st.executeQuery(query);

			rs.next();

	%>
	<div id="Allcontain">

		<div id="user-name-email">

			<p id="heading-user">
				User Name:
				<% out.print(rs.getString("Name"));%>
			</p>
			<p id="heading-user">
				User Gmail:
				<% out.print(rs.getString("Gamil"));%>
			</p>
			
			<p id="heading">
			<% String send = "  <button id=\"erp-button\" onclick=\"transfer('" + rs.getString("Gamil")
			+ "');\"  >Send Feed Back</button>      "; 
			out.print( send );
			%>
			
				<!-- <button id="erp-button" onclick="transfer('1st');">Send Feed Back</button> -->
			</p>


		</div>




		<div id="info">
			<p id="heading">Message</p>
			<p id="description">
				<%
					out.print(rs.getString("Comment"));
			
				%>
			</p>

		</div>
	</div>
	
	
	
	
	
	

	
	
<jsp:include page="/Footer/footer.jsp" />


</body>
</html>