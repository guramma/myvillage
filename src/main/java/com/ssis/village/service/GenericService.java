package com.ssis.village.service;

import java.util.List;

import com.ssis.village.model.Student;
import com.ssis.village.model.Users;

public interface GenericService {
	
	public <T> List<T> getAll(final Class<T> type);
	public <T> T getUserByName(final Class<T> type,String email);
	public <T> List<T> getDetailsById(final Class<T> type,Integer userId,String parameter);
	public <T> List<T> getDetailsByEmail(final Class<T> type,String email,String parameter);
	public <T> Integer save(final T type);
	public <T> T getInfoById(final Class<T> type,Integer userId,String parameter);
	public <T> void delete(final Class<T> type,Integer id);
	public <T> List<T> getAllByOrder(final Class<T> type,String parameter);
	public <T> List<T> getOrderDetailsById(final Class<T> type,Integer userId,String parameter,String orderParameter);
	public Integer saveUserDetails(Users users);
	public Integer saveStudentDetails(Student student);

}
