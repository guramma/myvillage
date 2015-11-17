package com.ssis.village.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "festivalVideos")
public class FestivalVideos implements Serializable {

	private Integer festivalVideoId;
	private String festivalVideoName;
	private String festivalModifiedName;
	private Festivals festivals;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="festivalVideoId")
	public Integer getFestivalVideoId() {
		return festivalVideoId;
	}

	public void setFestivalVideoId(Integer festivalVideoId) {
		this.festivalVideoId = festivalVideoId;
	}

	@Column(name="festivalVideoName")
	public String getFestivalVideoName() {
		return festivalVideoName;
	}

	public void setFestivalVideoName(String festivalVideoName) {
		this.festivalVideoName = festivalVideoName;
	}

	@Column(name="festivalModifiedName")
	public String getFestivalModifiedName() {
		return festivalModifiedName;
	}

	public void setFestivalModifiedName(String festivalModifiedName) {
		this.festivalModifiedName = festivalModifiedName;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="festivalId")
	public Festivals getFestivals() {
		return festivals;
	}

	public void setFestivals(Festivals festivals) {
		this.festivals = festivals;
	}

}
