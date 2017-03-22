package com.course.user.dao;

import com.course.entity.LoginUser;
import com.course.util.BaseDao;

public interface UserDao extends BaseDao<LoginUser>{

	public LoginUser findByAccountAndPass(String name, String password);
}
