package com.ssis.village.dao;

import java.util.List;

public interface GenericDao {
	
	public <T> List<T> getAll(Class<T> type);
	public <T> T getUserByName(final Class<T> type,String email);
	public <T> Integer save(final T type);
	public <T> List<T> getDetailsById(final Class<T> type,Integer userId,String parameter);
	public <T> List<T> getDetailsByEmail(final Class<T> type,String email,String parameter);
	public <T> T getInfoById(final Class<T> type,Integer userId,String parameter);
	public <T> void delete(final Class<T> type,Integer id);
	public <T> List<T> getAllByOrder(final Class<T> type,String parameter);
	public <T> List<T> getOrderDetailsById(final Class<T> type,Integer userId,String parameter,String orderParameter);

}
