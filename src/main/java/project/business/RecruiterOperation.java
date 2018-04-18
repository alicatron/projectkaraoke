package project.business;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import project.business.Recruiter;
import project.dao.*;

@Component
public class RecruiterOperation {

	private RecruiterData data;
		
		@Autowired
		public RecruiterOperation(RecruiterData data){
			this.data = data;
		}
		
		public List<Recruiter> getRecruiters(){
			return data.getAllRecruiters();
		}
}