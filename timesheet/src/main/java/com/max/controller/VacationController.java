package com.max.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
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
import com.max.domain.Leave;
import com.max.domain.User;
import com.max.service.VacationService;
import com.max.vo.LeaveVO;

@Controller
@RequestMapping("/vacation")
public class VacationController {
	
	@Autowired
	VacationService vacationService;
	
	@Autowired
	TaskService taskService;

	@PostMapping("/submitApply")
	public String submitApply(Leave leave, String approvalUserId) {
		vacationService.submitApply(leave, approvalUserId);
		return "forward:/vacation/running";
	}
	
	@ResponseBody
	@PostMapping("/ajaxSubmitApply")
	public boolean ajaxSubmitApply(Leave leave, String approvalUserId, String taskId, boolean approvalPass) {
		try {
			vacationService.updateApply(leave, approvalUserId, taskId, approvalPass);
			Map<String, Object> variables = new HashMap<String, Object>();
			variables.put("approvalUser", approvalUserId);
			variables.put("approvalpass", approvalPass);
			taskService.complete(taskId, variables);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@GetMapping("/input")
	public String input(Model model) {
		List<User> list = vacationService.getApprovalUser();
		model.addAttribute("list", list);
		return "submitApply";
	}
	
	@ResponseBody
	@GetMapping(value = "/input2", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String input2(Model model) {
		List<User> list = vacationService.getApprovalUser();
		if(list == null) {
			return null;
		}
		String result = GsonUtil.toJson(list);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping(value = "/input3/{leaveId}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String input3(@PathVariable String leaveId) {
		Leave leave = vacationService.findById(leaveId);
		List<User> list = vacationService.getApprovalUser();
		
		LeaveVO leaveVO = new LeaveVO(leave, list);
		String result = GsonUtil.toJson(leaveVO);
		
		return result;
	}
	
	@RequestMapping("/todoTask")
	public String todoTask(@RequestParam(required = false, defaultValue="1") int currentPage, Model model) {
		Pagination<Leave> pagination = new Pagination<Leave>();
		pagination.setCurrentPage(currentPage);
		vacationService.todoTask(pagination);
		model.addAttribute("pagination", pagination);
		return "todoTask";
	}
	
	@RequestMapping("/running")
	public String runningTask(@RequestParam(required = false, defaultValue="1") int currentPage, Model model) {
		Pagination<Leave> pagination = new Pagination<Leave>();
		pagination.setCurrentPage(currentPage);
		vacationService.runningTask(pagination);
		model.addAttribute("pagination", pagination);
		
		return "runningTask";
	}
	
	@ResponseBody
	@RequestMapping("/approval")
	public boolean approval(@RequestParam String taskId, @RequestParam String approvalUserId, @RequestParam boolean result) {
		 Map<String, Object> variables = new HashMap<String, Object>();
		 variables.put("approvalpass", result);
		 if(result) {
			 variables.put("approvalUser", approvalUserId);
		 }
		 
		 try {
			 taskService.complete(taskId, variables);
			 return true;
		 }catch (Exception e) {
			e.printStackTrace();
			return false;
		 }	
	}
	
	@RequestMapping("/history")
	public String history(@RequestParam(required = false, defaultValue="1") int currentPage, Model model) {
		Pagination<Leave> pagination = new Pagination<Leave>();
		pagination.setCurrentPage(currentPage);
		vacationService.history(pagination);
		model.addAttribute("pagination", pagination);
		
		return "historyTask";
	}
}
