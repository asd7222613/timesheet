package com.max.common;

import java.util.List;

/**
 * 树形菜单节点
 * 
 * @author MADMAX
 *
 */
public class Node {

	private Long id; //节点编号
	private String text; // 节点名称
	private String icon = ""; // 未选中时的图标
	private String selectedIcon = "";// 选中时的图标
	private List<Node> nodes; // 子节点
	
	public Node() {}

	public Node(Long id, String text, List<Node> nodes) {
		this.id = id;
		this.text = text;
		this.nodes = nodes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSelectedIcon() {
		return selectedIcon;
	}

	public void setSelectedIcon(String selectedIcon) {
		this.selectedIcon = selectedIcon;
	}

	public List<Node> getNodes() {
		return nodes;
	}

	public void setNodes(List<Node> nodes) {
		this.nodes = nodes;
	}
}
