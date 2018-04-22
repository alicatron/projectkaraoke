package project.dao;

import java.sql.*;
import java.util.List;

import org.springframework.stereotype.Service;

import java.util.ArrayList;

import project.business.WhiteBoard;
import project.dao.WhiteBoardData;

@Service
public class MySQLWhiteBoard implements WhiteBoardData {

	@Override
	public List<WhiteBoard> getAllWhiteBoard() {
		   List<WhiteBoard> whiteboardFigures = new ArrayList<WhiteBoard>();
		   
		   Connection cn;
		   try{
			   Class.forName("com.mysql.jdbc.Driver");
				cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
	                    "root","c0nygre");
				Statement st = cn.createStatement();
				
				ResultSet rs = st.executeQuery("select candidate.candidateID, candidate.LastName, candidate.FirstName, vacancy.role, candidate.StartDate, recruiter.email as 'hiredBy', candidate.email " + 
						"from candidate left join recruiter on candidate.recruiterID = recruiter.recruiterID " +
						"left join vacancy on candidate.VacancyID = vacancy.VacancyID;");
				System.out.println(rs.toString());
				
				while(rs.next()){
					
					//vacancies.add(new Vacancy(rs.getString(2),rs.getString(3),rs.getInt(4)));
					whiteboardFigures.add(new WhiteBoard(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString("hiredBy"),rs.getString(7),1,1));
				}
		   }catch(SQLException ex){
				whiteboardFigures.add(new WhiteBoard(1,ex.getMessage(),null, null,null,null,null,1,1));
		   } 
		   catch (ClassNotFoundException ex) {
			   whiteboardFigures.add(new WhiteBoard(1,"Driver"+ ex.getMessage(),null, null,null,null,null,1,1));
				
			}
		return whiteboardFigures;
	}

}


