package project.dao;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import project.business.Candidate;
import project.dao.CandidateData;

@Service
public class MySQLRecruiterHires implements RecruiterHireData {

	@Override
	public List<Candidate> getSelectCandidates(String id) {
		String recruiterid = id;
		System.out.println("rec id" + recruiterid);
		List<Candidate> candidates = new ArrayList<Candidate>();
		Connection cn;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
                    "root","c0nygre");
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM Candidate WHERE RecruiterID ="+ id +" ORDER BY FirstName;");
			System.out.println("ID is " + id);
			while(rs.next()){
				
				candidates.add(new Candidate(rs.getInt(1),rs.getString(3),rs.getString(2),rs.getString(4),rs.getDate(7),rs.getInt(5),rs.getInt(6)));
			}
			cn.close();
		}catch(SQLException ex){
			candidates.add(new Candidate(1,ex.getMessage(),ex.getMessage(), ex.getMessage(),null,1,1));
		} catch (ClassNotFoundException ex) {
			// TODO Auto-generated catch block
			candidates.add(new Candidate(1,"Driver" + ex.getMessage(),null,null, null,1,1));
		}

	return candidates;

	}
	}

