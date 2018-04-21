package project.business;

public class Vacancy {

	private int id;
	private String Role;
	private String Practice;
	private int NumOfPositions;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getPractice() {
		return Practice;
	}
	public void setPractice(String practice) {
		Practice = practice;
	}
	public int getNumOfPositions() {
		return NumOfPositions;
	}
	public void setNumOfPositions(int numOfPositions) {
		NumOfPositions = numOfPositions;
	}
	public Vacancy(String role, String practice, int numOfPositions) {
		super();
		Role = role;
		Practice = practice;
		NumOfPositions = numOfPositions;
	}
	
	public Vacancy(){
			
		}
	
	
	
}
