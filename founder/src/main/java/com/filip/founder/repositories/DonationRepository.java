package com.filip.founder.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.filip.founder.entities.Donation;
import java.lang.Long;
import java.util.List;
import com.filip.founder.entities.Project;
@Transactional
@Repository
public interface DonationRepository extends CrudRepository<Donation,Long> {
  
	List<Donation> findById(Long id);
	List<Donation> findByProject(Project project);

}
