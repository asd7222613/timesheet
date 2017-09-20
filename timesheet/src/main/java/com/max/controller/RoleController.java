package com.max.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.max.common.GsonUtil;
import com.max.common.Pagination;
import com.max.domain.Role;
import com.max.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/list")
	public String list(@RequestParam(required = false, defaultValue="1") int currentPage, @RequestParam(required = false) String roleName, Model model) {
		Pagination<Role> pagination = new Pagination<Role>();
		pagination.setCurrentPage(currentPage);
		roleService.list(pagination, roleName);
		model.addAttribute("pagination", pagination);
		return "roleList";
	}
	
	@PostMapping("/add")
	public String addRole(Role role) {
		roleService.addRole(role);
		return "forward:/role/list";
	}
	
	@ResponseBody
	@GetMapping(value="/findBy/{roleId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String findBy(@PathVariable Long roleId) {
		Role role = roleService.findById(roleId);
		String result = GsonUtil.toJson(role);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/update")
	public boolean update(Role role) {
		boolean result = roleService.updateRole(role);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public boolean delete(Role role) {
		boolean result= roleService.deleteRole(role);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/savePermissions")
	public boolean savePermissions(String ids, String roleId) {
		boolean result = roleService.savePermissions(ids, roleId);
		return result;
	}
}
