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
@Table(name = "festivalMusics")
public class FestivalMusics implements Serializable {

	private Integer festivalMusicId;
	private String festivalMusicName;
	private String festivalModifiedName;
	private Festivals festivals;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="festivalMusicId")
	public Integer getFestivalMusicId() {
		return festivalMusicId;
	}

	public void setFestivalMusicId(Integer festivalMusicId) {
		this.festivalMusicId = festivalMusicId;
	}

	@Column(name="festivalMusicName")
	public String getFestivalMusicName() {
		return festivalMusicName;
	}

	public void setFestivalMusicName(String festivalMusicName) {
		this.festivalMusicName = festivalMusicName;
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
