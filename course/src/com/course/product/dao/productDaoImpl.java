package com.course.product.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.course.entity.Product;
import com.course.util.BaseDaoImpl;

public class productDaoImpl extends BaseDaoImpl<Product> implements ProductDao {

	@Override 
	public List<Product> pageList(Integer currentPage, int i) {
		String hql = "from Product";
		Query query = currentSession().createQuery(hql);
		query.setFirstResult((currentPage-1)*i);
		query.setMaxResults(i);
		return query.getResultList();
	}

	@Override
	public List<Product> findBysearchName(String searchName) {
		String hql = "from Product where productName like ?";
		Query query = currentSession().createQuery(hql);
		query.setParameter(0, "%"+searchName+"%");
		return query.getResultList();
	}
}
