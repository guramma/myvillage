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
@Table(name="PostAdUserLikes")
public class PostAdUserLikes implements Serializable {
	
	private Integer likeId;
	private String userProfileModifiedName;
	private String userName;
	private String email;
	private PostYourAd postYourAd;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "likeId")
	public Integer getLikeId() {
		return likeId;
	}

	public void setLikeId(Integer likeId) {
		this.likeId = likeId;
	}

	@Column(name = "userProfileModifiedName")
	public String getUserProfileModifiedName() {
		return userProfileModifiedName;
	}

	public void setUserProfileModifiedName(String userProfileModifiedName) {
		this.userProfileModifiedName = userProfileModifiedName;
	}

	@Column(name = "userName")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "postYourAdId")
	public PostYourAd getPostYourAd() {
		return postYourAd;
	}

	public void setPostYourAd(PostYourAd postYourAd) {
		this.postYourAd = postYourAd;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
