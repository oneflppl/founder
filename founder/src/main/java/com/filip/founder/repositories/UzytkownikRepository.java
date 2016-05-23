package com.filip.founder.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.filip.founder.entities.Uzytkownik;
import java.lang.String;
import java.util.List;



@Repository
@Transactional
public interface UzytkownikRepository extends CrudRepository<Uzytkownik, Long> {

	List<Uzytkownik> findByEmail(String email);
	List<Uzytkownik> findByLogin(String login);
	List<Uzytkownik> findByPwd(String pwd);
	
	Uzytkownik findUzytkownikByEmail(String email);
	Uzytkownik findUzytkownikByLogin(String login);
	Uzytkownik findUzytkownikByPwd(String pwd);
		
}
