<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidates</title>
</head>
<h2>Candidates</h2>
<body>
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
	<a href="/addCandidate">Add candidate</a>
	<a href="/">Home</a>
</body>
</html>