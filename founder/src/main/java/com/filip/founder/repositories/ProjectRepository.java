package com.filip.founder.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.filip.founder.entities.Project;
import com.filip.founder.entities.Uzytkownik;

@Transactional
@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {
	
	void delete(Long id);
	List<Project> findAll();
	List<Project> findByCreator(Uzytkownik creator);
}
