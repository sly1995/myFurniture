package com.course.rolepower.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.course.entity.Power;
import com.course.rolepower.dao.PowerDao;
import com.course.util.BaseServiceImpl;

@Service("powerService")
public class PowerServiceImpl extends BaseServiceImpl<Power> implements PowerService {


	private PowerDao powerDao;
	@Resource
	public void setPowerDao(PowerDao powerDao) {
		super.setBaseDao(powerDao);
		this.powerDao = powerDao;
	}

}
