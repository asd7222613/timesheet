package com.max.repository.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.max.base.BaseRepository;
import com.max.common.Pagination;
import com.max.domain.User;
import com.max.repository.UserRepository;

@Repository
public class UserRepositoryImpl implements UserRepository {
	
	@Autowired
	BaseRepository<User> baseRepository;
	
	@Override
	public User login(String userName, String userPassword) {
			return (User)baseRepository.getSession().createQuery("from User where userAccount=:userAccount and userPassword=:userPassword and isDelete=0")
							   		   .setParameter("userAccount", userName)
							   	       .setParameter("userPassword", userPassword)
							   	       .uniqueResult();
	}
	
	@Override
	public User findUser(String userName) {
		return (User)baseRepository.getSession().createQuery("from User where userAccount = :userAccount")
						   		   .setParameter("userAccount", userName)
						           .uniqueResult();
	}

	@Override
	public void saveUser(User user) {
		baseRepository.save(user);
	}

	@Override
	public int totalCount(Map<String, ?> variables) {
		StringBuffer sb = new StringBuffer("select count(*) from User where isDelete=0");
		if(variables.size() > 0) {
			sb.append(" and userAccount=:userAccount");
			sb.append(" or realName like :realName");
			sb.append(" or userEmail=:userEmail");
		}
		int totalCount = baseRepository.totalCount(sb.toString(), variables);
		
		return totalCount;
	}

	@Override
	public List<User> list(Pagination<User> pagination, Map<String, ?> variables) {
		StringBuffer sb = new StringBuffer("from User where isDelete=0");
		if(variables.size() > 0) {
			sb.append(" and userAccount=:userAccount");
			sb.append(" or realName like :realName");
			sb.append(" or userEmail=:userEmail");
		}
		
			sb.append(" order by createTime desc");
		
		return baseRepository.findHqlPage(pagination, sb.toString(), variables);
	}

	@Override
	public User findById(Long userId) {
		return baseRepository.find(User.class, userId);
	}

	@Override
	public void updateUser(User user) {
		baseRepository.update(user);
	}

	@Override
	public void deleteUser(User user) {
		baseRepository.delete(user);
	}
}
