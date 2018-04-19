<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Add Candidate</h2>

<c:url var="actionUrl" value="/addCandidate" />

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
                    <td><input type="submit" value="Submit"/></td>
                </tr>-->
            </table>
    <form:button id="addCandidate">Add Person</form:button>
	</form:form>

</body>
</html>