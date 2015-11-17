package com.ssis.village.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PostYourAdsDto {

	private String titles;
	private List<MultipartFile> files;

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

}
