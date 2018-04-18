package project.dao;

import java.sql.*;
import java.util.List;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import project.business.Candidate;
import project.business.Vacancy;
import project.dao.CandidateData;

@Service
public class MySQLCandidates implements CandidateData {

	@Override
	public List<Candidate> getAllCandidates() {
		List<Candidate> candidates = new ArrayList<Candidate>();
		Connection cn;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
                    "root","c0nygre");
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Candidate");
			
			while(rs.next()){
				
				candidates.add(new Candidate(rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(7)));
			}
			cn.close();
		}catch(SQLException ex){
			candidates.add(new Candidate(ex.getMessage(),ex.getMessage(), ex.getMessage(),null));
		} catch (ClassNotFoundException ex) {
			// TODO Auto-generated catch block
			candidates.add(new Candidate("Driver" + ex.getMessage(),null,null, null));
		}

	return candidates;

	}

}
