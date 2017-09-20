package com.max.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.max.service.MenuService;

@RestController
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@GetMapping(value = "/buildTree", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String buildTree() {
		String result = menuService.buildTree();
		return result;
	}
}
