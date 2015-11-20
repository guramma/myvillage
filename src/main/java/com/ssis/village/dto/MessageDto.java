package com.ssis.village.dto;

public class MessageDto {

	private String status;
	private String message;
	private String fullstatus;
	private String email;
	private String password;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFullstatus() {
		return fullstatus;
	}

	public void setFullstatus(String fullstatus) {
		this.fullstatus = fullstatus;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}	

}