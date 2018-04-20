<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
        rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidates</title>
</head>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">White Board</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href="/vacancy">Vacancies</a></li>
      <li><a href="/candidate">Hired Candidates</a></li>
      <li><a href="recruiter">Recruiters</a></li>
    </ul>
  </div>
</nav>

<body>
<div class="container">
        <table class="table table-striped">
        <h2>Candidate</h2>
            <thead>
	<tr>
		<th>First Name</th>
		<th>Surname</th>
		<th>Email</th>
		<th>Start Date</th>
	</tr>
	</thead>
            <tbody>
	<c:if test="${not empty candidates}">
		<c:forEach var="listValue" items="${candidates}">
			<tr>
				<td>${listValue.firstName}</td>
				<td>${listValue.lastName}</td>
				<td>${listValue.email}</td>
				<td>${listValue.startDate}</td>
				<td><a class="btn btn-warning" href="/edit-todo">Edit Todo</a></td>
                        <td><a class="btn btn-warning" href="/delete-todo">Delete Todo</a></td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	</table>
	<div>
            <a class="btn btn-default" href="/addCandidate">Add Candidate</a>
            
        </div>
        <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </div>
	<br>

	<br><br>
</body>
</html>