package com.ssis.village.service;

import com.ssis.village.dto.PasswordDto;
import com.ssis.village.model.Users;

public interface UserService {

	public Integer updateUserProfile(Users users);
	public Integer updateUserPassword(PasswordDto passwordDto);

}
