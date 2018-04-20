<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1" import="project.dao.*,java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/karaoke?useSSL=false";
		String userId = "root";
		String password = "c0nygre";
				
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		
		connection = DriverManager.getConnection(
		connectionUrl, userId, password);
		statement = connection.createStatement();
		String sql = "SELECT FirstName, LastName FROM recruiter WHERE RecruiterID = " + request.getParameter("recruiterid") + ";";
		resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
			
			String fname = resultSet.getString("FirstName");
			String lname = resultSet.getString("LastName");
			%>
			<h2>Candidates hired by <%=fname + " " + lname %></h2>
			<% 
		}
		
		%>


	<table>
	<tr>
		<th>Fname</th><th>Sname</th><th>Email</th><th>Start Date</th>
	</tr>
	<c:if test="${not empty candidates}">
		<c:forEach var="listValue" items="${candidates}">
			<tr>
				<td>${listValue.firstName}</td>
				<td>${listValue.lastName}</td>
				<td>${listValue.email}</td>
				<td>${listValue.startDate}</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	<br>
	<!--<a href="/addCandidate">Add candidate</a>-->
	<a href="/">Home</a>
</body>
</html>