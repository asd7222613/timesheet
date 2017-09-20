package com.max.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 菜单实体类
 * 
 * @author MADMAX
 *
 */
@Entity
@Table(name = "t_menu")
public class Menu implements Serializable {

	private static final long serialVersionUID = 6747747478418742169L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "menuname")
	private String menuName;
	@Column(name = "menuurl")
	private String menuUrl;
	@Column(name = "menuicon")
	private String menuIcon;
	@Column(name = "permissioncode")
	private String permissionCode;
	@Column(name = "level")
	private int level;
	@Column(name = "isdelete")
	private byte isDelete;
	@Column(name = "createtime")
	private Date createTime;
	@OneToOne
	@JoinColumn(name = "createuser")
	private User createUser;
	@Column(name = "updatetime")
	private Date updateTime;
	@OneToOne
	@JoinColumn(name = "updateuser")
	private User updateUser;
	
	@OneToMany
	@JoinColumn(name = "parentid")
	Set<Menu> menus = new HashSet<Menu>();

	public Menu() {}

	public Menu(Long id, String menuName, String menuUrl, String menuIcon, String permissionCode,int level,
				byte isDelete, Date createTime, User createUser, Date updateTime, User updateUser) {
		this.id = id;
		this.menuName = menuName;
		this.menuUrl = menuUrl;
		this.menuIcon = menuIcon;
		this.permissionCode = permissionCode;
		this.level = level;
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

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getPermissionCode() {
		return permissionCode;
	}

	public void setPermissionCode(String permissionCode) {
		this.permissionCode = permissionCode;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
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
}