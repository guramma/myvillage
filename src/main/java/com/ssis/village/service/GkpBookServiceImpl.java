package com.ssis.village.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ssis.village.dao.GenericDao;
import com.ssis.village.dao.GkpBookDao;
import com.ssis.village.dto.PostYourAdsDto;
import com.ssis.village.model.GkpBookRequests;
import com.ssis.village.model.PostYourAd;
import com.ssis.village.model.PostYourAdAttachments;
import com.ssis.village.model.Users;

@Service
@Transactional
public class GkpBookServiceImpl implements GkpBookService {
	
	@Autowired public GkpBookDao gkpBookDao;
	@Autowired public UploadPathService uploadPathService;
	@Autowired public GenericDao genericDao;

	@Override
	public List<GkpBookRequests> getBookRequestByUserName(String email) {
		return gkpBookDao.getBookRequestByUserName(email);
	}

	@Override
	public List<Users> getRequestedUsersLitByUserName(String email) {
		return gkpBookDao.getRequestedUsersLitByUserName(email);
	}

	@Override
	public Integer savePostYourAd(PostYourAdsDto postYourAdsDto, Users user) {
		Integer result = null;	
		if(user!=null){
			PostYourAd postYourAd = new PostYourAd();
			postYourAd.setPostYourAdDate(new Date());
			postYourAd.setSenderEmail(user.getEmail());
			postYourAd.setTitle(postYourAdsDto.getTitles());
			postYourAd.setUserName(user.getFirstName()+" "+user.getLastName());
			postYourAd.setUserProfileModifiedName(user.getUserProfileModifiedName());
			 result = genericDao.save(postYourAd);
			if(result!=null){
				if(postYourAdsDto!=null && postYourAdsDto.getFiles()!=null && postYourAdsDto.getFiles().size()>0){
					for(MultipartFile file : postYourAdsDto.getFiles()){
						PostYourAdAttachments postYourAdAttachments = new PostYourAdAttachments();
						try {
							if(file!=null && file.getBytes()!=null && StringUtils.hasText(file.getOriginalFilename())){
								String fileName = file.getOriginalFilename();
								String modifiedImageName  = FilenameUtils.getBaseName(fileName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(fileName);
								File fileinfo = uploadPathService.getFilesPath(modifiedImageName,"postAds");
								if(fileinfo!=null){
									FileUtils.writeByteArrayToFile(fileinfo, file.getBytes());
								}
								postYourAdAttachments.setAdFileModifiedName(modifiedImageName);
								postYourAdAttachments.setAdFileName(fileName);
								postYourAdAttachments.setPostYourAd(new PostYourAd(result));
								genericDao.save(postYourAdAttachments);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		return result;
	}

	@Override
	public List<PostYourAd> getPostAds(String email) {
		return gkpBookDao.getPostAds(email);
	}

	@Override
	public List<String> getAllEmails(String email) {
		return gkpBookDao.getAllEmails(email);
	}

	@Override
	public List<String> getAllFromEmails(String email) {
		return gkpBookDao.getAllFromEmails(email);
	}

	@Override
	public Integer updateAccept(String userFromemail, String userToemail) {
		return gkpBookDao.updateAccept(userFromemail,userToemail);
	}

	@Override
	public void rejectuserrequest(String userFromemail, String userToemail) {
		gkpBookDao.rejectuserrequest(userFromemail,userToemail);
	}

}
