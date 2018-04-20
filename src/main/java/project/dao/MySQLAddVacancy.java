package project.dao;
import java.sql.*;

import javax.validation.Valid;

import project.business.Vacancy;

public class MySQLAddVacancy {
	public static boolean success;
	
	public MySQLAddVacancy(@Valid Vacancy vacancy){
		
	System.out.println("Constructor of query hit" + vacancy.getRole());
			
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
	             st.executeUpdate("INSERT INTO vacancy (Role,Practice, NumOfPositions) " +
	             "VALUES (' "+ vacancy.getRole()+"', '"+ vacancy.getPractice() +"',"+ vacancy.getNumOfPositions()+");");
	
	        }catch( SQLException ex){
	        	 System.out.println("Error executing INSERT, DELETE, or UPDATE statement: " + ex);
	        }
	}

}
