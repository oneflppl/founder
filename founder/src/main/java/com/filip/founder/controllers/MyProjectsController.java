package com.filip.founder.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.filip.founder.entities.Image;
import com.filip.founder.entities.Project;
import com.filip.founder.entities.Uzytkownik;
import com.filip.founder.entities.Video;
import com.filip.founder.servicies.DailyService;
import com.filip.founder.servicies.DonationService;
import com.filip.founder.servicies.ImageService;
import com.filip.founder.servicies.ProjectService;
import com.filip.founder.servicies.UzytkownikService;
import com.filip.founder.servicies.VideoService;
@Controller
public class MyProjectsController {

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
	
	@ModelAttribute("video")
	public  Video getVideo(){
		return new  Video();
	}
	
	@RequestMapping(value ="/myprojects", method= RequestMethod.GET)
	public String myprojects(Model model)
	{
		Uzytkownik u = getUzytkownikFromSession();
		
		model.addAttribute("myprojects",projects.findByCreator(u));
		return "myprojects";
	}
	
	@RequestMapping(value="/myprojects/{pid}",method=RequestMethod.GET)	
	public String myproject(@PathVariable("pid") Long pid, Model model){
		Project p = projects.findById(pid);	
		Project edits = new Project();	
		p.setDonations(donations.findByProject(p));
		p.setImages(images.findByProject(p));
		p.setVideos(videos.findByProject(p));
		p.setDailys(dailys.findByProject(p));
		model.addAttribute("myproject",p);	
	
		return "myproject";
	}
	
	

	@RequestMapping(value="/myprojects/edit",method=RequestMethod.POST)
	public String edit_myproject(@ModelAttribute("myproject") Project myproject) {	
		
		Project p = projects.findById(myproject.getId());	
		p.setAmount(myproject.getAmount());
		p.setEndDate(myproject.getEndDate());
		p.setLabel(myproject.getLabel());
		p.setDsc(myproject.getDsc());		
		projects.save(p);	
		
		return "redirect:/myprojects/" + p.getId().toString();
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
	

	@RequestMapping(value = "/myprojects/{pid}/upload/video", method = RequestMethod.POST)
	public String save_video(Model model,@ModelAttribute("video")Video video,@PathVariable("pid") Long pid) {
		//model.addAttribute("projects",projects.getAllProjects());		
		Project p = projects.findById(pid);
		StringBuilder yt = new StringBuilder("http://www.youtube.com/embed/");
		
		yt.append(video.getPath());
		video.setPath(yt.toString());
		video.setProject(p);
		
		videos.save(video);
				
		return "redirect:/myprojects/" + p.getId().toString();
	}
	
	@RequestMapping(value = "/myprojects/delete/video/{vid}", method = RequestMethod.GET)
	public String deleteVideo(HttpSession session,@PathVariable("vid") Long vid) {
		
		
		Video video = videos.findOne(vid);
		videos.delete(video);
				
		return "redirect:/myprojects/" + video.getProject().getId().toString();
	}
	
	@RequestMapping(value = "/myprojects/delete/photo/{pid}", method = RequestMethod.GET)
	public String deletePhoto(HttpSession session,@PathVariable("pid") Long pid) {

		Image img = images.findOne(pid);
		String contextPath = session.getServletContext().getRealPath("/");
		String filePath = contextPath + "resources" + File.separator + "img" + File.separator + img.getId().toString()
				+ img.getPath();

		System.out.println(filePath);
		File toDel = new File(filePath);
		if (toDel.exists()) {
			toDel.delete();
			}

		images.delete(img);
		return "redirect:/myprojects/" + img.getProject().getId();
	}
	
	@RequestMapping(value = "/myprojects/{pid}/upload/photo", method = RequestMethod.POST)
	public String uploadPhoto(@RequestParam("file") MultipartFile file,HttpSession session,@PathVariable("pid") Long pid) {
	
		Project myproject = projects.findById(pid);
		if (!file.isEmpty()) {
			try {				
				String fname = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'), file.getOriginalFilename().length());
				Image img = new Image();
				img.setPath(fname);
				img.setProject(myproject);
				images.save(img);
				String contextPath = session.getServletContext().getRealPath("/");
				String filePath = contextPath + "resources"  + File.separator + "img"  + File.separator + img.getId().toString() + fname;
				System.out.println(filePath);			
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(filePath)));				
                FileCopyUtils.copy(file.getInputStream(), stream);
				stream.close();			
			}
			catch (Exception e) {
			e.printStackTrace();
			}
		}
		
		return "redirect:/myprojects/" + myproject.getId().toString();
	}
}
