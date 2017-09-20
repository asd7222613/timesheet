package com.max.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.max.common.Pagination;

@Repository
public class HibernateBaseRepository<T> implements BaseRepository<T> {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public T find(Class<T> theClass, Long id) {
		return (T) this.getSession().get(theClass, id);
	}

	@Override
	public T find(T example) {
		List<T> results = this.getSession().createCriteria(example.getClass())
				.add(Example.create(example)).list();

		if (results.size() > 0) {
			return results.get(0);
		}
		
		return null;
	}

	@Override
	public T find(String hql, Object... values) {
		Query query = this.getSession().createQuery(hql);
		query = setParameters(query, values);
		List<T> results = query.list();
		if (results.size() > 0) {
			return results.get(0);
		}
		return null;
	}

	@Override
	public List<T> findAll(T example) {
		List<T> results = this.getSession().createCriteria(example.getClass())
				.add(Example.create(example)).list();
		
		return results;
	}

	@Override
	public List<T> findAllHql(String hql, Map<String, ?> values) {
		Query query = this.getSession().createQuery(hql);
		query = setParameters(query, values);
		return query.list();
	}
	
	@Override
	public List<T> findHqlPage(Pagination<T> page, String hql, Map<String, ?> values) {
		Query query = this.getSession().createQuery(hql);
		query = setParameters(query, values);
		query.setFirstResult((page.getCurrentPage() - 1) * page.getPageSize())
			 .setMaxResults(page.getPageSize());
		
		return query.list();
	}
	
	@Override
	public int totalCount(String hql, Map<String, ?> values) {
		Query query = this.getSession().createQuery(hql);
		query = setParameters(query, values);
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public List<T> findAllHql(String hql, Object... values) {
		Query query = this.getSession().createQuery(hql);
		query = setParameters(query, values);
		return query.list();
	}

	@Override
	public void saveOrUpdate(T t) {
		this.getSession().saveOrUpdate(t);
	}

	@Override
	public void save(T t) {
		this.getSession().saveOrUpdate(t);
	}

	@Override
	public void update(T t) {
		this.getSession().saveOrUpdate(t);
	}

	@Override
	public void delete(T t) {
		this.getSession().delete(t);
	}
	
	protected Query setParameters(Query query, Object... values) {
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				query.setParameter(i, values[i]);
			}
		}
		return query;
	}

	protected Query setParameters(Query query, Map<String, ?> values) {
		if (values != null)
			query.setProperties(values);

		return query;
	}


	@Override
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

}
