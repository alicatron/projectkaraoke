<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    
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
                    <%
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/karaoke?useSSL=false";
		String userId = "root";
		String password = "c0nygre";
			
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	
		
		connection = DriverManager.getConnection(
		connectionUrl, userId, password);
		statement = connection.createStatement();
		String Param = request.getParameter("vacancyid");
		int VacId = Integer.parseInt(Param);			
		System.out.println("Vacancy id is " + VacId);
		String sql = "SELECT * FROM vacancy WHERE VacancyID = " + VacId + ";";
		resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
					
					String role = resultSet.getString("Role");
					String practice = resultSet.getString("Practice");
					int numPositions = resultSet.getInt("NumOfPositions");
					
					
					%>
<h2>Change Number of <%=role %> Vacancies</h2>
<p>There are currently <%=numPositions + " available " + role + " positions in the " + practice + " team." %></p>
<p>If you would like to change the number of vacancies please enter the update amount in the form below</p>
<%
		}
%>
<c:url var="actionUrl" value="/editVacancy" />
	
	
	 
 
<form:form action="${actionUrl}" modelAttribute="vacancy" method="POST" acceptCharset="UTF-8">

<form:input path="id" type ="hidden" value="<%=VacId %>"/>
<div class="form-group row">
    <form:label path="numOfPositions" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">No. Positions</form:label>
    <div class="col-sm-3">
      <form:input path="numOfPositions" class="form-control form-control-lg" id="colFormLabelLg" placeholder="No. of Positions"/>
    </div>
  </div>
<form:button id="editVacancy" class="btn btn-info">Update</form:button>

</form:form>
</div>
</body>
</html>