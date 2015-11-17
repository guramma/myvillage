package com.ssis.village.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssis.village.dto.FestivalDto;
import com.ssis.village.model.FestivalImages;
import com.ssis.village.model.FestivalMusics;
import com.ssis.village.model.FestivalVideos;

@Repository
@SuppressWarnings("unchecked")
public class FestivalDaoImpl implements FestivalDao {
	
	@Autowired protected SessionFactory sessionFactory;
	
	@Override
	public List<FestivalDto> getAllFestivalImages() {
		Query query=sessionFactory.getCurrentSession().createSQLQuery("SELECT festivalImages.festivalModifiedName as festivalModifiedName,festivals.festivalDate as festivalDate,festivals.festivalName as festivalName FROM festivalImages inner join festivals on festivalImages.festivalId = festivals.festivalId group by festivals.festivalName");
		query.setResultTransformer(Transformers.aliasToBean(FestivalDto.class));
		List<FestivalDto> festivalDtos=query.list();
		return festivalDtos;
	}

	@Override
	public List<FestivalImages> getFestivalImagesByFestivalName(String festivalname) {
		Query query=sessionFactory.getCurrentSession().createSQLQuery("SELECT festivalImageName as festivalImageName,festivalModifiedName as festivalModifiedName FROM festivalImages where festivalId in (select festivalId from festivals where festivalName =:festivalName)");
		query.setParameter("festivalName",festivalname);
		query.setResultTransformer(Transformers.aliasToBean(FestivalImages.class));
		List<FestivalImages> festivalImages=query.list();
		return festivalImages;
	}

	@Override
	public List<FestivalDto> getAllFestivalvideos() {
		Query query=sessionFactory.getCurrentSession().createSQLQuery("SELECT festivalVideos.festivalModifiedName as festivalModifiedName,festivals.festivalDate as festivalDate,festivals.festivalName as festivalName FROM festivalVideos inner join festivals on festivalVideos.festivalId = festivals.festivalId group by festivals.festivalName;");
		query.setResultTransformer(Transformers.aliasToBean(FestivalDto.class));
		List<FestivalDto> festivalDtos=query.list();
		return festivalDtos;
	}

	@Override
	public List<FestivalVideos> getFestivalVideosByFestivalName(String festivalname) {
		Query query=sessionFactory.getCurrentSession().createSQLQuery("SELECT festivalVideoName as festivalVideoName,festivalModifiedName as festivalModifiedName FROM festivalVideos where festivalId in (select festivalId from festivals where festivalName =:festivalName)");
		query.setParameter("festivalName",festivalname);
		query.setResultTransformer(Transformers.aliasToBean(FestivalVideos.class));
		List<FestivalVideos> festivalVideos=query.list();
		return festivalVideos;
	}

	@Override
	public List<FestivalDto> getAllFestivalMusics() {
		Query query=sessionFactory.getCurrentSession().createSQLQuery("SELECT festivalMusics.festivalModifiedName as festivalModifiedName,festivals.festivalDate as festivalDate,festivals.festivalName as festivalName FROM festivalMusics inner join festivals on festivalMusics.festivalId = festivals.festivalId group by festivals.festivalName");
		query.setResultTransformer(Transformers.aliasToBean(FestivalDto.class));
		List<FestivalDto> festivalDtos=query.list();
		return festivalDtos;
	}

	@Override
	public List<FestivalMusics> getFestivalMusicsByFestivalName(String festivalname) {
		Query query=sessionFactory.getCurrentSession().createSQLQuery("SELECT festivalMusicName as festivalMusicName,festivalModifiedName as festivalModifiedName FROM festivalMusics where festivalId in (select festivalId from festivals where festivalName =:festivalName)");
		query.setParameter("festivalName",festivalname);
		query.setResultTransformer(Transformers.aliasToBean(FestivalMusics.class));
		List<FestivalMusics> festivalMusics=query.list();
		return festivalMusics;
	}

}
