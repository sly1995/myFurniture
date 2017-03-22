package com.course.menu.service;

import java.util.List;

import com.course.entity.Menu;
import com.course.util.BaseService;

public interface MenuService extends BaseService<Menu>{

		//查找所有父菜单
		public List<Menu> findAllParent();
		
		//查询所有子菜单
		public List<Menu> findBesidesParent();
}
