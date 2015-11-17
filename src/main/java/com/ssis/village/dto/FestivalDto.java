package com.ssis.village.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FestivalDto {

	private String festivalName;
	private String dateofFestival;
	private List<MultipartFile> festivalImages;
	private List<MultipartFile> festivalVideos;
	private List<MultipartFile> festivalMusics;
	private Integer userId;
	private Date festivalDate;
	private String festivalModifiedName;

	public String getFestivalName() {
		return festivalName;
	}

	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
	}

	public String getDateofFestival() {
		return dateofFestival;
	}

	public void setDateofFestival(String dateofFestival) {
		this.dateofFestival = dateofFestival;
	}

	public List<MultipartFile> getFestivalImages() {
		return festivalImages;
	}

	public void setFestivalImages(List<MultipartFile> festivalImages) {
		this.festivalImages = festivalImages;
	}

	public List<MultipartFile> getFestivalVideos() {
		return festivalVideos;
	}

	public void setFestivalVideos(List<MultipartFile> festivalVideos) {
		this.festivalVideos = festivalVideos;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getFestivalDate() {
		return festivalDate;
	}

	public void setFestivalDate(Date festivalDate) {
		this.festivalDate = festivalDate;
	}

	public String getFestivalModifiedName() {
		return festivalModifiedName;
	}

	public void setFestivalModifiedName(String festivalModifiedName) {
		this.festivalModifiedName = festivalModifiedName;
	}

	public List<MultipartFile> getFestivalMusics() {
		return festivalMusics;
	}

	public void setFestivalMusics(List<MultipartFile> festivalMusics) {
		this.festivalMusics = festivalMusics;
	}
	
	
	

}
