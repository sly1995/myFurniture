package com.course.menu.dao;

import java.util.List;

import com.course.entity.Menu;
import com.course.util.BaseDao;

public interface MenuDao extends BaseDao<Menu> {

	//查找所有父菜单 
	public List<Menu> findAllParent();
	
	//查找所有子菜单
	public List<Menu> findBesidesParent();
}
