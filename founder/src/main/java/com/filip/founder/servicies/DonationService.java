package com.filip.founder.servicies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filip.founder.entities.Donation;
import com.filip.founder.entities.Project;
import com.filip.founder.repositories.DonationRepository;

@Service
public class DonationService {
@Autowired
DonationRepository repository;

public List<Donation> findById(Long id){
	
	return  repository.findById(id);
}


public List<Donation> findByProject(Project project){
	
	return  repository.findByProject(project);
}

public void save(Donation donation)
{
		repository.save(donation);
}


}