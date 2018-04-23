package project.dao;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.validation.Valid;

import project.business.Candidate;
public class MySQLUpdateCandidate {
	public static boolean success;
	
	public MySQLUpdateCandidate(@Valid Candidate candidate){
		
		String jdbcDriver = "com.mysql.jdbc.Driver";
        String databaseUri = "jdbc:mysql://localhost:3306/karaoke?autoReconnect=true&useSSL=false";


        // Load JDBC driver.
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
        ResultSet rs = null;
 
        try {
        	System.out.println("Update Query Has Been hit");
            st = cn.createStatement();
            
            // Execute some INSERT statements
            st.executeUpdate("UPDATE candidate SET FirstName = '" + candidate.getFirstName() +"', LastName = '" + candidate.getLastName() +
            		"', Email = '" + candidate.getEmail() + "', StartDate = '" + candidate.getStartDate() + "', VacancyID = " + candidate.getVacancyId() +
            		", RecruiterID = " + candidate.getRecruiterId() + " WHERE CandidateID = " + candidate.getId() + ";");
            
            success = true;

        } catch (SQLException e) {
            System.out.println("Error executing INSERT, DELETE, or UPDATE statement: " + e);
        }
		
	}

}
