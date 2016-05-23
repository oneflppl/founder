package com.filip.founder.servicies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filip.founder.entities.Daily;
import com.filip.founder.entities.Project;
import com.filip.founder.repositories.DailyRepository;

@Service
public class DailyService {

	@Autowired
	DailyRepository repository;
	
	public List<Daily> findByProject(Project project){		
		
		return repository.findByProject(project);
		
	};
	
	public Daily findOne(Long did)
	{
		return repository.findOne(did);	
	}
	
	public void save(Daily daily)
	{
		repository.save(daily);		
	}

	
}
