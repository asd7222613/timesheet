package com.max.common;

import java.util.List;

import com.google.gson.annotations.Expose;

/**
 * 分页工具类
 * @author MADMAX
 *
 */
public class Pagination<T> {

	@Expose
	private int totalCount; //总条数
	@Expose
	private int totalPage; //总页数
	@Expose
	private int currentPage = 1; //当前页，默认1
	@Expose
	private int pageSize = 10; //每页显示的条数，默认10条
	@Expose
	private List<T> result; //分页数据
	
	public Pagination() {}

	public Pagination(int totalCount, int totalPage, int currentPage, int pageSize, List<T> result) {
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.result = result;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPage = this.totalCount % this.pageSize == 0 ? (this.totalCount / this.pageSize) : (this.totalCount / this.pageSize) + 1;
	}

	public int getTotalPage() {
		if(this.totalCount == 0) {
			return 1;
		}else {
			return this.totalPage;
		}
		
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		if(currentPage < 1) {
			return 1;
		}else if(currentPage > this.getTotalPage()) {
			return this.getTotalPage();
		}else {
			return this.currentPage;
		}
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getResult() {
		return result;
	}

	public void setResult(List<T> result) {
		this.result = result;
	}
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("<nav><ul class=\"pager\" style=\"text-align:left\">");
		sb.append("<li style=\"margin-right: 150px\">共有" + getTotalCount() + "条数据，每页显示" + getPageSize() + "条，当前第"+ getCurrentPage() + "/" + getTotalPage() + "页</li>");
		sb.append("<li><a href=\"#\" onclick=\"loadData(1)\">首页</a></li>");
		sb.append("<li><a href=\"#\" onclick=\"loadData(" + (getCurrentPage() - 1) + ")\">上一页</a></li>");
		sb.append("<li><a href=\"#\" onclick=\"loadData(" + (getCurrentPage() + 1) + ")\">下一页</a></li>");
		sb.append("<li><a href=\"#\" onclick=\"loadData(" + getTotalPage() + ")\">尾页</a></li>");
		sb.append("</ul></nav>");
		
		return sb.toString();
	}
}
