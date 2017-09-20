package com.max.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
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
import javax.persistence.Table;
import javax.persistence.Transient;

import com.google.gson.annotations.Expose;

/**
 * 用户实体类
 * 
 * @author MADMAX
 *
 */

@Entity
@Table(name = "t_user")
public class User implements Serializable {
	
	private static final long serialVersionUID = -2716100238593533645L;
	
	@Expose
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Expose
	@Column(name = "useraccount")
	private String userAccount;
	@Expose
	@Column(name = "userpassword")
	private String userPassword;
	@Expose
	@Column(name = "realname")
	private String realName;
	@Expose
	@Column(name = "useremail")
	private String userEmail;
	@Expose
	@Column(name = "usertel")
	private String userTel;
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
	
	@ManyToMany(cascade=CascadeType.PERSIST)
	@JoinTable(name = "t_role_user",joinColumns= {@JoinColumn(name = "userid")}, inverseJoinColumns = { @JoinColumn(name = "roleid")})
	private Set<Role> roles = new HashSet<Role>();
	
	@Transient
	private String roleNames;
	
	public User() {}

	public User(Long id, String userAccount, String userPassword, String realName, String userEmail, String userTel,
			byte isDelete, Date createTime, User createUser, Date updateTime, User updateUser) {
		this.id = id;
		this.userAccount = userAccount;
		this.userPassword = userPassword;
		this.realName = realName;
		this.userEmail = userEmail;
		this.userTel = userTel;
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

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
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

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}

}
