package com.filip.founder.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="donation")
public class Donation {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	Long id;
	
	String dsc;
	
	@ManyToOne
	@JoinColumn(name="id_project",referencedColumnName="id")
	Project project;
	

	@ManyToOne
	@JoinColumn(name="id_donator",referencedColumnName="id")
	Uzytkownik donator;
	
	float amount;
	
	public Uzytkownik getDonator() {
		return donator;
	}

	public void setDonator(Uzytkownik donator) {
		this.donator = donator;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDsc() {
		return dsc;
	}

	public void setDsc(String dsc) {
		this.dsc = dsc;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	
	
	
}
