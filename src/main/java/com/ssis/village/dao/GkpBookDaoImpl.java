package com.ssis.village.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssis.village.model.GkpBookRequests;
import com.ssis.village.model.PostYourAd;
import com.ssis.village.model.Users;

@Repository
@SuppressWarnings("unchecked")
public class GkpBookDaoImpl implements GkpBookDao {
	
	@Autowired public SessionFactory sessionFactory;
	
	@Override
	public List<GkpBookRequests> getBookRequestByUserName(String email) {
		return sessionFactory.getCurrentSession().createQuery("from GkpBookRequests where bookFrom=:bookFrom and accepted=:accepted").setParameter("bookFrom", email).setParameter("accepted",false).list();
	}

	@Override
	public List<Users> getRequestedUsersLitByUserName(String email) {
		
		Query query =sessionFactory.getCurrentSession().createSQLQuery("SELECT GkpBookRequests.bookRequestId as bookRequestId,users.userProfileModifiedName as userProfileModifiedName,users.firstName as firstName,users.lastName as lastName,users.email as email,GkpBookRequests.requestedDate as requestedDate FROM users inner join GkpBookRequests on users.email = GkpBookRequests.bookFrom where GkpBookRequests.bookTo=:bookTo and GkpBookRequests.accepted=:accepted").setParameter("bookTo", email).setParameter("accepted",false);
		query.setResultTransformer(Transformers.aliasToBean(Users.class));
		List<Users> usersInfo=(List<Users>) query.list();
		return usersInfo;
	}

	@Override
	public List<PostYourAd> getPostAds(String email) {
		Set<String> emailses = new HashSet<String>();
		List<GkpBookRequests> bookRequests = sessionFactory.getCurrentSession().createQuery("from GkpBookRequests where bookFrom=:bookFrom or bookTo=:bookTo and accepted=:accepted").setParameter("bookFrom", email).setParameter("bookTo", email).setParameter("accepted",true).list();
		if(bookRequests!=null && bookRequests.size()>0){
			for(GkpBookRequests bookRequests2 : bookRequests){
				if(!bookRequests2.getBookFrom().equalsIgnoreCase(email)){
					emailses.add(bookRequests2.getBookFrom());
				}
				if(!bookRequests2.getBookTo().equalsIgnoreCase(email)){
					emailses.add(bookRequests2.getBookTo());
				}
				
				
			}
		}
		List<String> emails = new ArrayList<String>(emailses);
		if(emails!=null && emails.size()>0){
			return sessionFactory.getCurrentSession().createQuery("from PostYourAd where senderEmail in(:emails) order by postYourAdDate desc").setParameterList("emails",emails).list();
		}
		return null;
		
	}

	@Override
	public List<String> getAllEmails(String email) {
		Set<String> emailses = new HashSet<String>();
		List<GkpBookRequests> bookRequests = sessionFactory.getCurrentSession().createQuery("from GkpBookRequests where bookFrom=:bookFrom or bookTo=:bookTo and accepted=:accepted").setParameter("bookFrom", email).setParameter("bookTo", email).setParameter("accepted",true).list();
		if(bookRequests!=null && bookRequests.size()>0){
			for(GkpBookRequests bookRequests2 : bookRequests){
				if(!bookRequests2.getBookFrom().equalsIgnoreCase(email)){
					emailses.add(bookRequests2.getBookFrom());
				}
				if(!bookRequests2.getBookTo().equalsIgnoreCase(email)){
					emailses.add(bookRequests2.getBookTo());
				}
				
				
			}
		}
		List<String> emails = new ArrayList<String>(emailses);
		return emails;
	}

	@Override
	public List<String> getAllFromEmails(String email) {
		return sessionFactory.getCurrentSession().createQuery("select bookFrom from GkpBookRequests where bookTo=:bookTo and accepted=:accepted").setParameter("bookTo", email).setParameter("accepted",false).list();
	}

	@Override
	public Integer updateAccept(String userFromemail, String userToemail) {
		return (Integer) sessionFactory.getCurrentSession().createQuery("update GkpBookRequests set accepted=:accepted where bookFrom=:bookFrom and bookTo=:bookTo").setParameter("accepted", true).setParameter("bookFrom",userFromemail).setParameter("bookTo", userToemail).executeUpdate();
	}

	@Override
	public void rejectuserrequest(String userFromemail, String userToemail) {
		sessionFactory.getCurrentSession().createQuery("delete from GkpBookRequests where bookFrom=:bookFrom and bookTo=:bookTo").setParameter("bookFrom",userFromemail).setParameter("bookTo", userToemail).executeUpdate();
	}

}
