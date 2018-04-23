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
 <link href="resources/navbar.css" rel="stylesheet">
<title>Vacancy</title>
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
              <li class="hover"><a href="/vacancy">Vacancies</a></li>
      <li><a href="/candidate">Hired Candidates</a></li>
      <li><a href="recruiter">Recruiters</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="/charts">Charts<span class="glyphicon glyphicon-stats"></span>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/createChart">Hires Per Recruiter</a></li>
          <li><a href="/roleChart">Hires Per Role </a></li>
          <li><a href="/startDateChart">Start Date</a></li>
          <li><a href="/vacancyChart">Vacancies Per Role</a></li>
          <li><a href="/positionCountChart">Vacancies Per Practice</a></li>
        </ul>
      </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
    </div> <!-- /container -->

<div class= "container">
<div style = "float: right;">
<a href="/vacancyChart"><button id="vacancy" class="btn btn-info"> View Graph <span class="glyphicon glyphicon-stats"></span></button></a>
</div>
</div>

	<div class="container">
	
        <table class="table table-striped table-hover table-bordered">
        
            <thead class="p-3 mb-2 bg-primary text-white">
           
	<tr>
		<th>Role</th>
		<th>Practice</th>
		<th>Number of Positions</th>
		<th></th>
		<!--<th></th>-->
	</tr>
	</thead>
	<tbody>
	<c:if test="${not empty vacancies}">
		<c:forEach var="listValue" items="${vacancies}">
			<tr>
				<td>${listValue.role}</td>
				<td>${listValue.practice}</td>
				<td>${listValue.numOfPositions}</td>
				<td><a href="/edit-todo"><span class="glyphicon glyphicon-pencil"></span>Edit</a></td>
                        <!--<td><a href="/delete-todo"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>-->
                     
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	
	</table>
	</span>
        <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </div>
	<br>
<div class="container">
	<c:url var="actionUrl" value="/vacancy" />

<form:form action="${actionUrl}" modelAttribute="vacancy" method="POST" acceptCharset="UTF-8">
  <div class="form-group row">
    <form:label path="role" for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">Role</form:label>
    <div class="col-sm-3">
    
      <form:input path="role" class="form-control form-control-sm" id="colFormLabelSm" placeholder="Role"/>
    </div>
  </div>
  <div class="form-group row">
    <form:label path="practice" for="colFormLabel" class="col-sm-2 col-form-label">Practice</form:label>
    <div class="col-sm-3">
      <form:input path="practice" class="form-control" id="colFormLabel" placeholder="Practice"/>
    </div>
  </div>
  <div class="form-group row">
    <form:label path="numOfPositions" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">No. Positions</form:label>
    <div class="col-sm-3">
      <form:input path="numOfPositions" class="form-control form-control-lg" id="colFormLabelLg" placeholder="No. of Positions"/>
    </div>
  </div>
  <form:button id="vacancy" class="btn btn-info">Add New Vacancy</form:button>

</form:form>
</div>
</body>
</html>