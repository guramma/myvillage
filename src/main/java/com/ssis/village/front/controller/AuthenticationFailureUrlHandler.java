package com.ssis.village.front.controller;

import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.stereotype.Component;

import com.ssis.village.common.CommonController;

@Component
public class AuthenticationFailureUrlHandler extends CommonController implements ApplicationListener<AuthenticationFailureBadCredentialsEvent>{

	@Override
	public void onApplicationEvent(AuthenticationFailureBadCredentialsEvent event) {
		Object userName = event.getAuthentication().getPrincipal();
        Object credentials = event.getAuthentication().getCredentials();
        System.out.println("Failed login using USERNAME [" + userName + "]");
        System.out.println("Failed login using PASSWORD [" + credentials + "]");
	}

}
