package com.course.product.service;

import java.util.List;

import com.course.entity.Product;
import com.course.util.BaseService;
import com.course.util.Page;

public interface ProductService extends BaseService<Product> {

	//分页数据
	public List<Product> pageList(Integer currentPage, int i);
	
	//根据关键字搜索
	public List<Product> doSearch(String searchName);
	
	//封装页面
	public Page<Product> createPage(List<?> list, Integer currentPage, int i);
}
