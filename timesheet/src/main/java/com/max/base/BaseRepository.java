package com.max.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.max.common.Pagination;

public interface BaseRepository<T> {

	public T find(Class<T> theClass,  Long id);

	public T find(T example);
	public T find(String hql, Object... values);

	public List<T> findAll(T example);
	public List<T> findAllHql(String hql, Map<String, ?> values);
	public List<T> findAllHql(String hql, Object... values);

	public void saveOrUpdate(T t);

	public void save(T t);

	public void update(T t);

	public void delete(T t);
	
	public List<T> findHqlPage(Pagination<T> page, String hql, Map<String, ?> values);
	
	public Session getSession();
	
	public int totalCount(String hql, Map<String, ?> values);

}
