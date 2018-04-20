<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<h2>Add Vacancy</h2>
	<c:url var="actionUrl" value="/vacancy" />

<form:form action="${actionUrl}" modelAttribute="vacancy" method="POST" acceptCharset="UTF-8">
		<table>
                <tr>
                    <td><form:label path="role">Role</form:label></td>
                    <td><form:input path="role"/></td>
                </tr>
                <tr>
                    <td><form:label path="practice">Practice</form:label></td>
                    <td><form:input path="practice"/></td>
                </tr>
                <tr>
                    <td><form:label path="numOfPositions">#Positions</form:label></td>
                    <td><form:input path="numOfPositions"/></td>
                </tr>
            </table>
    <form:button id="vacancy">add vacancy</form:button>
	</form:form>
	<a href="/">Home</a>
</body>
</html>