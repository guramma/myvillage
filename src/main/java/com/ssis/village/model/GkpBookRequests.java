package com.ssis.village.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="GkpBookRequests")
public class GkpBookRequests implements Serializable {

	private Integer bookRequestId;
	private String bookFrom;
	private String bookTo;
	private boolean request;
	private boolean accepted;
	private Date requestedDate;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bookRequestId")
	public Integer getBookRequestId() {
		return bookRequestId;
	}

	public void setBookRequestId(Integer bookRequestId) {
		this.bookRequestId = bookRequestId;
	}

	@Column(name="bookFrom")
	public String getBookFrom() {
		return bookFrom;
	}

	public void setBookFrom(String bookFrom) {
		this.bookFrom = bookFrom;
	}

	@Column(name="bookTo")
	public String getBookTo() {
		return bookTo;
	}

	public void setBookTo(String bookTo) {
		this.bookTo = bookTo;
	}

	@Column(name="request")
	public boolean isRequest() {
		return request;
	}

	
	public void setRequest(boolean request) {
		this.request = request;
	}

	@Column(name="accepted")
	public boolean isAccepted() {
		return accepted;
	}

	
	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}

	@Column(name="requestedDate")
	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

}
