package project.dao;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.validation.Valid;

import project.business.Candidate;
public class MySQLAddCandidate {
	public static boolean success;
	
	public MySQLAddCandidate(@Valid Candidate candidate) {
		System.out.println("Constructor of query hit" + candidate.getEmail() +" RECID"+ candidate.getRecruiterId()+ " VACID " + candidate.getVacancyId());
		
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
        int nov;
 
        try {
        	System.out.println("Query Hit" + candidate.getLastName()+ "Date" + candidate.getStartDate());
            st = cn.createStatement();
            
            // Execute some INSERT statements
            st.executeUpdate("INSERT INTO candidate (LastName,FirstName, Email, RecruiterID, VacancyID, StartDate) " +
            "VALUES (' "+ candidate.getLastName()+"', '"+ candidate.getFirstName()+"','" + candidate.getEmail() +"',"+
            		candidate.getRecruiterId() + ", "+ candidate.getVacancyId()+",'"+ candidate.getStartDate()+"');");
            
            success = true;

        } catch (SQLException e) {
            System.out.println("Error executing INSERT, DELETE, or UPDATE statement: " + e);
        }
        try{
        	rs = st.executeQuery("SELECT NumOfPositions FROM vacancy WHERE VacancyID = " + candidate.getVacancyId() +";");
        	if(rs.next()){
        		nov = ((Number) rs.getObject(1)).intValue();
            System.out.println("positions count " + nov);
            nov = nov - 1;
            System.out.println("new position count " + nov);
        	
            st.executeUpdate("UPDATE vacancy SET NumOfPositions = " + nov + " WHERE VacancyID = " +candidate.getVacancyId()+";");
        	}
        }catch(SQLException e){
        	 System.out.println("Error executing INSERT, DELETE, or UPDATE statement: " + e);
        }
       
	}

	public static boolean main(Candidate candidate){
		 // Set up a default JDBC driver and database name.
        success = true;
        return success;
        
	}
}
