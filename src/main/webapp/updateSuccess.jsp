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
 <title>Delete Candidate</title>
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
        <a class="dropdown-toggle" data-toggle="dropdown" href="/charts">Charts
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
    <div class="container">
<h2>Your update has been successfully applied</h2>

<div class="container">
	<a href="/" class="btn btn-info">Home<span class="glyphicon glyphicon-home"></span></a>
	</div>
</div>
</body>
</html>