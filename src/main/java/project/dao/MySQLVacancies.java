package project.dao;

import java.sql.*;
import java.util.List;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import project.business.Vacancy;
import project.dao.VacancyData;

@Service
public class MySQLVacancies implements VacancyData {

	@Override
	public List<Vacancy> getAllVacancies() {
			List<Vacancy> vacancies = new ArrayList<Vacancy>();
			Connection cn;
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/karaoke?useSSL=false",
	                    "root","c0nygre");
				Statement st = cn.createStatement();
				ResultSet rs = st.executeQuery("SELECT * FROM vacancy ORDER BY Practice");
				
				while(rs.next()){
					
					vacancies.add(new Vacancy(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
				}
				cn.close();
			}catch(SQLException ex){
				vacancies.add(new Vacancy(0,ex.getMessage(), ex.getMessage(), 1));
			} catch (ClassNotFoundException ex) {
				// TODO Auto-generated catch block
				vacancies.add(new Vacancy(0,"Driver" + ex.getMessage(),null,1));
			}

		return vacancies;
	}

}
