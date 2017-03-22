package com.course.util;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

public abstract class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {
	
	//声明泛型， Class<T>代表这个类型所对应的类
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")  //消除方法BaseDaoImpl()的编译器安全警告
	public BaseDaoImpl() {
		ParameterizedType pt = (ParameterizedType)this.getClass().getGenericSuperclass();
		 clazz = (Class<T>)pt.getActualTypeArguments()[0];
	}

	@Override
	public void save(T object) {
		getHibernateTemplate().save(object);
	}

	@Override
	public void update(T object) {
		getHibernateTemplate().update(object);
	}

	@Override
	public void deleteById(Serializable id) {
		T t = findById(id);
		if(t !=null ){
			getHibernateTemplate().delete(t);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		return currentSession().createQuery("from "+clazz.getSimpleName()).getResultList();
	}

	//Serializable:让对象有个唯一标识，以便序列化和反序列化保持版本一致
	@Override
	public T findById(Serializable id) {
		return getHibernateTemplate().get(clazz,id);
	}
}
