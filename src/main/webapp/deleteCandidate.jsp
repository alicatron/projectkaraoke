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
      <li><a href="/charts">Charts</a></li>
      </ul>
      <ul class="dropdown-menu">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
    </div> <!-- /container -->
    <div class="container">
<h2>Delete</h2>
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
		String Param = request.getParameter("candidateid");
		int CanId = Integer.parseInt(Param);			
		System.out.println("Candidate id is " + CanId);
		String sql = "SELECT FirstName, LastName FROM candidate WHERE CandidateID = " + request.getParameter("candidateid") + ";";
		resultSet = statement.executeQuery(sql);
		
		while (resultSet.next()) {
					
					String fname = resultSet.getString("FirstName");
					String lname = resultSet.getString("LastName");
					
					
					%>
<p>Are you sure you would like to delete <%=fname + " " + lname %>?</p>
<%
		}
%>
<c:url var="actionUrl" value="/deleteCandidate" />
	
	
	 
 
<form:form action="${actionUrl}" modelAttribute="candidate" method="POST" acceptCharset="UTF-8">

<form:input path="id" type ="hidden" value="<%=CanId %>"/>
<form:button id="deleteCandidate" class="btn btn-info">Yes</form:button>
<a href="/" class="btn btn-info">No</a>

</form:form>
</div>
</body>
</html>