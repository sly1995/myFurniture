package com.course.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.course.entity.Product;
import com.course.product.dao.ProductDao;
import com.course.util.BaseServiceImpl;
import com.course.util.Page;

@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService {

	private ProductDao productDao;
	@Resource
	public void setProductDao(ProductDao productDao) {
		super.setBaseDao(productDao);
		this.productDao = productDao;
	}
	@Override
	public List<Product> pageList(Integer currentPage, int i) {
		return productDao.pageList(currentPage,i);
	}
	@Override
	public List<Product> doSearch(String searchName) {
		return productDao.findBysearchName(searchName);
	}
	@Override
	public Page<Product> createPage(List list, Integer currentPage, int i) {
		Page<Product> page = new Page<Product>(currentPage,i);
		if (list!=null) {
			page.setTotalCount(list.size());
			page.setList(list);
			return page;
		}
		list = findAll();
		page.setTotalCount(list.size());
		page.setList(pageList(currentPage, i));
		return page;
	}
	
	

}
