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
@Table(name = "festivalImages")
public class FestivalImages implements Serializable {

	private Integer festivalImageId;
	private String festivalImageName;
	private String festivalModifiedName;
	private Festivals festivals;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="festivalImageId")
	public Integer getFestivalImageId() {
		return festivalImageId;
	}

	public void setFestivalImageId(Integer festivalImageId) {
		this.festivalImageId = festivalImageId;
	}

	@Column(name="festivalImageName")
	public String getFestivalImageName() {
		return festivalImageName;
	}

	public void setFestivalImageName(String festivalImageName) {
		this.festivalImageName = festivalImageName;
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
