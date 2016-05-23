package com.filip.founder.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;


import com.filip.founder.entities.Project;
import com.filip.founder.entities.Video;
import com.filip.founder.entities.Daily;

public interface VideoRepository extends CrudRepository<Video, Long> {
	List<Video> findByProject(Project project);
	List<Video> findByDaily(Daily daily);
	//Image findOne(Long id);
}
