package com.ssis.village.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="festivalsList")
public class FestivalList implements Serializable {

	private Integer festivalListId;
	private String festivalName;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="festivalsListId")
	public Integer getFestivalListId() {
		return festivalListId;
	}

	public void setFestivalListId(Integer festivalListId) {
		this.festivalListId = festivalListId;
	}

	@Column(name="festivalName")
	public String getFestivalName() {
		return festivalName;
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}

}
