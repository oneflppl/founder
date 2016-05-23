package com.filip.founder.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.filip.founder.entities.Daily;
import com.filip.founder.entities.Image;
import com.filip.founder.entities.Project;
import com.filip.founder.entities.Video;
import com.filip.founder.servicies.DailyService;
import com.filip.founder.servicies.DonationService;
import com.filip.founder.servicies.ImageService;
import com.filip.founder.servicies.ProjectService;
import com.filip.founder.servicies.UzytkownikService;
import com.filip.founder.servicies.VideoService;
@Controller
public class DailyController {

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
	
	@RequestMapping(value="/daily/{did}",method=RequestMethod.GET)	
	public String daily(@PathVariable("did") Long did, Model model){
		
		Daily d = dailys.findOne(did);
		d.setImages(images.findByDaily(d));
		d.setVideos(videos.findByDaily(d));
		model.addAttribute("daily",d);			
		return "daily";
	}	
	
	@RequestMapping(value = "/myprojects/{pid}/dailys/add", method = RequestMethod.GET)
	public String add_daily(Model model,@PathVariable("pid") Long pid) {
		
		Project p = projects.findById(pid);
		Daily d = new Daily();
		d.setProject(p);		
		model.addAttribute("mydaily",d);		
		return "add_daily";
	}
	
	
	@RequestMapping(value = "/myprojects/{pid}/dailys/save", method = RequestMethod.POST)
	public String save_daily(Model model,@PathVariable("pid") Long pid, @ModelAttribute("mydaily") Daily daily) {
		Project p = projects.findById(pid);	
		daily.setCreatedDate(new Date());
		daily.setProject(p);		
		dailys.save(daily);		
		return "redirect:/myprojects/" + p.getId();
		
	}
	
	@RequestMapping(value = "/myprojects/dailys/{did}/edit", method = RequestMethod.GET)
	public String add_media(Model model,@PathVariable("did") Long did, @ModelAttribute("mydaily") Daily daily) {	
		Daily d = dailys.findOne(did);
		d.setImages(images.findByDaily(d));
		d.setVideos(videos.findByDaily(d));
		model.addAttribute("mydaily",d);
		model.addAttribute("myvideo",new Video());
		return "add_media";
	}
	
	
	@RequestMapping(value = "/myprojects/dailys/{did}/upload/photo", method = RequestMethod.POST)
	public String save_PhotoDaily(@RequestParam("file") MultipartFile file,HttpSession session,@PathVariable("did") Long did) {
	
		Daily d = dailys.findOne(did);
		if (!file.isEmpty()) {
			try {

				String fname = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'),
						file.getOriginalFilename().length());
				Image img = new Image();
				img.setPath(fname);
				img.setDaily(d);
				images.save(img);

				String contextPath = session.getServletContext().getRealPath("/");
				String filePath = contextPath + "resources" + File.separator + "img" + File.separator
						+ img.getId().toString() + fname;
				System.out.println(filePath);

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(filePath)));

				FileCopyUtils.copy(file.getInputStream(), stream);
				stream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/myprojects/dailys/" + d.getId().toString() + "/edit";
	}
	

	
	@RequestMapping(value = "/myprojects/dailys/delete/photo/{pid}", method = RequestMethod.GET)
	public String deletePhotoDaily(HttpSession session,@PathVariable("pid") Long pid) {

		Image img = images.findOne(pid);
		System.out.println(img.getPath());

		String contextPath = session.getServletContext().getRealPath("/");
		String filePath = contextPath + "resources" + File.separator + "img" + File.separator + img.getId().toString()
				+ img.getPath();

		System.out.println(filePath);
		File toDel = new File(filePath);
		toDel.delete();

		Long did = img.getDaily().getId();
		img.setDaily(null);
		images.delete(img);

		return "redirect:/myprojects/dailys/"+ did.toString() +"/edit";
	}
	
	@RequestMapping(value = "/myprojects/dailys/{did}/upload/video", method = RequestMethod.POST)
	public String save_VideoDaily(Model model,@ModelAttribute("video")Video video,@PathVariable("did") Long did) {
		//model.addAttribute("projects",projects.getAllProjects());		
		Daily d = dailys.findOne(did);
		StringBuilder yt = new StringBuilder("http://www.youtube.com/embed/");
		
		yt.append(video.getPath());
		video.setPath(yt.toString());
		video.setDaily(d);
		
		videos.save(video);
				
		return "redirect:/myprojects/dailys/"+ did.toString() +"/edit";
	}
	
	@RequestMapping(value = "/myprojects/dailys/delete/video/{vid}", method = RequestMethod.GET)
	public String deleteVideoDaily(HttpSession session,@PathVariable("vid") Long vid) {
		
		
		Video video = videos.findOne(vid);
		videos.delete(video);
				
		return "redirect:/myprojects/dailys/"+ video.getDaily().getId() +"/edit";
	}
}
