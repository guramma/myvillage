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
@Table(name="PostYourAdAttachments")
public class PostYourAdAttachments implements Serializable {

	private Integer attachmentId;
	private String adFileName;
	private String adFileModifiedName;
	private PostYourAd postYourAd;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="attachmentId")
	public Integer getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Integer attachmentId) {
		this.attachmentId = attachmentId;
	}

	@Column(name="adFileName")
	public String getAdFileName() {
		return adFileName;
	}

	public void setAdFileName(String adFileName) {
		this.adFileName = adFileName;
	}

	@Column(name="adFileModifiedName")
	public String getAdFileModifiedName() {
		return adFileModifiedName;
	}

	public void setAdFileModifiedName(String adFileModifiedName) {
		this.adFileModifiedName = adFileModifiedName;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="postYourAdId")
	public PostYourAd getPostYourAd() {
		return postYourAd;
	}

	public void setPostYourAd(PostYourAd postYourAd) {
		this.postYourAd = postYourAd;
	}

}
