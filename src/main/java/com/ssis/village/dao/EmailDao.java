package com.ssis.village.dao;

import java.util.List;

import com.ssis.village.model.Emails;
import com.ssis.village.model.EmailsAttached;

public interface EmailDao {
	
	public List<Emails> getEmailsByUserName(String email);
	public List<String> getAllEmails(String email);
	public Integer saveEmails(Emails emails, List<EmailsAttached> emailsAttacheds);
	public Emails changeReadable(Integer emailId);
	public List<Emails> getSendEmailsByUserName(String email);
	public Integer updateEmailStatusById(Integer emailId, String status);

}
