package com.ssis.village.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssis.village.dao.SarpanchDao;

@Service
@Transactional
public class SarpanchServiceImpl implements SarpanchService{
	
	@Autowired public SarpanchDao sarpanchDao;

	@Override
	public Integer updateUserRating(Integer totalusers, double totaluserRating,double totalRating, Integer sarpanchId) {
		return sarpanchDao.updateUserRating(totalusers,totaluserRating,totalRating,sarpanchId);
	}

}
