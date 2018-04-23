<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1" import="project.dao.*,java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html">
<html>
<head>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
        rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link href="resources/navbar.css" rel="stylesheet">
<title>Insert title here</title>
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
		String sql = "SELECT FirstName, LastName FROM recruiter WHERE RecruiterID =" + request.getParameter("recruiterid") + ";";
		resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
			
			String fname = resultSet.getString("FirstName");
			String lname = resultSet.getString("LastName");
			%>
			<h2>Candidates Hired by <%=fname + " " + lname %></h2>
			<% 
		}
		
		%>
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
				<td><a href="/edit-todo"><span class="glyphicon glyphicon-pencil"></span>Edit</a></td>
                        <td><a href="/delete-todo"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
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
	<!--<a href="/addCandidate">Add candidate</a>-->
	<div class="container">
	<a href="/recruiter" class="btn btn-info">Back</a>
	</div>
</body>
</html>