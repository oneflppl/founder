package com.filip.founder.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="image")
public class Image {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Long id;
	
	String path;
	
	@ManyToOne
	@JoinColumn(name="id_project",referencedColumnName="id")
	Project project;

	@ManyToOne
	@JoinColumn(name="id_daily",referencedColumnName="id")
	Daily daily;
	
	String dsc;
	
	public String getDsc() {
		return dsc;
	}

	public void setDsc(String dsc) {
		this.dsc = dsc;
	}

	public Long getId() {
		return id;
	}

	public Daily getDaily() {
		return daily;
	}

	public void setDaily(Daily daily) {
		this.daily = daily;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}
	
	
}
