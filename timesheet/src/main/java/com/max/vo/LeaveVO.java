package com.max.vo;

import java.util.List;

import com.google.gson.annotations.Expose;
import com.max.domain.Leave;
import com.max.domain.User;

public class LeaveVO {

	@Expose
	private Leave leave;
	@Expose
	private List<User> list;

	public LeaveVO() {}
	
	public LeaveVO(Leave leave, List<User> list) {
		this.leave = leave;
		this.list = list;
	}

	public Leave getLeave() {
		return leave;
	}

	public void setLeave(Leave leave) {
		this.leave = leave;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}
}
