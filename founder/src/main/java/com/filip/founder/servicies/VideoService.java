package com.filip.founder.servicies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filip.founder.entities.Daily;
import com.filip.founder.entities.Project;
import com.filip.founder.entities.Video;
import com.filip.founder.repositories.VideoRepository;

@Service
public class VideoService {
	@Autowired 
	VideoRepository repository;
	public List<Video> findByProject(Project project){
		return repository.findByProject(project);
	}

	public List<Video> findByDaily(Daily daily){
		
		return repository.findByDaily(daily);
	};
	public Video findOne(Long id)
	{		
		return repository.findOne(id);
	}
	
	public void save(Video image){
		repository.save(image);		
	}
	public void delete(Video image){
		repository.delete(image);		
	}
}
