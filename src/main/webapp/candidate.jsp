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
<title>Candidates</title>
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
    
    <div class= "container">
<div style = "float: right;">
<a href="/createChart" target="_blank"><button id="hired" class="btn btn-info"> View Graph <span class="glyphicon glyphicon-stats"></span></button></a>
</div>
</div>

<div class="container">
        <table class="table table-striped table-hover table-bordered">
        
            <thead class="p-3 mb-2 bg-primary text-white">
	<tr>
		<th>First Name</th>
		<th>Surname</th>
		<th>Email</th>
		<th>Start Date</th>
		<th></th>
		<th></th>
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
				<td><a href="/editCandidate?candidateid=${listValue.id }"><span class="glyphicon glyphicon-pencil"></span>Edit</a></td>
                <td><a href="/deleteCandidate?candidateid=${listValue.id}"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
			</tr>
		</c:forEach>
	</c:if>
	</tbody>
	</table>

        <script src="webjars/jquery/1.9.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </div>
	<br>



<div class="container">
	<c:url var="actionUrl" value="/candidate" />
	
	
	 
 
<form:form action="${actionUrl}" modelAttribute="candidate" method="POST" acceptCharset="UTF-8">
       
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
  <div class="form-group row">
    <form:label path="startDate" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Date</form:label>
    <div class="col-sm-3">
      <form:input path="startDate" class="form-control form-control-lg" id="colFormLabelLg" type="date"/>
    </div>
  </div>
  <!--<div class="form-group row">
    <form:label path="recruiterId" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Recruiter</form:label>
    <div class="col-sm-3">
      <form:input path="recruiterId" class="form-control form-control-lg" id="colFormLabelLg" placeholder="Recruiter"/>
    </div>
  </div>
               <div class="form-group row">
    <form:label path="vacancyId" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Vacancy</form:label>
    <div class="col-sm-3">
      <form:input path="vacancyId" class="dropdown-menu" action="${actionUrl}" modelAttribute="vacancy" method="GET" acceptCharset="UTF-8"/>
	<select name="vacancyId">
	<c:forEach var="listValue" items="${vacancies}">
		<option value="${listValue.id}">${listValue.role}</option>
		</c:forEach>
		</select>
    </div>
  </div>-->


 
                <!--<tr>
                 <td><form:label path="recruiterId">Recruiter</form:label>
                <select name="recruiterid">
					<c:forEach var="listValue" items="${recruiters}">
					<option value="${listValue.id}">${listValue.email}</option>
					</c:forEach>
				</select>
=======
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
		
		<div class="form-group row">
    <form:label path="recruiterId" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Recruiter</form:label>
    <div class="col-sm-3">
    
       			<form:select path="recruiterId" class="form-control form-control-lg" id="colFormLabelLg" placeholder="Recruiter">
					<%
						while(resultSet.next()){
							System.out.println("WORKS " + resultSet.getInt(1));
							out.print("<option value=" + resultSet.getInt(1) + ">" + 
							resultSet.getString(2) + "</option>");
						}				
					%>
				</form:select>
			</div>
			</div>
			
			<div class="form-group row">
    <form:label path="vacancyId" for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">Vacancy</form:label>
    <div class="col-sm-3">
                <form:select path="vacancyId" class="form-control form-control-lg" id="colFormLabelLg" placeholder="Vacancy">
					<%
						String sql2 = "SELECT VacancyID, Role From vacancy;";
						resultSet2 = statement.executeQuery(sql2);
						while(resultSet2.next()){
							out.print("<option value=" + resultSet2.getInt(1) + ">" + 
							resultSet2.getString(2) + "</option>");
						}				
					%>
				</form:select>
				</div>
				</div>
				
				

            
    <form:button id="candidate" class="btn btn-info">Add Candidate</form:button>
                <!--<tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>-->
            
    <!--<form:button id="addCandidate">Add Person</form:button>
>>>>>>> branch 'master' of https://github.com/alicatron/projectkaraoke.git
    </form:form>
    </div>


</body>
</html>