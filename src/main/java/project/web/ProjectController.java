package project.web;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.ChartUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import project.business.*;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import project.dao.MySQLAddCandidate;
import project.dao.MySQLAddVacancy;
import project.dao.MySQLAddRecruiter;
import project.dao.MySQLRecruiterStats;
import project.dao.MySQLRecruiterHires;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.validation.Valid;


@Controller
public class ProjectController {
	@Autowired
	VacancyOperation VOData;
	
	@Autowired
	CandidateOperation COData;
	
	@Autowired
	RecruiterOperation ROData;
	
	@Autowired
	WhiteBoardOperation WBData;
	
	@Autowired
	RecruiterHireOperation RHData;
	
	

	
	@RequestMapping("/")
	public ModelAndView welcome(){
		ModelAndView result = new ModelAndView();
		List<WhiteBoard> whiteboardFigures = WBData.getProducts();
		result.addObject("whiteboardFigures",whiteboardFigures);
		result.setViewName("index");
		return result;
		
	}
	

	@RequestMapping(value ="/vacancy",  method = RequestMethod.GET)
	public ModelAndView vacancy(){
		ModelAndView result = new ModelAndView();
		List<Vacancy> vacancies = VOData.getProducts();
		result.addObject("vacancies",vacancies);
		 result.addObject("vacancy", new Vacancy());
		result.setViewName("vacancy");
		return result;
		
	}
	@RequestMapping(value ="/vacancy",  method = RequestMethod.POST)
	public ModelAndView addVacancy(@Valid @ModelAttribute("vacancy") Vacancy vacancy, BindingResult bindingResult){
		if (bindingResult.hasErrors()){
         return vacancy();
         }
		 MySQLAddVacancy AddVacancy = new MySQLAddVacancy(vacancy);
		 return vacancy();
	}
	@RequestMapping(value = "/recruiterStats", method = RequestMethod.GET)
	//modelAndView
	public ModelAndView recruiterStats(@RequestParam(name="recruiterid") String recruiterid){
		ModelAndView result = new ModelAndView();
		String id = recruiterid;
		int nid = Integer.parseInt(id);
//		System.out.println("THE ID IS BEING PASSED" + nid);
		MySQLRecruiterStats stats = new MySQLRecruiterStats(nid);
		System.out.println(stats);
		List<Candidate> candidates = RHData.getProducts(id);
		result.addObject("candidates",candidates);
		result.setViewName("recruiterStats");
		return result;
	}
	


	@RequestMapping(value = "/recruiter", method = RequestMethod.GET)
	public ModelAndView recruiter(){
		ModelAndView result = new ModelAndView();
		List<Recruiter> recruiters = ROData.getRecruiters();
		result.addObject("recruiters",recruiters);
		result.addObject("recruiter", new Recruiter());
		result.setViewName("recruiter");
		return result;
		
	}
	@RequestMapping(value= "/recruiter", method = RequestMethod.POST)
	public ModelAndView addRecuiter(@Valid @ModelAttribute("recruiter") Recruiter recruiter, BindingResult bindingResult){
		if(bindingResult.hasErrors()){
			return recruiter();
		}
		MySQLAddRecruiter AddRecruiter = new MySQLAddRecruiter(recruiter);
		return recruiter();
		
	}
	
	@RequestMapping("/candidate")
	public ModelAndView candidate(){
		ModelAndView result = new ModelAndView();
		List<Candidate> candidates = COData.getProducts();
		result.addObject("candidates",candidates);
		result.setViewName("candidate");
		return result;
		
	}
	
	@RequestMapping("/createChart")
	public void createChart(HttpServletResponse response) {
		response.setContentType("image/jpeg");
		try{
			OutputStream out = response.getOutputStream();
			ChartUtilities.writeChartAsJPEG(out, CreateChart.createPieChart(), 640, 480);
		}
		catch(IOException e){
			System.out.println(e.getMessage());
		}
	}
	 @RequestMapping(value = "/addCandidate", method = RequestMethod.GET)
	    public ModelAndView add() {
	     ModelAndView result = new ModelAndView();
		 result.addObject("candidate", new Candidate());
		 result.setViewName("addCandidate");
	     return result;
	    }

	    @RequestMapping(value = "/addCandidate", method = RequestMethod.POST)
	    public ModelAndView processAdd(@Valid @ModelAttribute("candidate") Candidate candidate, BindingResult bindingResult) {
	        if (bindingResult.hasErrors()) {
	            return add();
	        }
	        //System.out.println("CANDIDATE " + candidate.getLastName());
	        MySQLAddCandidate AddCandidate = new MySQLAddCandidate(candidate);
	        //System.out.println(AddCandidate.toString());
	        
	        return candidate();
	    }
	
	
}
