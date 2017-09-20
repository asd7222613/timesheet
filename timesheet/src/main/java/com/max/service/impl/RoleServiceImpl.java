package com.max.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.max.common.Pagination;
import com.max.domain.Role;
import com.max.domain.User;
import com.max.repository.RoleRepository;
import com.max.service.RoleService;

@Service
@Transactional(readOnly = true)
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleRepository roleRepository;
	
	@Override
	public void list(Pagination<Role> pagination, String roleName) {
		//查询总条数
		int totalCount = roleRepository.totalCount(roleName);
		pagination.setTotalCount(totalCount);
		//查询分页数据
		List<Role> result = roleRepository.findAll(pagination, roleName);
		pagination.setResult(result);
	}

	@Transactional
	public boolean savePermissions(String ids, String roleId) {
		try {
			String[] menuIds = ids.split(",");
			//先删除角色现有权限
			roleRepository.deletePermissions(roleId);
			//添加新的权限
			roleRepository.savePermissions(menuIds, roleId);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Transactional
	public void addRole(Role role) {
		role.setCreateUser((User)SecurityUtils.getSubject().getSession().getAttribute("currentUser"));
		role.setCreateTime(new Date());
		roleRepository.addRole(role);
	}

	@Override
	public Role findById(Long roleId) {
		return roleRepository.findById(roleId);
	}

	@Transactional
	public boolean updateRole(Role role) {
		try {
			Role currentRole = roleRepository.findById(role.getId());
			
			currentRole.setRoleName(role.getRoleName());
			currentRole.setRoleDesc(role.getRoleDesc());
			currentRole.setUpdateTime(new Date());
			currentRole.setUpdateUser((User)SecurityUtils.getSubject().getSession().getAttribute("currentUser"));
			
			roleRepository.updateRole(currentRole);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Transactional
	public boolean deleteRole(Role role) {
		try {
			roleRepository.deleteRole(role);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}

	@Override
	public List<Role> findAll() {
		try {
			return roleRepository.findAll();
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Role findRoleByName(String roleName) {
		try {
			return roleRepository.findRoleByName(roleName);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
