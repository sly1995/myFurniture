package com.course.product.dao;

import java.util.List;

import com.course.entity.Product;
import com.course.util.BaseDao;

public interface ProductDao extends BaseDao<Product> {
	
	//分页
	public List<Product> pageList(Integer currentPage, int i);
	
	//模糊查询
	public List<Product> findBysearchName(String searchName);
}
