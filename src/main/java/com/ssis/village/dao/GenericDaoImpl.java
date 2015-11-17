package com.ssis.village.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("unchecked")
public class GenericDaoImpl implements GenericDao {

	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public <T> List<T> getAll(Class<T> type) {
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		return crit.list();
	}

	@Override
	public <T> T getUserByName(Class<T> type, String email) {
		
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		crit.add(Restrictions.eq("email",email));
		return (T)crit.uniqueResult();
	}

	@Override
	public <T> Integer save(final T type) {
		return (Integer)sessionFactory.getCurrentSession().save(type);
	}

	@Override
	public <T> List<T> getDetailsById(Class<T> type, Integer userId,String parameter) {
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		crit.add(Restrictions.eq(parameter,userId));
		return crit.list();
	}

	@Override
	public <T> T getInfoById(Class<T> type, Integer userId, String parameter) {
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		crit.add(Restrictions.eq(parameter,userId));
		return (T)crit.uniqueResult();
	}

	@Override
	public <T> void delete(Class<T> type, Integer id) {
		final Session session = sessionFactory.getCurrentSession();
		T t = (T)session.get(type, id);
		if(t!=null){
			session.delete(t);
		}
		
	}

	@Override
	public <T> List<T> getAllByOrder(Class<T> type, String parameter) {
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		crit.addOrder(Order.desc(parameter));
		return crit.list();
	}

	@Override
	public <T> List<T> getOrderDetailsById(Class<T> type, Integer userId,String parameter, String orderParameter) {
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		crit.add(Restrictions.eq(parameter,userId));
		crit.addOrder(Order.desc(orderParameter));
		return crit.list();
	}

	@Override
	public <T> List<T> getDetailsByEmail(Class<T> type, String email,String parameter) {
		final Session session = sessionFactory.getCurrentSession();
		final Criteria crit = session.createCriteria(type);
		crit.add(Restrictions.eq(parameter,email));
		return crit.list();
	}

}
