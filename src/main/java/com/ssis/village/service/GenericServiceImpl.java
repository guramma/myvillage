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

import com.ssis.village.dao.GenericDao;
import com.ssis.village.model.Student;
import com.ssis.village.model.Users;

@Service
@Transactional
public class GenericServiceImpl implements GenericService {

	@Autowired
	protected GenericDao genericDao;
	
	@Autowired
	protected UploadPathService uploadPathService;

	@Override
	public <T> List<T> getAll(Class<T> type) {
		return genericDao.getAll(type);
	}

	@Override
	public <T> T getUserByName(Class<T> type, String email) {
		return genericDao.getUserByName(type,email);
	}

	@Override
	public <T> Integer save(final T type) {
		return genericDao.save(type);
		
	}

	@Override
	public <T> List<T> getDetailsById(Class<T> type, Integer userId,String parameter) {
		return genericDao.getDetailsById(type,userId,parameter);
	}

	@Override
	public <T> T getInfoById(Class<T> type, Integer userId, String parameter) {
		return genericDao.getInfoById(type,userId,parameter);
	}

	@Override
	public <T> void delete(Class<T> type, Integer id) {
		genericDao.delete(type,id);
	}

	@Override
	public <T> List<T> getAllByOrder(Class<T> type, String parameter) {
		return genericDao.getAllByOrder(type,parameter);
	}

	@Override
	public <T> List<T> getOrderDetailsById(Class<T> type, Integer userId,String parameter, String orderParameter) {
		return genericDao.getOrderDetailsById(type,userId,parameter,orderParameter);
	}

	@Override
	public Integer saveUserDetails(Users users) {
		if(users!=null){
			try {
				if(users.getFile()!=null && users.getFile().getBytes()!=null && StringUtils.hasText(users.getFile().getOriginalFilename())){
					String imageName = users.getFile().getOriginalFilename();
					String modifiedImageName  = FilenameUtils.getBaseName(imageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(imageName);
					File file = uploadPathService.getFilesPath(modifiedImageName,"userProfiles");
					if(file!=null){
						FileUtils.writeByteArrayToFile(file, users.getFile().getBytes());
					}
					users.setUserProfileModifiedName(modifiedImageName);
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
					users.setUserProfileBackgroundModifiedName(modifiedBackgroundImageName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
		
		users.setAuthority("ROLE_USER");
		users.setEnabled(true);
		users.setCreatedDate(new Date());
		return genericDao.save(users);
	}

	@Override
	public <T> List<T> getDetailsByEmail(Class<T> type, String email,String parameter) {
		return genericDao.getDetailsByEmail(type, email, parameter);
	}

	@Override
	public Integer saveStudentDetails(Student student) {
		if(student!=null){
			try {
				if(student.getFile()!=null && student.getFile().getBytes()!=null && StringUtils.hasText(student.getFile().getOriginalFilename())){
					String imageName = student.getFile().getOriginalFilename();
					String modifiedImageName  = FilenameUtils.getBaseName(imageName)+"_"+System.currentTimeMillis()+"."+FilenameUtils.getExtension(imageName);
					File file = uploadPathService.getFilesPath(modifiedImageName,"userProfiles/student");
					if(file!=null){
						FileUtils.writeByteArrayToFile(file, student.getFile().getBytes());
					}
					student.setUserProfileModifiedName(modifiedImageName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
		
		student.setAuthority("ROLE_STUDENT");
		student.setEnabled(true);
		student.setCreatedDate(new Date());
		return genericDao.save(student);
	}

}
