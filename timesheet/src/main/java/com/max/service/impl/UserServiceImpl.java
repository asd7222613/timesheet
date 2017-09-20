package com.max.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.max.common.Pagination;
import com.max.domain.Role;
import com.max.domain.User;
import com.max.repository.RoleRepository;
import com.max.repository.UserRepository;
import com.max.service.UserService;

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepository;

	@Override
	public User login(String userName, String userPassword) {
		return userRepository.login(userName, userPassword);
	}
	
	@Override
	public void list(Pagination<User> pagination, String condition) {
		Map<String, Object> variables = new HashMap<String, Object>();
		if(condition != null && !"".equals(condition)) {
			variables.put("userAccount", condition);
			variables.put("realName", "%" + condition + "%");
			variables.put("userEmail", condition);
		}
		
		int totalCount = userRepository.totalCount(variables);
		pagination.setTotalCount(totalCount);
		List<User> result = userRepository.list(pagination, variables);
		for(User user : result) {
			String roleNames = "";
			for(Role role : user.getRoles()) {
				roleNames += role.getRoleName() + ",";
			}
			
			user.setRoleNames(roleNames.substring(0, roleNames.length() - 1));
		}
		pagination.setResult(result);
	}

	@Transactional
	public void save(User user, Long roleId) {
		user.setCreateUser((User)SecurityUtils.getSubject().getSession().getAttribute("currentUser"));
		user.setCreateTime(new Date());
		
		Role role = new Role();
		role.setId(roleId);
		user.getRoles().add(role);
		
		userRepository.saveUser(user);
	}

	@Override
	public User findById(Long userId) {
		return userRepository.findById(userId);
	}

	@Transactional
	public boolean update(User user) {
		try {
			User currentUser = userRepository.findById(user.getId());
			//update user
			currentUser.setRealName(user.getRealName());
			if(user.getUserPassword() != null && !"".equals(user.getUserPassword())) {
				currentUser.setUserPassword(user.getUserPassword());
			}
			currentUser.setUserEmail(user.getUserEmail());
			userRepository.updateUser(currentUser);
			
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}

	@Transactional
	public boolean delete(User user) {
		try {
			userRepository.deleteUser(user);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
