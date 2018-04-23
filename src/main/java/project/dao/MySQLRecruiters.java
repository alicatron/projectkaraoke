package project.dao;

import java.sql.*;
import java.util.List;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import project.business.Recruiter;
import project.dao.RecruiterData;

@Service
public class MySQLRecruiters implements RecruiterData{  

	@Override
	public List<Recruiter> getAllRecruiters() {
		List<Recruiter> recruiters = new ArrayList<Recruiter>();
		Connection cn;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
                    "root","c0nygre");
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT RecruiterID, firstName, lastName, email FROM recruiter ORDER BY firstName");
			
			while(rs.next()){ 
				recruiters.add(new Recruiter(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			cn.close();
		}
		catch(SQLException ex){
		recruiters.add(new Recruiter(1,ex.getMessage(), ex.getMessage(), ex.getMessage()));
		} catch (ClassNotFoundException ex) {
			// TODO Auto-generated catch block
			recruiters.add(new Recruiter(1,"Driver" + ex.getMessage(),null, null));
		}
		return recruiters;
	}


}
