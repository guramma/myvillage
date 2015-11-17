package com.ssis.village.dao;

import com.ssis.village.dto.PasswordDto;
import com.ssis.village.model.Users;

public interface UserDao {

	public Integer updateUserProfile(Users users);
	public Integer updateUserPassword(PasswordDto passwordDto);

}
