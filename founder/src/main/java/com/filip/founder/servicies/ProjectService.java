package com.filip.founder.servicies;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filip.founder.repositories.ProjectRepository;
import com.filip.founder.entities.Project;
import com.filip.founder.entities.Uzytkownik;
@Service
public class ProjectService {

	@Autowired
	ProjectRepository repository;

	public List<Project> getAllProjects() {
		return repository.findAll();
	}

	public List<Project> findByCreator(Uzytkownik creator) {
		return repository.findByCreator(creator);
	}

	public void save(Project project) {
		repository.save(project);
	}

	public Project findById(Long id) {
		return repository.findOne(id);
	}

}
