package com.filip.founder.controllers;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.filip.founder.entities.Project;
import com.filip.founder.entities.Uzytkownik;
import com.filip.founder.servicies.ProjectService;
import com.filip.founder.servicies.UzytkownikService;

//@SessionAttributes({"project"})
@Controller
public class ProjectsController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@ModelAttribute("project")
	public Project getProject() {
		return new Project();
	}

	@Autowired
	UzytkownikService users;

	@Autowired
	ProjectService projects;

	@RequestMapping(value = "/projects", method = RequestMethod.GET)
	public String projects(Locale locale, Model model) {
		model.addAttribute("projects", projects.getAllProjects());
		return "projects";
	}

	@RequestMapping(value = "/projects/add", method = RequestMethod.GET)
	public String add_project(Locale locale, Model model) {
		// model.addAttribute("projects",projects.getAllProjects());
		return "add_project";
	}

	@RequestMapping(value = "/projects/save", method = RequestMethod.POST)
	public String save_project(Model model, @ModelAttribute("project") Project project) {
		// model.addAttribute("projects",projects.getAllProjects());
		Uzytkownik u = getUzytkownikFromSession();
		project.setCreator(u);
		projects.save(project);
		return "redirect:/projects";
	}

	private Uzytkownik getUzytkownikFromSession() {
		Uzytkownik k = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			k = users.findUzytkownikByLogin(((UserDetails) principal).getUsername());
			System.out.println(((UserDetails) principal).getAuthorities());
		}

		return k;
	}

}
