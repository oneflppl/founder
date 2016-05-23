package com.filip.founder.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="project")
public class Project {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Long id;
	String label;
	Date startDate;
	Date endDate;
	Float amount;
	Float collected;
    String dsc;
	@Transient
	Integer progress;
	
	public Integer getProgress() {		
		Float percents = (collected/amount);
		percents=percents*100;
		return Math.round(percents);
	}

	public Float getCollected() {
		return collected;
	}

	public void setCollected(Float collected) {
		this.collected = collected;
	}

	@ManyToOne
	@JoinColumn(name="id_creator",referencedColumnName="id")
	Uzytkownik creator;
	
	@OneToMany(mappedBy="donator",cascade=CascadeType.ALL)
	List<Donation> donations;
	
	
	@OneToMany(mappedBy="project",cascade=CascadeType.ALL)
	List<Image> images;
	
	@OneToMany(mappedBy="project",cascade=CascadeType.ALL)
	List<Video> videos;
	
	@OneToMany(mappedBy="project",cascade=CascadeType.ALL)
	List<Daily> dailys;
	
	
	
	
	public List<Video> getVideos() {
		return videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	
	
	
	
	public List<Daily> getDailys() {
		return dailys;
	}

	public void setDailys(List<Daily> dailys) {
		this.dailys = dailys;
	}

	public void setProgress(Integer progress) {
		this.progress = progress;
	}

	public List<Donation> getDonations() {
		return donations;
	}

	public void setDonations(List<Donation> donations) {
		this.donations = donations;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}


 
	public String getDsc() {
		return dsc;
	}

	public void setDsc(String dsc) {
		this.dsc = dsc;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public Uzytkownik getCreator() {
		return creator;
	}

	public void setCreator(Uzytkownik creator) {
		this.creator = creator;
	}
	
}
