package com.filip.founder.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name="uzytkownik")
public class Uzytkownik {	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Long id;
	
	String login;
	String pwd;
	String email;
	
	@OneToMany(mappedBy="creator" ,cascade = CascadeType.ALL)
	List<Project> projects;
	
	@OneToOne(cascade=CascadeType.ALL)	
       @JoinTable(name="uzytkownik_role",	   
           joinColumns = {@JoinColumn(name="id_uzytkownik", referencedColumnName="id")},	   
           inverseJoinColumns = {@JoinColumn(name="id_role", referencedColumnName="id")}	   
       )	
       private Role role;
	
	@OneToMany(mappedBy="donator" ,cascade = CascadeType.ALL)
	List<Donation> donations;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	
}
//CREATE TABLE uzytkownik (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, login VARCHAR(50) NOT NULL, pwd VARCHAR(50) NOT NULL, email VARCHAR(200) NOT NULL); 