package com.ssis.village.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SarpanchDaoImpl implements SarpanchDao {
	
	@Autowired public SessionFactory sessionFactory;

	@Override
	public Integer updateUserRating(Integer totalusers, double totaluserRating,double totalRating, Integer sarpanchId) {
		return (Integer)sessionFactory.getCurrentSession().createQuery("update Sarpanches set totalPersons=:totalPersons,totalUsersRating=:totalUsersRating,totalRating=:totalRating where sarpanchId=:sarpanchId").setParameter("totalPersons", totalusers)
				.setParameter("totalUsersRating", totaluserRating).setParameter("totalRating", totalRating).setParameter("sarpanchId", sarpanchId).executeUpdate();
	}

}
