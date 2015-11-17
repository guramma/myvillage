package com.ssis.village.dao;

import java.util.List;

import com.ssis.village.model.GkpBookRequests;
import com.ssis.village.model.PostYourAd;
import com.ssis.village.model.Users;

public interface GkpBookDao {
	
	public List<GkpBookRequests> getBookRequestByUserName(String email);
	public List<Users> getRequestedUsersLitByUserName(String email);
	public List<PostYourAd> getPostAds(String email);
	public List<String> getAllEmails(String email);
	public List<String> getAllFromEmails(String email);
	public Integer updateAccept(String userFromemail, String userToemail);
	public void rejectuserrequest(String userFromemail, String userToemail);

}
