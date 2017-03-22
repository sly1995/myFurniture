package com.course.user.service;

import com.course.entity.LoginUser;
import com.course.util.BaseService;

public interface UserService extends BaseService<LoginUser> {

	//login
	public LoginUser login(String name, String password);
}
