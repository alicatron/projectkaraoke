package project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.business.*;
import java.util.List;

@Controller
public class ProjectController {

	@RequestMapping("/")
	public String welcome() {
		return "index";
	}
	
	@RequestMapping("/vacancy")
	public String vacancy() {
		return "vacancy";
	}
}
