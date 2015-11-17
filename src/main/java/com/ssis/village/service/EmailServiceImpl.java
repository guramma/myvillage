package com.ssis.village.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssis.village.dao.EmailDao;
import com.ssis.village.model.Emails;
import com.ssis.village.model.EmailsAttached;


@Service
@Transactional
public class EmailServiceImpl implements EmailService {
	
	@Autowired public EmailDao emailDao;

	@Override
	public List<Emails> getEmailsByUserName(String email) {
		return emailDao.getEmailsByUserName(email);
	}

	@Override
	public List<String> getAllEmails(String email) {
		return emailDao.getAllEmails(email);
	}

	@Override
	public Integer saveEmails(Emails emails,List<EmailsAttached> emailsAttacheds) {
		return emailDao.saveEmails(emails,emailsAttacheds);
	}

	@Override
	public Emails changeReadable(Integer emailId) {
		return emailDao.changeReadable(emailId);
	}

	@Override
	public List<Emails> getSendEmailsByUserName(String email) {
		return emailDao.getSendEmailsByUserName(email);
	}

	@Override
	public Integer updateEmailStatusById(Integer emailId,String status) {
		return emailDao.updateEmailStatusById(emailId,status);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
