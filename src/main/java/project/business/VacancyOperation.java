package project.business;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import project.business.Vacancy;
import project.dao.*;

@Component
public class VacancyOperation {
	
	private VacancyData data;
	
	@Autowired
	public VacancyOperation(VacancyData data){
		this.data = data;
	}
	
	public List<Vacancy> getProducts(){
		return data.getAllVacancies();
	}

}
