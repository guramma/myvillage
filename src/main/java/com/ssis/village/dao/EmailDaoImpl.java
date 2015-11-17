package com.ssis.village.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.ssis.village.model.Emails;
import com.ssis.village.model.EmailsAttached;

@Repository
@SuppressWarnings("unchecked")
public class EmailDaoImpl implements EmailDao {
	
	@Autowired public SessionFactory sessionFactory;

	
	@Override
	public List<Emails> getEmailsByUserName(String email) {
		return sessionFactory.getCurrentSession().createQuery("from Emails where recieveremail=:recieveremail and receiverDeleteStatus=:receiverDeleteStatus").setParameter("recieveremail", email).setParameter("receiverDeleteStatus", false).list();
	}

	@Override
	public List<String> getAllEmails(String email) {
		return sessionFactory.getCurrentSession().createQuery("select email from Users where email!=:email").setParameter("email", email).list();
	}


	@Override
	public Integer saveEmails(Emails emails,List<EmailsAttached> emailsAttacheds) {
		Integer result = (Integer)sessionFactory.getCurrentSession().save(emails);
		if(result!=null){
			if(emailsAttacheds!=null){
				if(emailsAttacheds.size()>0){
					for(EmailsAttached fileName : emailsAttacheds){
						EmailsAttached emailsAttached = new EmailsAttached();
						emailsAttached.setEmailImageName(fileName.getEmailImageName());
						emailsAttached.setEmailImageModifiedName(fileName.getEmailImageModifiedName());
						emailsAttached.setEmails(new Emails(result));
						sessionFactory.getCurrentSession().save(emailsAttached);
					}
				}
			}
		}
		return result;
	}


	@Override
	public Emails changeReadable(Integer emailId) {
		Emails emails = null;
		Integer result = sessionFactory.getCurrentSession().createQuery("update Emails set readed=:readed where emailId=:emailId").setParameter("readed", true).setParameter("emailId", emailId).executeUpdate();
		if(result!=null){
			emails = (Emails) sessionFactory.getCurrentSession().createQuery("from Emails where emailId=:emailId").setParameter("emailId", emailId).uniqueResult();
		}
		return emails;
	}


	@Override
	public List<Emails> getSendEmailsByUserName(String email) {
		return sessionFactory.getCurrentSession().createQuery("from Emails where senderEmail=:senderEmail and senderDeleteStatus=:senderDeleteStatus").setParameter("senderEmail", email).setParameter("senderDeleteStatus",false).list();
	}


	@Override
	public Integer updateEmailStatusById(Integer emailId,String status) {
		Integer result = null;
		if(StringUtils.hasText(status)){
			if(status.equalsIgnoreCase("receiver")){
				result = (Integer)sessionFactory.getCurrentSession().createQuery("update Emails set receiverDeleteStatus=:receiverDeleteStatus where emailId=:emailId").setParameter("receiverDeleteStatus", true).setParameter("emailId",emailId).executeUpdate();
			}
			if(status.equalsIgnoreCase("sender")){
				result = (Integer)sessionFactory.getCurrentSession().createQuery("update Emails set senderDeleteStatus=:senderDeleteStatus where emailId=:emailId").setParameter("senderDeleteStatus", true).setParameter("emailId",emailId).executeUpdate();
			}
		}
		return result;
	} 

}
