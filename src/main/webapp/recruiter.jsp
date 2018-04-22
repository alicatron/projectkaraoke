<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.dao.*,java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
        rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="resources/navbar.css" rel="stylesheet">

<title>Recruiter</title>
</head>



<body>
<div class="container">
 
      <!-- Static navbar -->
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">WhiteBoard</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="/">Home</a></li>
              <li><a href="/vacancy">Vacancies</a></li>
      <li><a href="/candidate">Hired Candidates</a></li>
      <li><a href="recruiter">Recruiters</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="/charts">Charts<span class="glyphicon glyphicon-stats"></span>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="/charts">Charts</a></li>
          <li><a href="/createChart">Hires Per Recruiter</a></li>
          <li><a href="/roleChart">Hires Per Role </a></li>
          <li><a href="/vacancyChart">Vacancies</a></li>
          <li><a href="/startDateChart">Start Date</a></li>
          <li><a href="/positionCountChart">Roles Required Per Practice</a></li>
        </ul>
      </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
    </div> <!-- /container -->

<div class= "container">
<div style = "float: right;">
<c:if test="${not empty recruiters}">
	<c:url var="actionUrl" value="/recruiterStats" />
	<form:form action="${actionUrl}" modelAttribute="recruiter" method="GET" acceptCharset="UTF-8">
	<select name="recruiterid">
		<c:forEach var="listValue" items="${recruiters}">
		<option value="${listValue.id}">${listValue.email}</option>
		</c:forEach>
		</select>
		<form:button id="vacancy" class="btn btn-info"> View Stats <span class="glyphicon glyphicon-stats"></span></form:button>
	</form:form>
		</c:if>
		</div>
	<br>
</div>	
	
<div class="container">
        <table class="table table-striped table-hover table-bordered">
            <thead class="p-3 mb-2 bg-primary text-white">
	<tr>
		<th>First Name</th>
		<th>Surname</th>
		<th>Email</th>
		<th></th>
		<!--<th></th>-->
	</tr>
	</thead>
	<tbody>
	<c:if test="${not empty recruiters}">
		<c:forEach var="listValue" items="${recruiters}">
			<tr>
				<td>${listValue.firstName}</td>
				<td>${listValue.lastName}</td>
				<td>${listValue.email}</td>
				<td><a href="/edit-todo"><span class="glyphicon glyphicon-pencil"></span>Edit</a></td>
                        <!--<td><a href="/delete-todo"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>-->
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	</table>
	<div>
            
        </div>
        <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </div>
	

	<br>
	<div class="container">
	<c:url var="actionUrl" value="/recruiter" />

<form:form action="${actionUrl}" modelAttribute="recruiter" method="POST" acceptCharset="UTF-8">
  <div class="form-group row">
    <form:label path="firstName" for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">First Name</form:label>
    <div class="col-sm-3">
      <form:input path="firstName" class="form-control form-control-sm" id="colFormLabelSm" placeholder="First Name"/>
    </div>
  </div>
  <div class="form-group row">
    <form:label path="lastName" for="colFormLabel" class="col-sm-2 col-form-label">Surname</form:label>
    <div class="col-sm-3">
      <form:input path="lastName" class="form-control" id="colFormLabel" placeholder="Surname"/>
    </div>
  </div>
  <div class="form-group row">
    <form:label path="email" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Email</form:label>
    <div class="col-sm-3">
      <form:input path="email" class="form-control form-control-lg" id="colFormLabelLg" placeholder="email@email.com"/>
    </div>
  </div>
  <form:button id="recruiter" class="btn btn-info">Add Recruiter</form:button>

</form:form>


</body>
</html>