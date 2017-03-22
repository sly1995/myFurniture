package com.course.menu.dao;

import java.util.List;

import com.course.entity.Menu;
import com.course.util.BaseDaoImpl;

public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao {

	@Override
	public List<Menu> findAllParent() {
		String hql = "from Menu where parentMenu is null";
		return (List<Menu>)currentSession().createQuery(hql).getResultList();
	}

	@Override
	public List<Menu> findBesidesParent() {
		String hql = "from Menu where parentMenu is not null";
		return (List<Menu>)currentSession().createQuery(hql).getResultList();
	}
}
