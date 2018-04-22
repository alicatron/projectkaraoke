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
         <link href="resources/navbar.css" rel="stylesheet">
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
        </ul>
      </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
    </div> <!-- /container -->

<div class="container" align="center">
<img src="http://localhost:8080/createChart" alt="Chart" style="width:640px;height:420px;">
</div>
<br><br><br>

<div class="container">
        <table class="table table-striped table-hover table-bordered">
        
            <thead class="p-3 mb-2 bg-primary text-white">
                <tr>
                    <th>First Name</th>
                    <th>Surname</th>
                    <th>Role</th>
                    <th>Start Date</th>
                    <th>Hired By</th>
                    <th></th>
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
				<td><a href="/edit-todo"><span class="glyphicon glyphicon-pencil"></span>Edit</a></td>
                        <td><a href="/deleteCandidate?candidateid=${listValue.id}"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
			</tr>
		</c:forEach>
	</c:if>
                        
                        
                    </tr>
            </tbody>
        </table>
        
        <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </div>
    

<br><br>
</body>
</html>