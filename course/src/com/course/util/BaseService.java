package com.course.util;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T> {
	//新增
	public void save(T entity);
	
	//更新
	public void update(T entity);
	
	//根据id删除
	public void deleteById(Serializable id);
	
	//根据id查找
	public T findById(Serializable id);
	
	//查找列表
	public List<T> findAll();
}
