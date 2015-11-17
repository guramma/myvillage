package com.ssis.village.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ssis.village.dao.FestivalDao;
import com.ssis.village.dao.GenericDao;
import com.ssis.village.dto.FestivalDto;
import com.ssis.village.model.FestivalImages;
import com.ssis.village.model.FestivalMusics;
import com.ssis.village.model.FestivalVideos;
import com.ssis.village.model.Festivals;
import com.ssis.village.model.Users;

@Service
@Transactional
public class FestivalServiceImpl implements FestivalService {

	@Autowired protected UploadPathService uploadPathService;
	@Autowired protected GenericDao genericDao;
	@Autowired protected FestivalDao festivalDao;
	
	@Override
	public Integer saveFestivalDetails(FestivalDto festivalDto) {
		Integer result = null;
		if(festivalDto!=null){
			Festivals festivals = new Festivals();
			festivals.setFestivalDate(festivalDto.getFestivalDate());
			festivals.setFestivalName(festivalDto.getFestivalName());
			festivals.setUsers(new Users(festivalDto.getUserId()));
			result = genericDao.save(festivals);
			if(result!=null){
				if(festivalDto.getFestivalImages()!=null && festivalDto.getFestivalImages().size()>0){
					for(MultipartFile images : festivalDto.getFestivalImages()){
						FestivalImages festivalImages = new FestivalImages();
						try {
							if(images.getBytes()!=null && StringUtils.hasText(images.getOriginalFilename())){
								String imageName = images.getOriginalFilename();
								String modifiedImageName  = FilenameUtils.getBaseName(imageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(imageName);
								File file = uploadPathService.getFilesPath(modifiedImageName,"festivalImages");
								if(file!=null){
									FileUtils.writeByteArrayToFile(file, images.getBytes());
								}
								festivalImages.setFestivalImageName(images.getOriginalFilename());
								festivalImages.setFestivalModifiedName(modifiedImageName);
								festivalImages.setFestivals(new Festivals(result));
								genericDao.save(festivalImages);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
				
				
				if(festivalDto.getFestivalVideos()!=null && festivalDto.getFestivalVideos().size()>0){
					for(MultipartFile videos : festivalDto.getFestivalVideos()){
						FestivalVideos festivalVideos = new FestivalVideos();
						try {
							if(videos.getBytes()!=null && StringUtils.hasText(videos.getOriginalFilename())){
								String imageName = videos.getOriginalFilename();
								String modifiedImageName  = FilenameUtils.getBaseName(imageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(imageName);
								File file = uploadPathService.getFilesPath(modifiedImageName,"festivalVideos");
								if(file!=null){
									FileUtils.writeByteArrayToFile(file, videos.getBytes());
								}
								festivalVideos.setFestivalVideoName(videos.getOriginalFilename());
								festivalVideos.setFestivalModifiedName(modifiedImageName);
								festivalVideos.setFestivals(new Festivals(result));
								genericDao.save(festivalVideos);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
				
				if(festivalDto.getFestivalMusics()!=null && festivalDto.getFestivalMusics().size()>0){
					for(MultipartFile musics : festivalDto.getFestivalMusics()){
						FestivalMusics festivalMusics = new FestivalMusics();
						try {
							if(musics.getBytes()!=null && StringUtils.hasText(musics.getOriginalFilename())){
								String imageName = musics.getOriginalFilename();
								String modifiedImageName  = FilenameUtils.getBaseName(imageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(imageName);
								File file = uploadPathService.getFilesPath(modifiedImageName,"festivalMusics");
								if(file!=null){
									FileUtils.writeByteArrayToFile(file, musics.getBytes());
								}
								festivalMusics.setFestivalMusicName(musics.getOriginalFilename());
								festivalMusics.setFestivalModifiedName(modifiedImageName);
								festivalMusics.setFestivals(new Festivals(result));
								genericDao.save(festivalMusics);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
	
			}
		}

		return result;
	}

	@Override
	public List<FestivalDto> getAllFestivalImages() {
		return festivalDao.getAllFestivalImages();
	}

	@Override
	public List<FestivalImages> getFestivalImagesByFestivalName(String festivalname) {
		return festivalDao.getFestivalImagesByFestivalName(festivalname);
	}

	@Override
	public List<FestivalDto> getAllFestivalvideos() {
		return festivalDao.getAllFestivalvideos();
	}

	@Override
	public List<FestivalVideos> getFestivalVideosByFestivalName(String festivalname) {
		return festivalDao.getFestivalVideosByFestivalName(festivalname);
	}

	@Override
	public List<FestivalDto> getAllFestivalMusics() {
		return festivalDao.getAllFestivalMusics();
	}

	@Override
	public List<FestivalMusics> getFestivalMusicsByFestivalName(String festivalname) {
		return festivalDao.getFestivalMusicsByFestivalName(festivalname);
	}

}
