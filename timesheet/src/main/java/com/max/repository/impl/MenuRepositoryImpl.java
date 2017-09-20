package com.max.repository.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.max.domain.Menu;
import com.max.repository.MenuRepository;

@Repository
public class MenuRepositoryImpl implements MenuRepository {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Menu> list() {		
		return sessionFactory.getCurrentSession()
					.createQuery("from Menu where parentid=0")
					.list();
	}

}
