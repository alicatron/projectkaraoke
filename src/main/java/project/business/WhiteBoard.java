package project.business;
import java.sql.Date;

import project.business.Candidate;

public class WhiteBoard extends Candidate {
	public String hiredBy;
	public String role;
	
	public WhiteBoard(int id,String firstName, String lastName, String role, Date startDate, String hiredBy, String email, int recruiterId, int vacancyId) {
		super(id, firstName, lastName, email, startDate, recruiterId, vacancyId);
		this.hiredBy = hiredBy;
		this.role = role;
		
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getHiredBy() {
		return hiredBy;
	}

	public void setHiredBy(String hiredBy) {
		this.hiredBy = hiredBy;
	}

}
