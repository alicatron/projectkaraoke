<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title</title>
</head>
<h2>WhiteBoard</h2>
<body>
<a href="vacancy">Vacancies</a>
<a href="recruiter">Recruiters</a>
<a href="candidate">Candidates</a>
<br><br>
<table>
	<tr>
		<th>Lname</th><th>Sname</th><th>Role</th><th>Starts</th><th>Hired By</th>
	</tr>
	<c:if test="${not empty whiteboardFigures}">
		<c:forEach var="listValue" items="${whiteboardFigures}">
			<tr>
				<td>${listValue.lastName}</td>
				<td>${listValue.firstName}</td>
				<td>${listValue.role}</td>
				<td>${listValue.startDate}</td>
				<td>${listValue.hiredBy}</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
</body>
</html>