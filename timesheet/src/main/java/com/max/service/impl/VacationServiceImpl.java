package com.max.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricProcessInstanceQuery;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.max.common.Pagination;
import com.max.domain.Leave;
import com.max.domain.Role;
import com.max.domain.User;
import com.max.repository.VacationRepository;
import com.max.service.RoleService;
import com.max.service.VacationService;

@Service
@Transactional(readOnly = true)
public class VacationServiceImpl implements VacationService {

	@Autowired
	VacationRepository vacationRepository;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	RuntimeService runtimeService;
	
	@Autowired
	TaskService taskService;
	
	@Autowired
	IdentityService identityService;
	
	@Autowired
	HistoryService historyService;
	
	@Autowired
	RepositoryService repositoryService;
	
	@Transactional
	public void updateApply(Leave leave, String approvalUserId, String taskId, boolean approvalPass) {
		Leave currentLeave = vacationRepository.findByBusinessKey(leave.getId().toString());
		currentLeave.setStartTime(leave.getStartTime());
		currentLeave.setEndTime(leave.getEndTime());
		currentLeave.setReason(leave.getReason());	
		vacationRepository.submitApply(currentLeave);
	}

	
	@Transactional
	public void submitApply(Leave leave, String approvalUserId) {
		try {
			//获取当前用户
			User currentUser = (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
			leave.setSubmitUser(currentUser);
			leave.setCreateTime(new Date());
			vacationRepository.submitApply(leave);
			//获取businessKey
			String businessKey = leave.getId().toString();
			Map<String, Object> variables = new HashMap<String, Object>();
			variables.put("approvalUser", approvalUserId);
			//用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
			identityService.setAuthenticatedUserId(currentUser.getId().toString());
			//启动流程实例
			runtimeService.startProcessInstanceByKey("leave", businessKey, variables);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			identityService.setAuthenticatedUserId(null);
		}
		
	}

	@Override
	public List<User> getApprovalUser() {
		User user = (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		List<Role> roles = new ArrayList<Role>(user.getRoles());
		String roleName = roles.get(0).getRoleName();
		
		Role role = null;
		if("employee".equals(roleName)) {
			role = roleService.findRoleByName("leader");
		}else if("leader".equals(roleName)) {
			role = roleService.findRoleByName("hr");
		}else {
			return null;
		}
		
		return role.getUsers();
	}

	@Override
	public void todoTask(Pagination<Leave> pagination) {
		List<Leave> result = new ArrayList<Leave>();
		User currentUser = (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(currentUser.getId().toString());
		pagination.setTotalCount(((Long)taskQuery.count()).intValue());
		List<Task> list = taskQuery.list();
		
		for(Task task : list) {
			String proceInstanceId = task.getProcessInstanceId();
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(proceInstanceId).active().singleResult();
			String businessKey = processInstance.getBusinessKey();
			Leave leave = vacationRepository.findByBusinessKey(businessKey);
			leave.setTask(task);
			
			result.add(leave);
		}
		
		pagination.setResult(result);
	}

	@Override
	public void history(Pagination<Leave> pagination) {
		List<Leave> leaves = new ArrayList<Leave>();
		User currentUser = (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		HistoricProcessInstanceQuery query = historyService.createHistoricProcessInstanceQuery().finished().startedBy(currentUser.getId().toString());
		pagination.setTotalCount(((Long)query.count()).intValue());
		query.listPage((pagination.getCurrentPage() - 1) * pagination.getPageSize(), pagination.getPageSize());
		List<HistoricProcessInstance> list = query.list();
		for(HistoricProcessInstance hp : list) {
			Leave leave = vacationRepository.findByBusinessKey(hp.getBusinessKey());
			leave.setHistoricProcessInstance(hp);
			
			leaves.add(leave);
		}
		
		pagination.setResult(leaves);
	}

	@Override
	public void runningTask(Pagination<Leave> pagination) {
		List<Leave> leaves = new ArrayList<Leave>();
		User currentUser = (User)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		ProcessInstanceQuery query = runtimeService.createProcessInstanceQuery().variableValueEquals("applyUserId", currentUser.getId().toString());
		
		pagination.setTotalCount(((Long)query.count()).intValue());
		query.listPage((pagination.getCurrentPage() - 1) * pagination.getPageSize(), pagination.getPageSize());
		List<ProcessInstance> list = query.list();
		for(ProcessInstance instance : list) {
			Leave leave = vacationRepository.findByBusinessKey(instance.getBusinessKey());
			ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(instance.getProcessDefinitionId()).singleResult();
			List<Task> tasks = taskService.createTaskQuery().processInstanceId(instance.getId()).active().orderByTaskCreateTime().desc().listPage(0, 1);
            leave.setTask(tasks.get(0));
            leave.setProcessDefinition(processDefinition);
            leave.setProcessInstance(instance);
            leaves.add(leave);
		}
		
		pagination.setResult(leaves);
	}

	@Override
	public Leave findById(String id) {
		try {
			return vacationRepository.findByBusinessKey(id);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
