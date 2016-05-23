package com.filip.founder.servicies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filip.founder.entities.Daily;
import com.filip.founder.entities.Image;
import com.filip.founder.entities.Project;
import com.filip.founder.repositories.ImageRepository;

@Service
public class ImageService {
	@Autowired 
	ImageRepository repository;
	public List<Image> findByProject(Project project){
		return repository.findByProject(project);
	}
	
	public List<Image> findByDaily(Daily daily){
		return repository.findByDaily(daily);
	}
	
	public Image findOne(Long id)
	{		
		return repository.findOne(id);
	}
	
	public void save(Image image){
		repository.save(image);		
	}
	public void delete(Image image){
		repository.delete(image);		
	}
}
