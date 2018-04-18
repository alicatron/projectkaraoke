<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recruiter</title>
</head>
<h2>Recruiters</h2>
<body>
<table>
	<tr>
		<th>Name</th><th>Surname</th><th>Email</th>
	</tr>
	<c:if test="${not empty recruiters}">
		<c:forEach var="listValue" items="${recruiters}">
			<tr>
				<td>${listValue.firstName}</td>
				<td>${listValue.lastName}</td>
				<td>${listValue.email}</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
	<br>
	
	<a href="/">Home</a>

</body>
</html>