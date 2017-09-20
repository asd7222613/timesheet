package com.max.repository.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.max.base.BaseRepository;
import com.max.common.Pagination;
import com.max.domain.Role;
import com.max.repository.RoleRepository;

@Repository
public class RoleRepositoryImpl implements RoleRepository {

	@Autowired
	BaseRepository<Role> baseRepository;
	
	@Override
	public int totalCount(String roleName) {
		String hql = "select count(*) from Role";
		if(roleName != null && !"".equals(roleName)) {
			hql += " where roleName like '%" + roleName + "%'";
		}
		return ((Long)baseRepository.getSession().createQuery(hql)
								    .uniqueResult()).intValue();
	}

	@Override
	public List<Role> findAll(Pagination<Role> pagination, String roleName) {
		String hql = "from Role where";
		if(roleName != null && !"".equals(roleName)) {
			hql += " roleName like '%" + roleName + "%' and";
		}
		
		hql += " isDelete=0 order by createTime desc";
		return baseRepository.getSession().createQuery(hql)
					.setFirstResult((pagination.getCurrentPage() - 1) * pagination.getPageSize())
					.setMaxResults(pagination.getPageSize())
					.list();
	}

	@Override
	public void savePermissions(String[] ids, String roleId) {
		if(ids != null && ids.length > 0) {
			for(int i = 0; i < ids.length; i++) {
				baseRepository.getSession().createSQLQuery("insert into t_role_menu(roleid,menuid) values(:roleId,:menuId)")
										   .setParameter("roleId", roleId)
										   .setParameter("menuId", ids[i])
										   .executeUpdate();
			}
			
			baseRepository.getSession().flush();
		}
	}

	@Override
	public void deletePermissions(String roleId) {
		baseRepository.getSession().createSQLQuery("delete from t_role_menu where roleid=:roleId")
								   .setParameter("roleId", roleId)
								   .executeUpdate();
	}

	@Override
	public void addRole(Role role) {
		baseRepository.save(role);
	}

	@Override
	public Role findById(Long roleId) {
		return (Role)baseRepository.find(Role.class, roleId);
	}

	@Override
	public void updateRole(Role role) {
		baseRepository.update(role);
	}

	@Override
	public void deleteRole(Role role) {
		baseRepository.delete(role);
	}

	@Override
	public List<Role> findAll() {
		return baseRepository.findAll(new Role());
	}

	@Override
	public Role findRoleByName(String roleName) {
		return (Role)baseRepository.getSession().createQuery("from Role where roleName=:roleName and isDelete=0")
							 .setParameter("roleName", roleName)
							 .uniqueResult();
	}		
}
