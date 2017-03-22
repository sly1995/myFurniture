package com.course.util;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
	
	//save
	public void save(T object);
	
	//update
	public void update(T object);
	
	//deleteById
	public void deleteById(Serializable id);
	
	//findAll
	public List<T> findAll();
	
	//findById
	public T findById(Serializable id);
}
