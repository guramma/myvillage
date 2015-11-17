package com.ssis.village.service;

import java.util.List;

import com.ssis.village.dto.FestivalDto;
import com.ssis.village.model.FestivalImages;
import com.ssis.village.model.FestivalMusics;
import com.ssis.village.model.FestivalVideos;

public interface FestivalService {
	
	public Integer saveFestivalDetails(FestivalDto festivalDto);
	public List<FestivalDto> getAllFestivalImages();
	public List<FestivalImages> getFestivalImagesByFestivalName(String festivalname);
	public List<FestivalDto> getAllFestivalvideos();
	public List<FestivalVideos> getFestivalVideosByFestivalName(String festivalname);
	public List<FestivalDto> getAllFestivalMusics();
	public List<FestivalMusics> getFestivalMusicsByFestivalName(String festivalname);

}
