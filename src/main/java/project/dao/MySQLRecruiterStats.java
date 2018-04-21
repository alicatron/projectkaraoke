package project.dao;
import java.sql.*;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import project.business.Recruiter;
import project.dao.RecruiterData;

public class MySQLRecruiterStats {
	public static int count;
	
	public int nid;
	public MySQLRecruiterStats(int nid2) {
		RecruiterCount(nid2);
	}
	public static int RecruiterCount(int nid) {
		Connection cn;
		try{
		Class.forName("com.mysql.jdbc.Driver");
		cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
                "root","c0nygre");
		Statement st = cn.createStatement();
		//ResultSet rs = st.executeQuery("SELECT RecruiterID, firstName, lastName, email FROM recruiter WHERE RecruiterID = ");
		ResultSet rs = st.executeQuery("select count(*) as 'number' from " +
			"(select candidate.LastName, candidate.FirstName, vacancy.role, recruiter.email as 'Hired by' from candidate "+
			"left join recruiter on candidate.recruiterID = recruiter.recruiterID "+
			"left join vacancy on candidate.VacancyID = vacancy.VacancyID "+
			"where recruiter.RecruiterID =" + nid  +" ) src;");
		if(rs.next()){
    		count = ((Number) rs.getObject(1)).intValue();
    		System.out.println("Hire count = " + count);
		cn.close();
		
		}	
	}
	catch(SQLException ex){
		System.out.println(ex);
	} catch (ClassNotFoundException ex) {
		System.out.println(ex);
	}
		return count;

	}
	
	
	}





