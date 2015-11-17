package com.ssis.village.model;

import java.io.Serializable;
import java.util.ArrayList;
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
@Table(name = "Sarpanches")
public class Sarpanches implements Serializable {

	private Integer sarpanchId;
	private String sarpanchStartDate;
	private String sarpanchEndDate;
	private String sarpanchProfileModifiedName;
	private String sarpanchProfile;
	private String sarpanchName;
	private double totalUsersRating;
	private Integer totalPersons;
	private double totalRating;
	private String shortProfile;
	private List<SarpanchUserComments> comments = new ArrayList<SarpanchUserComments>();

	public Sarpanches(){
		
	}
	
	public Sarpanches(Integer sarpanchId) {
		super();
		this.sarpanchId = sarpanchId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sarpanchId")
	public Integer getSarpanchId() {
		return sarpanchId;
	}

	public void setSarpanchId(Integer sarpanchId) {
		this.sarpanchId = sarpanchId;
	}

	@Column(name = "sarpanchStartDate")
	public String getSarpanchStartDate() {
		return sarpanchStartDate;
	}

	public void setSarpanchStartDate(String sarpanchStartDate) {
		this.sarpanchStartDate = sarpanchStartDate;
	}

	@Column(name = "sarpanchEndDate")
	public String getSarpanchEndDate() {
		return sarpanchEndDate;
	}

	public void setSarpanchEndDate(String sarpanchEndDate) {
		this.sarpanchEndDate = sarpanchEndDate;
	}

	@Column(name = "sarpanchProfileModifiedName")
	public String getSarpanchProfileModifiedName() {
		return sarpanchProfileModifiedName;
	}

	public void setSarpanchProfileModifiedName(
			String sarpanchProfileModifiedName) {
		this.sarpanchProfileModifiedName = sarpanchProfileModifiedName;
	}

	@Column(name = "sarpanchProfile")
	public String getSarpanchProfile() {
		return sarpanchProfile;
	}

	public void setSarpanchProfile(String sarpanchProfile) {
		this.sarpanchProfile = sarpanchProfile;
	}

	@Column(name = "sarpanchName")
	public String getSarpanchName() {
		return sarpanchName;
	}

	public void setSarpanchName(String sarpanchName) {
		this.sarpanchName = sarpanchName;
	}

	@Column(name = "totalUsersRating")
	public double getTotalUsersRating() {
		return totalUsersRating;
	}

	public void setTotalUsersRating(double totalUsersRating) {
		this.totalUsersRating = totalUsersRating;
	}

	@Column(name = "totalPersons")
	public Integer getTotalPersons() {
		return totalPersons;
	}

	public void setTotalPersons(Integer totalPersons) {
		this.totalPersons = totalPersons;
	}

	@Column(name = "totalRating")
	public double getTotalRating() {
		return totalRating;
	}

	public void setTotalRating(double totalRating) {
		this.totalRating = totalRating;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sarpanches", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<SarpanchUserComments> getComments() {
		return comments;
	}

	public void setComments(List<SarpanchUserComments> comments) {
		this.comments = comments;
	}

	@Column(name = "shortProfile")
	public String getShortProfile() {
		return shortProfile;
	}

	public void setShortProfile(String shortProfile) {
		this.shortProfile = shortProfile;
	}
	
	

}
