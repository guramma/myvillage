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

@SuppressWarnings("serial")
@Entity
@Table(name = "postYourAd")
public class PostYourAd implements Serializable {

	private Integer postYourAdId;
	private String senderEmail;
	private String userName;
	private String userProfileModifiedName;
	private Date postYourAdDate;
	private String title;
	private List<PostYourAdAttachments> postYourAdAttachments = new ArrayList<PostYourAdAttachments>();
	private List<PostYourAdComments> postYourAdComments = new ArrayList<PostYourAdComments>();
	private List<PostAdUserLikes> postAdUserLikes = new ArrayList<PostAdUserLikes>();

	public PostYourAd() {

	}

	public PostYourAd(Integer postYourAdId) {
		super();
		this.postYourAdId = postYourAdId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "postYourAdId")
	public Integer getPostYourAdId() {
		return postYourAdId;
	}

	public void setPostYourAdId(Integer postYourAdId) {
		this.postYourAdId = postYourAdId;
	}

	@Column(name = "senderEmail")
	public String getSenderEmail() {
		return senderEmail;
	}

	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}

	@Column(name = "postYourAdDate")
	public Date getPostYourAdDate() {
		return postYourAdDate;
	}

	public void setPostYourAdDate(Date postYourAdDate) {
		this.postYourAdDate = postYourAdDate;
	}

	@Column(name = "userProfileModifiedName")
	public String getUserProfileModifiedName() {
		return userProfileModifiedName;
	}

	public void setUserProfileModifiedName(String userProfileModifiedName) {
		this.userProfileModifiedName = userProfileModifiedName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postYourAd", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<PostYourAdAttachments> getPostYourAdAttachments() {
		return postYourAdAttachments;
	}

	public void setPostYourAdAttachments(
			List<PostYourAdAttachments> postYourAdAttachments) {
		this.postYourAdAttachments = postYourAdAttachments;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postYourAd", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<PostYourAdComments> getPostYourAdComments() {
		return postYourAdComments;
	}

	public void setPostYourAdComments(
			List<PostYourAdComments> postYourAdComments) {
		this.postYourAdComments = postYourAdComments;
	}

	@Column(name = "userName")
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "title")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postYourAd", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<PostAdUserLikes> getPostAdUserLikes() {
		return postAdUserLikes;
	}

	public void setPostAdUserLikes(List<PostAdUserLikes> postAdUserLikes) {
		this.postAdUserLikes = postAdUserLikes;
	}
	
	

}
