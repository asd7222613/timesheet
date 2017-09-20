package com.max.service;

import java.util.List;

import org.activiti.engine.task.Task;

import com.max.common.Pagination;
import com.max.domain.Leave;
import com.max.domain.User;

public interface VacationService {

	public void submitApply(Leave leave, String approvalUserId);
	
	public List<User> getApprovalUser();
	
	public void todoTask(Pagination<Leave> pagination);
	
	public void runningTask(Pagination<Leave> pagination);
	
	public void history(Pagination<Leave> pagination);
	
	public Leave findById(String id);
	
	public void updateApply(Leave leave, String approvalUserId, String taskId, boolean approvalPass);

}
