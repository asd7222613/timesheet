package com.max.repository;

import java.util.List;
import java.util.Map;

import com.max.common.Pagination;
import com.max.domain.User;

public interface UserRepository {
	
	//用户登录
	public User login(String userName, String userPassword);
	
	//查询数据总条数
	public int totalCount(Map<String, ?> variables);
	
	//用户分页查询
	public List<User> list(Pagination<User> pagination, Map<String, ?> variables);

	//根据用户名查询用户
	public User findUser(String userName);
	
	//用户保存
	public void saveUser(User user);
	
	//用户更新
	public void updateUser(User user);
	
	//用户删除
	public void deleteUser(User user);
	
	//根据id查询用户
	public User findById(Long userId);
}
