package project.web;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.ChartUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import project.business.*;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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

//	@RequestMapping("/")
//	public String welcome() {
//		return "index";
//	}
	
	@RequestMapping("/")
	public ModelAndView welcome(){
		ModelAndView result = new ModelAndView();
		List<WhiteBoard> whiteboardFigures = WBData.getProducts();
		result.addObject("whiteboardFigures",whiteboardFigures);
		result.setViewName("index");
		return result;
		
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
	
	/*@RequestMapping("/recruiter")
	public String Recruiter() {
		return "recruiter";
	}*/
	
	@RequestMapping("/recruiter")
	public ModelAndView recruiter(){
		ModelAndView result = new ModelAndView();
		List<Recruiter> recruiters = ROData.getRecruiters();
		result.addObject("recruiters",recruiters);
		result.setViewName("recruiter");
		return result;
		
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
}
