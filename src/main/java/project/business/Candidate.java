package project.business;

import java.sql.Date;

public class Candidate {
	
	private int id;
	private String FirstName;
	private String LastName;
	private String Email;
	private Date StartDate;
	private int RecruiterId;
	private int VacancyId;
	
	public int getRecruiterId() {
		return RecruiterId;
	}
	public void setRecruiterId(int recruiterId) {
		RecruiterId = recruiterId;
	}
	public int getVacancyId() {
		return VacancyId;
	}
	public void setVacancyId(int vacancyId) {
		VacancyId = vacancyId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public Date getStartDate() {
		return StartDate;
	}
	public void setStartDate(Date startDate) {
		StartDate = startDate;
	}
	public Candidate(String firstName, String lastName, String email, Date startDate, int recruiterId, int vacacnyId) {
		super();
		FirstName = firstName;
		LastName = lastName;
		Email = email;
		StartDate = startDate;
		RecruiterId = recruiterId;
		VacancyId = vacacnyId;
	}
	//default constructor
	public Candidate(){
		
	}
	
	

}
