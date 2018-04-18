package project.dao;

import project.business.*;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class MySQL implements RecruiterData{  

	@Override
	public List<Recruiter> getAllRecruiters() {
		List<Recruiter> recruiters = new ArrayList<Recruiter>();
		Connection cn;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
                    "root","c0nygre");
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Recruiter");
			while(rs.next()){ 
				recruiters.add(new Recruiter(rs.getString(1), rs.getString(2), rs.getString(3)));
			}
			cn.close();
		}
		catch(SQLException ex){
		recruiters.add(new Recruiter(ex.getMessage(), ex.getMessage(), ex.getMessage()));
		} catch (ClassNotFoundException ex) {
			// TODO Auto-generated catch block
			recruiters.add(new Recruiter(ex.getMessage(), ex.getMessage(), ex.getMessage()));
		}
		return recruiters;
	}


}
