package com.ssis.village.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@Table(name="SarpanchUserComments")
public class SarpanchUserComments implements Serializable {

	private Integer sarpanchCommentsId;
	private String userProfileModifiedName;
	private String userName;
	private String userComment;
	private Sarpanches sarpanches;
	private Date commentDate;
	private Integer sarpanchId;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="sarpanchCommentsId")
	public Integer getSarpanchCommentsId() {
		return sarpanchCommentsId;
	}

	public void setSarpanchCommentsId(Integer sarpanchCommentsId) {
		this.sarpanchCommentsId = sarpanchCommentsId;
	}

	@Column(name="userProfileModifiedName")
	public String getUserProfileModifiedName() {
		return userProfileModifiedName;
	}

	public void setUserProfileModifiedName(String userProfileModifiedName) {
		this.userProfileModifiedName = userProfileModifiedName;
	}

	@Column(name="userName")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name="userComment")
	public String getUserComment() {
		return userComment;
	}

	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="sarpanchId")
	public Sarpanches getSarpanches() {
		return sarpanches;
	}

	public void setSarpanches(Sarpanches sarpanches) {
		this.sarpanches = sarpanches;
	}

	@Column(name="commentDate")
	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Transient
	public Integer getSarpanchId() {
		return sarpanchId;
	}

	public void setSarpanchId(Integer sarpanchId) {
		this.sarpanchId = sarpanchId;
	}
	
	
	
	

}
