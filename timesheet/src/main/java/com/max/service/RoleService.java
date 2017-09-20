package com.max.service;


import java.util.List;

import com.max.common.Pagination;
import com.max.domain.Role;

public interface RoleService {

	//查询分页所有角色
	public void list(Pagination<Role> pagination, String roleName);
	
	//查询所有角色
	public List<Role> findAll();
	
	//根据name查询角色
	public Role findRoleByName(String roleName);
	
	//添加角色权限
	public boolean savePermissions(String ids, String roleId);
	
	//添加角色
	public void addRole(Role role);
	
	//更新角色
	public boolean updateRole(Role role);
	
	//删除角色
	public boolean deleteRole(Role role);
	
	//根据id查询角色
	public Role findById(Long roleId);
}
