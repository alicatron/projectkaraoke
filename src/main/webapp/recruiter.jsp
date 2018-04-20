<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.dao.*,java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	<c:if test="${not empty recruiters}">
	<c:url var="actionUrl" value="/recruiterStats" />
	<form:form action="${actionUrl}" modelAttribute="recruiter" method="GET" acceptCharset="UTF-8">
	<select name="recruiterid">
		<c:forEach var="listValue" items="${recruiters}">
		<option value="${listValue.id}">${listValue.email}</option>
		</c:forEach>
		</select>
		<form:button id="vacancy">View Stats</form:button>
	</form:form>
		</c:if>
	<br>

	<br>
	<h2>Add Recruiter</h2>
	<c:url var="actionUrl" value="/recruiter" />

<form:form action="${actionUrl}" modelAttribute="recruiter" method="POST" acceptCharset="UTF-8">
		<table>
                <tr>
                    <td><form:label path="firstName">First name</form:label></td>
                    <td><form:input path="firstName"/></td>
                </tr>
                <tr>
                    <td><form:label path="lastName">Last Name</form:label></td>
                    <td><form:input path="lastName"/></td>
                </tr>
                <tr>
                    <td><form:label path="email">Email</form:label></td>
                    <td><form:input path="email"/></td>
                </tr>
            </table>
    <form:button id="vacancy">Add Recruiter</form:button>
	</form:form>
	
	<a href="/">Home</a>

</body>
</html>