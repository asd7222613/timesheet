package com.max.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
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
import com.max.common.MD5Util;
import com.max.common.Pagination;
import com.max.domain.Role;
import com.max.domain.User;
import com.max.service.RoleService;
import com.max.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping("/list")
	public String list(@RequestParam(required = false, defaultValue="1") int currentPage, String condition, Model model) {
		Pagination<User> pagination = new Pagination<User>();
		pagination.setCurrentPage(currentPage);
		userService.list(pagination, condition);
		
		model.addAttribute("pagination", pagination);
		return "userList";
	}

	@PostMapping("/login")
	public String login(String userAccount, String userPassword, Model model) {
		UsernamePasswordToken token = new UsernamePasswordToken(userAccount, MD5Util.shaToHex(userPassword));
		try {
			token.setRememberMe(true);
			//用户登录验证
			Subject currentUser = SecurityUtils.getSubject();
			currentUser.login(token);
			return "index";
		} catch (AuthenticationException ae) {
			logger.error(ae);
			model.addAttribute("errorMessage", "帐户名或登录密码不正确，请重新输入");
			return "forward:/login.jsp";
		}		
	}
	
	@PostMapping("/save")
	public String saveUser(User user, Long roleId) {
		userService.save(user, roleId);
		return "forward:/user/list";
	}
	
	@GetMapping("/add")
	public String addUser(Model model) {
		List<Role> list = roleService.findAll();
		model.addAttribute("list", list);
		return "addUser";
	}
	
	@ResponseBody
	@PostMapping("/update")
	public boolean updateUser(User user) {
		boolean result = userService.update(user);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public boolean deleteUser(User user) {
		boolean result = userService.delete(user);
		return result;
	}
	
	@ResponseBody
	@GetMapping(value="/findBy/{userId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String findBy(@PathVariable int userId) {
		User user = userService.findById((long)userId);
		String result = GsonUtil.toJson(user);
		return result; 
	}
	
	@GetMapping("/logout")
	public String logout() {
		SecurityUtils.getSubject().logout();
		return "redirect:/login.jsp";
	}
}
