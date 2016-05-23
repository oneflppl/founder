package com.filip.founder.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.filip.founder.entities.Daily;
import com.filip.founder.entities.Image;
import com.filip.founder.entities.Project;
import java.util.List;
@Transactional
@Repository
public interface ImageRepository extends CrudRepository<Image, Long> {
		List<Image> findByProject(Project project);
		List<Image> findByDaily(Daily daily);
		//Image findOne(Long id);
		
}
