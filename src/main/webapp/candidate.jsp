<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                <!--<tr>
                    <td><form:label path="recruiterId">Recruiter</form:label></td>
                    <td><form:input path="recruiterId"/></td>
                </tr>
                <tr>
                    <td><form:label path="vacancyId">Vacancy</form:label></td>
                    <td><form:input path="vacancyId"/></td>
                </tr>-->
                
                <%
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/karaoke?useSSL=false";
		String userId = "root";
		String password = "c0nygre";
			
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;

		
		connection = DriverManager.getConnection(
		connectionUrl, userId, password);
		statement = connection.createStatement();
		String sql = "SELECT RecruiterID, Email FROM recruiter;";
		resultSet = statement.executeQuery(sql);
		%>
                <tr>
                 <td><form:label path="recruiterId">Recruiter</form:label></td>
                <td><form:select path="recruiterId">
					<%
						while(resultSet.next()){
							System.out.println("WORKS " + resultSet.getInt(1));
							out.print("<option value=" + resultSet.getInt(1) + ">" + 
							resultSet.getString(2) + "</option>");
						}				
					%>
				</form:select></td>
				</tr>
				<tr>
                 <td><form:label path="vacancyId">Vacancy</form:label></td>
                <td><form:select path="vacancyId">
					<%
						String sql2 = "SELECT VacancyID, Role From vacancy;";
						resultSet2 = statement.executeQuery(sql2);
						while(resultSet2.next()){
							out.print("<option value=" + resultSet2.getInt(1) + ">" + 
							resultSet2.getString(2) + "</option>");
						}				
					%>
				</form:select></td>
				</tr>
				
               
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
    <!--<form:button id="addCandidate">Add Person</form:button>
    </form:form>
	<!--<a href="/addCandidate">Add candidate</a>-->
	<a href="/">Home</a>
</body>
</html>