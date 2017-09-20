package com.max.service;

import java.util.Map;

import com.max.common.Pagination;
import com.max.domain.User;

public interface UserService {

	//用户登录
	public User login(String userName, String userPassword);
	
	//用户查询
	public void list(Pagination<User> pagination, String condition);
	
	//用户保存
	public void save(User user, Long roleId);
	
	//用户更新
	public boolean update(User user);
	
	//用户删除
	public boolean delete(User user);
	
	//根据id查询用户
	public User findById(Long userId);
}
