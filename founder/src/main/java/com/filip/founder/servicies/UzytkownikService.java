package com.filip.founder.servicies;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filip.founder.entities.Uzytkownik;
import com.filip.founder.repositories.UzytkownikRepository;
import com.filip.founder.repositories.UzytkownikRepository;

@Service
public class UzytkownikService {
	@Autowired
	UzytkownikRepository repository;
	public Uzytkownik findUzytkownikByLogin(String login){
		return repository.findUzytkownikByLogin(login);
	}
	
	public Uzytkownik findById(Long id){
		return repository.findOne(id);
	}
	
}
