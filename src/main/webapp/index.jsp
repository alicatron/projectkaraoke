<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
        rel="stylesheet">
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
        
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Surname</th>
                    <th>Role</th>
                    <th>Start Date</th>
                    <th>Hired By</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                    <tr>
                    <c:if test="${not empty whiteboardFigures}">
		<c:forEach var="listValue" items="${whiteboardFigures}">
			<tr>
				<td>${listValue.lastName}</td>
				<td>${listValue.firstName}</td>
				<td>${listValue.role}</td>
				<td>${listValue.startDate}</td>
				<td>${listValue.hiredBy}</td>
				<td><a class="btn btn-warning" href="/edit-todo">Edit Todo</a></td>
                        <td><a class="btn btn-warning" href="/delete-todo">Delete Todo</a></td>
			</tr>
		</c:forEach>
	</c:if>
                        
                        
                    </tr>
            </tbody>
        </table>
        <div>
            <a class="btn btn-default" href="/add-todo">Add a Todo</a>
            
        </div>
        <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </div>

<br><br>
</body>
</html>