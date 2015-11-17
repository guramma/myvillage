package com.ssis.village.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.ssis.village.dao.GenericDao;
import com.ssis.village.dao.UserDao;
import com.ssis.village.dto.PasswordDto;
import com.ssis.village.model.Users;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	public UserDao userDao;
	@Autowired
	public UploadPathService uploadPathService;
	@Autowired
	public GenericDao genericDao;
	@Autowired
	public ServletContext context;

	@Override
	public Integer updateUserProfile(Users users) {
		Users user = genericDao.getInfoById(Users.class, users.getUserId(), "userId");
		if(users!=null){
			try {
				if(users.getFile()!=null && users.getFile().getBytes()!=null && StringUtils.hasText(users.getFile().getOriginalFilename())){
					String imageName = users.getFile().getOriginalFilename();
					String modifiedImageName  = FilenameUtils.getBaseName(imageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(imageName);
					File file = uploadPathService.getFilesPath(modifiedImageName,"userProfiles");
					if(file!=null){
						FileUtils.writeByteArrayToFile(file, users.getFile().getBytes());
					}
					File filePath = new File(context.getRealPath("/userProfiles/"+user.getUserProfileModifiedName()));
					if(filePath.exists()){
						filePath.delete();
					}
					users.setUserProfileModifiedName(modifiedImageName);
				}else{
					users.setUserProfileModifiedName(user.getUserProfileModifiedName());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
		
		if(users!=null){
			try {
				if(users.getFile1()!=null && users.getFile1().getBytes()!=null && StringUtils.hasText(users.getFile1().getOriginalFilename())){
					String backgroundImageName = users.getFile1().getOriginalFilename();
					String modifiedBackgroundImageName  = FilenameUtils.getBaseName(backgroundImageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(backgroundImageName);
					File file = uploadPathService.getFilesPath(modifiedBackgroundImageName,"userProfiles");
					if(file!=null){
						FileUtils.writeByteArrayToFile(file, users.getFile1().getBytes());
					}
					File filePath = new File(context.getRealPath("/userProfiles/"+user.getUserProfileBackgroundModifiedName()));
					if(filePath.exists()){
						filePath.delete();
					}
					users.setUserProfileBackgroundModifiedName(modifiedBackgroundImageName);
				}else{
					users.setUserProfileBackgroundModifiedName(user.getUserProfileBackgroundModifiedName());
				}
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
		
		return userDao.updateUserProfile(users);
	}

	@Override
	public Integer updateUserPassword(PasswordDto passwordDto) {
		return userDao.updateUserPassword(passwordDto);
	}

}
