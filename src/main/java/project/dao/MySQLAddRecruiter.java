package project.dao;
import java.sql.*;

import javax.validation.Valid;
import project.business.Recruiter;

public class MySQLAddRecruiter {
	
	public MySQLAddRecruiter(@Valid Recruiter recruiter){
		
		System.out.println("Constructor of query hit" + recruiter.getEmail());
		
		String jdbcDriver = "com.mysql.jdbc.Driver";
        String databaseUri = "jdbc:mysql://localhost:3306/karaoke?autoReconnect=true&useSSL=false";
        
        try {
            Class.forName(jdbcDriver);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading JDBC driver: " + e);
        }

        // Connect to a database.
        Connection cn = null;
        try {
            cn = DriverManager.getConnection(databaseUri,"root","c0nygre");
        } catch (SQLException e) {
            System.out.println("Error connecting to a database: " + e);
        }

        // Execute some INSERT, DELETE, and UPDATE statements.
        Statement st = null;
        
        try{
        	 st = cn.createStatement();
             
             // Execute some INSERT statements
             st.executeUpdate("INSERT INTO recruiter (LastName,FirstName, Email) " +
             "VALUES (' "+ recruiter.getLastName()+"', '"+ recruiter.getFirstName() +"', '"+ recruiter.getEmail()+"');");

        }catch( SQLException ex){
        	 System.out.println("Error executing INSERT, DELETE, or UPDATE statement: " + ex);
        }
	}

}
