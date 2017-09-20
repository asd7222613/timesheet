package com.max.common;

import java.util.ArrayList;
import java.util.List;

import com.max.domain.Menu;

/**
 * 树形菜单工具类
 * @author MADMAX
 *
 */
public class TreeUtil {

	public static Node buildTree(Menu menu) {
		if(menu.getMenus().size() > 0) {
			List<Node> nodes = new ArrayList<Node>();
			for(Menu subMenu : menu.getMenus()) {
				nodes.add(buildTree(subMenu));
			}
			Node node = new Node(menu.getId(), menu.getMenuName(), nodes);
			return node;
		}else {
			Node node = new Node(menu.getId(), menu.getMenuName(), null);
			return node;
		}
	}
}
