package com.max.repository;

import java.util.List;

import com.max.common.Pagination;
import com.max.domain.Role;

public interface RoleRepository{

	//查询数据总条数
	public int totalCount(String roleName);
	
	//分页查询角色
	public List<Role> findAll(Pagination<Role> pagination, String roleName);
	
	//查询所有角色
	public List<Role> findAll();
	
	//根据name查询角色
	public Role findRoleByName(String roleName);
	
	//根据id查询角色
	public Role findById(Long roleId);
	
	//添加角色
	public void addRole(Role role);
	
	//删除角色
	public void deleteRole(Role role);
	
	//更新角色
	public void updateRole(Role role);
	
	//保存用户权限
	public void savePermissions(String[] ids, String roleId);
	
	//删除所有权限
	public void deletePermissions(String roleId);
}
