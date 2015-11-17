package com.ssis.village.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "festivals")
public class Festivals implements Serializable {

	private Integer festivalId;
	private String festivalName;
	private Date festivalDate;
	private Users users;
	private List<FestivalVideos> festivalVideos = new ArrayList<FestivalVideos>();
	private List<FestivalImages> festivalImages = new ArrayList<FestivalImages>();
	private List<FestivalMusics> festivalMusics = new ArrayList<FestivalMusics>();

	public Festivals(){
		
	}
	
	
	public Festivals(Integer festivalId) {
		super();
		this.festivalId = festivalId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "festivalId")
	public Integer getFestivalId() {
		return festivalId;
	}

	public void setFestivalId(Integer festivalId) {
		this.festivalId = festivalId;
	}

	@Column(name = "festivalName")
	public String getFestivalName() {
		return festivalName;
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}

	@Column(name = "festivalDate")
	public Date getFestivalDate() {
		return festivalDate;
	}

	public void setFestivalDate(Date festivalDate) {
		this.festivalDate = festivalDate;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "festivals", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<FestivalVideos> getFestivalVideos() {
		return festivalVideos;
	}

	public void setFestivalVideos(List<FestivalVideos> festivalVideos) {
		this.festivalVideos = festivalVideos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "festivals", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<FestivalImages> getFestivalImages() {
		return festivalImages;
	}

	public void setFestivalImages(List<FestivalImages> festivalImages) {
		this.festivalImages = festivalImages;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "festivals", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<FestivalMusics> getFestivalMusics() {
		return festivalMusics;
	}


	public void setFestivalMusics(List<FestivalMusics> festivalMusics) {
		this.festivalMusics = festivalMusics;
	}
	
	

}
