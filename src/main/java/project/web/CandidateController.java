package project.web;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.business.Candidate;

@Controller
public class CandidateController {
	
//	 @RequestMapping(value = "/addCandidate", method = RequestMethod.GET)
//	    public String add(Model model) {
//	        model.addAttribute("Candidate", new Candidate(null, null, null, null));
//	        return "add-Candidate";
//	    }
//
//	    @RequestMapping(value = "/addCandidate", method = RequestMethod.POST)
//	    public String processAdd(@Valid @ModelAttribute("Candidate") Candidate Candidate, BindingResult bindingResult) {
//	        if (bindingResult.hasErrors()) {
//	            return "add-Candidate";
//	        }
//
//	        return "Candidate-added-successfully";
//	    }
}
