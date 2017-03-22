package com.course.rolepower.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.course.entity.Role;
import com.course.rolepower.dao.RoleDao;
import com.course.util.BaseServiceImpl;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
	
	private RoleDao roleDao;
	@Resource
	public void setRoleDao(RoleDao roleDao) {
		super.setBaseDao(roleDao);
		this.roleDao = roleDao;
	}
}
