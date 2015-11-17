package com.ssis.village.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssis.village.dto.PasswordDto;
import com.ssis.village.model.Users;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired public SessionFactory sessionFactory;

	@Override
	public Integer updateUserProfile(Users users) {
		return sessionFactory.getCurrentSession().createQuery("update Users set firstName=:firstName,lastName=:lastName,email=:email,password=:password,userProfileModifiedName=:userProfileModifiedName,userProfileBackgroundModifiedName=:userProfileBackgroundModifiedName,phoneNumber=:phoneNumber,dateofBirth=:dateofBirth,country=:country,state=:state,city=:city,zipcode=:zipcode,address1=:address1,address2=:address2,gender=:gender,userProfile=:userProfile where userId=:userId")
		.setParameter("firstName", users.getFirstName()).setParameter("lastName", users.getLastName()).setParameter("email", users.getEmail()).setParameter("password", users.getPassword()).setParameter("userProfileModifiedName", users.getUserProfileModifiedName()).setParameter("userProfileBackgroundModifiedName", users.getUserProfileBackgroundModifiedName()).setParameter("phoneNumber", users.getPhoneNumber()).setParameter("dateofBirth", users.getDateofBirth())
		.setParameter("country", users.getCountry()).setParameter("state", users.getState()).setParameter("city", users.getCity()).setParameter("zipcode",users.getZipcode()).setParameter("address1",users.getAddress1()).setParameter("address2", users.getAddress2()).setParameter("gender", users.getGender()).setParameter("userProfile", users.getUserProfile()).setParameter("userId",users.getUserId()).executeUpdate();
	}

	@Override
	public Integer updateUserPassword(PasswordDto passwordDto) {
		return sessionFactory.getCurrentSession().createQuery("update Users set password=:newpassword where email=:email and password=:oldpassword")
				.setParameter("newpassword", passwordDto.getNewpassword()).setParameter("email",passwordDto.getUseremail()).setParameter("oldpassword",passwordDto.getOldpassword()).executeUpdate();
	}

}
