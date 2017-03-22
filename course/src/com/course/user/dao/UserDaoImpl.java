package com.course.user.dao;

import org.hibernate.query.Query;

import com.course.entity.LoginUser;
import com.course.util.BaseDaoImpl;

public class UserDaoImpl extends BaseDaoImpl<LoginUser> implements UserDao {

	@Override
	public LoginUser findByAccountAndPass(String name, String password) {
		String hql = "from LoginUser where loginName = ? and password = ?";
		Query query = currentSession().createQuery(hql);
		query.setParameter(0, name);
		query.setParameter(1, password);
		return (LoginUser) query.uniqueResult();
	}
}
