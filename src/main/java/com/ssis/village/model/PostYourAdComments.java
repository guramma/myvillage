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

@SuppressWarnings("serial")
@Entity
@Table(name="PostYourAdComments")
public class PostYourAdComments implements Serializable {

	private Integer commentId;
	private String comments;
	private String userProfileModifiedName;
	private String userName;
	private Date commentDate;
	private PostYourAd postYourAd;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="commentId")
	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	@Column(name="comments")
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="postYourAdId")
	public PostYourAd getPostYourAd() {
		return postYourAd;
	}

	public void setPostYourAd(PostYourAd postYourAd) {
		this.postYourAd = postYourAd;
	}

	@Column(name="commentDate")
	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
	
	

}
