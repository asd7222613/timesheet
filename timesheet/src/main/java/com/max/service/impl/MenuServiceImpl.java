package com.max.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.max.common.Node;
import com.max.common.TreeUtil;
import com.max.domain.Menu;
import com.max.repository.MenuRepository;
import com.max.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	MenuRepository menuRepository;
	Gson gson = new Gson();
	
	@Override
	public String buildTree() {
		List<Menu> menus = menuRepository.list();
		List<Node> nodes = new ArrayList<Node>();
		List<Node> rootNode = new ArrayList<Node>();
		
		for(Menu menu : menus) {
			nodes.add(TreeUtil.buildTree(menu));
		}
		
		Node root = new Node(0L, "系统功能", nodes);
		rootNode.add(root);
		String result = gson.toJson(rootNode);
		return result;
	}

}
