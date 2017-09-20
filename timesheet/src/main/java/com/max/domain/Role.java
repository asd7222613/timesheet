package com.max.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

/**
 * 角色实体类
 * 
 * @author MADMAX
 *
 */
@Entity
@Table(name = "t_role")
public class Role implements Serializable {

	private static final long serialVersionUID = -678572234809539027L;

	@Expose
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Expose
	@Column(name = "rolename")
	private String roleName;
	@Expose
	@Column(name = "roledesc")
	private String roleDesc;
	@Expose
	@Column(name = "isdelete")
	private byte isDelete;
	@Expose
	@Column(name = "createtime")
	private Date createTime;
	
	@OneToOne
	@JoinColumn(name="createuser")
	private User createUser;
	@Column(name = "updatetime")
	private Date updateTime;
	@OneToOne
	@JoinColumn(name="updateuser")
	private User updateUser;
	@ManyToMany
	@JoinTable(name = "t_role_menu",joinColumns= {@JoinColumn(name = "roleid")}, inverseJoinColumns = { @JoinColumn(name = "menuid")})
	@OrderBy("level")
	private Set<Menu> menus = new HashSet<Menu>(0);
	
	@ManyToMany(cascade=CascadeType.PERSIST)
	@JoinTable(name = "t_role_user",joinColumns= {@JoinColumn(name = "roleid")}, inverseJoinColumns = { @JoinColumn(name = "userid")})
	private List<User> users = new ArrayList<User>(0);

	public Role() {
	}

	public Role(Long id, String roleName, String roleDesc, byte isDelete, Date createTime, User createUser,
			Date updateTime, User updateUser) {
		this.id = id;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.isDelete = isDelete;
		this.createTime = createTime;
		this.createUser = createUser;
		this.updateTime = updateTime;
		this.updateUser = updateUser;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	public byte getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(byte isDelete) {
		this.isDelete = isDelete;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public User getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}

	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
}
