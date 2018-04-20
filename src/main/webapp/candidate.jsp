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
	<c:url var="actionUrl" value="/candidate" />
 
<form:form action="${actionUrl}" modelAttribute="candidate" method="POST" acceptCharset="UTF-8">
        <table>
                <tr>
                    <td><form:label path="lastName">LastName</form:label></td>
                    <td><form:input path="lastName"/></td>
                </tr>
                <tr>
                    <td><form:label path="firstName">FirstName</form:label></td>
                    <td><form:input path="firstName"/></td>
                </tr>
                <tr>
                    <td><form:label path="email">Email</form:label></td>
                    <td><form:input path="email"/></td>
                </tr>
                <tr>
                    <td><form:label path="startDate">Start Date</form:label></td>
                    <td><form:input type="date" path="startDate"/></td>
                </tr>
                <tr>
                    <td><form:label path="recruiterId">Recruiter</form:label></td>
                    <td><form:input path="recruiterId"/></td>
                </tr>
                <tr>
                    <td><form:label path="vacancyId">Vacancy</form:label></td>
                    <td><form:input path="vacancyId"/></td>
                </tr>
                <!--<tr>
                 <td><form:label path="recruiterId">Recruiter</form:label>
                <select name="recruiterid">
					<c:forEach var="listValue" items="${recruiters}">
					<option value="${listValue.id}">${listValue.email}</option>
					</c:forEach>
				</select>
				</tr>
				<select name="recruiterid">
					<c:forEach var="listValue" items="${recruiters}">
					<option value="${listValue.id}">${listValue.email}</option>
					</c:forEach>
				</select>
               
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>-->
            </table>
    <form:button id="addCandidate">Add Person</form:button>
    </form:form>
	<!--<a href="/addCandidate">Add candidate</a>-->
	<a href="/">Home</a>
</body>
</html>