package project.business;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import project.business.Candidate;
import project.dao.*;

@Component
public class RecruiterHireOperation {

	private RecruiterHireData data;
	public String id;
		@Autowired
		public RecruiterHireOperation(RecruiterHireData data){
			this.data = data;
		}
		
		public List<Candidate> getProducts(String id){
			return data.getSelectCandidates(id);
		}
}