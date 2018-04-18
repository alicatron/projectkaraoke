package project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import project.business.*;
import java.util.List;

@Controller
public class ProjectController {
	@Autowired
	VacancyOperation VOData;
	
	@Autowired
	CandidateOperation COData;

	@RequestMapping("/")
	public String welcome() {
		return "index";
	}
	
	//@RequestMapping("/vacancy")
//	public String vacancy() {
//		return "vacancy";
//	}
	@RequestMapping("/vacancy")
	public ModelAndView vacancy(){
		ModelAndView result = new ModelAndView();
		List<Vacancy> vacancies = VOData.getProducts();
		result.addObject("vacancies",vacancies);
		result.setViewName("vacancy");
		return result;
		
	}
	
	@RequestMapping("/recruiter")
	public String Recruiter() {
		return "recruiter";
	}
	
//	@RequestMapping("/candidate")
//	public String Candidate() {
//		return "candidate";
//	}
	@RequestMapping("/candidate")
	public ModelAndView candidate(){
		ModelAndView result = new ModelAndView();
		List<Candidate> candidates = COData.getProducts();
		result.addObject("candidates",candidates);
		result.setViewName("candidate");
		return result;
		
	}
	
	
	
}
