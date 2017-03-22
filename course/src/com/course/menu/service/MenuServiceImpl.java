package com.course.menu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.course.entity.Menu;
import com.course.menu.dao.MenuDao;
import com.course.util.BaseServiceImpl;

@Service("menuService")
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService {

	private MenuDao menuDao;
	@Resource  //依赖注入bean
	public void setMenuDao(MenuDao menuDao) {
		super.setBaseDao(menuDao);
		this.menuDao = menuDao;
	}

	@Override
	public List<Menu> findAllParent() {
		return menuDao.findAllParent();
	}

	@Override
	public List<Menu> findBesidesParent() {
		return menuDao.findBesidesParent();
	}
}
