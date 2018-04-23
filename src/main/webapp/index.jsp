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
          <li><a href="/createChart" target="_blank">Hires Per Recruiter</a></li>
          <li><a href="/roleChart" target="_blank">Hires Per Role </a></li>
          <li><a href="/startDateChart" target="_blank">Start Date</a></li>
          <li><a href="/vacancyChart" target="_blank">Vacancies Per Role</a></li>
          <li><a href="/positionCountChart" target="_blank">Vacancies Per Practice</a></li>
        </ul>
      </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
    </div> <!-- /container -->

<div class="container" align="center">
  <h2>Executive Summary Charts</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="http://localhost:8080/createChart" alt="Hires Per Recruiter" align="middle">
        <div class="carousel-caption">
          <h3>Hires Per Recruiter</h3>
        </div>
      </div>

      <div class="item">
        <img src="http://localhost:8080/roleChart" alt="Hires Per Role" align="middle">
        <div class="carousel-caption">
          <h3>Hires Per Role</h3>
        </div>
      </div>
    
      <div class="item">
        <img src="http://localhost:8080/startDateChart" alt="Start Date" align="middle">
        <div class="carousel-caption">
          <h3>Start Date</h3>
        </div>
      </div>
      
      
      <div class="item">
        <img src="http://localhost:8080/vacancyChart" alt="Vacancy" align="middle">
        <div class="carousel-caption">
          <h3>Vacancies Per Role</h3>
        </div>
      </div>
      
      <div class="item">
        <img src="http://localhost:8080/positionCountChart" alt="Practice" align="middle">
        <div class="carousel-caption">
          <h3>Vacancies Per Practice</h3>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

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
				<td><a href="/editCandidate?candidateid=${listValue.id }"><span class="glyphicon glyphicon-pencil"></span>Edit</a></td>
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