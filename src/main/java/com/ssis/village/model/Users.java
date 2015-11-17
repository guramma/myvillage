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
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("serial")
@Entity
@Table(name = "users")
public class Users implements Serializable {
	private Integer userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private boolean enabled;
	private String authority;
	private Date createdDate;
	private String userProfileModifiedName;
	private String userProfileBackgroundModifiedName;
	private String phoneNumber;
	private String dateofBirth;
	private String country;
	private String state;
	private String city;
	private String zipcode;
	private String address1;
	private String address2;
	private MultipartFile file;
	private MultipartFile file1;
	private String gender;
	private String userProfile;
	private Date requestedDate;
	private boolean status;
	private Integer bookRequestId;

	private List<Festivals> festivals = new ArrayList<Festivals>();

	public Users() {

	}

	public Users(Integer userId) {
		super();
		this.userId = userId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "userId")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "enabled")
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Column(name = "authority")
	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Column(name = "createdDate")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "users", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<Festivals> getFestivals() {
		return festivals;
	}

	public void setFestivals(List<Festivals> festivals) {
		this.festivals = festivals;
	}

	@Column(name = "userProfileModifiedName")
	public String getUserProfileModifiedName() {
		return userProfileModifiedName;
	}

	public void setUserProfileModifiedName(String userProfileModifiedName) {
		this.userProfileModifiedName = userProfileModifiedName;
	}

	@Column(name = "firstName")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "lastName")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Column(name = "phoneNumber")
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	@Column(name = "dateofBirth")
	public String getDateofBirth() {
		return dateofBirth;
	}

	public void setDateofBirth(String dateofBirth) {
		this.dateofBirth = dateofBirth;
	}

	@Column(name = "country")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "state")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "zipcode")
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	@Column(name = "address1")
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	@Column(name = "address2")
	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	@Transient
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Column(name = "gender")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "userProfile")
	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	@Transient
	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	@Transient
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Transient
	public Integer getBookRequestId() {
		return bookRequestId;
	}

	public void setBookRequestId(Integer bookRequestId) {
		this.bookRequestId = bookRequestId;
	}

	@Transient
	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	@Column(name = "userProfileBackgroundModifiedName")
	public String getUserProfileBackgroundModifiedName() {
		return userProfileBackgroundModifiedName;
	}

	public void setUserProfileBackgroundModifiedName(
			String userProfileBackgroundModifiedName) {
		this.userProfileBackgroundModifiedName = userProfileBackgroundModifiedName;
	}
	
	
	
	

}
