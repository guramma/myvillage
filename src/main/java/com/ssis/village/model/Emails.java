package com.ssis.village.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
@Entity
@Table(name = "emails")
public class Emails implements Serializable {

	private Integer emailId;
	private String senderEmail;
	private String recieveremail;
	private String message;
	private String subject;
	private boolean inbox;
	private boolean readed;
	private List<EmailsAttached> emailsAttacheds;
	private List<String> emails = new ArrayList<String>();
	private List<MultipartFile> files = new ArrayList<MultipartFile>();
	private boolean sended;
	private Date createdDate;
	private boolean senderDeleteStatus;
	private boolean receiverDeleteStatus;

	public Emails() {

	}

	public Emails(Integer emailId) {
		super();
		this.emailId = emailId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "emailId")
	public Integer getEmailId() {
		return emailId;
	}

	public void setEmailId(Integer emailId) {
		this.emailId = emailId;
	}

	@Column(name = "senderEmail")
	public String getSenderEmail() {
		return senderEmail;
	}

	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}

	@Column(name = "recieveremail")
	public String getRecieveremail() {
		return recieveremail;
	}

	public void setRecieveremail(String recieveremail) {
		this.recieveremail = recieveremail;
	}

	@Column(name = "message")
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "subject")
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column(name = "inbox")
	public boolean isInbox() {
		return inbox;
	}

	public void setInbox(boolean inbox) {
		this.inbox = inbox;
	}

	@Column(name = "readed")
	public boolean isReaded() {
		return readed;
	}

	public void setReaded(boolean readed) {
		this.readed = readed;
	}

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "emails")
	public List<EmailsAttached> getEmailsAttacheds() {
		return emailsAttacheds;
	}

	public void setEmailsAttacheds(List<EmailsAttached> emailsAttacheds) {
		this.emailsAttacheds = emailsAttacheds;
	}

	@Transient
	public List<String> getEmails() {
		return emails;
	}

	public void setEmails(List<String> emails) {
		this.emails = emails;
	}

	@Transient
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	@Column(name = "sended")
	public boolean isSended() {
		return sended;
	}

	public void setSended(boolean sended) {
		this.sended = sended;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name="senderDeleteStatus")
	public boolean isSenderDeleteStatus() {
		return senderDeleteStatus;
	}
	
	public void setSenderDeleteStatus(boolean senderDeleteStatus) {
		this.senderDeleteStatus = senderDeleteStatus;
	}

	@Column(name="receiverDeleteStatus")
	public boolean isReceiverDeleteStatus() {
		return receiverDeleteStatus;
	}

	public void setReceiverDeleteStatus(boolean receiverDeleteStatus) {
		this.receiverDeleteStatus = receiverDeleteStatus;
	}
	
	

}
