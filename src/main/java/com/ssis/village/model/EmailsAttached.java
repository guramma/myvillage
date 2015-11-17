package com.ssis.village.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "EmailsAttached")
public class EmailsAttached implements Serializable {

	private Integer emailAttachedId;
	private String emailImageModifiedName;
	private String emailImageName;
	private Emails emails;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="emailAttachedId")
	public Integer getEmailAttachedId() {
		return emailAttachedId;
	}

	public void setEmailAttachedId(Integer emailAttachedId) {
		this.emailAttachedId = emailAttachedId;
	}

	@Column(name="emailImageModifiedName")
	public String getEmailImageModifiedName() {
		return emailImageModifiedName;
	}

	public void setEmailImageModifiedName(String emailImageModifiedName) {
		this.emailImageModifiedName = emailImageModifiedName;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="emailId")
	public Emails getEmails() {
		return emails;
	}

	public void setEmails(Emails emails) {
		this.emails = emails;
	}

	@Column(name="emailImageName")
	public String getEmailImageName() {
		return emailImageName;
	}

	public void setEmailImageName(String emailImageName) {
		this.emailImageName = emailImageName;
	}
	
	

}
