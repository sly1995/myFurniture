package com.course.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.course.entity.LoginUser;
import com.course.user.dao.UserDao;
import com.course.util.BaseServiceImpl;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<LoginUser> implements UserService {
	
	private UserDao userDao;
	@Resource
	public void setUserDao(UserDao userDao) {
		super.setBaseDao(userDao);
		this.userDao = userDao;
	}

	@Override
	public LoginUser login(String name, String password) {
		return userDao.findByAccountAndPass(name,password);
	}
}
