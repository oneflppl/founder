package com.filip.founder.controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.filip.founder.entities.Donation;
import com.filip.founder.entities.Project;
import com.filip.founder.entities.Uzytkownik;
import com.filip.founder.servicies.DailyService;
import com.filip.founder.servicies.DonationService;
import com.filip.founder.servicies.ImageService;
import com.filip.founder.servicies.ProjectService;
import com.filip.founder.servicies.UzytkownikService;
import com.filip.founder.servicies.VideoService;

@Controller
public class ProjectController {

	
	@Autowired
	UzytkownikService users;
	
	@Autowired
	ProjectService projects;
	
	@Autowired
	DonationService donations;
	
	@Autowired
	ImageService images;
	
	@Autowired
	VideoService videos;
	
	@Autowired
	DailyService dailys;
	
	@ModelAttribute("donation")
	public  Donation getDonation(){
		return new  Donation();
	}
	
	@RequestMapping(value="/projects/{uid}",method=RequestMethod.GET)	
	public String project(@PathVariable("uid") Long uid, Model model){
		Project p = projects.findById(uid);	
		p.setDonations(donations.findByProject(p));
		p.setImages(images.findByProject(p));
		p.setVideos(videos.findByProject(p));
		p.setDailys(dailys.findByProject(p));	
		model.addAttribute("project",p);	
		
		return "project";
	}
	
	@RequestMapping(value = "/projects/{uid}/donate", method = RequestMethod.POST)
	public String donate_project(Model model,@PathVariable("uid") Long uid, @ModelAttribute("donation") Donation donation) {
		//model.addAttribute("projects",projects.getAllProjects());		
		if(donation.getAmount() > 0)
		{
			Uzytkownik u = getUzytkownikFromSession();
			Project p = projects.findById(uid);	
			donation.setProject(p);
			if(u!=null){
				donation.setDonator(u);
			}
			p.setCollected(p.getCollected()+donation.getAmount());
			donations.save(donation);
			projects.save(p);
		}
		
		return "redirect:/projects/{uid}";
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
