package project.business;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import project.business.Candidate;
import project.dao.*;

@Component
public class CandidateOperation {

	private CandidateData data;
		
		@Autowired
		public CandidateOperation(CandidateData data){
			this.data = data;
		}
		
		public List<Candidate> getProducts(){
			return data.getAllCandidates();
		}
}
