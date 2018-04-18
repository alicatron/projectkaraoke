<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vacancy</title>
</head>
<h2>Vacancy</h2>
<body>
	<table>
	<tr>
		<th>Role</th><th>Practice</th><th># of positions</th>
	</tr>
	<c:if test="${not empty vacancies}">
		<c:forEach var="listValue" items="${vacancies}">
			<tr>
				<td>${listValue.role}</td>
				<td>${listValue.practice}</td>
				<td>${listValue.numOfPositions}</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	<br>
	<a href="/">Home</a>
</body>
</html>